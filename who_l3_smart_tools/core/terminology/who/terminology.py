import os

import pandas as pd
from who_l3_smart_tools.core.terminology.terminology import ConceptTerminology
from who_l3_smart_tools.core.terminology.who.schema import HIVConceptSchema


class HIVTerminology(ConceptTerminology):
    """
    A class representing the HIV terminology.

    This class extends the base ConceptTerminology class and provides specific functionality
    for working with HIV-related concepts.

    Args:
        files (list): A list of files containing the HIV terminology data.
    """

    excel_sheets_prefix = "HIV"

    def __init__(self, files: list):
        owner_id = "WHO-Smart-Guidelines"
        super().__init__(owner_id, files, schema=HIVConceptSchema)

    @classmethod
    def from_excel(cls, file_path: str):
        directory = os.path.dirname(file_path)
        files = {}
        excel_df = pd.read_excel(file_path, sheet_name=None)
        for sheet_name, df in excel_df.items():
            if not sheet_name.startswith(cls.excel_sheets_prefix):
                continue
            csv_files_dir = os.path.join(directory, "csv_files")
            os.makedirs(csv_files_dir, exist_ok=True)
            file_path = os.path.join(csv_files_dir, f"{sheet_name}.csv")
            df.to_csv(file_path, index=False)
            files[sheet_name] = file_path
        return cls(files)
