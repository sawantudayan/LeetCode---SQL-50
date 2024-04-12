WITH A AS (
    SELECT
        *
    FROM
        QUEUE
    ORDER BY
        TURN ASC
),

B AS (
    SELECT
        *,
        SUM(WEIGHT) OVER (
            ORDER BY
                TURN
        ) AS EX_WEIGHT
    FROM
        A
)

SELECT
    PERSON_NAME
FROM
    B
WHERE
    EX_WEIGHT <= 1000
ORDER BY
    EX_WEIGHT DESC
LIMIT 1;