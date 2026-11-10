Create View Nigerian_Movies AS
Select t.show_id,t.type,t.title,c.country from Titles t
Join TitleCountries tc on t.show_id = tc.show_id
join Countries c on tc.country_id = c.Country_id
where t.type = 'Movie'
and c.country = 'Nigeria'

go 

CREATE PROCEDURE GetMoviesByCountries @Country nvarchar(550)
AS
BEGIN
    SELECT
        T.show_id,
        T.type,
        T.title,
        C.country
    FROM Titles T
    JOIN TitleCountries TC
        ON T.show_id = TC.show_id
    JOIN Countries C
        ON TC.country_id = C.country_id
    WHERE T.type = 'Movie'
    AND C.country = @Country;
END;

Exec GetMoviesByCountries @Country = 'Canada'