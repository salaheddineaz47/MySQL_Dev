create database myex5tp5;
use myex5tp5 ;

-- Create Ville table
CREATE TABLE Ville (
    CodePostal INT PRIMARY KEY,
    NomVille VARCHAR(30)
);

-- Create Cinéma table
CREATE TABLE Cinema (
    NumCinema INT PRIMARY KEY,
    NomCinema VARCHAR(30),
    RueCinema VARCHAR(30),
    CodePostal INT,
    FOREIGN KEY (CodePostal) REFERENCES Ville(CodePostal)
);

-- Create Salle table
CREATE TABLE Salle (
    NumSalle INT PRIMARY KEY,
    Capacite INT,
    NumCinema INT,
    FOREIGN KEY (NumCinema) REFERENCES Cinema(NumCinema)
);

-- Create Film table
CREATE TABLE Film (
    NumFilm INT PRIMARY KEY,
    Titre VARCHAR(255),
    Durée INT,
    Producteur VARCHAR(255)
);

-- Create Projection table
CREATE TABLE Projection (
    Num_P INT PRIMARY KEY,
    NumFilm INT,
    NumSalle INT,
    Date DATE,
    NbreEntrees INT,
    FOREIGN KEY (NumFilm) REFERENCES Film(NumFilm),
    FOREIGN KEY (NumSalle) REFERENCES Salle(NumSalle)
);


INSERT INTO Ville (CodePostal, NomVille) VALUES
(75000, 'Casa'),
(69000, 'Rabat'),
(13000, 'Marrakech');

INSERT INTO Cinema (NumCinema, NomCinema, RueCinema, CodePostal) VALUES
(1, 'Cinéma A', 'Rue A', 75000),
(2, 'Cinéma B', 'Rue B', 69000),
(3, 'Cinéma C', 'Rue C', 13000);

INSERT INTO Salle (NumSalle, Capacite, NumCinema) VALUES
(101, 100, 1),
(102, 80, 1),
(103, 120, 2),
(104, 90, 2),
(105, 150, 3);


INSERT INTO Film (NumFilm, Titre, Durée, Producteur) VALUES
(200, 'Film A', 120, 'Prod A'),
(201, 'Film B', 90, 'Prod B'),
(202, 'Film C', 110, 'Prod A');

INSERT INTO Projection (Num_P, NumFilm, NumSalle, Date, NbreEntrees) VALUES
(301, 200, 101, '2021-01-15', 80),
(302, 200, 102, '2022-02-20', 60),
(303, 201, 103, '2023-03-25', 100),
(304, 201, 104, '2021-04-10', 50),
(305, 202, 105, '2021-05-12', 120);


SELECT * FROM Ville ;
SELECT * FROM Cinema ;
SELECT * FROM Salle ;
SELECT * FROM Film ;
SELECT * FROM Projection ;



-- 1. 
SELECT V.NomVille, COUNT(C.NumCinema) AS NombreCinemas
FROM Ville V
INNER JOIN Cinema C ON V.CodePostal = C.CodePostal
GROUP BY V.CodePostal;

-- 2. 
SELECT C.NomCinema, SUM(S.Capacite) AS CapaciteTotale
FROM Cinema C
JOIN Salle S ON C.NumCinema = S.NumCinema
GROUP BY C.NumCinema;

-- 3. 
SELECT F.*
FROM Film F
INNER JOIN Projection P ON F.NumFilm = P.NumFilm
INNER JOIN Salle S ON P.NumSalle = S.NumSalle
WHERE P.NbreEntrees < 0.3 * S.Capacite;

select f.titre,p.nbreentrees,s.capacite 
from film f 
join projection p using(numfilm) 
join salle s using(numsalle) 
where p.nbreentrees < s.capacite * 0.3;

-- 4. 
SELECT F.Producteur, COUNT(DISTINCT P.NumFilm) AS NombreFilmsProjetés
FROM Film F
INNER JOIN Projection P ON F.NumFilm = P.NumFilm
WHERE P.Date = '2011-08-25'
GROUP BY F.Producteur;

select * 
from projection p inner join film f on p.numfilm = f.numfilm where date = '2011-08-25' ;

-- table projection seulement

-- 5. 
SELECT F.NumFilm,F.Titre, COUNT(Num_P) AS NombreProjections
FROM Film F
JOIN Projection P ON F.NumFilm = P.NumFilm
WHERE P.Date BETWEEN '2010-10-20' AND '2023-10-25'
GROUP BY F.NumFilm;

-- 6. 
SELECT  F.*,max(P.Date)
FROM Film F
INNER JOIN Projection P on P.NumFilm = F.NumFilm
group by F.NumFilm
having max(P.Date) < CURRENT_DATE - INTERVAL 3 YEAR  ;

--  exam 31 JANVIER 3controle : numerique - P.O.O - data base (select)
