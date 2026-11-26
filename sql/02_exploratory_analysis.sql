==================================================
ONLINE RETAIL DATASET – EXPLORATORY ANALYSIS
==================================================
*/

-- 1. DATASET OVERVIEW
-- Basic size, coverage and date range of the dataset.

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT invoiceno) AS unique_invoices,
    COUNT(DISTINCT stockcode) AS unique_products,
    COUNT(DISTINCT customerid) AS unique_customers,
    COUNT(DISTINCT country) AS unique_countries,
    MIN(invoicedate) AS first_transaction,
    MAX(invoicedate) AS last_transaction
FROM online_retail;

-- 2. REVENUE AND CANCELLATIONS
-- Compare the full recorded value with revenue from non-cancelled invoices.
-- Important: excluding C-prefixed invoices does not remove the two
-- negative "Adjust bad debt" entries; these remain in this revenue measure.

SELECT
    SUM(quantity * unitprice) AS total_revenue
FROM online_retail;

SELECT
    SUM(quantity * unitprice) AS total_revenue,
    SUM(
        CASE
            WHEN invoiceno NOT LIKE 'C%'
            THEN quantity * unitprice
            ELSE 0
        END
    ) AS revenue_excluding_cancellations
FROM online_retail;

SELECT
    SUM(quantity * unitprice) AS cancellation_value,
    COUNT(DISTINCT invoiceno) AS cancelled_invoices
FROM online_retail
WHERE invoiceno LIKE 'C%';


-- 3. MONTHLY SALES TRENDS
-- Monthly revenue, order volume and average order value.
-- Note: December 2011 is a partial month in this dataset.

SELECT
    TO_CHAR(DATE_TRUNC('month', invoicedate), 'YYYY-MM')
        AS sales_month,
    ROUND(SUM(quantity * unitprice)::numeric, 2)
        AS monthly_revenue
FROM online_retail
WHERE invoiceno NOT LIKE 'C%'
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY DATE_TRUNC('month', invoicedate);

SELECT
    TO_CHAR(DATE_TRUNC('month', invoicedate), 'YYYY-MM')
        AS sales_month,
    COUNT(DISTINCT invoiceno) AS total_orders
FROM online_retail
WHERE invoiceno NOT LIKE 'C%'
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY DATE_TRUNC('month', invoicedate);


SELECT
    TO_CHAR(DATE_TRUNC('month', invoicedate), 'YYYY-MM')
        AS sales_month,
    ROUND(
        (SUM(quantity * unitprice) /
        COUNT(DISTINCT invoiceno))::numeric, 2
    ) AS average_order_value
FROM online_retail
WHERE invoiceno NOT LIKE 'C%'
GROUP BY DATE_TRUNC('month', invoicedate)
ORDER BY DATE_TRUNC('month', invoicedate);

-- 4. COUNTRY ANALYSIS
-- Compare revenue and order volume by customer country.

SELECT
    country,
    ROUND(SUM(quantity * unitprice)::numeric, 2)
        AS total_revenue,
    COUNT(DISTINCT invoiceno)
        AS total_orders
FROM online_retail
WHERE invoiceno NOT LIKE 'C%'
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 15;
