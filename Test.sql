create database test ;
use test;
create table workers(
 Num_Emp int primary key,
 Nom_Emp varchar(30) , 
 Prenom_Emp varchar(30) , 
 DateNaissance_Emp date,
 DateEmbauche_Emp date default(CURRENT_DATE) ,
 Salaire_Emp float,
 Num_Dep int,
 CHECK(Salaire_Emp > 0)); 
 
 select * from workers ;
 
 alter table workers drop Num_Dep ;
 alter table workers drop DateEmbauche_Emp ;
 alter table workers add column ville varchar(30) ;
 
INSERT INTO WORKERS (`Num_Emp`, `Nom_Emp`, `Prenom_Emp`, `DateNaissance_Emp`, `Salaire_Emp`) VALUES ('5', 'Nom1', 'Prenom5', '2018-2-2', '10000');

select * from workers where Salaire_Emp between 5000 and 9000 order by DateNaissance_Emp desc ;
select * from workers where ville not like '%a%';

select Salaire_Emp,Salaire_Emp* 12 as 'SalaireMensuel' from workers ; 

























