create database testy ;
use testy ;

select * from Stagiaire ;
select * from Examen ;

create table Stagiaire (NumS int primary key ,NomS varchar(30) , PrenomS varchar(30),TelS varchar(30), adrS varchar(30));
create table Examen (NumE int primary key ,SalleE varchar(30) , DateE date ,TypeE varchar(30));

select * from Stagiaire ;
select NumS,TelS as Numero_TEl from Stagiaire ;
