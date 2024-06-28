create database mydbextp2;
use mydbextp2 ;
create table CLIENT (codecli int primary key, prenomcli varchar(30) , nomcli varchar(30), ruecli varchar(30), cpcli varchar(30), villecli varchar(30));
create table Films (codefilm int primary key, nomfilm varchar(30) ) ;
create table TableLocation (codecli int , codefilm int , datedebut date , duree int, primary key(codecli,codefilm), foreign key(codecli) references CLIENT(codecli),
foreign key(codefilm) references Films(codefilm)) ;

insert into Films values(12, 'The Raid'), (13 , 'The walf of wall street');
insert into client (codecli , prenomcli , nomcli ) values (124 , 'Mohamed' , 'Ali') ;
insert into client (codecli , prenomcli , nomcli ) values (07 , 'Prenom07' , 'Nom07') ;
insert into Films values(8 , 'Matrix 2');

-- 3
insert into Tablelocation (codecli , codefilm , datedebut, duree ) values (7 , 9 , '2013-01-03', 4) ;
insert into Tablelocation (codecli , codefilm , datedebut, duree ) values (1 , 1, '2000-08-02', 1 ) ;
insert into Films values(3, 'The Film3');

delete from TableLocation where codefilm = 1 ;
-- delete from Films where codefilm = 1 ;
-- delete from Films where codefilm = 2 ;
-- delete from Films where codefilm = 3 ;
DELETE FROM Films WHERE codefilm IN (1, 2, 3);


UPDATE Films SET nomfilm = 'Matrix 2' WHERE codefilm = 8;
UPDATE Locations SET duree = duree + 3 WHERE codecli = 7 AND codefilm = 9;


select * from films ;
select * from TableLocation ;
select * from client ;
-- the last questions is to input
drop table films ;
drop table TableLocation ;
drop table client ;
