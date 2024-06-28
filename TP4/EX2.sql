create database tp4ex2 ;
use tp4ex2 ;

create table Commande (id_commande varchar(30) primary key  ,id_client varchar(30) , date_commande varchar(30),montant float, 
foreign key(id_client) references Commande(id_commande));

select * from Commande ;

--  QST 1
SELECT id_client,count(id_commande) from Commande group by id_client;
--  QST 2
SELECT id_client,sum(montant) from Commande group by id_client;
--  QST 3
SELECT id_client,min(date_commande) from Commande group by id_client ;
--  QST 4
SELECT id_client from Commande group by id_client having count(id_commande) > 3 ;
--  QST 5
SELECT id_client from Commande group by id_client having sum(montant) > 1000    ;
--  QST 6
SELECT id_client,avg(montant) from Commande group by id_client   ;
--  QST 7
SELECT id_client,max(montant) as la_Plus_cher_commande from Commande group by id_client   ;
