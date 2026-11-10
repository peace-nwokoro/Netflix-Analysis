Create Table Titles
(
show_id nvarchar(10) primary key,
type nvarchar(20) not null,
title nvarchar (250) not null
)


Create Table Countries
(
Country_id int identity(1,1) primary key,
country nvarchar(550) null,
)

Create Table Category
(
Category_id int identity(1,1) primary key,
listed_in nvarchar(550) null,
)

Create Table TitleCountries
(
show_id nvarchar(10),
country_id int,
primary key (show_id, country_id),
foreign key (show_id) references Titles,
foreign key (country_id) references Countries,
)

Create Table TitleCategory
(
show_id nvarchar(10),
category_id int,
primary key (show_id, category_id),
foreign key (show_id) references Titles,
foreign key (Category_id) references Category,
)
