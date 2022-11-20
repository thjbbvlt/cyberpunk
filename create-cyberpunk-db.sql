/*
SÉRIE DE COMMANDES SQLITE3 POUR CRÉER LA BASE DE DONNÉE
à partir de la commande suivante (par exemple):
sqlite3 cyberpunk.db ".read create-cyberpunk-db.sql" 

https://www.sqlite.org/foreignkeys.html 
https://www.sqlite.org/lang_createtable.html 
*/

/* autoriser foreign key: */
PRAGMA foreign_keys = ON;

/* create table annee (pk_annee, numero); */
create table annee (
	pk_annee int primary key not null
);

/* create table pays (pk_pays, nom, fk_langue, existence_reelle); */
create table pays (
	/* column_name type constraint1 constraintn (primary key not null)(,) */
	pk_pays int primary key not null, 
	/* primary key: implique not null (mais il faut le spécifier tout de même) et unique (pas besoin de spécifier) */
	pays_nom text
);

/* create table langue (pk_langue, nom); */
create table langue (
	pk_langue int primary key not null,
	langue_nom text
);

/* create table organisation (pk_organisation, nom, fk_pays, annee_de_creation); */
create table organisation (
	pk_organisation int primary key not null,
	organisation_nom text,
	fk_organisation_annee int,
	fk_organisation_pays int,
	/* les relations fk-pk doivent être à la fin */
	FOREIGN KEY(fk_organisation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_organisation_pays) REFERENCES pays(pk_pays)
);

/* create table manifestation (pk_manifestation, titre, fk_organisation, fk_oeuvre, fk_annee, fk_pays, fk_langue); */
create table manifestation (
	pk_manifestation int primary key not null,
	manifestation_titre text,
	fk_manifestation_organisation int,
	fk_manifestation_annee int,
	fk_manifestation_pays int,
	fk_manifestation_langue int,
	FOREIGN KEY(fk_manifestation_organisation) REFERENCES organisation(pk_organisation),
	FOREIGN KEY(fk_manifestation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_manifestation_pays) REFERENCES pays(pk_pays),
	FOREIGN KEY(fk_manifestation_langue) REFERENCES langue(pk_langue)
);

/* create table oeuvre (pk_oeuvre, fk_manifestation, fk_pays, fk_annee); */
create table oeuvre (
	pk_oeuvre int primary key not null,
	fk_oeuvre_manifestation int,
	fk_oeuvre_annee int,
	fk_oeuvre_pays int,
	fk_oeuvre_langue int,
	FOREIGN KEY(fk_oeuvre_manifestation) REFERENCES manifestation(pk_manifestation),
	FOREIGN KEY(fk_oeuvre_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_oeuvre_pays) REFERENCES pays(pk_pays),
	FOREIGN KEY(fk_oeuvre_langue) REFERENCES langue(pk_langue)
);

/* create table mot (pk_mot, nom, rarete, anciennete, fk_langue); */

/* test table avec keys */
/* depuis: */

/* insérer valeurs dans des tables */
/* insert into langue values (1, 'eng'); */
/* insert into langue values (2, 'fra'); */
insert into annee values (2004);
insert into annee values (1824);
/* insert into organisation values (12, 'une_organisation', 1824); */

/* pour m'assurer que tout fonctionne */
/* faire une requete */
/* select * from langue; */
select * from annee;
select * from organisation;
