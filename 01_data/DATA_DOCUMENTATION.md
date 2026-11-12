# Dataset Documentation | SwasthyaMeds

This directory documents the **11 CSV datasets** used in the **SwasthyaMeds – E-Pharmacy Supply Chain Analytics** portfolio project. The datasets cover product demand, procurement, supplier relationships, warehouse and dark-store operations, and last-mile delivery across West Bengal, India.

## Download the datasets

**[Access all 11 datasets on Google Drive](https://drive.google.com/file/d/1Ob0zSwPy7SY6Rfxep2-stxFHIRqLCrZ8/view?usp=drive_link)**

The CSV files are hosted on Google Drive rather than committed to GitHub because the complete data folder is approximately **341 MB**. Open the link, download the files (Google Drive may bundle them as a ZIP), and extract them into this `01_data/` directory. Ensure the CSVs are directly inside `01_data/`, not an extra nested folder.

> **Access note:** The owner must set Google Drive sharing to **Anyone with the link → Viewer**. This document cannot verify the current sharing permissions.

## Dataset inventory

Counts and column types below were transcribed from the provided Jupyter `DataFrame.info()` screenshots. The names are presented as the expected CSV filenames; verify the filenames match the actual files in Drive before running the loader.

| # | Dataset | Rows | Columns | Purpose |
|---|---|---:|---:|---|
| 1 | `dim_products_raw.csv` | 6,120 | 14 | Product master and commercial attributes |
| 2 | `dim_customers_raw.csv` | 110,000 | 6 | Customer location, segment, and signup information |
| 3 | `dim_dark_stores_raw.csv` | 30 | 11 | Dark-store locations and capacity |
| 4 | `dim_suppliers_raw.csv` | 100 | 8 | Supplier master and commercial terms |
| 5 | `dim_mother_warehouses_raw.csv` | 10 | 10 | Mother warehouse locations and operating capacity |
| 6 | `dim_delivery_executives_raw.csv` | 1,000 | 7 | Delivery workforce attributes |
| 7 | `dim_supplier_products_raw.csv` | 170,000 | 9 | Supplier–product contract relationships |
| 8 | `fact_orders_raw.csv` | 595,021 | 12 | Customer orders |
| 9 | `fact_order_items_raw.csv` | 1,583,925 | 9 | Order line items and discounts |
| 10 | `fact_purchase_orders_raw.csv` | 150,835 | 15 | Procurement order lines and receipts |
| 11 | `fact_deliveries_raw.csv` | 595,021 | 19 | Fulfilment timestamps and last-mile deliveries |

**Total:** 11 datasets, **120 columns across datasets**, and **3,212,062 rows** (sum of individual table row counts, not distinct entities).

## Complete column reference

The following column names and pandas dtypes reflect the screenshots, **not necessarily the inferred PostgreSQL types**. In particular, dates and timestamps currently appear as `str` in the displayed pandas DataFrames.

### 1. `dim_products_raw.csv`

**6,120 rows · 14 columns** — Medicine/product catalogue.

| Column | Pandas dtype |
|---|---|
| `product_id` | `str` |
| `product_name` | `str` |
| `brand_name` | `str` |
| `generic_name` | `str` |
| `category` | `str` |
| `dosage_form` | `str` |
| `strength` | `str` |
| `pack_size` | `str` |
| `mrp` | `float64` |
| `selling_price` | `float64` |
| `prescription_required` | `bool` |
| `shelf_life_days` | `int64` |
| `storage_type` | `str` |
| `active_flag` | `bool` |

### 2. `dim_customers_raw.csv`

**110,000 rows · 6 columns** — Customer geography and segments.

| Column | Pandas dtype |
|---|---|
| `customer_id` | `str` |
| `city` | `str` |
| `pincode` | `int64` |
| `zone` | `str` |
| `customer_segment` | `str` |
| `signup_date` | `str` |

### 3. `dim_dark_stores_raw.csv`

**30 rows · 11 columns** — Dark-store facilities.

| Column | Pandas dtype |
|---|---|
| `dark_store_id` | `str` |
| `dark_store_name` | `str` |
| `warehouse_id` | `str` |
| `city` | `str` |
| `zone` | `str` |
| `pincode` | `int64` |
| `capacity_units` | `int64` |
| `latitude` | `float64` |
| `longitude` | `float64` |
| `opening_date` | `str` |
| `active_flag` | `bool` |

### 4. `dim_suppliers_raw.csv`

**100 rows · 8 columns** — Supplier details.

| Column | Pandas dtype |
|---|---|
| `supplier_id` | `str` |
| `supplier_name` | `str` |
| `supplier_type` | `str` |
| `city` | `str` |
| `state` | `str` |
| `service_region` | `str` |
| `payment_terms_days` | `int64` |
| `active_flag` | `bool` |

### 5. `dim_mother_warehouses_raw.csv`

**10 rows · 10 columns** — Mother warehouse operations.

| Column | Pandas dtype |
|---|---|
| `warehouse_id` | `str` |
| `warehouse_name` | `str` |
| `city` | `str` |
| `zone` | `str` |
| `capacity_units` | `int64` |
| `operating_cost_per_day` | `int64` |
| `latitude` | `float64` |
| `longitude` | `float64` |
| `opening_date` | `str` |
| `active_flag` | `bool` |

### 6. `dim_delivery_executives_raw.csv`

**1,000 rows · 7 columns** — Delivery workforce.

| Column | Pandas dtype |
|---|---|
| `de_id` | `str` |
| `de_name` | `str` |
| `city` | `str` |
| `zone` | `str` |
| `vehicle_type` | `str` |
| `joining_date` | `str` |
| `active_flag` | `bool` |

### 7. `dim_supplier_products_raw.csv`

**170,000 rows · 9 columns** — Supplier–product terms and effective dates.

| Column | Pandas dtype |
|---|---|
| `supplier_product_id` | `str` |
| `supplier_id` | `str` |
| `product_id` | `str` |
| `minimum_order_qty` | `int64` |
| `expected_lead_time_days` | `int64` |
| `contract_fulfillment_rate` | `float64` |
| `effective_from` | `str` |
| `effective_to` | `str` |
| `active_flag` | `bool` |

### 8. `fact_orders_raw.csv`

**595,021 rows · 12 columns** — Customer order headers.

| Column | Pandas dtype |
|---|---|
| `order_id` | `str` |
| `customer_id` | `str` |
| `dark_store_id` | `str` |
| `order_datetime` | `str` |
| `order_status` | `str` |
| `total_items` | `int64` |
| `order_value` | `float64` |
| `delivery_pincode` | `int64` |
| `promised_delivery_datetime` | `str` |
| `payment_type` | `str` |
| `cancelled_flag` | `bool` |
| `cancellation_reason` | `str` |


### 9. `fact_order_items_raw.csv`

**1,583,925 rows · 9 columns** — Product-level order lines.

| Column | Pandas dtype |
|---|---|
| `order_item_id` | `str` |
| `order_id` | `str` |
| `product_id` | `str` |
| `quantity` | `int64` |
| `unit_selling_price` | `float64` |
| `discount_pct` | `int64` |
| `total_item_price` | `float64` |
| `discount_amount` | `float64` |
| `net_item_value` | `float64` |

### 10. `fact_purchase_orders_raw.csv`

**150,835 rows · 15 columns** — Purchase order lines, procurement costs, and delivery performance.

| Column | Pandas dtype |
|---|---|
| `po_id` | `str` |
| `po_line_id` | `str` |
| `warehouse_id` | `str` |
| `supplier_id` | `str` |
| `product_id` | `str` |
| `po_date` | `str` |
| `ordered_quantity` | `int64` |
| `unit_procurement_cost` | `float64` |
| `discount_pct` | `float64` |
| `expected_delivery_date` | `str` |
| `actual_delivery_date` | `str` |
| `received_quantity` | `int64` |
| `po_status` | `str` |
| `fulfillment_rate` | `float64` |
| `actual_lead_time_days` | `float64` |

### 11. `fact_deliveries_raw.csv`

**595,021 rows · 19 columns** — Fulfilment events and last-mile delivery outcomes.

| Column | Pandas dtype |
|---|---|
| `delivery_id` | `str` |
| `order_id` | `str` |
| `dark_store_id` | `str` |
| `de_id` | `str` |
| `order_received_datetime` | `str` |
| `picking_start_datetime` | `str` |
| `picking_completed_datetime` | `str` |
| `packing_start_datetime` | `str` |
| `packing_completed_datetime` | `str` |
| `de_assigned_datetime` | `str` |
| `de_arrival_datetime` | `str` |
| `order_picked_datetime` | `str` |
| `out_for_delivery_datetime` | `str` |
| `customer_arrival_datetime` | `str` |
| `delivered_datetime` | `str` |
| `delivery_status` | `str` |
| `delivery_distance_km` | `float64` |
| `delivery_attempts` | `int64` |
| `failure_reason` | `str` |

## Key relationships

The following are **expected analytical joins** based on matching identifiers. Validate actual keys, uniqueness, and referential integrity against the database schema.

| From | Key | To |
|---|---|---|
| `dim_dark_stores` | `warehouse_id` | `dim_mother_warehouses` |
| `dim_supplier_products` | `supplier_id` | `dim_suppliers` |
| `dim_supplier_products` | `product_id` | `dim_products` |
| `fact_orders` | `customer_id` | `dim_customers` |
| `fact_orders` | `dark_store_id` | `dim_dark_stores` |
| `fact_order_items` | `order_id` | `fact_orders` |
| `fact_order_items` | `product_id` | `dim_products` |
| `fact_purchase_orders` | `warehouse_id` | `dim_mother_warehouses` |
| `fact_purchase_orders` | `supplier_id` | `dim_suppliers` |
| `fact_purchase_orders` | `product_id` | `dim_products` |
| `fact_deliveries` | `order_id` | `fact_orders` |
| `fact_deliveries` | `dark_store_id` | `dim_dark_stores` |
| `fact_deliveries` | `de_id` | `dim_delivery_executives` |

## How to use the data

## How to use the data

1. **Download the dataset:** Download the complete ZIP archive using the Google Drive link provided above and extract all CSV files into the repository's `01_data/` folder.

2. **Set up the database:** Configure your SQL database and execute `02_sql/01_schema_setup/create_schemas.sql` to create all the required database schemas.

3. **Load the datasets:** Open the terminal from the project root directory and execute the following command to load all datasets into your configured SQL database:

   ```bash
   python 05_scripts/load_csv.py
   ```

   Ensure that the database connection credentials are configured locally and that the loading script points to the `01_data/` directory.

4. **Perform the analysis:** Execute the analysis SQL scripts, explore the Python notebooks, and interact with the Power BI report as documented in the main project `README.md`.

