create database ex1tp3 ;
use ex1tp3 ;

select * from Stagiaire ;
select * from Examen ;


create table Stagiaire (NumS int primary key ,NomS varchar(30) , PrenomS varchar(30),TelS varchar(30), adrS varchar(30));
create table Examen (NumE int primary key ,SalleE varchar(30) , DateE date ,TypeE varchar(30));

INSERT INTO Stagiaire VALUES (3, 'Nom3', 'Prenom3', '06949d99', 'Adress 3 hvvsshhdhd');
INSERT INTO Examen VALUES ('13', 'sale3', '2012-08-02', 'Type3');


select * from Stagiaire ;  # 1)
select NomS,prenoms,Nums  as 'Num de stagiaire' from Stagiaire ;
select NumE as "Num d'examen",DateE as "Date de realisation" from Examen ;

select NomS,prenoms   from Stagiaire order by NomS desc ;

select * from Examen where TypeE = 'Pratique' ;
select * from Examen where SalleE  in('A1',"A2") ;
select * from Examen order by DateE ; 

select * from Examen order by SalleE asc , DateE desc ; 
select * from stagiaire where NomS like '%u%'  ;
select prenoms from stagiaire where prenomS like "%m"  ;
select prenoms from stagiaire where prenomS like "%m" or prenomS like  "%d"  ;

select noms,prenoms from stagiaire where nomS like "%i" and prenoms like  "%m"  ;
select noms from stagiaire where nomS like "_a%"   ;

select noms from stagiaire where nomS not like "_a%"   ;
select noms from stagiaire where substring(noms,2,1) != 'a'   ;
select noms from stagiaire where not substring(noms,2,1) = 'a'   ;

#select substring("Salah",2,2);

select * from Examen where TypeE like "A%" ; 
select sallee from Examen where sallee is not null ; 
select distinct sallee from Examen where sallee is not null ; 
