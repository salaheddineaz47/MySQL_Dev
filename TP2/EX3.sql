create database ANALYSES1 ;
use ANALYSES1 ;

drop  table CLIENT ;
drop table Echantillon ;
drop table Realiser ;
drop table Typeanalyse ;
drop table CHOLESTEROL ;


create table CLIENT(codeclient varchar(30) primary key, Nom varchar(30) , cpclient varchar(30), villeclient varchar(30), tel int);

alter table CLIENT modify codeclient varchar(30) not null ;
alter table CLIENT modify villeclient varchar(30) not null ;
alter table CLIENT alter nom set default "Anonyme";
alter table Echantillon auto_increment = 10 ;

create table Echantillon(codeEchantillon int primary key auto_increment, dateEntree date , codeclient varchar(30) ,foreign key(codeclient) references CLIENT(codeclient) );

create table Typeanalyse( RefTypeAnalyse int primary key, designation varchar(30) , TypeAnalyse varchar(30), prixTypeAnalyse float );

alter table Typeanalyse add constraint ck_Typeanalyse check( prixTypeAnalyse >= 100 and prixTypeAnalyse <= 1000 ) ;
alter table Typeanalyse drop  ck_Typeanalyse ;

create table Realiser( codeEchantillon int, RefTypeAnalyse int ,dateRealisation date, primary key(codeEchantillon,RefTypeAnalyse) ,
 foreign key(codeEchantillon) references Echantillon(codeEchantillon) , foreign key(RefTypeAnalyse) references Typeanalyse(RefTypeAnalyse)  );
 
alter table Realiser add constraint ck_dateRealisation check( (dateRealisation > sysdate()) and (dateRealisation <  DATE_ADD(sysdate(), INTERVAL 3 DAY) )  ) ;	
alter table Realiser drop  ck_dateRealisation ;

alter table CLIENT modify column codeclient  varchar(30);
insert into CLIENT values("C3", 'Nom3','cp3', 'Safi' , 06433332 ) ;
insert into typeanalyse values(4 ,"des4","type4",190);
insert into Echantillon (dateEntree, codeclient) values ('2023-07-22' ,'C2' );
insert into Realiser values (5 ,1, '2020-09-21');

delete from CLIENT where codeclient = 'C1';

select * from CLIENT ;
select * from Echantillon ;
select * from Realiser ;
select * from typeanalyse ;
select * from CHOLESTEROL ;

update typeanalyse set prixTypeAnalyse =  prixTypeAnalyse + prixTypeAnalyse*0.1 ;
update typeanalyse set prixTypeAnalyse =  80 where prixTypeAnalyse > 80 ;

update client set tel = 0611111111 where codeclient = 'C2' ;
update Echantillon set dateEntree = '2006-02-01' where dateEntree = '2007-02-01';

create table CHOLESTEROL( RefTypeAnalyse int primary key, designation varchar(30) , TypeAnalyse varchar(30), prixTypeAnalyse float );

insert into typeanalyse select * from CHOLESTEROL   ; 

