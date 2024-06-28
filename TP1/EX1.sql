create database myTP1 ;
use myTP1;
create table Employé(
 Num_Emp int primary key auto_increment,
 Nom_Emp varchar(30) NOT NULL, 
 Prenom_Emp varchar(30) NOT NULL, 
 Fonction_Emp varchar(30),
 DateNaissance_Emp date,
 DateEmbauche_Emp date ,
 Salaire_Emp float,
 Num_Dep int,
foreign key(Num_Dep) references Département (Num_Dep), CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur'), CHECK(Salaire_Emp > 0)); 

create table Département(
 Num_Dep int primary key auto_increment, Nom_Dep varchar(30) unique, Ville_Dep varchar(30) default 'Casa');
 
alter table Employé alter DateEmbauche_Emp set default (curdate());

select * from Département ;
select * from Employé ;

drop table Employé;
drop table Département ;


select date_add(curdate(),interval 3 year);
select date_sub(curdate(),interval 3 year);
select date_format(curdate(),"%d-%m-%Y");
select dayname("2024-03-26");
select dayofweek("2024-03-26");