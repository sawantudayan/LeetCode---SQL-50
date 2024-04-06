SELECT
    DATE_FORMAT(TRANS_DATE, '%Y-%m') AS month,
    country,
    COUNT(STATE) AS trans_count,
    SUM(IF(STATE = 'APPROVED', 1, 0)) AS approved_count,
    SUM(AMOUNT) AS trans_total_amount,
    SUM(IF(STATE = 'APPROVED', AMOUNT, 0)) AS approved_total_amount
FROM
    TRANSACTIONS
GROUP BY
    1, 2