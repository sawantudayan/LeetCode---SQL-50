(
    SELECT
        NAME AS RESULTS
    FROM
        USERS A
        LEFT JOIN MOVIERATING B ON A.USER_ID = B.USER_ID
    GROUP BY
        NAME
    ORDER BY
        COUNT(RATING) DESC,
        NAME ASC
    LIMIT
        1
)

UNION ALL 

(
    SELECT
        TITLE
    FROM
        MOVIES A
        LEFT JOIN MOVIERATING B ON A.MOVIE_ID = B.MOVIE_ID
    WHERE
        DATE_FORMAT(CREATED_AT, '%Y-%m') = '2020-02'
    GROUP BY
        TITLE
    ORDER BY
        AVG(RATING) DESC,
        TITLE ASC
    LIMIT
        1
)