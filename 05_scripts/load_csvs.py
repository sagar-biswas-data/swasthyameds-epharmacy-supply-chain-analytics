import pandas as pd
from sqlalchemy import create_engine
from pathlib import Path

# PostgreSQL connection
DB_URL = "postgresql://postgres:Sagar29092000@localhost:5432/medplus_db"

# Relative directory of the CSV files
BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "01_data"

try:
    engine = create_engine(DB_URL)

    # =========================
    # Read CSV files
    # =========================

    datasets = {
        "dim_customers_raw": DATA_DIR / "dim_customers_raw.csv",
        "dim_products_raw": DATA_DIR / "dim_products_raw.csv",
        "dim_suppliers_raw": DATA_DIR / "dim_suppliers_raw.csv",
        "dim_warehouses_raw": DATA_DIR / "dim_warehouses_raw.csv",
        "dim_dark_stores_raw": DATA_DIR / "dim_dark_stores_raw.csv",
        "dim_delivery_partners_raw": DATA_DIR / "dim_delivery_partners_raw.csv",
        "dim_supplier_products_raw": DATA_DIR / "dim_supplier_products_raw.csv",

        "fact_orders_raw": DATA_DIR / "fact_orders_raw.csv",
        "fact_order_items_raw": DATA_DIR / "fact_order_items_raw.csv",
        "fact_purchase_orders_raw": DATA_DIR / "fact_purchase_orders_raw.csv",
        "fact_deliveries_raw": DATA_DIR / "fact_deliveries_raw.csv"
    }

    # =========================
    # Load each CSV into PostgreSQL
    # =========================

    for table_name, file_path in datasets.items():

        print(f"\nLoading: {file_path}")
        print(f"Target table: {table_name}")

        df = pd.read_csv(file_path)

        df.to_sql(
            name=table_name,
            con=engine,
            schema = "dbo",
            if_exists="replace",
            index=False,
            chunksize=50000
        )

        print(
            f"SUCCESS: {table_name} "
            f"({len(df):,} rows)"
        )

    print("\n===================================")
    print("ALL 9 DATASETS LOADED SUCCESSFULLY")
    print("===================================")

except Exception as e:

    print("\n===================================")
    print("ERROR OCCURRED")
    print("===================================")

    print(type(e).__name__)
    print(str(e))

    raise