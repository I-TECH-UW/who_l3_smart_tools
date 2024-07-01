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
        concept_class = ""
        super().__init__(owner_id, concept_class, files, schema=HIVConceptSchema)

    @classmethod
    def from_excel(cls, file_path: str):
        directory = os.path.dirname(file_path)
        files = []
        excel_df = pd.read_excel(file_path, sheet_name=None)
        for sheet_name, df in excel_df.items():
            if not sheet_name.startswith(cls.excel_sheets_prefix):
                continue
            file_path = os.path.join(directory, f"{sheet_name}.csv")
            df.to_csv(file_path, index=False)
            files.append(file_path)
        return cls(files)
