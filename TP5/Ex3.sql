create database myex3tp55;
use myex3tp55 ;

-- Table: Service
CREATE TABLE Service (
    NumService INT PRIMARY KEY,
    NomService VARCHAR(255),
    Lieu VARCHAR(255)
);

-- Table: Projet
CREATE TABLE Projet (
    CodeProjet INT PRIMARY KEY,
    NomPrj VARCHAR(255),
    DateDebut DATE,
    DateFin DATE
);

-- Table: Salarie
CREATE TABLE Salarie (
    Matricule INT PRIMARY KEY,
    Nom VARCHAR(255),
    Poste VARCHAR(255),
    E_mail VARCHAR(255),
    DatEmb DATE,
    Salaire DECIMAL(10, 2),
    NumService INT,
    prime DECIMAL(10, 2),
    FOREIGN KEY (NumService) REFERENCES Service(NumService) 
);

-- Table: Participation
CREATE TABLE Participation (
    Matricule INT,
    CodeProjet INT,
    Fonction VARCHAR(255),
    NbrJours INT,
    PRIMARY KEY (Matricule, CodeProjet),
    FOREIGN KEY (Matricule) REFERENCES Salarie(Matricule),
    FOREIGN KEY (CodeProjet) REFERENCES Projet(CodeProjet)
);

-- Insert data into Service table
INSERT INTO Service (NumService, NomService, Lieu) VALUES
(1, 'Informatique', 'Casa'),
(2, 'intelligence Artificielle', 'Agadir'),
(3, 'Ressources Humaines', 'Marrakech'),
(4, 'Finance', 'Rabat');

-- Insert data into Projet table
INSERT INTO Projet (CodeProjet, NomPrj, DateDebut, DateFin) VALUES
(101, 'Projet A', '2020-01-01', '2023-03-01'),
(102, 'Projet B', '2021-02-01', '2022-04-01'),
(103, 'Projet C', '2022-03-01', '2023-05-01'),
(104, 'Projet D', '2012-03-01', '2019-05-01'),
(105, 'Projet E', '2018-03-01', '2020-05-01');

-- Insert data into Salarie table
INSERT INTO Salarie (Matricule, Nom, Poste, E_mail, DatEmb, Salaire, NumService, prime) VALUES
(1001, 'Ahmed', 'Developpeur', 'Ahmed.doe@email.com', '2020-01-01', 50000, 1, 2000),
(1002, 'Mohammed', 'Ressources Humaines', 'Mohammed.ex@email.com', '2021-02-01', 60000, 3, 2500),
(1003, 'Mustafa', 'Ingenieur', 'Mohammed.ex@email.com', '2021-02-01', 80000, 2, 2500),
(1004, 'Mustafa', 'Ingenieur', 'Mustafa.ex@email.com', '2019-02-01', 80000, 2, 200),
(1005, 'Said', 'Financier', 'said.johnson@email.com', '2019-03-01', 70000, 4, 3000),
(1006, 'Ali', 'Financier', 'Ali.johnson@email.com', '2020-03-01', 65000, 4, 3000);

-- Insert data into Participation table
INSERT INTO Participation (Matricule, CodeProjet, Fonction, NbrJours) VALUES
(1001, 101, 'Developpeur', 20),
(1001, 102, 'Developpeur', 25),
(1001, 103, 'Developpeur', 15),
(1002, 101, 'Responsable RH', 30),
(1002, 102, 'Responsable RH', 20),
(1005, 101, 'Analyste Financier', 18),
(1006, 103, 'Analyste Financier', 22),
(1004, 103, 'Ingenierie artificielle', 22);

SELECT * FROM Projet ;
SELECT * FROM Service ;
SELECT * FROM Salarie ;
SELECT * FROM Participation ;

delete from Participation where Matricule = 1006 ;

select avg(Salaire) from Salarie ;
-- 1. 
SELECT se.NomService, MAX(Salaire) AS MaxSalaire
FROM Salarie s
INNER JOIN Service se ON s.NumService = se.NumService
GROUP BY s.NumService;

-- 2. 
SELECT s.*
FROM Salarie s
JOIN Service se ON s.NumService = se.NumService
WHERE se.NomService = 'Informatique';

-- 3. 
SELECT s.Matricule,s.Nom, 	COUNT(p.CodeProjet) AS NombreProjets, SUM(p.NbrJours) AS TotalJours
FROM Salarie s
INNER JOIN Participation p ON s.Matricule = p.Matricule
GROUP BY s.Matricule;

SELECT s.Matricule, s.NOM , COUNT(pa.Codeprojet) as nombredeprojet, SUM(pa.NBrjours) as sommetotale
FROM Salarie s
INNER JOIN Participation pa ON s.Matricule = pa.Matricule
GROUP BY s.Matricule;

-- 4. 
SELECT se.NomService, SUM(Salaire + prime) AS MasseSalarialeTotale
FROM Salarie s
INNER JOIN Service se ON s.NumService = se.NumService
GROUP BY se.NumService;

-- 5.
SELECT se.NomService, COUNT(s.Matricule) AS NombreSalariesSansPrime
FROM Salarie s
INNER JOIN Service se ON s.NumService = se.NumService
WHERE s.Salaire > (SELECT AVG(Salaire) FROM Salarie)
GROUP BY se.NumService;

-- 6. 
#trrruue
SELECT s.*
FROM Salarie s
LEFT JOIN Participation p ON s.Matricule = p.Matricule
WHERE p.Matricule IS NULL;

SELECT s.*
FROM Salarie s
LEFT JOIN Participation pa ON s.Matricule = pa.Matricule
WHERE pa.CodeProjet IS NULL;	

##
SELECT s.*,pa.*
FROM Salarie s
LEFT JOIN Participation pa ON s.Matricule = pa.Matricule ;	


select * 
from Salarie 
where Matricule not in (Select Matricule from Participation);

-- 7.
SELECT s.*
FROM Salarie s
INNER JOIN Participation pa ON s.Matricule = pa.Matricule
INNER JOIN Projet pr ON pa.CodeProjet = pr.CodeProjet
where pa.Nbrjours > 0.1 * timestampdiff(day,pr.DateDebut , pr.DateFin )
GROUP BY s.Matricule
HAVING Count(pr.CodeProjet )>1;






DROP TABLE Participation;
DROP TABLE  Salarie;
DROP TABLE  Projet;
DROP TABLE  Service;




