show databases;
use serie_exos;
show tables;
create table representation(
Num_Rep int primary key,
titre_Rep text,
lieu varchar(30));

create table musicien(
Num_mus int primary key,
nom varchar(30),
Num_Rep int);

alter table musicien
add constraint fk_numrep foreign key (Num_Rep) references representation(Num_Rep);

drop table representation;
show tables;

create table representation(
Num_Rep int primary key,
titre_Rep text,
lieu varchar(30));

alter table musicien
add constraint fk_numrep foreign key (Num_Rep) references representation(Num_Rep);

create table programmer(
Date datetime,
Num_Rep int,
tarif int,
constraint fknumrep foreign key (Num_Rep) references representation(Num_Rep));

#1
select titre_Rep from representation;
#2
select titre_Rep from representation where lieu = "théâtre JCC";
#3
select nom from musicien and titre_Rep from representation;
#4
select titre_Rep and lieu from representation and tarif from programmer where date = '2021-02-28';
#5
select count(nom) from musicien where Num_Rep = 15;
#6
select Num_Rep and Date from programmer where tarif < 30;

create table departements(
DNO int,
DNOM varchar(50),
DIR varchar(50),
VILLE varchar(50));

create table employes (
ENO int,
ENOM varchar(50),
PROF varchar(50),
DATEEMB date,
COM int,
SAL int,
DNO int);

alter table employes
add constraint fk_DNO foreign key (DNO) references departements(DNO);

drop table departements;

create table departements (
DNO int,
DNOM varchar(50),
DIR varchar(50),
VILLE varchar(50));

alter table employes
add constraint fk_DNO foreign key (DNO) references departements(DNO);

use serie_exos;
show tables;
alter table employes
add constraint fk_dno foreign key (DNO) references departements(DNO);

drop tables employes, departements;

create table departements(
DNO int primary key,
DNOM varchar(50),
DIR varchar(50),
VILLE varchar(50));

create table employes(
ENO int primary key,
ENOM varchar(50),
PROF varchar(50),
DATEEMB date,
COM int,
SAL int,
DNO int);

alter table employes
add constraint fk_dno foreign key (DNO) references departements(DNO);

#1
select ENOM from employes where COM > 0;
#2
select ENOM, PROF, SAL from employes;
#3
select avg(SAL) from employes;
#4
select avg(SAL) and DNO = 'Production' from employes;
#5
select DNO and max(SAL) from employes;
#6
select PROF and avg(SAL) from employes;
#7

create table client(
Numcli int primary key,
Nomcli varchar(30) not null,
Prenomcli varchar(30) not null,
adressecli text not null,
mailcli text);