create database immobilier;
use immobilier;
create table logement (
    idLogement int not null auto_increment primary key,
    type varchar(50) check( type in ('maison','appartement')),
    ville varchar(10),
    prix float,
    superficie int,
    categorie varchar(10) check( categorie in ('vente','location'))
);
create table agence (
    idAgence int not null auto_increment primary key,
    nom varchar(30),
    adresse varchar(80)
);
create table personne (
	idPersonne int not null auto_increment primary key,
    nom varchar(20),
    prenom varchar(20),
    mail varchar(60) check( mail in ('''@''''.fr'))
);

alter table personne
modify mail varchar(60);

create table logement_agence(
    idLogementAgence int not null auto_increment primary key,
    idAgence int,
    idLogement int,
    frais float,
    foreign key (idAgence) references agence(idAgence),
    foreign key (idLogement) references logement(idLogement)
);
create table logement_personne(
	idLogementPersonne int not null auto_increment primary key,
    idPersonne int,
    idLogement int,
    foreign key (idPersonne) references personne(idPersonne),
    foreign key (idLogement) references logement(idLogement)
);
create table demande(
	idDemande int not null auto_increment primary key,
	idPersonne int,
	type varchar(50) check( type in ('maison','appartement')),
    ville varchar(10),
    budget float,
    superficie int,
    categorie varchar(10) check( categorie in ('vente','location')),
    foreign key (idPersonne) references personne(idPersonne)
);

call ajout_donnees;

#1
select distinct nom from agence;
#2
select idAgence from agence where nom = 'orpi';
#3
select * from logement limit 1; 
#4
select count(*) from logement;
#5
select * from logement where categorie = 'vente' and prix < 150000
order by prix asc;
#6
select count(*) from logement where categorie = 'location';
#7
select distinct ville from demande;
#8
select count(*) from logement where categorie = 'vente'
group by ville;
#9
select idLogement from logement where categorie = 'location';
#10
select idLogement from logement where superficie >= 20 and superficie <=30;
#11
select min(prix) from logement where categorie = 'vente';
#12
select distinct ville from logement where type = 'maison' and categorie = 'vente';
#13
select replace (frais, 800, 730) from logement_agence where idLogement = 3; 

#Exercice 4
create user 'afpa' identified by 'afpa123';
create user 'cda314' identified by 'cda123';
grant select on personne to 'afpa';
grant insert on personne to 'afpa';
grant select on logement to 'afpa';
grant insert on logement to 'afpa';
grant delete on demande to 'cda314';
grant delete on logement to 'cda314';