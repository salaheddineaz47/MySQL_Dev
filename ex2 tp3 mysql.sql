use tp3 ;
CREATE TABLE employe (
    num_emp INT PRIMARY KEY,
    nom_emp VARCHAR(30),
    prenom_emp VARCHAR(30),
    fonction_emp VARCHAR(30),
    date_naissance DATE,
    date_embauch DATE,
    salaire float,
    num_dep INT,
    sup_emp varchar (30)
);
insert into employe values 
(1,'Nom1','prenom1','President','2000-01-01','2021-01-01',2500,10,'responsable'),
(2,'nom2','prenom2','Directeur','1997-02-02','2022-02-02',20000,20,'responsable'),
(3,'nom3','prenom3','vendeur','2002-01-01','2023-03-03',7000,10,null),
(4,'nom4','prenom4','President','2001-01-01','2021-04-04',6000,20,null),
(5,'nom5','prenom5','Directeur','1994-01-01','2022-05-05',30000,30,'responsable'),
(6,'nom6','prenom6','vendeur','2002-06-06','2022-06-06',3000,20,'responsable'),
(7,'nom7','prenom7','Directeur','1995-07-07','2022-07-0',30000,10,'responsable'),
(8,'nom8','prenom7','vendeur','2000-08-08','2020-08-08',4000,30,null),
(9,'nom9','prenom9','vendeur','2001-10-10','2020-10-10',9000,20,null),
(10,'nom10','prenom10','Ouvrier','2001-10-10','2020-10-10',8500,30,'responsable'),
(11,'nom11','prenom11','Ouvrier','1998-10-10','2020-10-10',9300,20,null),
(12,'nom12','prenom12','secrétaire','2001-10-10','2020-10-10',5500,20,'responsable'),
(13,'nom13','prenom13','secrétaire','2001-10-10','2020-10-10',3000,30,null);

select * from employe;

drop table employe;

-- 1
select nom_emp , num_emp from employe where num_dep=20 ; 

-- 2
select nom_emp , num_emp , num_dep from employe where fonction_emp='Ouvrier'  ;

-- 3
select nom_emp from employe where num_dep=30 and salaire > 1500 and fonction_emp='vendeur' ;

-- 4
select nom_emp , fonction_emp , salaire from employe where fonction_emp in ('President','Directeur');

-- 5
select nom_emp , fonction_emp , salaire from employe where fonction_emp='Directeur' or salaire > 5000 ;

-- 6
select nom_emp , fonction_emp from employe where (fonction_emp='Directeur' and num_dep=10) or (fonction_emp='Ouvrier' and num_dep=20);

-- 7
select nom_emp , fonction_emp , num_dep from employe where fonction_emp not in ('Ouvrier','Directeur');

-- 8
select nom_emp , fonction_emp , salaire from employe where salaire between 2200 and 2800 ;

-- 9
select nom_emp , num_emp , num_dep from employe where fonction_emp in ('Ouvrier','secrétaire','vendeur');

-- 10
select * from employe where sup_emp is not null;

-- 11
select * from employe where sup_emp is null;

-- 12
select salaire, fonction_emp , nom_emp  from employe where num_dep=20 order by salaire asc ;

-- 13
select salaire, fonction_emp , nom_emp  from employe where num_dep=20 order by salaire desc ;

-- 14
select * from employe order by fonction_emp asc , salaire desc ;

-- 15
select num_emp as 'Numero' , concat(nom_emp,"  ",prenom_emp) as nom_complet from employe ;

-- 16
select num_emp as 'Numero' , concat(nom_emp,"  ",prenom_emp) as nom_complet from employe order by nom_complet ;

-- 17
select upper(concat(nom_emp,"  ",prenom_emp)) as nom_complet from employe ;

-- 18
select num_emp as 'Numero', nom_emp , length(nom_emp) as longueur_nom from employe ;

-- 19
select num_emp as 'Numero' , concat(nom_emp,"  ",prenom_emp) as nom_complet , length(concat(nom_emp,prenom_emp)) as longueur_nom_cplt from employe ;

-- 20
select *,substring(nom_emp,1,1) as lettre from employe where substring(nom_emp,1,1) collate utf8mb4_bin =  substring(reverse(nom_emp),1,1);

-- 21
select * from employe where nom_emp collate utf8mb4_bin ='NoM1';

-- 22
select * from employe where prenom_emp=reverse(prenom_emp);

-- 23
select * from employe where ascii(left(nom_emp,1)) between 97 and 122;
select ascii('z');

-- 24
select num_emp as 'Numero', date_naissance, day(date_naissance),month(date_naissance),year(date_naissance) from employe;

-- 25
select concat(nom_emp,"  ",prenom_emp," touche ", round(salaire,2) , " dh par mois ") as "Salaires des employes" from employe;

-- 26
select concat(nom_emp,"  ",prenom_emp," touche ", round(salaire,2) , " dh par mois ") as "Salaires des employes" from employe order by salaire desc;

-- 27
select concat("Employe: ",nom_emp," ",prenom_emp," Date de Naissance: ",Day(date_naissance),".",month(date_naissance),".",year(date_naissance)) as 'Liste des employes' from employe ;

-- 28
select num_dep as 'Numero', dayofweek(date_embauch) from employe;

-- 29
select num_dep as 'Numero', dayname(date_embauch) from employe;

-- 30
select * from employe where dayname(date_embauch)='monday';

-- 31
select num_dep as num, concat("Employe: ",nom_emp," ",prenom_emp," Date de Naissance: ",dayname(date_naissance)," ",Day(date_naissance)," ",monthname(date_naissance)," ",month(date_naissance),".",year(date_naissance)) as 'Liste des employes' from employe;

-- 32
select num_dep as 'Numero' ,concat(nom_emp," ",prenom_emp) as 'nom complet', timestampdiff(year,date_naissance,curdate()) as age from employe;

-- 33
select num_dep,concat(nom_emp," ",prenom_emp), timestampdiff(month,date_naissance,curdate()) as age_mois, timestampdiff(day,date_naissance,curdate()) as age_jour from employe;

-- 34
select*,timestampdiff(year,date_naissance,date_embauch) as age_embauch from employe ;
