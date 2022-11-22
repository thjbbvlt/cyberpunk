/* langue */
insert into langue values ('eng');

/* pays */
insert into pays values ('us');
insert into pays values ('uk');

/* organisation */
insert into organisation values ('Doubleday', 'usa', '1897');
insert into organisation values ('Dell Publishing', 'usa', '1921');
insert into organisation values ('Arbor House', 'usa', '1969-1988');
insert into organisation values ('Bantam Books', 'usa', '1945');
insert into organisation values ('Bantam Spectra', 'usa', '1945');
insert into organisation values ('Simon & Schuster', 'usa', '1924');
insert into organisation values ('Ace Books', 'usa', '1952');
insert into organisation values ('Orbit Books', 'uk', '1974');
insert into organisation values ('Crown Publishing group', 'usa', '1933');

/* oeuvre et manifestation */
insert into manifestation values (1001, 'Do Androids Dream of Electric Sheep?', 'print', 'usa', 'eng', 'Doubleday', '1968');
insert into oeuvre values (1001, 11001, '1992', null); /*(2021 in later edition)*/

insert into manifestation values (1002, 'The Girl Who Was Plugged In', 'print', 'usa', 'eng', 'Doubleday', '1973');
insert into oeuvre values (1002, 11002, null, null);

insert into manifestation values (1003, 'True Names', 'print', 'usa', 'eng', 'Dell Publishing', '1981');
insert into oeuvre values (1003, 11003, null, null);

insert into manifestation values (1004, 'Islands in the Net', 'print', 'usa', 'eng', 'Arbor House', '1988');
insert into oeuvre values (1004, 11004, '2023', null);

insert into manifestation values (1005, 'Snow Crash', 'print', 'usa', 'eng', 'Bantam Books', '1992');
insert into oeuvre values (1005, 11005, '21st century', null);

insert into manifestation values (1006, 'Virtual Light', 'print', 'usa', 'eng', 'Bantam Spectra', '1993');
insert into oeuvre values (1006, 11006, '2006', null);

insert into manifestation values (1007, 'Heavy Weather', 'print', 'usa', 'eng', 'Bantam Spectra', '1994');
insert into oeuvre values (1007, 11007, '2031', null);

insert into manifestation values (1008, 'River of Gods', 'print', 'uk', 'eng', 'Simon & Schuster', '2004');
insert into oeuvre values (1008, 11008, '2047', null);

insert into manifestation values (1009, 'Glasshouse', 'print', 'uk / us', 'eng', 'Orbit / Ace', '2006');
insert into oeuvre values (1009, 11009, '27th century', null);

insert into manifestation values (1010, 'Ready Player One', 'print', 'usa', 'eng', 'Crown Publishing Group', '2011');
insert into oeuvre values (1010, 11010, '2040', null);
