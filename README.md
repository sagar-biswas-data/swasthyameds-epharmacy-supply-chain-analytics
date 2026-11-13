# 💊 SwasthyaMeds E-Pharmacy Supply Chain Analytics

A comprehensive data analytics project that leverages **SQL, Python, and
Power BI** to analyze medicine demand, optimize procurement expenditure,
evaluate supplier performance, and improve fulfillment and last-mile
delivery operations across an e-pharmacy network.

------------------------------------------------------------------------

## 📚 Table of Contents

-   [Project Overview](#-project-overview)
-   [Business Context](#-business-context)
-   [Business Problems](#-business-problems)
-   [Project Objectives](#-project-objectives)
-   [Key Business Questions](#-key-business-questions)
-   [Project Workflow](#-project-workflow)
-   [Tech Stack](#%EF%B8%8F-tech-stack)
-   [Dataset Overview](#%EF%B8%8F-dataset-overview)
-   [Repository Structure](#-repository-structure)
-   [Dashboard Overview](#-dashboard-overview)
-   [Business Report](#-business-report)
-   [Key Insights](#-key-insights)
-   [Strategic Recommendations](#-strategic-recommendations)
-   [Project Outcome](#-project-outcome)
-   [Business Impact](#-business-impact)
-   [How to Run the Project](#%EF%B8%8F-how-to-run-the-project)
-   [Future Improvements](#-future-improvements)
-   [Author](#-author)

------------------------------------------------------------------------

## 📖 Project Overview

The growing adoption of e-pharmacy services is transforming the
pharmaceutical retail landscape, creating new opportunities and
operational challenges for medicine distribution and supply chain
management. SwasthyaMeds aims to strengthen its supply chain operations
through data-driven decision-making rather than relying on conventional
inventory and procurement practices.

This project analyzes operational data spanning **April 2024 to July
2026** and concludes with a comprehensive business report containing
strategic recommendations for demand-driven inventory allocation,
procurement cost optimization, and fulfillment and delivery performance
improvement.

An end-to-end data analytics workflow was developed using **Python** for
data cleaning and exploratory data analysis, **PostgreSQL** for database
management, data transformations, and analytical modeling, and **Power
BI** for interactive dashboards and business intelligence reporting.

------------------------------------------------------------------------

## 🌍 Business Context

The rapid growth of online pharmaceutical services has increased the
importance of efficient supply chain management in ensuring medicine
availability, controlling procurement expenditure, and delivering orders
reliably to customers. As SwasthyaMeds expands its e-pharmacy operations
across West Bengal, managing a diverse product catalogue, coordinating
supplier relationships, and maintaining efficient fulfillment operations
have become critical to its business performance.

Operating across multiple urban markets through a network of mother
warehouses and dark stores, SwasthyaMeds faces interconnected challenges
involving product demand variability, procurement efficiency, and
last-mile delivery operations. Ineffective inventory allocation can
create stock imbalances, inefficient purchasing decisions can increase
procurement expenditure, and delays in order processing or delivery
executive allocation can affect fulfillment efficiency and customer
experience.

Rather than addressing these challenges through isolated operational
decisions, SwasthyaMeds aims to establish a more integrated, data-driven
approach to supply chain management. This project analyzes product
demand patterns, procurement expenditure and supplier performance, along
with order fulfillment and delivery operations, to uncover operational
inefficiencies, identify cost optimization opportunities, and support
strategic decision-making across its e-pharmacy supply chain.

------------------------------------------------------------------------

## ❓ Business Problems

### 1. Demand Variability & Inventory Allocation Inefficiencies

SwasthyaMeds faces challenges in maintaining an efficient inventory
allocation strategy across its e-pharmacy network. Managing a diverse
medicine catalogue and distributing inventory across multiple
geographical markets and dark stores requires a coordinated approach to
ensure that products are available where and when they are needed.
Ineffective inventory planning can create imbalances across the
distribution network, resulting in potential stock shortages, excess
inventory, increased holding costs, and inefficient utilization of
working capital. Management therefore requires a comprehensive
understanding of historical demand behaviour to evaluate inventory
planning effectiveness, identify areas of potential inefficiency, and
establish a more responsive, demand-driven supply chain strategy.

### 2. Rising Procurement Expenditure & Procurement Inefficiencies

SwasthyaMeds is facing challenges in managing its procurement
expenditure efficiently while maintaining a reliable and uninterrupted
supply of medicines across its distribution network. Variations in
supplier pricing, purchasing terms, minimum order quantities, delivery
lead times, and fulfillment reliability make procurement decisions
increasingly complex. Additionally, the lack of effective alignment
between purchasing quantities and actual product demand can lead to
inefficient procurement practices, excess inventory accumulation, and
unnecessary working capital commitments. Management needs greater
visibility into procurement cost drivers, supplier performance, and
purchasing patterns to identify cost optimization opportunities, improve
supplier selection, and ensure that procurement decisions deliver the
best possible balance between cost efficiency, supply reliability, and
inventory requirements.

### 3. Last-Mile Delivery Inefficiencies & Fulfillment Delays

SwasthyaMeds faces the operational challenge of ensuring timely,
reliable, and efficient order fulfillment across its e-pharmacy
distribution network. The end-to-end fulfillment process involves
multiple interconnected stages, including order processing, picking and
packing, delivery executive assignment, executive arrival, and last-mile
transportation. Inefficiencies or delays at any of these stages can
increase overall delivery time, disrupt fulfillment operations, and
negatively affect the customer experience. Furthermore, unsuccessful
delivery attempts arising from customer unavailability, communication
gaps, address inaccuracies, and accessibility constraints can result in
additional operational effort and increased delivery costs. Management
therefore needs greater visibility into the end-to-end fulfillment and
delivery process to identify operational bottlenecks, evaluate delivery
performance, understand the underlying causes of delays and failed
deliveries, and determine opportunities to improve last-mile efficiency.

------------------------------------------------------------------------

## 🎯 Project Objectives

The primary objective of this project is to conduct a comprehensive
analysis of SwasthyaMeds' e-pharmacy supply chain operations and develop
actionable, data-driven business recommendations to improve inventory
planning, optimize procurement expenditure, and enhance fulfillment and
delivery performance.

Specifically, this project aims to:

-   Analyze product-level and category-level demand patterns to
    understand consumption behaviour and identify inventory allocation
    opportunities.
-   Examine geographical demand distribution across cities and dark
    stores to identify variations in product consumption and stocking
    requirements.
-   Evaluate procurement expenditure, purchasing volumes, and supplier
    relationships to identify cost drivers and potential
    over-procurement.
-   Assess supplier performance based on procurement costs, discount
    structures, minimum order quantities, lead times, and fulfillment
    reliability.
-   Identify opportunities to optimize purchasing quantities and improve
    procurement efficiency without compromising supply continuity.
-   Evaluate end-to-end order fulfillment performance to identify
    processing delays and operational bottlenecks.
-   Analyze delivery executive assignment, availability, and arrival
    times to identify opportunities for automated workforce allocation
    and improved dispatch efficiency.
-   Investigate delivery delays and unsuccessful delivery attempts to
    identify opportunities for improving customer coordination and
    delivery reliability.
-   Develop interactive Power BI dashboards that provide stakeholders
    with actionable insights into demand, procurement, fulfillment, and
    overall supply chain performance.
-   Deliver strategic business recommendations to support informed
    decision-making, operational optimization, and improved supply chain
    efficiency.

------------------------------------------------------------------------

## ❓ Key Business Questions

This project aims to answer the following business questions:

**Product Demand Analysis** - Which products and medicine categories
contribute the most to overall demand? - How is product demand
distributed across different cities and dark stores? - Which products
demonstrate consistently high or low demand? - How are product demand
and order volumes evolving over time? - Where should inventory
allocation and replenishment receive greater priority?

**Procurement Cost Optimization** - What are the major drivers of
increasing procurement expenditure? - Is procurement volume aligned with
actual product demand? - Which products and categories account for the
largest share of procurement spending? - How do procurement costs,
discounts, MOQs, and lead times vary across supplier types? - Which
suppliers demonstrate the best balance between cost efficiency and
fulfillment reliability? - Where can purchasing quantities and supplier
relationships be optimized to control procurement expenditure?

**Fulfillment & Delivery Performance** - Which stages of the fulfillment
process contribute most to overall delivery time? - How do delivery
executive availability and assignment waiting times affect delivery
efficiency? - Which cities and dark stores experience the greatest
delivery bottlenecks? - What are the primary reasons behind delayed and
unsuccessful deliveries? - How can automated delivery executive
assignment and improved customer coordination enhance delivery
performance? - Which operational improvements can reduce fulfillment
delays and improve customer experience?

------------------------------------------------------------------------

## 🔄 Project Workflow

1.  **Dataset Preparation** -- Prepared and organized large-scale,
    interconnected datasets representing SwasthyaMeds' pharmaceutical
    products, customers, suppliers, procurement, orders, fulfillment,
    and delivery operations.

2.  **Data Ingestion** -- Loaded the prepared datasets into a PostgreSQL
    database to establish a centralized environment for data management
    and analysis.

3.  **Database Design & Data Modeling** -- Structured the database using
    dimension and fact tables to establish relationships across product,
    customer, supplier, procurement, order, and delivery data.

4.  **Data Cleaning & Transformation** -- Used SQL to validate data
    consistency, handle data quality issues, transform raw datasets, and
    develop analytical views for business analysis.

5.  **Exploratory Data Analysis** -- Connected PostgreSQL with Python to
    perform domain-specific EDA using Pandas, NumPy, Matplotlib, and
    Seaborn, uncovering demand patterns, procurement inefficiencies, and
    delivery performance bottlenecks.

6.  **Dashboard Development** -- Developed four interactive Power BI
    dashboards covering Executive Supply Chain Overview, Product &
    Demand Analysis, Procurement & Cost Optimization, and Fulfillment &
    Delivery Performance.

7.  **Business Reporting** -- Consolidated analytical findings into a
    comprehensive business report, translating insights into strategic
    recommendations for inventory allocation, procurement optimization,
    and fulfillment efficiency.

------------------------------------------------------------------------

## 🛠️ Tech Stack

| Technology | Purpose | 
|------------|---------|
| **Python** | Performed data preprocessing, database connectivity, and exploratory data analysis (EDA). | 
| **SQL (PostgreSQL)** | Managed the database, performed data cleaning and transformations, and developed analytical views for business analysis. | 
| **Power BI** | Developed interactive dashboards to monitor demand, procurement expenditure, supplier performance, and fulfillment operations.
| **Pandas & NumPy** | Data manipulation, preprocessing, aggregation, and numerical analysis. | 
| **Matplotlib & Seaborn** | Data visualization and exploratory data analysis. | 
| **SQLAlchemy & Psycopg2** | Connected Python with PostgreSQL for data loading and analytical querying.
| **Git & GitHub** | Version control, project documentation, and portfolio hosting.

------------------------------------------------------------------------

## 🗃️ Dataset Overview

The project uses **11 datasets** covering pharmaceutical products,
customers, suppliers, procurement, warehouse infrastructure, order
management, and last-mile delivery across West Bengal, India.

📂 **Download Complete Datasets: [Access the SwasthyaMeds Datasets](https://drive.google.com/file/d/1Ob0zSwPy7SY6Rfxep2-stxFHIRqLCrZ8/view?usp=drive_link)**

The datasets are hosted on Google Drive due to their combined file size. Refer to the table below for individual dataset descriptions and their primary purposes.

## Dataset Documentation

| Dataset | Description | Primary Purpose |
|---|---|---|
| **dim_products** | Product master containing medicine names, brands, categories, dosage forms, pricing, shelf life, and storage attributes. | Product catalogue analysis, SKU-level demand analysis, and category performance evaluation. |
| **dim_customers** | Customer information covering geographical locations, customer segments, pincodes, and signup dates. | Customer segmentation, geographical demand analysis, and customer behaviour analysis. |
| **dim_dark_stores** | Dark-store information including locations, warehouse associations, storage capacity, geographical coordinates, and operational status. | Dark-store performance evaluation and location-level demand and delivery analysis. |
| **dim_suppliers** | Supplier master containing supplier types, locations, service regions, payment terms, and operational status. | Supplier segmentation and procurement performance analysis. |
| **dim_mother_warehouses** | Mother warehouse information covering locations, storage capacity, operating costs, and geographical coordinates. | Warehouse network analysis and supply chain infrastructure overview. |
| **dim_delivery_executives** | Delivery workforce information including executive details, geographical assignments, vehicle types, and active status. | Delivery workforce availability, workload, and performance analysis. |
| **dim_supplier_products** | Supplier–product relationships containing minimum order quantities, expected lead times, fulfillment rates, and contract validity. | Supplier-product evaluation and procurement efficiency analysis. |
| **fact_orders** | Customer order records containing order details, order values, order status, payment information, and promised delivery timestamps. | Order trends, customer demand, and order-level performance analysis. |
| **fact_order_items** | Product-level order transactions containing quantities, selling prices, discounts, and net item values. | Product demand, category contribution, and sales analysis. |
| **fact_purchase_orders** | Procurement records containing ordered and received quantities, supplier costs, discounts, delivery dates, and purchase order fulfillment information. | Procurement expenditure, purchasing volume, and supplier performance analysis. |
| **fact_deliveries** | Fulfillment and last-mile delivery records containing picking, packing, delivery executive assignment, delivery timestamps, delivery status, distance, and failure reasons. | Fulfillment efficiency, delivery time, workforce performance, and delivery failure analysis. |


> **Note:** The repository includes a separate data documentation file
> describing the datasets, their columns, and their usage. The CSV
> datasets are hosted externally because of their combined file size.
> Refer to
> [`01_data/DATA_DOCUMENTATION.md`](01_data/DATA_DOCUMENTATION.md) for
> the dataset download instructions and detailed documentation.

------------------------------------------------------------------------

## 📂 Repository Structure

``` text
SwasthyaMeds-E-Pharmacy-Supply-Chain-Analytics/
│
├── README.md
├── .gitignore
├── LICENSE
│
├── 01_data/
│   └── DATA_DOCUMENTATION.md
│
├── 02_sql/
│   │
│   ├── 01_schema_setup/
│   │   └── create_schemas.sql
│   │
│   └── 02_analytics_views/
│       │
│       ├── 01_analytics_demand/
│       │   ├── 01_product_demand_daily.sql
│       │   ├── 02_product_demand_monthly.sql
│       │   ├── 03_city_product_demand.sql
│       │   ├── 04_dark_store_product_demand.sql
│       │   └── 05_customer_product_demand.sql
│       │
│       ├── 02_analytics_cost/
│       │   ├── 01_monthly_procurement_cost.sql
│       │   ├── 02_monthly_product_procurement.sql
│       │   ├── 03_monthly_supplier_procurement.sql
│       │   ├── 04_monthly_supplier_product_procurement.sql
│       │   └── 05_supplier_product_efficiency.sql
│       │
│       └── 03_analytics_delivery/
│           ├── 01_monthly_city_delivery_performance.sql
│           ├── 02_monthly_dark_store_delivery_performance.sql
│           ├── 03_DE_delivery_performance.sql
│           └── 04_delivery_performance.sql
│
├── 03_python/
│   │
│   ├── 01_data_cleaning/
│   │   ├── 01_clean_dim_products.ipynb
│   │   ├── 02_clean_dim_customers.ipynb
│   │   ├── 03_clean_dim_dark_stores.ipynb
│   │   ├── 04_clean_dim_suppliers.ipynb
│   │   ├── 05_clean_dim_mother_warehouses.ipynb
│   │   ├── 06_clean_dim_delivery_executives.ipynb
│   │   ├── 07_clean_dim_supplier_products.ipynb
│   │   ├── 08_clean_fact_orders.ipynb
│   │   ├── 09_clean_fact_order_items.ipynb
│   │   ├── 10_clean_fact_purchase_orders.ipynb
│   │   └── 11_clean_fact_deliveries.ipynb
│   │
│   └── 02_eda/
│       ├── delivery_performance_eda.ipynb
│       ├── demand_eda.ipynb
│       └── procurement_eda.ipynb
│
├── 04_dashboards/
│   └── swasthyameds_daashboards.pbix
│
├── 05_scripts/
│   └── load_csvs.py
│
├── 06_business_report/
│   └── swasthyameds_business_report.pdf
│
└── 07_screenshots/
    ├── 01_executive_supply_chain_overview.jpg
    ├── 02_product_and_demand_analysis.jpg
    ├── 03_procurement_and_cost_optimization.jpg
    └── 04_fulfillment_and_delivery_performance.jpg
```

------------------------------------------------------------------------

## 📊 Dashboard Overview

The Power BI solution consists of **four interconnected dashboards**
that provide executive, product, procurement, and operational views of
SwasthyaMeds' e-pharmacy supply chain, enabling stakeholders to monitor
performance and support data-driven decision-making.

### 📈 Dashboard 1: Executive Supply Chain Overview

Provides a consolidated view of SwasthyaMeds' overall supply chain
health by bringing together key business, financial, and operational
performance indicators. It monitors order volumes, product sales,
procurement expenditure, customer activity, geographical demand
distribution, supplier sourcing patterns, and order fulfillment status.

```{=html}
<p align="center">
```
`<img src="07_screenshots/01_executive_supply_chain_overview.jpg" width="100%">`{=html}
```{=html}
</p>
```

------------------------------------------------------------------------

### 💊 Dashboard 2: Product & Demand Analysis

Provides an in-depth analysis of product performance and medicine demand
patterns across the e-pharmacy network. It examines SKU-level sales,
category-wise demand contribution, monthly demand trends, geographical
consumption patterns, and dark-store performance. The dashboard helps
identify high-demand products, major consumption markets, and
opportunities for more efficient inventory allocation.

```{=html}
<p align="center">
```
`<img src="07_screenshots/02_product_and_demand_analysis.jpg" width="100%">`{=html}
```{=html}
</p>
```

------------------------------------------------------------------------

### 💰 Dashboard 3: Procurement & Cost Optimization

Evaluates procurement expenditure, purchasing patterns, and supplier
performance to uncover cost drivers and procurement inefficiencies. It
analyzes monthly procurement costs and volumes, category-wise spending,
supplier-type contributions, supplier-level expenditure, and
product-level procurement costs. The dashboard supports the
identification of potential over-procurement, supplier dependency, and
opportunities to optimize purchasing decisions.

```{=html}
<p align="center">
```
`<img src="07_screenshots/03_procurement_and_cost_optimization.jpg" width="100%">`{=html}
```{=html}
</p>
```

------------------------------------------------------------------------

### 🚚 Dashboard 4: Fulfillment & Delivery Performance

Evaluates end-to-end order fulfillment and last-mile delivery operations
to identify operational bottlenecks and opportunities for service
improvement. It analyzes delivery volumes, early delivery performance,
average delivery time, delivery stage contributions, monthly delivery
trends, city-level performance, and the leading causes of unsuccessful
delivery attempts.

```{=html}
<p align="center">
```
`<img src="07_screenshots/04_fulfillment_and_delivery_performance.jpg" width="100%">`{=html}
```{=html}
</p>
```

------------------------------------------------------------------------

## 📄 Business Report

This project includes a comprehensive business report that translates
technical analysis into actionable business recommendations for
management and operational stakeholders.

The report covers:

-   Business Context & Objectives
-   Product Demand Analysis
-   Procurement Cost Optimization
-   Fulfillment & Delivery Performance
-   Key Insights & Findings
-   Strategic Recommendations

📄 **Business Report:**
[`06_business_report/swasthyameds_business_report.pdf`](06_business_report/swasthyameds_business_report.pdf)

------------------------------------------------------------------------

## 📈 Key Insights

-   **Growing Product Demand Across the Platform:** SwasthyaMeds
    recorded approximately **1.63M medicine units sold across 595K
    orders**, covering **6,120 active SKUs**. Monthly demand and order
    volumes demonstrate a consistent upward trend, indicating growing
    platform activity and medicine consumption.
-   **Demand Concentration Across Product Categories:** The top six
    medicine categories contribute **55.2% of total units sold**.
    Additionally, the top 706 SKUs, representing approximately 11.5% of
    the catalogue, account for 50% of overall demand.
-   **Significant Geographical Concentration of Demand:** Kolkata
    accounts for **84.72% of total orders**, while nine of the top ten
    dark stores are located in Kolkata. The top three dark stores
    collectively contribute approximately 43.5% of total units sold.
-   **Repeat Customers Drive Platform Engagement:** Repeat customers
    account for **97.2% of the 58K active customers**, indicating strong
    customer retention, although new customer acquisition remains an
    opportunity for business growth.
-   **Procurement Expenditure Shows a Significant Upward Trend:** Total
    procurement expenditure reached **₹611.6M**, covering 4.31M units
    procured across approximately 103K purchase orders. Purchasing
    volume emerged as a major driver of expenditure growth, while
    average procurement costs remained relatively stable.
-   **Procurement Volume Significantly Exceeds Demand:** Procurement
    quantities remain substantially higher than actual demand across the
    observed period, highlighting potential inventory accumulation,
    expiry exposure, and unnecessary working capital commitments.
-   **Procurement Spending Is Concentrated Across Suppliers:**
    Manufacturers account for **73.4% of total procurement
    expenditure**, while the top ten suppliers collectively contribute
    approximately 44.4% of overall spending.
-   **Supplier Reliability Remains Strong:** Suppliers maintain an
    average fulfillment rate of **98.2%**, with an average procurement
    lead time of 9.8 days. Differences in pricing, minimum order
    quantities, discounts, and delivery lead times highlight the
    importance of balanced supplier evaluation.
-   **Delivery Executive Assignment Is the Biggest Operational
    Bottleneck:** DE assignment waiting time contributes 34.5% of total
    delivery time, followed by DE arrival time at 21.6%. Together, these
    stages account for **56.1% of overall delivery duration**.
-   **Customer Availability Is the Leading Cause of Delivery Failures:**
    Customer unavailability and customer unreachability are the two
    leading delivery failure reasons. Kolkata also records the highest
    average delivery time among the analyzed cities.

------------------------------------------------------------------------

## 💡 Strategic Recommendations

-   **Implement Demand-Driven Inventory Allocation:** Establish a
    centralized inventory planning framework using SKU-level demand
    contribution, category consumption, and geographical demand patterns
    to optimize stocking priorities and replenishment decisions.
-   **Align Procurement Quantities with Actual Demand:** Introduce
    SKU-level purchasing controls, optimize order quantities against
    supplier MOQs, and regularly monitor procurement volumes against
    demand to minimize potential over-procurement and improve working
    capital utilization.
-   **Establish a Cost-Efficient, Performance-Based Supplier Strategy:**
    Evaluate suppliers based on procurement costs, discounts, minimum
    order quantities, lead times, and fulfillment reliability. Leverage
    purchasing concentration to negotiate better commercial terms while
    balancing direct manufacturer sourcing with flexible distributor and
    wholesaler arrangements.
-   **Implement Automated, Proximity-Based Delivery Executive
    Assignment:** Replace manual DE allocation at dark stores with an
    automated system that considers real-time executive availability,
    geographical proximity, and current workload to assign orders
    efficiently and reduce dispatch delays.
-   **Strengthen Proactive Customer Coordination:** Introduce automated
    delivery notifications, availability confirmation, address
    verification, and structured follow-up procedures for unreachable or
    unavailable customers to minimize unsuccessful delivery attempts.
-   **Optimize Dark Store Picking & Order Processing:** Introduce
    standardized product storage locations, clearly labelled shelves,
    digital pick lists, and optimized picking sequences to reduce
    product retrieval time and improve order processing efficiency.

------------------------------------------------------------------------

## 🎯 Project Outcome

This project demonstrates an end-to-end supply chain analytics workflow,
encompassing dataset preparation, PostgreSQL database development,
SQL-based data cleaning and analytical modeling, Python-driven
exploratory data analysis, and interactive Power BI dashboard
development. The analysis translates large-scale pharmaceutical supply
chain data into actionable business insights across product demand,
procurement expenditure, supplier performance, and order fulfillment.
The resulting business report provides strategic recommendations to
improve inventory allocation, control procurement costs, strengthen
supplier selection, and optimize fulfillment and last-mile delivery
operations.

------------------------------------------------------------------------

## 📈 Business Impact

This analysis provides SwasthyaMeds with a data-driven framework for
strategic supply chain decision-making by identifying demand
concentration patterns, potential procurement inefficiencies, supplier
optimization opportunities, and delivery operational bottlenecks. The
recommendations support more effective inventory allocation, improved
procurement expenditure control, better supplier management, and
efficient workforce utilization. Collectively, these improvements are
expected to strengthen operational efficiency, optimize working capital
utilization, improve fulfillment reliability, and enhance the overall
customer experience.

------------------------------------------------------------------------

## ▶️ How to Run the Project

Follow these steps to reproduce the SwasthyaMeds supply chain analytics
workflow:

### 1. Clone the Repository

``` bash
git clone https://github.com/sagar-biswas-data/swasthyameds-epharmacy-supply-chain-analytics.git
cd swasthyameds-epharmacy-supply-chain-analytics
```

### 2. Download the Datasets

The complete dataset collection is hosted on Google Drive due to its
large file size (approximately 341 MB).

-   Open the Google Drive link provided in
    `01_data/DATA_DOCUMENTATION.md`.
-   Download the complete dataset archive and extract the CSV files.
-   Place all 11 CSV files directly inside the `01_data/` directory.

Refer to `DATA_DOCUMENTATION.md` for the complete dataset inventory,
column descriptions, and data relationships.

### 3. Install Python Dependencies

Ensure Python and PostgreSQL are installed on your system. Install the
required Python libraries:

``` bash
pip install pandas numpy matplotlib seaborn sqlalchemy psycopg2-binary jupyter
```

### 4. Configure PostgreSQL Database Connectivity

-   Create a PostgreSQL database for the SwasthyaMeds project.
-   Configure the database connection credentials in
    `05_scripts/load_csvs.py`.
-   Ensure that the database server is running and the connection
    details are correctly configured.

### 5. Create the PostgreSQL Schemas

Execute the SQL script to create the required database schemas:

``` text
02_sql/01_schema_setup/create_schemas.sql
```

### 6. Load the Datasets into PostgreSQL

Run the Python loading script from the project root directory:

``` bash
python 05_scripts/load_csvs.py
```

The script loads the prepared CSV datasets into PostgreSQL for
subsequent SQL-based analysis.

### 7. Execute SQL Analytical Views

Run the SQL files within each analytical directory in their numbered
order:

``` text
02_sql/
├── 01_schema_setup/
└── 02_analytics_views/
    ├── 01_analytics_demand/
    ├── 02_analytics_cost/
    └── 03_analytics_delivery/
```

-   **01_analytics_demand** -- Product-level, monthly, city-level,
    dark-store-level, and customer-level demand analysis.
-   **02_analytics_cost** -- Monthly procurement expenditure, product
    procurement, supplier procurement, supplier-product procurement, and
    supplier efficiency analysis.
-   **03_analytics_delivery** -- Monthly city-level, dark-store-level,
    delivery executive, and overall delivery performance analysis.

### 8. Run the Analysis

Open the notebooks in the `03_python/` directory.

-   Execute the 11 notebooks inside `01_data_cleaning/` to perform
    dataset-specific cleaning and preprocessing.
-   Run the three notebooks inside `02_eda/` to explore product demand,
    procurement costs, and delivery performance.

Ensure the PostgreSQL connection is configured correctly before
executing the analysis notebooks.

### 9. Open the Power BI Dashboards

Open the `.pbix` file located in the `04_dashboards/` folder and
configure the PostgreSQL data connection to refresh the data and explore
the interactive dashboards.

### 10. Review the Business Report

Read the report in the `06_business_report/` folder for a detailed
summary of the analysis, key insights, and strategic recommendations.

------------------------------------------------------------------------

## 🚀 Future Improvements

This project can be further enhanced by incorporating advanced
analytics, intelligent automation, and scalable data infrastructure:

-   **Machine Learning for Demand Forecasting** -- Develop predictive
    models to forecast medicine demand at SKU, category, city, and
    dark-store levels, enabling proactive inventory planning and
    replenishment.
-   **Intelligent Inventory Optimization** -- Build an optimization
    framework to recommend optimal stock levels, reorder points, and
    safety stock quantities based on demand patterns, supplier lead
    times, and inventory requirements.
-   **Automated Supplier Recommendation System** -- Develop a supplier
    scoring and recommendation model that evaluates procurement costs,
    discounts, minimum order quantities, lead times, and fulfillment
    reliability to identify the most cost-effective sourcing options.
-   **Automated Delivery Executive Assignment** -- Implement a real-time
    assignment system that automatically allocates delivery orders to
    the most suitable available executive based on geographical
    proximity, current workload, and availability.
-   **Predictive Delivery Time Estimation** -- Develop predictive models
    to estimate delivery times using historical fulfillment performance,
    city-level traffic patterns, delivery distances, and delivery
    executive availability.
-   **Interactive Supply Chain Analytics Application** -- Develop a
    web-based analytics portal using Streamlit or Dash, enabling
    stakeholders to explore product demand, procurement performance,
    inventory indicators, and delivery operations without requiring
    Power BI Desktop.

------------------------------------------------------------------------

## 👨‍💻 Author

**Sagar Biswas**

- **GitHub:** https://github.com/sagar-biswas-data
- **LinkedIn:** https://linkedin.com/in/sagar-biswas-data
- **Email:** sagarbiswas.ds29@gmail.com

If you found this project interesting or have any feedback, feel free to connect with me!
