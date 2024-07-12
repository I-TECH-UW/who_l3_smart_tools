import re
from typing import List, Union
import pandas as pd
import os
from who_l3_smart_tools.utils import camel_case


data_type_map = {
    "Boolean": "boolean",
    "String": "string",
    "Date": "date",
    "DateTime": "dateTime",
    "Coding": "choice",
    "ID": "string",
    "Quantity": "integer",
}

questionnaire_template = """Instance: {activity_id}
InstanceOf: sdc-questionnaire-extr-smap
Title: "{activity_title}"
Description: "Questionnaire for {activity_title_description}"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* status = #draft
* experimental = true"""

questionnaire_item_template = """
* item[+]
  * id = "{data_element_id}"
  * linkId = "{data_element_id}"
  * type = #{data_type}
  * text = "{data_element_label}"
  * required = {required}
  * repeats = false
  * readOnly = false"""

questionnaire_item_valueset = """
  * answerValueSet = "#{data_element_id}" """.rstrip()


class QuestionnaireGenerator:
    def __init__(self, input_file, output_dir):
        self.input_file = input_file
        self.output_dir = output_dir
        self._activities = {}

    def generate_fsh_from_excel(self):
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)

        # Load the Excel file
        dd_xls = pd.read_excel(self.input_file, sheet_name=None)

        for sheet_name in dd_xls.keys():
            if not re.match(r"HIV\.[A-Z\-]+\s", sheet_name):
                continue

            df = dd_xls[sheet_name]
            current_activity_id = None
            questionnaire_items = []

            for i, row in df.iterrows():
                activity_id = row["Activity ID"]

                # handle an activity change
                if type(activity_id) == str and activity_id != current_activity_id:
                    # write out any existing activity
                    self._write_current_activity(
                        current_activity_id, questionnaire_items
                    )

                    # start a new activity
                    current_activity_id = activity_id
                    # NB The template gets formatted when written
                    questionnaire_items = []

                data_type = str(row["Data Type"])

                # we only want questions on the questionnaires
                if data_type == "Codes":
                    continue

                data_element_id = row["Data Element ID"]

                if type(data_element_id) != str or not data_element_id:
                    continue

                questionnaire_items.append(
                    questionnaire_item_template.format(
                        data_element_id=data_element_id,
                        data_element_label=str(row["Data Element Label"])
                        .replace("*", "")
                        .replace("[", "")
                        .replace("]", "")
                        .replace('"', "'")
                        .strip(),
                        data_type=data_type_map[data_type],
                        required="true" if str(row["Required"]) == "R" else "false",
                    )
                )

                # coded answers should be bound to a dataset
                if data_type == "Coding":
                    questionnaire_items.append(
                        questionnaire_item_valueset.format(
                            data_element_id=data_element_id
                        )
                    )

            self._write_current_activity(current_activity_id, questionnaire_items)

        for activity_code, activity in self._activities.items():
            questionnaire_items = activity.pop("questionnaire_items")
            with open(os.path.join(self.output_dir, f"{activity_code}.fsh"), "w") as f:
                f.write(
                    questionnaire_template.format(**activity)
                    + (
                        "\n" + "".join(questionnaire_items)
                        if len(questionnaire_items) > 0
                        else ""
                    )
                    + "\n"
                )

    def _write_current_activity(
        self, current_activity_id: Union[str, None], questionnaire_items: List[str]
    ):
        if current_activity_id is not None:
            if "\n" in current_activity_id:
                activities = current_activity_id.split("\n")
            else:
                activities = [current_activity_id]

            if activities:
                for activity in activities:
                    if " " in activity:
                        activity_code, activity_description = activity.split(" ", 1)
                        activity_desc_camel = camel_case(activity_description)
                        activity_desc_camel = (
                            activity_desc_camel[0].upper() + activity_desc_camel[1:]
                        )
                    else:
                        activity_code = activity
                        activity_description = activity_desc_camel = activity.split(
                            ".", 1
                        )[1]

                    if activity_code not in self._activities:
                        self._activities[activity_code] = {
                            "activity_id": f"{activity_code}{activity_desc_camel}",
                            "activity_title": activity_description,
                            "activity_title_description": activity_description[
                                0
                            ].lower()
                            + activity_description[1:],
                            "questionnaire_items": [],
                        }

                    self._activities[activity_code][
                        "questionnaire_items"
                    ] += questionnaire_items
