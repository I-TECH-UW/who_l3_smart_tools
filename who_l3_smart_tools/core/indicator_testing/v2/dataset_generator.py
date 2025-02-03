import pandas as pd
import uuid
import random
from datetime import timedelta


def generate_random_dataset(phenotype_excel, output_excel, num_rows=1000):
    """
    Aligns with the L3 Technical Experts workflow:
    Generates a random test dataset based on the labeled phenotype XLSX.
    """
    phenotype_df = pd.read_excel(phenotype_excel)
    # Use the labeled phenotypes as seed examples
    seed_rows = phenotype_df.to_dict(orient="records")
    output_rows = []
    for i in range(num_rows):
        base = random.choice(seed_rows).copy()
        base["Patient.id"] = str(uuid.uuid4())
        if "Patient.birthDate" in base and pd.notnull(base["Patient.birthDate"]):
            birth_date = pd.to_datetime(base["Patient.birthDate"])
            offset_days = random.randint(-30, 30)
            base["Patient.birthDate"] = (
                birth_date + timedelta(days=offset_days)
            ).date()
        output_rows.append(base)
    df_out = pd.DataFrame(output_rows)
    df_out.to_excel(output_excel, index=False)
    print(f"Random dataset generated: {output_excel}")
