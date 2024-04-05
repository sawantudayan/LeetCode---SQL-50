SELECT
    A.PROJECT_ID,
    ROUND(AVG(B.EXPERIENCE_YEARS), 2) AS AVERAGE_YEARS
FROM
    PROJECT A
LEFT JOIN EMPLOYEE B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID
GROUP BY A.PROJECT_ID