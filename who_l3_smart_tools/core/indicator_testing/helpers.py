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

def generate_patient_resource(row):
    # Create an instance of Patient
    patient = Patient.parse_obj({
        "resourceType": "Patient",
        "id": row['Patient.ID'],
        "gender": row['Patient.Gender'].lower() if row['Patient.Gender'] in ['male', 'female', 'other', 'unknown'] else 'unknown',
        "birthDate": row['Patient.DOB'],
        # Additional required attributes should be added here
    })
    return patient

def generate_observation_resource(row):
    # Create an instance of Observation
    observation = Observation.parse_obj({
        "resourceType": "Observation",
        "status": "final",
        "code": {
            "coding": [
                {
                    "system": "http://snomed.info/sct",
                  "display": row['Key Population Status']
                }
            ]
        },
        # Observation subject would need to be a reference to the Patient resource
        "subject": {
            "reference": f"Patient/{row['Patient.ID']}"
        }
        # Additional required attributes should be added here
    })
    return observation

def generate_condition_resource(row, start_date, end_date):
    # Create an instance of Condition
    condition = Condition.construct()
    
    condition.clinicalStatus = {
        "coding": [
            {
                "system": "http://terminology.hl7.org/CodeSystem/condition-clinical",
                "code": "active",
                "display": "Active"
            }
        ]
    }
    condition.verificationStatus = {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-ver-status",
      "code" : "confirmed"
    }]
  }
    condition.code = {
    "coding" : [{
            "system": "http://snomed.info/sct",
            "code": "38341003",
            "display": "HIV"
        }
    ]}
    condition.onsetDateTime = random_date_between(start_date, end_date).isoformat()
    condition.subject = {
        "reference": f"Patient/{row['Patient.ID']}"
    }
    return condition

def generate_medication_statement_resource(row, start_date, end_date):
    # Create an instance of MedicationStatement

    medication_statement = MedicationStatement.parse_obj({
        "resourceType": "MedicationStatement",
        "status": "active",
        "subject": {
            "reference": f"Patient/{row['Patient.ID']}"
        },
        "medication": {
            "reference" : {
                "reference" : "#med1"
            }
        },
        "contained" : [{
            "resourceType" : "Medication",
            "id" : "med1",
        }]
    })
    return medication_statement

def add_deceased_information(patient, measurementEnd):
    # Generate random date of death before measurementEnd
    deathDate = random_date(patient.birthDate, measurementEnd) 

    # Add deceased information to the Patient resource
    if(random.choice([True, False])):
        patient.deceasedBoolean = True
    else:
        patient.deceasedDateTime = deathDate


    return patient

def add_future_deceased_information(patient, measurementEnd):
    # Generate random date of death after measurementEnd
    deathDate = random_date(measurementEnd, measurementEnd + timedelta(days=365))

    # Add deceased information to the Patient resource
    if(random.choice([True, False])):
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
    return str_time_prop(start.isoformat(), end.isoformat(), '%Y-%m-%d', random.random())

def generate_episode_of_care_finished_before_measurement(row, measurement_end):
    """
    Generate an EpisodeOfCare resource that ends before the measurement period.
    """
    episode_of_care = EpisodeOfCare.construct()
    episode_of_care.status = "finished"
    
    # Assuming the date of birth is in row['Patient.DOB']
    dob = datetime.fromisoformat(row['Patient.DOB'])
    period_end = random_date_between(dob, measurement_end)
    period_start = random_date_between(dob, period_end)

    # Create the period
    episode_of_care.period = {
        "start": period_start.isoformat(),
        "end": period_end.isoformat()
    }

    return episode_of_care

def generate_episode_of_care_finished_after_measurement(row, measurement_end):
    """
    Generate an EpisodeOfCare resource that ends after the measurement period.
    """
    episode_of_care = EpisodeOfCare.construct()
    episode_of_care.status = "active"
    
    period_start = random_date_between(measurement_end, measurement_end + timedelta(days=365))
    
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
            request=BundleEntryRequest(
                method="POST",
                url=Uri(resource.resource_type)
            )
        )
        entries.append(entry)

    bundle = Bundle(
        type="transaction",
        entry=entries
    )

    return bundle

# Function to generate a random date of birth
def random_dob(start_year=1920, end_year=2003):
    start = datetime(year=start_year, month=1, day=1)
    end = datetime(year=end_year, month=12, day=31)
    random_date = start + timedelta(days=randint(0, (end - start).days))
    return random_date.isoformat()[:10]
