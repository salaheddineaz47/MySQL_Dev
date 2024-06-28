create database GestionCommande ;
use GestionCommande ;

create table CLIENT(
IdClt int primary key,
NomClt varchar(30) ,
PrenomClt varchar(30),
Adresse varchar(30),
VilleClt varchar(30)  ); #DECIMAL(nb qbl fasila , b3d fasila)

alter table CLIENT modify villeClt varchar(30) NOT NULL ;
alter table CLIENT alter NomClt set default 'SansNom' ;
alter table CLIENT alter PrenomClt set default 'SansPrenom' ;

INSERT INTO `gestioncommande`.`Commande` (`NoCmd`, `IdClt`, `Ref` ,  `DateCmd`, `DateLiv`) VALUES ( '3','2', '2' , '2022-08-22', '2023-09-28');

create table Produit(
Ref int primary key auto_increment,
Designation varchar(30) ,
Quantité int ,
Prix float  );

create table Commande(
NoCmd int primary key,
IdClt int  ,
Ref int ,
DateCmd date,
DateLiv date, foreign key (Idclt) references CLIENT(IdClt) on delete cascade on update cascade) ;

alter table Commande add constraint fk_Ref foreign key (Ref) references Produit(Ref) on delete cascade on update cascade ;	
alter table Commande add constraint ck_date check( DateLiv > DateCmd ) ;

alter table Commande add column calculee int as (DATEDIFF(DateLiv,DateCmd)) ;

select DATEDIFF(curdate(),"2024-03-14") ;

select * from CLIENT ;
select * from Commande ;
select * from Produit ;










drop table CLIENT ;
DROP table Commande ;
DROP table Produit ;


-- update Commande set DateCmd = current_date() ;
#update Commande SET  calculee = DATEDIFF(DateCmd, DateLiv) ;