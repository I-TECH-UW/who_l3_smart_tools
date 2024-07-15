import os
import unittest
from who_l3_smart_tools.core.questionnaires.questionnaire_generator import (
    QuestionnaireGenerator,
)


class TestQuestionnaireGenerator(unittest.TestCase):
    def setUp(self):
        self.input_file = os.path.join("tests", "data", "l2", "test_dd.xlsx")
        self.output_dir = os.path.join("tests", "output", "fsh", "questionnaires")

    def test_full_data_dictionary(self):
        generator = QuestionnaireGenerator(self.input_file, self.output_dir)

        generator.generate_fsh_from_excel()
