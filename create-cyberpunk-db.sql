/* les commandes de bases: */
/* create table (text);; */
/* insert into memos values('une_valeur');; */
/* select * from memos; */

/* creer les tables: */
create table manifestation (pk_manifestation, titre, fk_organisation, fk_oeuvre, fk_annee, fk_pays, fk_langue);
create table oeuvre (pk_oeuvre, fk_manifestation, fk_pays, fk_annee);
create table mot (pk_mot, nom, rarete, anciennete, fk_langue);
create table pays (pk_pays, nom, fk_langue, existence_reelle);
create table fabricant_e (pk_fabricant, nom, fk_pays, annee_de_creation);
create table annee (pk_annee, numero);
create table langue (pk_langue, nom);

/* insérer valeurs dans des tables */
insert into langue values (000001, 'eng');

/* faire une requete */
select * from langue;
