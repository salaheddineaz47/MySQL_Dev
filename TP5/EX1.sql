create database myex1tp5 ;
use myex1tp5 ;

select * from Employe ;
select * from Departement ;

create table Employe(
 Num_Emp int primary key,
 Nom_Emp varchar(30) NOT NULL, 
 Prenom_Emp varchar(30) NOT NULL, 
 Fonction_Emp varchar(30),
 DateNaissance_Emp date,
 DateEmbauche_Emp date default (curdate())  ,
 Salaire_Emp float,
 Sup_Emp int,
 Num_Dep int,
foreign key(Num_Dep) references Departement (Num_Dep), foreign key(Sup_Emp) references Employe(Num_Emp) ,
CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur'), CHECK(Salaire_Emp > 0)); 

create table Departement(
 Num_Dep int primary key , Nom_Dep varchar(30) unique, Ville_Dep varchar(30) default 'Casa');
 
-- 1) --- 
select e.Nom_Emp, d.ville_Dep from Employe e inner join Departement d on e.Num_Dep = d.Num_Dep ;
-- 2) ---
select d.ville_Dep from Employe e inner join Departement d on e.Num_Dep = d.Num_Dep where Num_Emp = 1035 ;
-- 3) ---
select e.Nom_Emp,e.Fonction_Emp,Nom_Dep from Employe e inner join Departement d on e.Num_Dep = d.Num_Dep where d.Num_Dep = 20 or e.Num_Dep = 30 ;
select e.Nom_Emp,e.Fonction_Emp,Nom_Dep from Employe e inner join Departement d on e.Num_Dep = d.Num_Dep where d.Num_Dep = 1 or e.Num_Dep = 2 ;
-- 4) ---
select concat(Nom_Emp," ",Prenom_Emp ) as Nom_Complet from Employe 
where Salaire_Emp = (SELECT MAX(Salaire_Emp) FROM Employe) ;
-- 5) ---
SELECT Num_Emp, CONCAT(Nom_Emp, ' ', Prenom_Emp) AS Nom_Complet FROM Employe
WHERE LENGTH(CONCAT(Nom_Emp, ' ', Prenom_Emp)) = (SELECT MAX(LENGTH(CONCAT(Nom_Emp, ' ', Prenom_Emp))) FROM Employe);

-- 6) --


-- 7) --
SELECT Nom_Emp, Salaire_Emp, Fonction_Emp
FROM Employe
WHERE Salaire_Emp > (select Salaire_Emp from Employe where Num_Emp = 1035 );
-- 8) ---
SELECT Nom_Emp, Fonction_Emp
FROM Employe
WHERE Salaire_Emp > All(SELECT Salaire_Emp FROM Employe WHERE Nom_Emp = 'Mahmoudi');
-- 9) ---
SELECT DISTINCT d.Nom_Dep
FROM Employe e
INNER JOIN Departement d ON e.Num_Dep = d.Num_Dep
WHERE Salaire_Emp > 3000;
-- 10) ---
SELECT Fonction_Emp
FROM Employe
GROUP BY Fonction_Emp
HAVING AVG(Salaire_Emp) < (SELECT AVG(Salaire_Emp) FROM Employe WHERE Fonction_Emp = 'ingenieur');
-- 11) ---
    select e1.nom_emp, e2.nom_emp as chef
    from employe e1
    inner join employe e2 on  e1.Sup_Emp = e2.num_emp ;
 
 ##
select e1.*, e2.*
    from employe e1
    inner join employe e2 on  e1.num_emp = e2.num_emp;
    
-- 12) ---
 select e1.nom_emp, e1.salaire_emp
    from employe e1
    inner join employe e2 on e1.sup_emp = e2.num_emp
    where e1.salaire_emp > e2.salaire_emp;
-- 13) ---
SELECT e1.nom_emp, e2.nom_emp as chef
FROM Employe e1
left JOIN Employe e2 ON e1.Sup_Emp = e2.Num_Emp;

#select * from employe ;


-- Inserting data into the Departement table
INSERT INTO Departement (Num_Dep, Nom_Dep, Ville_Dep) VALUES
(1, 'Finance', 'New York'),
(2, 'Human Resources', 'Los Angeles'),
(3, 'Marketing', 'Chicago');

-- Inserting data into the Employe table
INSERT INTO Employe (Num_Emp, Nom_Emp, Prenom_Emp, Fonction_Emp, DateNaissance_Emp, Salaire_Emp, Sup_Emp, Num_Dep) VALUES
(101, 'Smith', 'John', 'cadre', '1985-05-10', 5000, NULL, 1),
(102, 'Johnson', 'Emily', 'directeur', '1978-12-15', 8000, NULL, 1),
(103, 'Williams', 'Michael', 'ouvrier', '1990-08-20', 3000, 101, 2),
(104, 'Jones', 'Emma', 'cadre', '1982-03-25', 5500, 102, 3),
(105, 'Brown', 'Daniel', 'ouvrier', '1995-07-02', 2800, 103, 2),
(106, 'Davis', 'Olivia', 'ouvrier', '1993-11-18', 3200, 103, 2);

Insert
select e1.*, e2.*
    from employe e1
    inner join employe e2 on  e1.num_emp = e2.num_emp; into Employe  (Num_Emp, Nom_Emp, Prenom_Emp, Fonction_Emp, DateNaissance_Emp, Salaire_Emp, Sup_Emp, Num_Dep) 
 values (1035, 'Mohamed', 'Anas', 'ouvrier', '1993-11-18', 3200, 103, 2);

