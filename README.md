# E-Commerce Sales & Customer Analysis (SQL)

## Project Overview

This project explores transactional data from a UK-based online retailer using PostgreSQL. The aim was to investigate sales performance, product trends and customer purchasing behaviour, using SQL to identify meaningful business insights.

The analysis also involved investigating data-quality issues and making informed decisions about how unusual transactions should be handled.

## Dataset

**Source:** [UCI Machine Learning Repository – Online Retail Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)

The dataset contains 541,909 transaction records from December 2010 to December 2011.

Key fields include:
- Invoice number
- Product stock code and description
- Quantity purchased
- Invoice date
- Unit price
- Customer ID
- Country

## Tools Used

- PostgreSQL
- SQL
- DBeaver

## Analysis and Business Questions

### 1. Sales Performance
- What is the overall recorded revenue?
- How does revenue change when cancelled invoices are excluded?
- How do monthly revenue, order volume and average order value vary?

### 2. Product Performance
- Which products sell the highest number of units?
- Which products generate the most revenue?
- How do rankings change when non-standard stock codes are excluded?

### 3. Country Analysis
- Which countries generate the most revenue?
- How does order volume compare across countries?

### 4. Customer Analysis
- Who are the highest-spending customers?
- What proportion of customers place repeat orders?
- How is customer spending distributed?

### 5. Data Quality
- How should cancelled transactions be handled?
- How do missing customer IDs affect customer analysis?
- What do zero-priced and negative-priced transactions represent?

## Key Findings

- **Revenue:** Revenue excluding cancelled invoices was approximately £10.64 million.
- **Monthly performance:** November 2011 recorded the highest monthly revenue, at approximately £1.51 million.
- **Geographical performance:** The UK accounted for the largest share of revenue.
- **Product performance:** Regency Cake Stand 3 Tier was the highest-revenue product after excluding non-standard stock codes.
- **Repeat purchasing:** Approximately 65.57% of identified customers made more than one purchase.
- **Data quality:** The investigation identified 1,179 zero-price transaction rows and two negative-price accounting adjustments.

## Data Quality and Analytical Decisions

Several data-quality checks were carried out before interpreting the results.

- Cancelled invoices, identified by invoice numbers beginning with `C`, were excluded from sales analyses.
- Transactions without customer IDs were excluded from customer-level analysis.
- Zero-priced transactions were investigated. These represented approximately 0.22% of non-cancelled transaction rows with positive quantities.
- Two negative unit-price records were identified. Both were described as `Adjust bad debt` and were treated as accounting adjustments rather than ordinary product sales.
- The final customer spending summary excluded non-positive unit prices to focus on revenue-generating purchases.

The original records were retained in the source dataset.

## Repository Structure

```text
ecommerce-sql-business-analysis/
│
├── README.md
│
└── sql/
    ├── 01_data_validation.sql
    └── 02_exploratory_analysis.sql
```

## Project Learning Outcomes

This project demonstrates practical SQL skills, including:

- Aggregate functions and grouping
- Filtering and conditional aggregation
- Common Table Expressions (CTEs)
- Date and time analysis
- Window and percentile functions
- Customer segmentation
- Data-quality investigation
- Translating analytical findings into business insights
