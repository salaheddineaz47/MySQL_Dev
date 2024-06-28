use ANALYSES ;

create table Stagiaire(
Code_stgr int primary key,
Nom_stgr varchar(30) ,
Prenom_stgr varchar(30),
Date_Naissance date ,
Tel_fixe varchar(30) ,
Tel_portable varchar(30) ,
Code_Groupe varchar(30) );

create table Note(
Code_stgr int ,
Code_module int ,
Note_1 float,
Note_2 float ,
Note_3 float , primary key(Code_stgr, Code_module), foreign key(Code_module) references Module(Code_module)  );

create table Module(
Code_Module int primary key auto_increment ,
Libelle_Module varchar(30) );

create table Groupe(
Code_Groupe varchar(30) primary key ,
annee int ,
Code_filiere int  );

alter table Stagiaire add constraint foreign key (Code_Groupe) references Groupe(Code_Groupe) ;

create table Filiere(
Code_filiere int primary key auto_increment ,
Libelle_filiere varchar(30) );

alter table Groupe add constraint foreign key(Code_filiere) references Filiere(Code_filiere) ;

alter table Groupe add constraint anneecheck check(annee in (1,2)) ;

alter table Stagiaire add constraint checkTelfix check( length(Tel_fixe)= 10 and Tel_fixe like '05%' ) ;
alter table Stagiaire add constraint checkTelPortable check( length(Tel_portable)= 10 and Tel_portable like '06%' ) ;
alter table Stagiaire add constraint threeuniqueCols unique(Nom_stgr,Prenom_stgr, Date_Naissance) ;

alter table add constraint lowerThan10 Check( T) ;



drop table Stagiaire ;
drop table Note ;
drop table Module ;
drop table Filiere ;
drop table Groupe ;

select * from Filiere ;
select * from Note ;
select * from Module ;
select * from Filiere ;
select * from Groupe ;

