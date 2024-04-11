# Write your MySQL query statement below
SELECT
    A.PRODUCT_ID,
    A.YEAR AS FIRST_YEAR,
    A.QUANTITY,
    A.PRICE
FROM
    SALES A
    JOIN (
        SELECT
            PRODUCT_ID,
            MIN(YEAR) AS YEAR
        FROM
            SALES
        GROUP BY
            PRODUCT_ID
    ) B ON A.PRODUCT_ID = B.PRODUCT_ID
    AND A.YEAR = B.YEAR