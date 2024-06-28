create database ex3tp4 ;
use ex3tp4 ;


create table Employé(
 Num_Emp int primary key auto_increment,
 Nom_Emp varchar(30) NOT NULL, 
 Prenom_Emp varchar(30) NOT NULL, 
 Fonction_Emp varchar(30),
 DateNaissance_Emp date,
 DateEmbauche_Emp date ,
 Salaire_Emp float, Sup_Emp int ,
 Num_Dep int,
foreign key(Num_Dep) references Département (Num_Dep), foreign key(Sup_Emp) references Employé(Num_Emp) ,
CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur'), CHECK(Salaire_Emp > 0)); 

create table Département(
 Num_Dep int primary key auto_increment, Nom_Dep varchar(30) unique, Ville_Dep varchar(30) default 'Casa');
 
alter table Employé alter DateEmbauche_Emp  set default(curdate()) ;

--  QST 1
SELECT avg(Salaire_Emp) FROM Employé ;
--  QST 2
SELECT Fonction_Emp,avg(Salaire_Emp) FROM Employé where Fonction_Emp ="ouvrier" ;
--  QST 3
SELECT min(Salaire_Emp) as Le_plus_bas_salaire,max(Salaire_Emp) as Le_plus_haut_salaire FROM Employé  ;
--  QST 4
SELECT count(Num_Emp) FROM Employé where  Num_Dep = 10 ;
--  QST 5
SELECT count(Num_Emp) FROM Employé where  length(Nom_Emp) between 5 and 7 ;
--  QST 6
SELECT Fonction_Emp,count(Fonction_Emp) FROM Employé where Num_Dep = 10 group by Fonction_Emp  ;
--  QST 7
SELECT Fonction_Emp,count(Fonction_Emp) FROM Employé where Num_Dep = 10 group by Fonction_Emp  ;



select * from Employé ;
select * from Département ;