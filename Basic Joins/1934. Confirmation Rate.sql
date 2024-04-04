# Write your MySQL query statement below
SELECT
    S.USER_ID,
    ROUND(
        COALESCE(
            SUM(
                CASE
                    WHEN ACTION = 'CONFIRMED' THEN 1
                END
            ) / COUNT(*),0),2
    ) AS CONFIRMATION_RATE
FROM
    SIGNUPS S
    LEFT JOIN CONFIRMATIONS C ON S.USER_ID = C.USER_ID
GROUP BY
    S.USER_ID;