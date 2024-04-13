SELECT
    ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM
    INSURANCE A
WHERE
    TIV_2015 IN (
        SELECT
            TIV_2015
        FROM
            INSURANCE B
        WHERE
            A.PID != B.PID
    )
    AND(LAT, LON) NOT IN (
        SELECT
            LAT,
            LON
        FROM
            INSURANCE C
        WHERE
            C.PID != A.PID
    )