insert Titles (show_id,type,title)
select show_id,type,title
from netflix_Raw

insert into Category (listed_in)
select distinct  LTRIM(RTRIM(value))
from netflix_Raw 
CROSS APPLY STRING_SPLIT(listed_in, ',')
where listed_in is not null

insert into Countries (country)
SELECT DISTINCT LTRIM(RTRIM(value))
From netflix_Raw
CROSS APPLY STRING_SPLIT(country, ',')
where country is not null

INSERT INTO TitleCategory(show_id, category_id)
SELECT DISTINCT
    r.show_id,
    c.Category_id
FROM Netflix_Raw r
CROSS APPLY STRING_SPLIT(r.listed_in, ',') s
INNER JOIN Category c
    ON LTRIM(RTRIM(s.value)) = c.listed_in;


INSERT INTO TitleCountries(show_id, country_id)
SELECT DISTINCT
    r.show_id,
    c.country_id
FROM Netflix_Raw r
CROSS APPLY STRING_SPLIT(r.country, ',') s
INNER JOIN Countries c
    ON LTRIM(RTRIM(s.value)) = c.country;
