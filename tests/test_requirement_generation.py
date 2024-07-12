import os
import unittest
from who_l3_smart_tools.core.requirements.requirement_generator import (
    RequirementGenerator,
)


class TestRequirementGenerator(unittest.TestCase):
    def setUp(self):
        self.input_file = os.path.join("tests", "data", "l2", "test_functional.xlsx")
        self.output_dir = os.path.join("tests", "output", "fsh", "requirements")

    def test_full_data_dictionary(self):
        generator = RequirementGenerator(self.input_file, self.output_dir)

        generator.generate_fsh_from_excel()
