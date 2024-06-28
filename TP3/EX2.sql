create database ex2tp3 ;
use ex2tp3 ;

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
 
INSERT INTO Employé VALUES ('cadre', '1999/08/08', '1992/01/12', '26251');
update Employé set DateEmbauche_Emp = current_date();

alter table employé drop constraint checkwork ;
alter table employé add column Sup_Emp int ;
alter table employé add constraint foreign key(Sup_Emp) references employé(Num_Emp) ;

--  QST 1
SELECT Num_Emp, Nom_Emp FROM Employé WHERE Num_Dep = 20;
--  QST 2
select Num_Emp,nom_emp,num_dep from employé where Fonction_Emp = 'ouvrier'   ;
--  QST 3
SELECT Nom_Emp FROM Employé WHERE Fonction_Emp = 'vendeur' AND Num_Dep = 30 AND Salaire_Emp > 1500;
--  QST 4
SELECT Nom_Emp, Fonction_Emp, Salaire_Emp FROM Employé WHERE Fonction_Emp IN ('directeur', 'président');
--  QST 5
SELECT Nom_Emp, Fonction_Emp, Salaire_Emp FROM Employé WHERE   Fonction_Emp ='directeur'  OR Salaire_Emp > 5000;
--  QST 6
SELECT Nom_Emp, Fonction_Emp FROM Employé WHERE ( Num_Dep = 10 AND Fonction_Emp = 'directeur') OR (Num_Dep = 20 AND Fonction_Emp = 'ouvrier');
--  QST 7
SELECT Nom_Emp, Fonction_Emp, Num_Dep FROM Employé WHERE Fonction_Emp NOT IN ('ouvrier', 'directeur');
--  QST 8
SELECT Nom_Emp, Fonction_Emp, Salaire_Emp FROM Employé WHERE Salaire_Emp BETWEEN 2200 AND 2800;
--  QST 9
SELECT Nom_Emp, Fonction_Emp, Num_Dep FROM Employé WHERE Fonction_Emp IN ('ouvrier', 'secrétaire', 'vendeur');
--  QST 10
select * FROM EmPLOYé WHERE Sup_Emp IS NOT NULL ;
--  QST 11
select * FROM EmPLOYé WHERE Sup_Emp IS  NULL ;
--  QST 12
SELECT  Salaire_Emp,Fonction_Emp,Nom_Emp FROM Employé where Num_Dep =20 ORDER BY Salaire_Emp ASC;
--  QST 13
SELECT  Salaire_Emp,Fonction_Emp,Nom_Emp FROM Employé where Num_Dep =20 ORDER BY Salaire_Emp DESC;
--  QST 14
SELECT * FROM Employé order by Fonction_Emp ASC , Salaire_Emp DESC ;
--  QST 15
SELECT NUm_Emp AS NUMERO,CONCAT(Nom_Emp,' ',Prenom_Emp ) AS NOM_COMPLET FROM Employé  ;
--  QST 16
SELECT NUm_Emp AS NUMERO,CONCAT(Nom_Emp,' ',Prenom_Emp ) AS NOM_COMPLET FROM Employé order by NOM_COMPLET ;
--  QST 17
SELECT NUm_Emp AS NUMERO,UPPER(CONCAT(Nom_Emp,' ',Prenom_Emp )) AS NOM_COMPLET FROM Employé  ;
--  QST 18
SELECT NUm_Emp AS NUMERO,Nom_Emp AS 'NOM', length(Nom_Emp) AS LA_LONGEUR_DU_NOM FROM Employé  ;
--  QST 19
SELECT NUm_Emp AS 'NUMERO',CONCAT(Nom_Emp,'  ',Prenom_Emp ) AS NOM_COMPLET, length(Nom_Emp) + length(Prenom_Emp) AS 'LA LONGEUR DU NOM'FROM Employé  ;
SELECT NUm_Emp AS 'NUMERO',CONCAT(Nom_Emp,'  ',Prenom_Emp ) AS NOM_COMPLET, length(CONCAT(Nom_Emp,Prenom_Emp ))  AS 'LA LONGEUR DU NOM Complet'FROM Employé  ;
--  QST 20
SELECT * from employé where substring(Nom_Emp,1,1) = substring(reverse(Nom_Emp),1,1) ; 
SELECT * from employé where substring(Nom_Emp,1,1) = right(Nom_Emp,1) ; 
--  QST 21
SELECT * from employé where substring(Nom_Emp,1,1) collate utf8mb4_bin = substring(reverse(Nom_Emp),1,1) ; 
 
--  QST 22
 SELECT * FROM Employé WHERE Prenom_Emp = reverse(Prenom_Emp)  ;
 --  QST 23
select * FROM Employé WHERE binary ascii(substring(Nom_Emp,1,1)) between ascii('a') and ascii('z');
 --  QST 24
 select num_emp as 'Numero', DateNaissance_Emp, day(DateNaissance_Emp),month(DateNaissance_Emp),year(DateNaissance_Emp) FROM Employé ;
 --  QST 25
  SELECT NUm_Emp AS ' ', CONCAT(Nom_Emp,' ',Prenom_Emp,' touche','  ',round(Salaire_Emp,2), ' dh par mois' ) AS 'NO' FROM Employé ; 
 --  QST 26
  SELECT NUm_Emp AS ' ', CONCAT(Nom_Emp,' ',Prenom_Emp,' touche','  ',round(Salaire_Emp,2), ' dh par mois' ) AS 'NO' FROM Employé order by Salaire_Emp desc ; 
 --  QST 27
  SELECT NUm_Emp AS ' ', CONCAT('Employé :',case  when SEXE = 'M' then 'Mme. ' 
 when SEXE = 'F' then 'M. ' end,		
 Nom_Emp,' ',Prenom_Emp,' -Date de naissance : ', date_format(DateNaissance_Emp,"%d.%m.%Y") ) AS 'liste des employe' FROM Employé  ;
 --  QST 28
  select num_emp as 'Numero', dayofweek(DateEmbauche_Emp) from employé;
 --  QST 29
 select num_dep as 'Numero', dayname(date_embauch) from employe;
 --  QST 30
 select * from employe where dayname(date_embauch)='monday';
 --  QST 31
 SELECT NUm_Emp AS ' ', CONCAT('Employé :',case  when SEXE = 'M' then 'Mme. ' 
 when SEXE = 'F' then 'M. ' end,
 Nom_Emp,' ',Prenom_Emp,' -Date de naissance : ', dayname(DateNaissance_Emp)," ",date_format(DateNaissance_Emp,"%d %M %Y") ) AS 'liste des employe' FROM Employé  ;
  --  QST 32
   SELECT  NUm_Emp AS 'NUMERO',CONCAT(Nom_Emp,' ',Prenom_Emp ) AS NOM_COMPLET, timestampdiff(year,DateNaissance_Emp, curdate()) as Age_Employe from Employé;
  --  QST 33
  select num_dep,concat(nom_emp," ",prenom_emp), timestampdiff(month,DateNaissance_Emp,curdate()) as age_mois, timestampdiff(day,DateNaissance_Emp,curdate()) as age_jour from employé;
  --  QST 34
select*,timestampdiff(year,DateEmbauche_Emp,curdate() ) as age_embauch from employé ;
 




  
 
 ALTER TABLE Employé ADD COLUMN SEXE VARCHAR(30);

select * from Département ;
select * from Employé ;


drop table Employé;
drop table département  ;