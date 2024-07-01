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

    def __init__(self, files: list):
        super(HIVTerminology, self).__init__(files, schema=HIVConceptSchema)

    