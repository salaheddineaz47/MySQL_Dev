use myTP1;
create table Etudiants(
 id_etudiant int primary key auto_increment,
 Nom varchar(30)  , 
 Prenom varchar(30) , 
 Date_naissance date,
 Sexe varchar(30) ,
 Note_moyenne DECIMAL(5,2),
 Statut varchar(30));
 
 select * from Etudiants;
 drop table Etudiants ;
 
 Alter table Etudiants add column Adresse varchar (30);
 alter table Etudiants modify  Note_moyenne DECIMAL(5,2) not null ;
  alter table Etudiants add check(Statut = 'active' or Statut = 'suspendu' or Statut = 'diplome') ;
  alter table Etudiants add constraint checkdate check (Date_naissance > '1900-01-01') ;
  alter table Etudiants add check (Note_moyenne > 0);
  alter table Etudiants add constraint sexecheck check (sexe = 'M' or sexe = 'F');
  
  alter table Etudiants drop column Adresse ;
  alter table Etudiants drop constraint sexecheck ;
  alter table Etudiants drop constraint checkdate ;
   alter table Etudiants drop constraint grstatut ;
   
alter table Etudiants add column  année_inscription varchar(30) ;
alter table Etudiants modify column Statut varchar(30) check(Statut = 'active' or Statut = 'suspendu' or Statut = 'diplome' or Statut = 'en cours') ;
alter table Etudiants modify column  Note_moyenne float check(Note_moyenne > 0 and Note_moyenne <=20);
alter table Etudiants add constraint anneecheck check(année_inscription > '2000-01-01');
ALTER TABLE Etudiants add constraint grstatut check( (Statut != 'active' and Note_moyenne < 10) OR (Statut = 'actif' AND Note_moyenne >= 10))  ;
