create database myex3tp4 ;
use myex3tp4 ;


select * from Employé ;

select * from Département ;

create table Employé(
 Num_Emp int primary key,
 Nom_Emp varchar(30) NOT NULL, 
 Prenom_Emp varchar(30) NOT NULL, 
 Fonction_Emp varchar(30),
 DateNaissance_Emp date,
 DateEmbauche_Emp date  ,
 Salaire_Emp float,
 Sup_Emp int,
 Num_Dep int,
foreign key(Num_Dep) references Département (Num_Dep), foreign key(Sup_Emp) references Employé(Num_Emp) ,
CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur'), CHECK(Salaire_Emp > 0)); 

create table Département(
 Num_Dep int primary key auto_increment, Nom_Dep varchar(30) unique, Ville_Dep varchar(30) default 'Casa');
 
 INSERT INTO Employé VALUES (3, 'nom3', 'pre3', 'directeur', '2003-08-23','2021-08-12', 6000 ,2, 20);
ALTER TABLE Employé
DROP CONSTRAINT ck_check;
alter table Employé alter DateEmbauche_Emp  set default(curdate()) ;
update Employé set DateEmbauche_Emp = curdate() ;
alter table Employé add constraint ck1_check 
CHECK(Fonction_Emp ="ouvrier" or Fonction_Emp ='cadre' or Fonction_Emp ='directeur' or Fonction_Emp ='president' or Fonction_Emp ='secretaire') ;

 -- 1)
 select avg(Salaire_Emp) as Salaire_moyenne from Employé ;
  -- 2)
 select avg(Salaire_Emp) as Salaire_moyenne  from Employé where Fonction_Emp ="ouvrier"  ;
   -- 3)
 select max(Salaire_Emp) as Salaire_max, min(Salaire_Emp) as Salaire_min  from Employé  ;
    -- 4)
 select count(Num_Emp) as nombre_Employe_de_dep10 from Employé where Num_Dep = 10 ;
     -- 5)
  select  count(Num_Emp) from Employé where length(Nom_Emp) between 5 and 7 ;
      -- 6)
 select Fonction_Emp,count(Fonction_Emp) as nombre_de_fonction from Employé where Num_Dep = 10 group by Fonction_Emp;
       -- 7)
 select Num_Dep,avg(Salaire_Emp) as salaire_moyenne from Employé group by Num_Dep;
        -- 8)
 select Num_Dep,avg(Salaire_Emp)*12 as salaire_annuel_moyenne from Employé where Fonction_Emp not in ('directeur','president') group by Num_Dep;
         -- 9)
 select Num_Dep,Fonction_Emp,count(Num_Emp) as nombre_employe ,avg(Salaire_Emp) as salaire_moyenne from Employé group by Fonction_Emp,Num_Dep;
          -- 10)
 select timestampdiff(year,DateNaissance_Emp,curdate()) as age,count(Num_Emp) as nombre_employe from Employé
 group by timestampdiff(year,DateNaissance_Emp,curdate());
		-- 11)
select Fonction_Emp,count(Num_Emp) as nombre_employe ,avg(Salaire_Emp) as salaire_moyenne from Employé group by Fonction_Emp having count(Fonction_Emp) > 2;
select Fonction_Emp,count(Num_Emp) as nombre_employe ,avg(Salaire_Emp) as salaire_moyenne from Employé group by Fonction_Emp having count(Num_Emp) > 2;
 		-- 12)
 select Num_Dep from Employé where Fonction_Emp ="secretaire"
 group by Num_Dep having count(Num_Emp) >= 2;