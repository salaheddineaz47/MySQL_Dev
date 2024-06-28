create database myex2tp2 ;
use myex2tp2;
create table Employé(
 Num_Emp int primary key ,
 Nom_Emp varchar(30) NOT NULL, 
 Prenom_Emp varchar(30) NOT NULL, 
 Fonction_Emp varchar(30),
 DateNaissance_Emp date,
 DateEmbauche_Emp  date,
 Salaire_Emp float,
 Num_Dep int,
foreign key(Num_Dep) references Département (Num_Dep), CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur'), 
CHECK(Salaire_Emp > 0)); 

create table Département(
 Num_Dep int primary key , Nom_Dep varchar(30) unique, Ville_Dep varchar(30) default 'Casa');
 
INSERT INTO Employé VALUES (6 , 'NOM6' ,'PRENOM6', 'directeur' ,'1997-08-08', '2021-01-12', 9000, 30 );
INSERT INTO Employé VALUES (1 , 'NOM1' ,'PRENOM1', 'directeur' ,'1991-08-08', '2018-01-12', 11000, 20 );
INSERT INTO Employé VALUES (200 , 'NOM200' ,'PRENOM200', 'ouvrier' ,'2000-08-08', '2017-01-12', 3000, 20 );
INSERT INTO Département VALUES (20 , 'DEP20' ,'VILLE20');
INSERT INTO Département VALUES (30 , 'DEP30' ,'VILLE30');
INSERT INTO Département VALUES (3 , 'DEP3' ,'VILLE3');

update Employé set Num_Dep = 20 where Num_Emp = 110 ;
update Employé set Salaire_Emp = Salaire_Emp + (Salaire_Emp * 0.1) where Num_Dep in (20, 30) ;

update Employé set Salaire_Emp =  10000  where Salaire_Emp > 10000 and Num_Dep = 20 ; 

select * from Département ;
select * from Employé ;

drop table Département ;
drop table Employé ;

delete from Département where Num_Dep = 20 ;