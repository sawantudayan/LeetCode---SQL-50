SELECT
    VISITED_ON,
    AMOUNT,
    AVERAGE_AMOUNT
FROM
    (
        SELECT
            VISITED_ON,
            COUNT(VISITED_ON) OVER (
                ORDER BY
                    VISITED_ON ROWS BETWEEN 6 PRECEDING
                    AND CURRENT ROW
            ) CNT,
            SUM(AMOUNT) OVER (
                ORDER BY
                    VISITED_ON ROWS BETWEEN 6 PRECEDING
                    AND CURRENT ROW
            ) AMOUNT,
            ROUND(
                AVG(AMOUNT) OVER (
                    ORDER BY
                        VISITED_ON ROWS BETWEEN 6 PRECEDING
                        AND CURRENT ROW
                ),
                2
            ) AVERAGE_AMOUNT
        FROM
            (
                SELECT
                    VISITED_ON,
                    SUM(AMOUNT) AMOUNT
                FROM
                    CUSTOMER
                GROUP BY
                    1
            ) T1
        GROUP BY
            1
    ) T2
WHERE
    CNT = 7
ORDER BY
    1