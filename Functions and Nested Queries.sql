Select Count(title) from Titles
where type = 'TV Show'

 SELECT country_id
FROM Countries
WHERE country = 'Nigeria';

/* Nested query */

SELECT show_id, title, type
FROM dbo.Titles
WHERE type = 'Movie'
AND show_id IN
(
    SELECT show_id
    FROM dbo.TitleCountries
    WHERE country_id IN
    (
        SELECT country_id
        FROM dbo.Countries
        WHERE country = 'Nigeria'
    )
)
AND show_id IN
(
    SELECT show_id
    FROM dbo.TitleCategory
    WHERE category_id IN
    (
        SELECT category_id
        FROM dbo.Category
        WHERE listed_in = 'Dramas'
    )
);