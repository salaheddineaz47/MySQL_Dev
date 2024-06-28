create database myex4tp55;
use myex4tp55 ;

-- Create Patient table
CREATE TABLE Patient (
    IDPt INT PRIMARY KEY,
    Nom VARCHAR(255),
    Sexe VARCHAR(10),
    Adresse VARCHAR(255),
    Ville VARCHAR(255)
);

-- Create Médecin table
CREATE TABLE Medecin (
    IDMed INT PRIMARY KEY,
    Nom VARCHAR(255),
    Adresse VARCHAR(255),
    Spécialité VARCHAR(255)
);

-- Create Consultation table
CREATE TABLE Consultation (
    NoCons INT PRIMARY KEY,
    IDPt INT,
    IDMed INT,
    Date DATE,
    Prix DECIMAL(10, 2),
    FOREIGN KEY (IDPt) REFERENCES Patient(IDPt),
    FOREIGN KEY (IDMed) REFERENCES Medecin(IDMed)
);

-- Insert data into Patient table
INSERT INTO Patient (IDPt, Nom, Sexe, Adresse, Ville) VALUES
(1, 'Ali', 'F', '123 Main St', 'Rabat'),
(2, 'Mohammed', 'M', '456 Oak St', 'Casablanca'),
(3, 'Mustafa', 'M', '789 Pine St', 'Marrakech');

-- Insert data into Médecin table
INSERT INTO Medecin (IDMed, Nom, Adresse, Spécialité) VALUES
(104, 'Dr. Hamza', '567 Elm St', 'Cardiologue'),
(105, 'Dr. Anas', '890 Maple St', 'Pédiatrie'),
(103, 'Dr. nadir', '111 Birch St', 'Généraliste');

-- Insert data into Consultation table
INSERT INTO Consultation (NoCons, IDPt, IDMed, Date, Prix) VALUES
(201, 1, 104, '2022-01-15', 50.00),
(202, 1, 105, '2022-02-20', 60.00),
(203, 2, 104, '2022-03-25', 75.00),
(204, 2, 103, '2022-04-10', 40.00),
(205, 3, 105, '2022-05-12', 55.00);

SELECT * FROM Patient ;
SELECT * FROM Medecin ;
SELECT * FROM Consultation ;

-- 1.
SELECT Spécialité, COUNT(IDMed) AS NombreMédecins
FROM Medecin
GROUP BY Spécialité;

-- 2. 
SELECT IDMed, COUNT(DISTINCT IDPt) AS NombrePatients
FROM Consultation
GROUP BY IDMed;

-- 3. 
SELECT P.Nom, COUNT(DISTINCT C.IDMed) AS NombreMédecinsConsultés
FROM Patient P
INNER JOIN Consultation C ON P.IDPt = C.IDPt
GROUP BY P.IDPt;

-- 4. 
SELECT P.IDPt,P.Nom, SUM(C.Prix) AS SommeTotalePayée
FROM Patient P
INNER JOIN Consultation C ON P.IDPt = C.IDPt
WHERE C.Date BETWEEN '2021-01-01' AND '2022-05-01'
GROUP BY P.IDPt
;

-- 5. 
WITH DernierJourTravail AS (
  SELECT IDMed, MAX(Date) AS DernierJour
  FROM Consultation
  GROUP BY IDMed
) 
SELECT M.Nom, sum(C.prix) AS SommeTotaleConsultations
FROM Medecin M
INNER JOIN DernierJourTravail D ON M.IDMed = D.IDMed
INNER JOIN Consultation C ON M.IDMed = C.IDMed AND D.DernierJour = C.Date
GROUP BY M.IDMed, M.Nom;

SELECT M.IDMed, M.Nom, sum(C.prix) AS SommeTotaleConsultations
FROM Medecin M
INNER JOIN Consultation C ON M.IDMed = C.IDMed
where C.Date = (select max(Date) from Consultation where IDMed =  C.IDMed  )
GROUP BY M.IDMed;

-- 6.
SELECT C.*
FROM Consultation C
JOIN Medecin M ON C.IDMed = M.IDMed
WHERE M.Spécialité = 'Pédiatrie';

-- 7.
SELECT P.*
FROM Patient P
INNER JOIN Consultation C on P.IDPt = C.IDPt
group by P.IDPt
having max(C.Date) < CURRENT_DATE - INTERVAL '3' YEAR  ;

select  p.*
from patient p 
inner join consultation c 
using(idpt) 
group by p.idpt 
having max(c.date)<date_sub(curdate(),interval 3 year);

