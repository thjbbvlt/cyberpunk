/*
SÉRIE DE COMMANDES SQLITE3 POUR CRÉER LA BASE DE DONNÉE (TABLES)
à partir de la commande suivante (par exemple):
sqlite3 cyberpunk.db ".read create-cyberpunk-db.sql" 

https://www.sqlite.org/lang_createtable.html 
https://www.sqlite.org/foreignkeys.html 
*/

/* autoriser foreign key: */
PRAGMA foreign_keys = ON;

/* annee (pk_annee, numero); */
create table annee (
	pk_annee int primary key not null
);

/* pays (pk_pays, nom, fk_langue, existence_reelle); */
create table pays (
	/* column_name type constraint1 constraintn (primary key not null)(,) */
	pk_pays text primary key not null
	/* primary key: implique not null (mais il faut le spécifier tout de même) et unique (pas besoin de spécifier) */
);

/* langue (pk_langue, nom); */
create table langue (
	pk_langue text primary key not null
);

/* organisation (pk_organisation, nom, fk_pays, annee_de_creation); */
create table organisation (
	pk_organisation int primary key not null,
	organisation_nom text,
	fk_organisation_annee int,
	fk_organisation_pays text,
	/* les relations fk-pk doivent être à la fin */
	FOREIGN KEY(fk_organisation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_organisation_pays) REFERENCES pays(pk_pays)
);

/* manifestation (pk_manifestation, titre, fk_organisation, fk_oeuvre, fk_annee, fk_pays, fk_langue); */
create table manifestation (
	pk_manifestation int primary key not null,
	manifestation_titre text,
	fk_manifestation_organisation int,
	fk_manifestation_annee int,
	fk_manifestation_pays text,
	fk_manifestation_langue text,
	support text,
	FOREIGN KEY(fk_manifestation_organisation) REFERENCES organisation(pk_organisation),
	FOREIGN KEY(fk_manifestation_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_manifestation_pays) REFERENCES pays(pk_pays),
	FOREIGN KEY(fk_manifestation_langue) REFERENCES langue(pk_langue)
);

/* oeuvre (pk_oeuvre, fk_manifestation, fk_pays, fk_annee); */
create table oeuvre (
	pk_oeuvre int primary key not null,
	fk_oeuvre_manifestation int,
	fk_oeuvre_annee int,
	fk_oeuvre_pays text,
	fk_oeuvre_langue text,
	FOREIGN KEY(fk_oeuvre_manifestation) REFERENCES manifestation(pk_manifestation),
	FOREIGN KEY(fk_oeuvre_annee) REFERENCES annee(pk_annee),
	FOREIGN KEY(fk_oeuvre_pays) REFERENCES pays(pk_pays),
	FOREIGN KEY(fk_oeuvre_langue) REFERENCES langue(pk_langue)
);

/* mot (pk_mot, nom, rarete, anciennete, fk_langue); */
create table mot (
	pk_mot int primary key not null,
	chaine_caractere text,
	rareté int,
	ancienneté int,
	fk_mot_langue text,
	FOREIGN KEY(fk_mot_langue) REFERENCES langue(pk_langue)
);
