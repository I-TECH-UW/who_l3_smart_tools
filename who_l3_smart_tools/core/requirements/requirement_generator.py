import re
from typing import Union
import pandas as pd
import os
from who_l3_smart_tools.utils import camel_case


requirement_template ="""Instance: {id}
InstanceOf: Requirements
Title: "{title}"
Description: "Functional Requirements For  for {title}"
Usage: #example
* status = #active"""

functional_requirement_item_template = """
* statement[+]
  * key = "{data_element_id}"
  * requirement = \"\"\"
   As a {actor}
   I want {action}
   So that {reason}  \"\"\""""
 

non_functional_requirement_template = """Instance: HIV non Functional Requirements
InstanceOf: Requirements
Title: "HIV non Functional Requirements"
Description: "Non Functional Requirements For  for HIV"
Usage: #example
* status = #active"""

non_functional_requirement_item_template = """
* statement[+]
  * key = "{data_element_id}"
  * requirement = \"\"\"
   Category : {category}
   {action} \"\"\""""
  

class RequirementGenerator:
    def __init__(self, input_file, output_dir):
        self.input_file = input_file
        self.output_dir = output_dir

    def generate_fsh_from_excel(self):
        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)

         # Load the Excel file
        dd_xls = pd.read_excel(self.input_file, sheet_name=None)
        fileName = None
        for sheet_name in dd_xls.keys():

            if sheet_name == "Functional" :

                df = dd_xls[sheet_name]
                current_requirement_template = ""
                
                for i, row in df.iterrows():
                    requirement_id = str(row["Requirement ID"]).replace(" ", "")
                    description = row["Activity ID and Description"]
                    if not isinstance(description, str) :
                         title = ""
                         last_dot_index = requirement_id.rfind('.')
                         if not last_dot_index == -1:
                             title = requirement_id[last_dot_index + 1:].strip()
                         else : 
                              title = requirement_id    
                         fileName = requirement_id
                         current_requirement_template = requirement_template.format(
                              id  = requirement_id ,
                              title = title
                          )
                         
                    if isinstance(description, str) :
                          current_requirement_template += functional_requirement_item_template.format(
                              data_element_id = requirement_id ,
                              actor = row["As a…"] ,
                              action = str(row["I want…"]).strip('…').strip('...') ,
                              reason = str(row["So that…"]).strip('…').strip('...')
                           )
                          
                          self._write_current_activity(fileName , current_requirement_template)

            elif  sheet_name == "Non-functional" :   
                  fileName = "HIV.Non_Functional"
                  df = dd_xls[sheet_name]
                  current_requirement_template = non_functional_requirement_template
                  for i, row in df.iterrows():
                       requirement_id = row["Requirement ID"]
                       category = row["Category"]
                       action = row["Non-Functional Requirement"]
                       current_requirement_template += non_functional_requirement_item_template.format(
                          data_element_id = requirement_id ,
                          category = category ,
                          action = action
                      )
                  self._write_current_activity(fileName , current_requirement_template)    
                       
                       
                        
    def _write_current_activity(self, file: Union[str, None], current_requirement_template: str):
        if file is not None:
            with open(os.path.join(self.output_dir, f"{file}.fsh"), "w") as f:
                 f.write(current_requirement_template)    
                    
                   
    