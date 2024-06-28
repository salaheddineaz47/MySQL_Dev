create database tp4ex1 ;
use tp4ex1 ;

create table Stagiaire (NumS int primary key ,NomS varchar(30) , PrenomS varchar(30),TelS varchar(30), adrS varchar(30));
create table Examen (NumE int primary key ,SalleE varchar(30) , DateE date ,TypeE varchar(30));

INSERT INTO Stagiaire VALUES (3, 'Nom3', 'Prenom3', '06949d99', 'Adress 3 hvvsshhdhd');
INSERT INTO Examen VALUES ('23', 'sale4', '2012-08-02', 'Pratique');

alter table Stagiaire modify column NumS int auto_increment ;
alter table Examen modify column NumE int auto_increment ;

-- 1)
select count(NumE) from Examen where TypeE = "Pratique" ;
-- 2)
select min(DateE) as "La date du premier examen effectué" from Examen  ; 
-- 3)
select count(NumS) from Stagiaire where NomS like '%b%' or NomS like '%s%'    ; 
-- 4)
select count(NumE) as 'le nombre dexamen en salle B5 ' from Examen where  SalleE ='B5'   ; 
-- 5)
select count(NumE) as 'le nombre dexamen en salle commencent par A ' from Examen where  SalleE like 'A%'   ; 
-- 6)
select DateE,count(SalleE)  from Examen  group by DateE   ; 
-- 7)
select SalleE,count(SalleE)  from Examen  group by SalleE   ; 
-- 8)
select SalleE,count(SalleE)  from Examen where SalleE like 'A%' group by SalleE   ; 
-- select SalleE,count(SalleE)  from Examen  group by SalleE   ; 
-- 9)
select SalleE  from Examen group by SalleE having count(SalleE) >= 2   ; 
-- 10)
select SalleE  from Examen group by SalleE having count(SalleE) = 3   ; 
-- 11)
select SalleE  from Examen where SalleE like 'A%' group by SalleE having count(SalleE) = 2   ; 



select * from Stagiaire ;
select * from Examen ;





drop table Stagiaire ;
drop table Stagiaire ;