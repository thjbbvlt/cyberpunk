/*
SÉRIE DE COMMANDES SQLITE3 POUR CRÉER LA BASE DE DONNÉE (TABLES)
à partir de la commande suivante (par exemple):
sqlite3 cyberpunk.db ".read create-cyberpunk-db-tables.sql" 

https://www.sqlite.org/lang_createtable.html 
https://www.sqlite.org/foreignkeys.html 
*/

/* autoriser foreign key: */
PRAGMA foreign_keys = ON;

/* annee (pk_annee); */
create table annee (
	/* column_name type constraint1 constraintn (primary key not null)(,) */
	/* primary key: implique not null (mais il faut le spécifier tout de même) et unique (pas besoin de spécifier) */
	pk_annee text primary key not null
);

/* pays (pk_pays_nom, fk_langue, existence_reelle); */
create table pays (
	pk_pays text primary key not null
);

/* langue (pk_langue_nom); */
create table langue (
	pk_langue text primary key not null
);

/* organisation (pk_organisation_nom, fk_pays, annee_de_creation); */
create table organisation (
	pk_organisation_nom text primary key not null,
	fk_organisation_annee text,
	fk_organisation_pays text,
	/* les relations fk-pk doivent être à la fin */
	FOREIGN KEY(fk_organisation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_organisation_pays) REFERENCES pays(pk_pays)
);

/* manifestation (pk_manifestation, titre, support, fk_pays, fk_langue, fk_organisation, fk_annee); */
create table manifestation (
	pk_manifestation int primary key not null,
	manifestation_titre text,
	support text,
	fk_manifestation_pays text,
	fk_manifestation_langue text,
	fk_manifestation_organisation text,
	fk_manifestation_annee text,
	FOREIGN KEY(fk_manifestation_organisation) REFERENCES organisation(pk_organisation_nom),
	FOREIGN KEY(fk_manifestation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_manifestation_pays) REFERENCES pays(pk_pays),
	FOREIGN KEY(fk_manifestation_langue) REFERENCES langue(pk_langue)
);

/* oeuvre (fk_manifestation, pk_oeuvre, fk_pays, fk_annee); */
create table oeuvre (
	fk_oeuvre_manifestation int,
	pk_oeuvre int primary key not null,
	fk_oeuvre_annee text,
	fk_oeuvre_pays text,
	FOREIGN KEY(fk_oeuvre_manifestation) REFERENCES manifestation(pk_manifestation),
	FOREIGN KEY(fk_oeuvre_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_oeuvre_pays) REFERENCES pays(pk_pays)
);

/* mot (pk_mot, nom, rarete, anciennete, fk_langue); */
create table mot (
	pk_mot text primary key not null,
	rareté int,
	ancienneté int,
	fk_mot_langue text,
	FOREIGN KEY(fk_mot_langue) REFERENCES langue(pk_langue)
);
