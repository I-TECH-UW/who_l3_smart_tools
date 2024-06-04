from re import sub
from fhir.resources.patient import Patient
from fhir.resources.observation import Observation
from fhir.resources.condition import Condition
from fhir.resources.medicationstatement import MedicationStatement
from fhir.resources.medication import Medication
from fhir.resources.episodeofcare import EpisodeOfCare
from fhir.resources.bundle import Bundle
from fhir.resources.bundle import BundleEntry
from fhir.resources.bundle import BundleEntryRequest
from fhir.resources.fhirtypes import Uri

import random
import time
from datetime import datetime, timedelta

# This collection of functions is used to generate synthetic FHIR resources for testing purposes.


# Helper Functions


def generate_patient_resource(row):
    # Create an instance of Patient
    patient = Patient.parse_obj(
        {
            "resourceType": "Patient",
            "id": row["Patient.ID"],
            "gender": (
                row["Patient.Gender"].lower()
                if row["Patient.Gender"] in ["male", "female", "other", "unknown"]
                else "unknown"
            ),
            "birthDate": row["Patient.DOB"],
            # Additional required attributes should be added here
        }
    )
    return patient


def generate_observation_resource(row):
    # Create an instance of Observation
    observation = Observation.parse_obj(
        {
            "resourceType": "Observation",
            "status": "final",
            "code": {
                "coding": [
                    {
                        "system": "http://snomed.info/sct",
                        "display": row["Key Population Status"],
                    }
                ]
            },
            # Observation subject would need to be a reference to the Patient resource
            "subject": {"reference": f"Patient/{row['Patient.ID']}"},
            # Additional required attributes should be added here
        }
    )
    return observation


def find_or_create_test_resources(bundle, coding):
    test_resources = None

    for r in bundle.entry:
        try:
            if r.resource.resource_type == "Observation":
                if (
                    r.resource.code.coding[0].code == coding["code"]
                    and r.resource.code.coding[0].system == coding["system"]
                ):
                    test_resources = r.resource
                    break
        except:
            pass
    if not test_resources:
        test_resources = Observation.construct()
        bundle.entry.append(
            BundleEntry(
                resource=test_resources,
                request=BundleEntryRequest(method="PUT", url=Uri("Observation")),
            )
        )
    return test_resources, bundle


def update_test_resources(test_resources, row, coding, coding_value):
    test_resources.code = {"coding": [coding]}
    test_resources.valueCodeableConcept = {
        "coding": [
            {
                "system": coding_value["system"],
                "code": coding_value["code"],
                "display": coding_value["display"],
            }
        ]
    }
    test_resources.subject = {"reference": f"Patient/{row['Patient.ID']}"}


def find_or_create_condition_resource(bundle, coding):
    condition_resource = None

    for r in bundle.entry:
        try:
            if r.resource.resource_type == "Condition":
                if (
                    r.resource.code.coding[0].code == coding["code"]
                    and r.resource.code.coding[0].system == coding["system"]
                ):
                    condition_resource = r.resource
                    break
        except:
            pass
    if not condition_resource:
        condition_resource = Condition.construct()
        bundle.entry.append(
            BundleEntry(
                resource=condition_resource,
                request=BundleEntryRequest(method="PUT", url=Uri("Condition")),
            )
        )
    return condition_resource, bundle


def update_condition_resource(
    condition, row, coding=None, start_date=None, end_date=None
):
    condition.clinicalStatus = {
        "coding": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                "code": "active",
                "display": "Active",
            }
        ]
    }
    condition.verificationStatus = {
        "coding": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/condition-ver-status",
                "code": "confirmed",
            }
        ]
    }

    if coding and isinstance(coding, list):
        condition.code = {"coding": coding}

    if start_date and end_date:
        condition.onsetDateTime = random_date_between(start_date, end_date).isoformat()

    condition.subject = {"reference": f"Patient/{row['Patient.id']}"}


def generate_medication_statement_resource(row, start_date, end_date):
    # Create an instance of MedicationStatement

    medication_statement = MedicationStatement.parse_obj(
        {
            "resourceType": "MedicationStatement",
            "status": "active",
            "subject": {"reference": f"Patient/{row['Patient.ID']}"},
            "medication": {"reference": {"reference": "#med1"}},
            "contained": [
                {
                    "resourceType": "Medication",
                    "id": "med1",
                }
            ],
        }
    )
    return medication_statement


def add_deceased_information(patient, measurementEnd):
    # Generate random date of death before measurementEnd
    deathDate = random_date(patient.birthDate, measurementEnd)

    # Add deceased information to the Patient resource
    if random.choice([True, False]):
        patient.deceasedBoolean = True
    else:
        patient.deceasedDateTime = deathDate

    return patient


