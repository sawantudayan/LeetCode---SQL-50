# Write your MySQL query statement below
SELECT
    MACHINE_ID,
    ROUND(AVG(END - START),
    3
) AS PROCESSING_TIME
FROM
    (
        SELECT
            MACHINE_ID,
            PROCESS_ID,
            MAX(CASE WHEN ACTIVITY_TYPE = 'START' THEN TIMESTAMP END) AS START,
            MAX(CASE WHEN ACTIVITY_TYPE = 'END' THEN TIMESTAMP END) AS END
        FROM
            ACTIVITY
        GROUP BY
            MACHINE_ID,
            PROCESS_ID
        ) AS A
GROUP BY
    MACHINE_ID