from who_l3_smart_tools.core.terminology.terminology import ConceptResourceGenerator
from who_l3_smart_tools.core.terminology.who.schema import HIVConceptSchema


class HIVTerminology(ConceptResourceGenerator):
    """
    A class representing the HIV terminology.

    This class extends the base ConceptTerminology class and provides specific functionality
    for working with HIV-related concepts.

    Args:
        file (str): An excel file containing the HIV terminology data.
    """

    def __init__(self, file: str):
        owner_id = "WHO-Smart-Guidelines"
        excel_sheets_prefix = "HIV"
        super().__init__(
            owner_id,
            file,
            schema=HIVConceptSchema,
            sheet_name_prefix=excel_sheets_prefix,
        )
