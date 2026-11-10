select count(*)
from netflix_Raw

select top 10 * from netflix_Raw

select show_id, count(*) as Duplicatecount
from netflix_Raw
Group by show_id
having count(*) > 1


SELECT
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS MissingDirectors,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS MissingCountries,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS MissingRatings,
    SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS MissingDates
FROM Netflix_Raw;