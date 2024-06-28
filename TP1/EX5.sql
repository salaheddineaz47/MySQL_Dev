create database ANALYSES ;
use ANALYSES ;

drop  table CLIENT ;
drop table Echantillon ;

select * from CLIENT ;
select * from Echantillon ;
select * from Realiser ;

create table CLIENTs(codeclient int primary key, Nom varchar(30) , cpclient varchar(30), villeclient varchar(30), tel int);
create table Echantillon(codeEchantillon int primary key auto_increment, dateEntree date , codeclient int ,foreign key(codeclient) references CLIENTs(codeclient) );
create table Typeanalyse( RefTypeAnalyse int primary key, designation varchar(30) , TypeAnalyse varchar(30), prixTypeAnalyse float );

alter table CLIENTs modify codeclient varchar(30) not null ;
alter table CLIENTs modify villeclient varchar(30) not null ;
alter table CLIENTs alter nom set default "Anonyme";
alter table Echantillon auto_increment = 10 ;

alter table Typeanalyse add constraint ck_Typeanalyse check( prixTypeAnalyse >= 100 and prixTypeAnalyse <= 1000 ) ;

create table Realiser( codeEchantillon int, RefTypeAnalyse int ,dateRealisation date, primary key(codeEchantillon,RefTypeAnalyse) ,
 foreign key(codeEchantillon) references Echantillon(codeEchantillon) , foreign key(RefTypeAnalyse) references Typeanalyse(RefTypeAnalyse)  );
 
alter table Realiser add constraint ck_dateRealisation check( (dateRealisation > sysdate()) and (dateRealisation <  DATE_ADD(sysdate(), INTERVAL 3 DAY) )  ) ;	