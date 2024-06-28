CREATE DATABASE TP1;
USE TP1;
drop table Employe;
select * from Employe;
CREATE TABLE Employe (
    Num_Emp INT PRIMARY KEY AUTO_INCREMENT,
    Nom_Emp VARCHAR(255) NOT NULL,
    Prénom_Emp VARCHAR(255) NOT NULL,
    Fonction_Emp varchar(30) check( Fonction_Emp = 'ouvrier' or 'cadre' or'directeur'),
    -- Fonction_Emp Varchar30 check Fonction_Emp in ('ouvrier
    DateNaissance_Emp DATE,
    DateEmbauche_Emp datetime default (curdate()),
    Salaire_Emp DECIMAL CHECK (Salaire_Emp > 0),
    Num_Dep INT
);
select curdate();

select * from Departement;
CREATE TABLE Departement (
    Num_Dep INT PRIMARY KEY AUTO_INCREMENT,
    Nom_Dep VARCHAR(255) UNIQUE,
    Ville_Dep VARCHAR(255) DEFAULT 'casa'
);

ALTER TABLE Employe ADD FOREIGN KEY (Num_Dep) REFERENCES Departement(Num_Dep);


-- Ex02
drop table Etudiants;
CREATE TABLE Etudiants (
    id_etudiant INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    date_naissance DATE,
    sexe CHAR(1),
    note_moyenne DECIMAL(5, 2),
    statut VARCHAR(255)
);
select * from Etudiants;
drop table etudiants;
ALTER TABLE Etudiants
ADD COLUMN adresse VARCHAR(255),
MODIFY COLUMN note_moyenne DECIMAL(5, 2) NOT NULL;
alter table Etudiants MODIFY  statut varchar(255) check( statut = 'actif' or  'suspendu' or'diplômé');

ALTER TABLE Etudiants
ADD CONSTRAINT chk_date_naissance CHECK (date_naissance > '1900-01-01');
ALTER TABLE Etudiants
ADD CONSTRAINT chk_note_moyenne CHECK (note_moyenne >= 0),
ADD CONSTRAINT chk_sexe CHECK (sexe IN ('M', 'F'));

ALTER TABLE Etudiants
DROP COLUMN adresse,
DROP CONSTRAINT chk_date_naissance,
DROP CONSTRAINT chk_sexe;

ALTER TABLE Etudiants
ADD COLUMN annee_inscription INT,
MODIFY COLUMN statut ENUM('actif', 'suspendu', 'diplômé', 'en cours'),
MODIFY COLUMN note_moyenne DECIMAL(5, 2) CHECK (note_moyenne <= 20),
ADD CONSTRAINT chk_annee_inscription CHECK (annee_inscription > 2000),
ADD CONSTRAINT chk_statut_note CHECK (NOT (statut = 'actif' AND note_moyenne < 10));
-- Add Constraint chk_statut_note check (statut = 'actif' And note_moyenne >= 10));
ALTER TABLE Etudiants
DROP COLUMN annee_inscription,
DROP CONSTRAINT chk_statut_note,
ALTER TABLE Etudiants
drop Constraint check(note_moyenne);

-- EX03
CREATE DATABASE GestionCommandeDB;
drop database GestionCommandeDB;
USE GestionCommandeDB;
CREATE TABLE CLIENT (
    IdClt INT PRIMARY KEY,
    NomClt VARCHAR(255) DEFAULT 'SansNom',
    PrenomClt VARCHAR(255) DEFAULT 'SansPrenom',
    AdresseClt VARCHAR(255),
    VilleClt VARCHAR(255) 
);
drop table Client;
ALTER TABLE CLIENT
MODIFY COLUMN VilleClt VARCHAR(255) NOT NULL;

ALTER TABLE CLIENT
MODIFY COLUMN NomClt VARCHAR(255) DEFAULT 'SansNom',
MODIFY COLUMN PrenomClt VARCHAR(255) DEFAULT 'SansPrenom';

CREATE TABLE Produit (
    Ref INT AUTO_INCREMENT PRIMARY KEY,
    Designation VARCHAR(255),
    Quantite INT,
    Prix DECIMAL(10, 2)
);

CREATE TABLE COMMANDE (
    NoCmd INT AUTO_INCREMENT PRIMARY KEY,
    IdClt INT,
    Ref INT,
    DateCmd DATE,
    DateLiv DATE,
    FOREIGN KEY (IdClt) REFERENCES CLIENT(IdClt) ON DELETE CASCADE on update Cascade,
    FOREIGN KEY (Ref) REFERENCES Produit(Ref) ON DELETE CASCADE on update cascade
);

ALTER TABLE COMMANDE
ADD CONSTRAINT fk_Ref FOREIGN KEY (Ref) REFERENCES Produit(Ref) ON DELETE CASCADE,
ADD CONSTRAINT ck_date CHECK (DateLiv >= DateCmd),
ADD COLUMN delai_livraison INT AS (DATEDIFF(DateLiv, DateCmd));
Show tables ;
select * from client;
select * from produit;
select * from commande;




-- EX04
CREATE DATABASE IF NOT EXISTS GestionLogementDB;

USE GestionLogementDB;
CREATE TABLE QUARTIER (
    ID_QUARTIER INT PRIMARY KEY,
    ID_COMMUNE INT,
    NOM_QUARTIER VARCHAR(30),
    CONSTRAINT pk_quartier PRIMARY KEY (ID_QUARTIER, ID_COMMUNE)
);

CREATE TABLE INDIVIDU (
    N_IDENTIFICATION INT PRIMARY KEY,
    N_LOGEMENT INT,
    TYPE_LOGEMENT VARCHAR(30),
    ID_QUARTIER INT,
    N_TELEPHONE VARCHAR(30) NOT NULL,
    DATE_NAISSANCE DATE,
    CONSTRAINT fk_quartier FOREIGN KEY (ID_QUARTIER) REFERENCES QUARTIER(ID_QUARTIER)
);


-- ex5 
create database ANALYSES;
use ANALYSES;
drop table Client;
create table Client(
					codeclient int primary key,
                    nom varchar(30),
                    cpclient varchar(30),
                    ville_client varchar(30),
                    tel varchar(30)
);
alter table Client modify column cpclient varchar(30) not null;
alter table Client modify column ville_client varchar(30) not null;
alter table Client alter column nom set default ' Anonyme';

select * from Echantillon;
drop table Echantillon;
create table Echantillon(
						codeEchantillon int primary key auto_increment,
                        dateentre date,
						codeclient int,
                        foreign key (codeclient) references Client(codeclient)
					
);
alter table Echantillon auto_increment=10 ;
drop table Typeanalyse;
select * from Typeanalyse;
create table Typeanalyse(
						RefTypeAnalyse int primary key ,
                        Desgnation varchar(30),
                        TypeAnalyse varchar(30),
                        PrixTypeAnalyse float
);
alter table Typeanalyse add constraint ck_PrixTypeAnalyse check (PrixTypeAnalyse>=100 and PrixTypeAnalyse<=1000);

drop table Realiser;
create table Realiser (
						codeEchantillon int,
                        RefTypeAnalyse int,
                        DateRealisation date,
                        primary key(codeEchantillon,RefTypeAnalyse),
                        foreign key (codeEchantillon) references Echantillon(codeEchantillon),
                        foreign key (RefTypeAnalyse) references Typeanalyse(RefTypeAnalyse)
);
alter table Realiser add constraint ck_DateRealisation check (DateRealisation >= sysdate() and DateRealisation <= date_add(sysdate(),interval 3 day));
















