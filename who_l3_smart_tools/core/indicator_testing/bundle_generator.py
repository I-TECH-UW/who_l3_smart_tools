from datetime import datetime, timedelta
import random
import json
from helpers import *
from fhir.resources.bundle import Bundle


def generate_patient_bundle(row, measurement_start, measurement_end):
    # Assume row is a dictionary with relevant keys from the Excel row data
    # Assume measurement_start and measurement_end are datetime objects
    start_date = datetime.fromisoformat(measurement_start)
    end_date = datetime.fromisoformat(measurement_end)

    bundle_resources = []

    # Generate Patient resource
    patient_resource = generate_patient_resource(row)
    bundle_resources.append(patient_resource)

    # Generate Observation for Key Population Status
    observation_resource = generate_observation_resource(row)
    bundle_resources.append(observation_resource)

    # If HIV_Positive, add Condition resource
    if row["HIV_Positive"]:
        condition_resource = generate_condition_resource(row, start_date, end_date)
        bundle_resources.append(condition_resource)
    else:
        # Randomly decide to either do nothing or add a Condition resource outside the period
        if random.choice([True, False]):
            condition_resource = generate_condition_resource(
                row, start_date - timedelta(days=10), end_date - timedelta(days=1)
            )
            bundle_resources.append(condition_resource)

    # If HIV_Treatment, add MedicationStatement resource
    if row["HIV_Treatment"]:
        medication_resource = generate_medication_statement_resource(
            row, start_date, end_date
        )
        bundle_resources.append(medication_resource)
    else:
        # Randomly decide to either do nothing or add a MedicationStatement resource outside the period
        if random.choice([True, False]):
            medication_resource = generate_medication_statement_resource(
                row, start_date - timedelta(days=10), end_date - timedelta(days=1)
            )
            bundle_resources.append(medication_resource)

    # If Deceased, add deceased information to Patient resource
    if row["Deceased"]:
        patient_resource = add_deceased_information(patient_resource, end_date)
    else:
        # Randomly decide to either do nothing or add deceased information after the period
        if random.choice([True, False]):
            patient_resource = add_future_deceased_information(
                patient_resource, end_date
            )

    # If Stopped_ART, add an EpisodeOfCare resource with status finished
    if row["Stopped_ART"]:
        episode_of_care_resource = generate_episode_of_care_finished_before_measurement(
            row, end_date
        )
        bundle_resources.append(episode_of_care_resource)
    else:
        # Randomly decide to either do nothing or add an EpisodeOfCare resource with status active
        if random.choice([True, False]):
            episode_of_care_resource = (
                generate_episode_of_care_finished_after_measurement(row, end_date)
            )
            bundle_resources.append(episode_of_care_resource)

    # Compile all resources into a bundle
    bundle = create_bundle(bundle_resources)

    return bundle


def create_bundle(resources):

    return create_transaction_bundle(resources)
