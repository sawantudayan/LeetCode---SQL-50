SELECT
    COALESCE (
        (
            SELECT
                NUM
            FROM
                MYNUMBERS
            GROUP BY
                NUM
            HAVING
                COUNT(NUM) = 1
            ORDER BY
                NUM DESC
            LIMIT
                1
        ), NULL
    ) AS NUM