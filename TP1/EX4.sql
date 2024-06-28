create database GestionLogement ;
use GestionLogement ;

create table QUARTIER (ID_QUARTIER int primary key , ID_COMMUNE int , LIBELLE_QUARTIER varchar(30));

create table COMMUNE (ID_COMMUNE  int primary key , NOM_COMMUNE varchar(30) , DISTANCE_AGE float, NOMBRE_D_HA int);

create table LOGEMENT (N_LOGEMENT  int primary key , TYPE_LOGEMENT varchar(30) , ID_QUARTIER int, NO int, RUE varchar(30), SUPERFICE float, LOYER float);

create table TYPE_DE_LOGEMENT (TYPE_LOGEMENT  varchar(30) primary key , CHARGES_FORF varchar(30) );

create table INDIVIDU (N_IDENTIFICATION  int primary key , N_LOGEMENT int , NOM varchar(30), PRENOM varchar(30),
 DATE_DE_NAISSANCE date, N_TELEPHONE varchar(30));
 
 
alter table LOGEMENT add constraint foreign key(TYPE_LOGEMENT) references TYPE_DE_LOGEMENT(TYPE_LOGEMENT) on delete cascade on update cascade ;

alter table LOGEMENT add constraint foreign key(ID_QUARTIER) references QUARTIER(ID_QUARTIER) on delete cascade on update cascade ;

alter table QUARTIER add constraint foreign key(ID_COMMUNE) references COMMUNE(ID_COMMUNE) on delete cascade on update cascade ;

alter table INDIVIDU add constraint foreign key(N_LOGEMENT) references LOGEMENT(N_LOGEMENT) on delete cascade on update cascade ;

alter table INDIVIDU modify N_TELEPHONE varchar(30) not null ;
alter table INDIVIDU modify NOM varchar(30) default('sansNom');
alter table INDIVIDU alter NOM set default('sansNom');

#alter table INDIVIDU add constraint ck_ateNaissance check( (DATE_DE_NAISSANCE > current_date) and (timestampdiff(year,DATE_DE_NAISSANCE, current_date()) < 18 ) ) ;
alter table INDIVIDU add constraint ck_datedenaissance check (DATE_DE_NAISSANCE <= sysdate() and  timestampdiff( year , DATE_DE_NAISSANCE , sysdate() ) >= 18 );

alter table INDIVIDU alter NOM drop default ;












drop table LOGEMENT ; 
drop table QUARTIER ; 
drop table INDIVIDU ; 
drop table TYPE_DE_LOGEMENT ; 
drop table COMMUNE ;