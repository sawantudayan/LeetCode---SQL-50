SELECT
    x,
    y,
    z,
    CASE
        WHEN X + Y <= Z THEN 'No'
        WHEN Y + Z <= X THEN 'No'
        WHEN Z + X <= Y THEN 'No'
        ELSE 'Yes'
    END AS triangle
FROM
    TRIANGLE