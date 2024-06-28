create database myex2tp5 ;
use myex2tp5 ;


create table Client(
 codeclt int primary key , nomclt varchar(30) unique,prenomclt varchar(30), adresseclt varchar(100), CPclt varchar(30), villeclt varchar(30)
 );
create table REPRESENTANT
 (coderep int primary key, nomrep varchar(30), prenomrep varchar(30))  ;
create table APPARTEMENT (
ref varchar(30) primary key, superficie float, pxvente float, secteur varchar(30), coderep int, codeclt int,
 foreign key(coderep) references REPRESENTANT(coderep), foreign key(codeclt) references Client(codeclt) )  ;
 
select * from Client ;
select * from REPRESENTANT ;
select * from APPARTEMENT ;
INSERT INTO APPARTEMENT VALUES ('app3', '40', '90000', 'Hivernage', '10', '3');


-- 1)
SELECT secteur, AVG(pxvente) AS moyenne_prix
FROM APPARTEMENT
GROUP BY secteur;
-- 2)
SELECT secteur, COUNT(ref) AS nombre_appartements
FROM APPARTEMENT
GROUP BY secteur
HAVING COUNT(ref) >= 10;
-- 3)
SELECT secteur, COUNT(ref) AS nombre_appartements
FROM APPARTEMENT
WHERE superficie > 80
GROUP BY secteur;
-- 4)
SELECT secteur, MAX(pxvente) AS prix_max
FROM APPARTEMENT
GROUP BY secteur
HAVING COUNT(ref) > 10;
-- 5)
SELECT CONCAT(c.nomclt,' ', c.prenomclt) as Nom_Complet, a.ref
FROM CLIENT c
INNER JOIN APPARTEMENT a ON c.codeclt = a.codeclt;
-- 6)
SELECT a.ref
FROM APPARTEMENT a
INNER JOIN REPRESENTANT r ON a.coderep = r.coderep
WHERE a.secteur = 'Hivernage' AND r.nomrep = 'Alami' AND r.prenomrep = 'Fadoua';
-- 7)
SELECT a.secteur, COUNT(c.codeclt) AS nombre_clients_fes
FROM CLIENT c
INNER JOIN APPARTEMENT a ON c.codeclt = a.codeclt
WHERE c.villeclt = 'New York'
GROUP BY a.secteur;



-- Inserting data into the Client table
INSERT INTO Client (codeclt, nomclt, prenomclt, adresseclt, CPclt, villeclt) VALUES
(1, 'Smith', 'John', '123 Main St', '12345', 'New York'),
(2, 'Johnson', 'Emily', '456 Elm St', '67890', 'Los Angeles'),
(3, 'Williams', 'Michael', '789 Oak St', '23456', 'Chicago');

-- Inserting data into the REPRESENTANT table
INSERT INTO REPRESENTANT (coderep, nomrep, prenomrep) VALUES
(101, 'Brown', 'Daniel'),
(102, 'Davis', 'Olivia'),
(103, 'Wilson', 'James');

-- Inserting data into the APPARTEMENT table
INSERT INTO APPARTEMENT (ref, superficie, pxvente, secteur, coderep, codeclt) VALUES
('A101', 100, 200000, 'Downtown', 101, 1),
('B202', 120, 250000, 'Suburb', 102, 2),
('C303', 90, 180000, 'Urban', 103, 3);

INSERT INTO APPARTEMENT (ref, superficie, pxvente, secteur, coderep, codeclt) VALUES ('A505', 100, 200000, 'Urban', 101, 1);