def add_future_deceased_information(patient, measurementEnd):
    # Generate random date of death after measurementEnd
    deathDate = random_date(measurementEnd, measurementEnd + timedelta(days=365))

    # Add deceased information to the Patient resource
    if random.choice([True, False]):
        patient.deceasedBoolean = True
    else:
        patient.deceasedDateTime = deathDate

    return patient


def str_time_prop(start, end, time_format, prop):
    """Get a time at a proportion of a range of two formatted times.

    start and end should be strings specifying times formatted in the
    given format (strftime-style), giving an interval [start, end].
    prop specifies how a proportion of the interval to be taken after
    start.  The returned time will be in the specified format.
    """
    start = start[:10]
    end = end[:10]

    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end):
    return str_time_prop(
        start.isoformat(), end.isoformat(), "%Y-%m-%d", random.random()
    )


def generate_episode_of_care_finished_before_measurement(row, measurement_end):
    """
    Generate an EpisodeOfCare resource that ends before the measurement period.
    """
    episode_of_care = EpisodeOfCare.construct()
    episode_of_care.status = "finished"

    # Assuming the date of birth is in row['Patient.DOB']
    dob = datetime.fromisoformat(row["Patient.DOB"])
    period_end = random_date_between(dob, measurement_end)
    period_start = random_date_between(dob, period_end)

    # Create the period
    episode_of_care.period = {
        "start": period_start.isoformat(),
        "end": period_end.isoformat(),
    }

    return episode_of_care


def generate_episode_of_care_finished_after_measurement(row, measurement_end):
    """
    Generate an EpisodeOfCare resource that ends after the measurement period.
    """
    episode_of_care = EpisodeOfCare.construct()
    episode_of_care.status = "active"

    period_start = random_date_between(
        measurement_end, measurement_end + timedelta(days=365)
    )

    # Create the period
    episode_of_care.period = {
        "start": period_start.isoformat()
        # The 'end' key is not set, assuming the episode is ongoing after the measurement period.
    }

    return episode_of_care


def random_date_between(start_date, end_date):
    """
    Generate a random datetime between start_date and end_date.
    """
    time_between_dates = end_date - start_date
    random_number_of_days = random.randrange(time_between_dates.days)
    random_date = start_date + timedelta(days=random_number_of_days)
    return random_date


def create_transaction_bundle(resources):
    entries = []

    for resource in resources:
        entry = BundleEntry(
            resource=resource,
            request=BundleEntryRequest(method="POST", url=Uri(resource.resource_type)),
        )
        entries.append(entry)

    bundle = Bundle(type="transaction", entry=entries)

    return bundle


# Function to generate a random date of birth
def random_dob(start_year=1920, end_year=2003):
    start = datetime(year=start_year, month=1, day=1)
    end = datetime(year=end_year, month=12, day=31)
    random_date = start + timedelta(days=randint(0, (end - start).days))
    return random_date.isoformat()[:10]


# Generator Fuctions
# These functions are mapped to the features from the list above using the snake_case
# function. They generate FHIR resources based on the input data.
#
# Each function is a passthrough: it takes in a FHIR bundle, makes some modifications,
# and returns the modified bundle.


