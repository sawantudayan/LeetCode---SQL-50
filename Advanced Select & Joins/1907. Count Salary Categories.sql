# Write your MySQL query statement below
SELECT
    'Low Salary' AS category,
    SUM(IF(INCOME < 20000, 1, 0)) AS accounts_count
FROM
    ACCOUNTS

UNION

SELECT
    'Average Salary' as category,
    SUM(
        IF(INCOME >= 20000 AND INCOME <= 50000, 1, 0)) AS accounts_count
FROM
    ACCOUNTS

UNION

SELECT
    'High Salary' as categroy,
    SUM(IF(INCOME > 50000, 1, 0)) AS accounts_count
FROM
    ACCOUNTS