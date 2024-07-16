import json

from fhirpy import SyncFHIRClient


def send_to_fhir_server(bundle, fhir_server_url):
    # Initialize the FHIR client
    client = SyncFHIRClient(url=fhir_server_url)

    # Serialize the bundle to a JSON string using the .json() method
    bundle_json = bundle.json()

    # Parse the JSON string back to a dictionary since fhirpy expects a dictionary
    bundle_dict = json.loads(bundle_json)

    # Create a Resource instance from the bundle dictionary
    fhir_bundle = client.resource("Bundle", **bundle_dict)

    # Send the transaction bundle to the FHIR server
    try:
        # Since fhirpy does not automatically detect the transaction type,
        # we need to ensure we're sending a transaction bundle correctly.
        # For fhirpy, we typically use the .save() method directly.
        # However, the handling here assumes .save() can process the transaction.
        # This might need adjustment based on fhirpy's version or specific server requirements.
        fhir_bundle.save()
        print("Transaction bundle sent successfully to the FHIR server.")
    except Exception as e:  # pylint: disable=broad-except
        print(f"Failed to send transaction bundle to the FHIR server: {e}")
