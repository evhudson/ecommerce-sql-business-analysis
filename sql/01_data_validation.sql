SELECT
    COUNT(*) AS total_rows,

    COUNT(*) FILTER (
        WHERE customerid IS NULL
    ) AS missing_customer_ids,

    COUNT(*) FILTER (
        WHERE invoiceno LIKE 'C%'
    ) AS cancellation_lines,

    COUNT(*) FILTER (
        WHERE quantity < 0
    ) AS negative_quantity_lines,

    COUNT(*) FILTER (
        WHERE unitprice <= 0
    ) AS zero_or_negative_prices

FROM online_retail;
