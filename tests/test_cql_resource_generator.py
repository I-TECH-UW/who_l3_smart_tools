from fileinput import close
import unittest

from who_l3_smart_tools.core.indicator_generation.cql_resource_generator import (
    CQLResourceGenerator,
)


@unittest.skip("Skip for now")
class TestParseCql(unittest.TestCase):
    def test_parse_cql_with_valid_content(self):
        # Load example CQL from data directory
        filename = "tests/data/example_cql.cql"

        # Load content and close file
        cql_file = open(filename, "r")
        cql_content = cql_file.read()
        cql_file.close()

        generator = CQLResourceGenerator(cql_content)

        parsedCQL = generator.parse_cql()

        self.assertEqual(parsedCQL["library_name"], "Measles_1")


if __name__ == "__main__":
    unittest.main()


@unittest.skip("Skip for now")
class TestCqlScaffoldGenerator(unittest.TestCase):
    def test_generate_cql_scaffolds(self):
        # Create an instance of CqlScaffoldGenerator
        generator = CqlScaffoldGenerator("path/to/indicator_artifact.xlsx")

        # Call the generate_cql_scaffolds method
        cql_scaffolds = generator.generate_cql_scaffolds()

        # Assert that the result is a list
        self.assertIsInstance(cql_scaffolds, list)

        # Assert that each item in the list is a string
        for cql_scaffold in cql_scaffolds:
            self.assertIsInstance(cql_scaffold, str)

        # Add more assertions as needed


if __name__ == "__main__":
    unittest.main()
