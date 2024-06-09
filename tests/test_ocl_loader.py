import os
import unittest

from who_l3_smart_tools.core.terminology.ocl_loader import OclLoader


class TestOclLoader(unittest.testcase):
    def setUp(self):
        self.input_file = "../l3-data/test_dd.xlsx"
        self.output_dir = "../l3-data/output"

    def test_load_data(self):
        loader = OclLoader(self.input_file, self.output_dir)
        self.assertEqual(loader.load_data(), loader.df_dict)

    def test_transform_data(self):
        loader = OclLoader(self.input_file, self.output_dir)

        loader.transform_data()

        self.assertEqual(len(loader.df_dict["HIV.A"].columns), 9)

    def test_generate_ocl_csv(self):
        loader = OclLoader(self.input_file, self.output_dir)
        loader.transform_data()
        loader.generate_ocl_csv()

        self.assertTrue(os.path.exists(f"{self.output_dir}/HIV.A.csv"))
