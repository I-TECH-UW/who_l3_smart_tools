import pandas as pd
from indicator_mappings import INDICATOR_MAPPINGS


def generate_phenotype_xlsx(input_excel, indicator, output_excel):
    # Read the L2 indicator dataset
    df = pd.read_excel(input_excel, sheet_name="Indicator definitions")
    # New interactive mode for L2 Domain Experts
    if indicator.lower() == "interactive":
        available = (
            df.get("Indicator", pd.Series()).unique().tolist()
        )  # Expect a column named "Indicator"
        if not available:
            raise ValueError("No 'Indicator' column found for interactive selection")
        print("Available indicators:")
        for i, ind in enumerate(available):
            print(f"{i}: {ind}")
        choice = input("Select indicator number (or press Enter to exit): ")
        if choice == "":
            print("Exiting interactive mode.")
            return
        try:
            choice = int(choice)
            indicator = available[choice]
        except (ValueError, IndexError):
            raise ValueError("Invalid selection for indicator")
    # Extract the mapping for the selected indicator
    mapping = INDICATOR_MAPPINGS.get(indicator)
    if not mapping:
        raise ValueError(f"Indicator '{indicator}' not found in mappings")
    # Extract minimal phenotype: identifier, demographics, and referenced elements (e.g., test result, test date)
    cols = ["Patient.id", "Patient.gender", "Patient.birthDate"]
    # Assuming the indicator definition contains extra columns for phenotype elements as a comma‐separated list
    # For demo, we simply include expected fields.
    cols.extend(list(mapping["expected_fields"].keys()))
    phenotype_df = df[cols].copy()  # Use the subset of columns as phenotype definition

    # Save to XLSX
    phenotype_df.to_excel(output_excel, index=False)
    print(f"Phenotype file generated: {output_excel}")


def generate_template_xlsx(input_excel, indicator, output_excel):
    # Read the indicator XLSX as input
    df = pd.read_excel(input_excel, sheet_name="Indicator definitions")
    # Example: extract candidate columns containing key terms from existing logic
    # (Could also use fsh_resource_generator.py as a guide for parsing logic)
    candidate_cols = [
        "Patient.id",
        "Patient.gender",
        "Patient.birthDate",
        "Test.date",
        "Test.result",
    ]
    # Add extra columns for manual labelling by domain experts
    extra_cols = ["Label as Numerator (True/False)", "Label as Denom (True/False)"]
    template_cols = candidate_cols + extra_cols
    template_df = (
        df[template_cols].copy()
        if set(template_cols).issubset(df.columns)
        else df[candidate_cols].copy()
    )
    for col in extra_cols:
        if col not in template_df.columns:
            template_df[col] = ""
    template_df.to_excel(output_excel, index=False)
    print(f"Template file generated for indicator {indicator}: {output_excel}")