class FhirGenerator:

    codings = {
        "hiv-positive": {
            "system": "http://snomed.info/sct",
            "code": "38341003",
            "display": "HIV Positive",
        },
        "hiv-negative": {
            "system": "http://snomed.info/sct",
            "code": "165815009",
            "display": "HIV Negative",
        },
        "hiv-test": {
            "system": "http://snomed.info/sct",
            "code": "31676001",
            "display": "HIV Antigen test",
        },
        "hiv-condition": {
            "system": "http://snomed.info/sct",
            "code": "86406008",
            "display": "Human immunodeficiency virus infection",
        },
        "inconclusive": {
            "system": "http://snomed.info/sct",
            "code": "419984006",
            "display": "Inconclusive",
        },
    }

    def __init__(
        self, all_feature_keys, reporting_period_start_date, reporting_period_end_date
    ):
        self.all_feature_keys = all_feature_keys
        self.reporting_period_start_date = reporting_period_start_date
        self.reporting_period_end_date = reporting_period_end_date

        return

    def generate_for(self, header, row, bundle):
        try:
            # Get the function to call based on the header
            function = self.get_mapped_function(header)
            return function(row, bundle, header)
        except Exception as e:
            print(f"Error generating resource for header '{header}': {e}")
            return bundle

    def snake_case(self, s):
        # Replace hyphens with spaces, then apply regular expression substitutions for title case conversion
        # and add an underscore between words, finally convert the result to lowercase
        return "_".join(
            sub(
                "([A-Z][a-z]+)", r" \1", sub("([A-Z]+)", r" \1", s.replace("-", " "))
            ).split()
        ).lower()

    def get_mapped_function(self, key):
        function_name = "generate_" + self.snake_case(key)

        if function_name not in self.all_feature_keys:
            raise Exception(f"Function {function_name} not found for key '{key}'")

        if function_name in globals():
            return globals()[function_name]
        else:
            raise Exception(f"Function {function_name} not found for key '{key}'")

    # See generator_functions.py
    def generate_patient(self, row, bundle):

        return bundle

    def generate_test(self, row, bundle):
        return bundle

    def generate_key_population_member_type(self, row, bundle):
        return bundle

    def generate_tb_diagnosis_result(self, row, bundle):
        return bundle

    def generate_presumptive_tb(self, row, bundle):
        return bundle

    def generate_testing_entry_point(self, row, bundle):
        return bundle

    def generate_self_testing(self, row, bundle):
        return bundle

    def generate_hiv_test_result_hiv_positive(self, row, bundle, header):
        # Add / modify condition resource based on value of feature
        test_coding = self.codings["hiv-test"]
        positive_coding = self.codings["hiv-positive"]
        negative_coding = self.codings["hiv-negative"]
        inconclusive_coding = self.codings["inconclusive"]

        # Search for existing condition resource or create new
        test_resources, bundle = find_or_create_test_resources(bundle, test_coding)

        if row[header] and row[header] == "1":
            update_test_resources(test_resources, row, test_coding, positive_coding)
        elif row[header] and row[header] == "0":
            # Randomly assign negative, inconclusive or no result
            coding = random.choice(negative_coding, inconclusive_coding, None)
            if coding:
                update_test_resources(test_resources, row, test_coding, coding)

        return bundle

    def generate_date_hiv_test_results_returned_in_the_reporting_period(
        self, row, bundle, header
    ):
        # Assumes row[header] - 1 is the index of hiv-positive test result column
        hiv_pos_value = row[row.index(header) - 1]
        my_value = row[header]

        my_coding = self.codings["hiv-test"]

        if hiv_pos_value == "1":
            # Test resources should exist - update the date based on the value of the feature
            test_resources, bundle = find_or_create_test_resources(bundle, my_coding)

            if my_value == "1":
                # Date should be in the reporting period
                update_test_resources(
                    test_resources,
                    row,
                    start_date=self.reporting_period_start_date,
                    end_date=self.reporting_period_end_date,
                )
            else:
                # Date should be outside the reporting period
                outside_start = self.reporting_period_start_date - timedelta(days=10)
                outside_end = outside_start + timedelta(days=5)
                update_test_resources(
                    test_resources,
                    row,
                    start_date=outside_start,
                    end_date=outside_end,
                )
        else:
            # Condition should not exist - do nothing
            pass
        return bundle

    def generate_hiv_diagnosis_date_in_the_reporting_period(self, row, bundle):

        return bundle

    def generate_hiv_test_date_in_the_reporting_period(self, row, bundle):

        return bundle

    def generate_hiv_treatment_outcome_lost_to_follow_up(self, row, bundle):
        return bundle

    def generate_hiv_status_hiv_positive(self, row, bundle, header):
        # Note - qualified by `at the end of the reporting period`

        # Add / modify condition resource based on value of feature
        my_coding = self.codings["hiv-condition"]

        # Determine if creating a new condition
        create_new_condition = random.choice([True, False])
        hiv_positive = row[header] and row[header] == "1"

        # Search for existing condition resource or create new
        if create_new_condition or hiv_positive:
            condition_resource, bundle = find_or_create_condition_resource(
                bundle, my_coding
            )
            if hiv_positive:
                update_condition_resource(
                    condition_resource,
                    row,
                    coding=[my_coding],
                    start_date=self.reporting_period_start_date,
                    end_date=self.reporting_period_end_date,
                )
            else:
                update_condition_resource(
                    condition_resource,
                    row,
                    coding=[my_coding],
                    start_date=self.reporting_period_end_date - timedelta(days=10),
                    end_date=self.reporting_period_end_date - timedelta(days=5),
                )
        else:
            # Condition should not exist - do nothing
            pass
        return bundle

    def generate_hiv_treatment_outcome_death_documented(self, row, bundle):
        return bundle

    def generate_on_art_true_at_reporting_period_end_date(self, row, bundle):
        return bundle

    def generate_hiv_treatment_outcome_transferred_out(self, row, bundle):
        return bundle
