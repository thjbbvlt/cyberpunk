/* autoriser foreign key: */
PRAGMA foreign_keys = ON;

/* creer les tables 1: */
/* create table annee (pk_annee, numero); */
/* create table langue (pk_langue, nom); */
/* create table pays (pk_pays, nom, fk_langue, existence_reelle); */
/* create table mot (pk_mot, nom, rarete, anciennete, fk_langue); */
/* create table manifestation (pk_manifestation, titre, fk_organisation, fk_oeuvre, fk_annee, fk_pays, fk_langue); */
/* create table oeuvre (pk_oeuvre, fk_manifestation, fk_pays, fk_annee); */
/* create table fabricant_e (pk_fabricant, nom, fk_pays, annee_de_creation); */

/* creer les tables 2: */

create table annee (
	pk_annee int primary key not null
);

create table pays (
	pk_pays_num int primary key not null,
	pays_nom text
);

create table organisation (
	pk_organisation_num int primary key not null,
	organisation_nom text,
	fk_organisation_annee,
	FOREIGN KEY(fk_organisation_annee) REFERENCES annee(pk_annee)
);


/* test table avec keys */
/* depuis: */

/* insérer valeurs dans des tables */
/* insert into langue values (1, 'eng'); */
/* insert into langue values (2, 'fra'); */
insert into annee values (2004);
insert into annee values (1824);

/* faire une requete */
/* select * from langue; */
select * from annee;

/* aide-mémoire */

/* https://www.sqlite.org/foreignkeys.html */
/* https://www.sqlite.org/lang_createtable.html */

/* les commandes de bases: */
/* create table tablegoodname (text1, text2);; */
/* column_name type constraint1 constraint2... (primary key) */
/* insert into tablegoodname values('une_valeur', 2, 'une_autre_valeur_pas_num');; */

/* primary key: implique not null (mais il faut le spécifier tout de même) et unique (pas besoin de spécifier) */
