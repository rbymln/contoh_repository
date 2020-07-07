CREATE DATABASE Robby;

show databases;

use world;

show tables;

use mysql;

show tables;

show databases;

use toko;

create table karyawan(
     No int not null auto_increment,
     Nama varchar(30) not null,
     Usia smallint,
     Berat float(3,1),
     Kota text,
     Th year,
     Data_In timestamp default current_timestamp,
     primary key (No)
    );
    
select * from karyawan;

INSERT INTO karyawan VALUES(
null,
'Andi',
32,
68.3,
'Jakarta',
2010,
null
);

create table member(
	nama varchar(50),
    usia smallint,
    id int
);

select * from member;
insert into member(nama,usia,id) values
("Andi",21,1),("Budi",22,4),("Caca",23,4),("Dedi",24,4);

INSERT INTO karyawan (Nama,Usia,Berat,Kota,Th) VALUES
('Hamzah Syah',55,66.0,'Yogyakarta',2008),
('Irene Sukindar',60,49.3,'Jakarta',2016),
('Joni Saputra',45,69.8,'Yogyakarta',2000);

insert into karyawan(Nama) values
('caca'),('dedi');

alter table karyawan 
add column Gaji int after Th;

alter table karyawan 
drop column Gaji;

#Update Column
UPDATE karyawan set Kota = "Jakarta";


#Update column
 UPDATE karyawan set Nama = "Andi Santosa"
 WHERE No = 1;

#Delete Row
DELETE FROM karyawan
WHERE No = 9;

UPDATE karyawan set Berat = 70
WHERE No = 10;

Select * from karyawan;
select Nama,Usia from karyawan;

select * from karyawan limit 2;

#Tampilkan setelah row ke-5 dan 5 baris berikutnya
select No,Nama,Kota from karyawan
limit 5,5;

Select Nama, Berat,
0.5 * Berat As SeparuhAku
From karyawan;


SELECT Nama, Usia,
55 - Usia as MenujuPensiun
From karyawan;

SELECT * FROM karyawan
order by Usia;

SELECT * FROM karyawan
order by Usia DESC;

SELECT Nama,Usia,Berat
from karyawan
order by Usia,Berat;

SELECT Nama,Usia,Berat
from karyawan
order by Usia,Nama;

Select * FROM Karyawan
where usia > 30;

Select * FROM Karyawan
where usia > 30 AND Berat < 70;

Select nama FROM Karyawan
where usia < 40 or th > 2010;


Select Nama, Usia from karyawan
Where th In(2000,2010)

#Tampilkan seluruh nama yang awalannya a
Select Nama From karyawan
Where Nama Like 'a%';

#Tampilkan seluruh nama yang akhirannya r
Select Nama From karyawan
Where Nama Like '%r';

UPDATE karyawan SET Kota = "Jakarta"
WHERE No = 11;

use world;
select * from country
where name = "Indonesia";
select * from city
 WHERE ID = 939 ;
select * from countrylanguage


-- Nomor1
select ID,name as nama_kota, CountryCode as county_code,district,population 
from city
WHERE CountryCode = "IDN"
ORDER BY POPULATION desc 
LIMIT 10;

-- Nomor2
select ID,c.name as nama_kota,district,ctr.name as nama_negara,c.population 
from city c 
inner join country ctr
on c.countrycode = ctr.code
ORDER BY POPULATION desc 
LIMIT 10;


-- Nomor3
select code,name,continent,region,IndepYear
from country
where indepyear is not null
order by indepyear;

-- nomor4
select continent,count(continent) as banyak_negara,sum(population) as total_population
,avg(lifeexpectancy) as Rata_AngkaHrpnHdp 
from country
group by continent
having banyak_negara > 10
order by total_population desc;

-- nomor5

select name,continent as benua, LifeExpectancy as AngkaHarapanHidup, GNP 
from country
where continent = "Asia" and LifeExpectancy > (select avg(LifeExpectancy) from country
where continent = "Europe")
order by LifeExpectancy desc;

select name as Nama, continent as benua, lifeexpectancy as AngkaHidup, gnp
from country 
where continent = "Asia" and 
lifeexpectancy  > (select avg(case when continent = "Europe" then lifeexpectancy 
else null end) from country)
order by lifeexpectancy desc;


-- nomor6
select countrycode,ctr.name,language,isofficial,percentage 
from countrylanguage cl
inner join country ctr
on cl.countrycode = ctr.code
where language = "English" and isofficial = "T"
order by percentage desc limit 10;

-- nomor7
select ctr.name,ctr.population,gnp,c.name,c.population 
from country ctr
inner join city  c 
on ctr.capital = c.id 
where region = "southeast asia"
order by ctr.name;

#nomor 8
select ctr.name,ctr.population,gnp,c.name,c.population
from country ctr
inner join city c
on ctr.capital = c.id
where ctr.name in('Australia','Argentina','Brazil','Canada','China','France',
'Germany','India','Indonesia','Japan','Mexico','Russian Federation','South Korea',
'Turkey','United Kingdom','United States')
order by ctr.name;

-- nomor8
select ctr.name,population_country as populasi_negara,gnp as GNP,
name as Ibukota,population as population_ibukota 
from country ctr
inner join city 
on country.capital = city.id 
where country_name = "Australia" or country_name = "Indonesia" or
country_name = "Germany"  or
country_name = "Canada" or country_name = "Saudi Arabia" or 
country_name = "United States" or country_name = "India" or
country_name = "Russian Federation" or country_name = "Turkey" or
country_name = "Argentina" or country_name = "Brazil" or
country_name = "Mexico" or country_name = "France" or
country_name = "Germany" or
country_name = "United Kingdom" or country_name = "China" or
country_name = "Japan" or country_name = "South Korea"
order by country_name;

#nomor 8
select ctr.name,ctr.population,gnp,c.name,c.population
from country ctr
inner join city c
on ctr.capital = c.id
where GNP > (SELECT avg(gnp) from country)
order by GNP desc, ctr.name
limit 20;select ctr.name,ctr.population,gnp,c.name,c.population
from country ctr
inner join city c
on ctr.capital = c.id
where GNP > (SELECT avg(gnp) from country)
order by GNP desc, ctr.name
limit 20;

alter table country rename column country_name to name;
alter table country rename column population_country to population;

select country_name,population_country,gnp,name,population from country 
inner join city on country.capital = city.id 
where region = "southeast asia"
order by country_name;

use toko;
show full tables;

create view senior as 
select nama,usia from karyawan
where usia > 35;


select * from senior;
