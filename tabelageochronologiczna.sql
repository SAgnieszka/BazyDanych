CREATE DATABASE TabelaGeochronologiczna;

CREATE TABLE GeoEon (id_eon int NOT NULL, nazwa_eon varchar(20), PRIMARY KEY (id_eon));
CREATE TABLE GeoEra (id_era int NOT NULL, id_eon int, nazwa_era varchar(20), PRIMARY KEY (id_era));
CREATE TABLE GeoOkres (id_okres int NOT NULL, id_era int, nazwa_okres varchar(20), PRIMARY KEY (id_okres));
CREATE TABLE GeoEpoka (id_epoka int NOT NULL, id_okres int, nazwa_epoka varchar(20), PRIMARY KEY (id_epoka));
CREATE TABLE GeoPietro (id_pietro int NOT NULL, id_epoka int, nazwa_pietro varchar(20), PRIMARY KEY (id_pietro));

ALTER TABLE GeoEra ADD FOREIGN KEY (id_eon) REFERENCES GeoEon(id_eon);
ALTER TABLE GeoOkres ADD FOREIGN KEY (id_era) REFERENCES GeoEra(id_era);
ALTER TABLE GeoEpoka ADD FOREIGN KEY (id_okres) REFERENCES GeoOkres(id_okres);
ALTER TABLE GeoPietro ADD FOREIGN KEY (id_epoka) REFERENCES GeoEpoka(id_epoka);

INSERT INTO GeoEon (id_eon, nazwa_eon) 
VALUES (0, 'Fanerozoik');

INSERT INTO GeoEra (id_era, id_eon, nazwa_era) 
VALUES (0, 0, 'Kenozoik'), 
	(1, 0, 'Mezozoik'), 
	(2, 0, 'Paleozoik');

INSERT INTO GeoOkres (id_okres, id_era, nazwa_okres) 
VALUES (0, 0, 'Czwartorzad'), 
	(1, 0, 'Trzeciorzad'), 
	(2, 1, 'Kreda'),
	(3, 1, 'Jura'),
	(4, 1, 'Trias'),
	(5, 2, 'Perm'),
	(6, 2, 'Karbon'),
	(7, 2, 'Dewon');

INSERT INTO GeoEpoka (id_epoka, id_okres, nazwa_epoka) 
VALUES (0, 0, 'Halocen'),
	(1, 0, 'Plejstocen'),
	(2, 1, 'Pliocen'),
	(3, 1, 'Miocen'),
	(4, 1, 'Oligocen'),
	(5, 1, 'Eocen'),
	(6, 1, 'Paleocen'),
	(7, 2, 'Górna'),
	(8, 2, 'Dolna'),
	(9, 3, 'Górna'),
	(10, 3, 'Œrodkowa'),
	(11, 3, 'Dolna'),
	(12, 4, 'Górna'),
	(13, 4, 'Œrodkowa'),
	(14, 4, 'Dolna'),
	(15, 5, 'Górny'),
	(16, 5, 'Dolny'),
	(17, 6, 'Górny'),
	(18, 6, 'Dolny'),
	(19, 7, 'Górny'),
	(20, 7, 'Œrodkowy'),
	(21, 7, 'Dolny');

INSERT INTO GeoPietro(id_pietro, id_epoka, nazwa_pietro) 
VALUES (0, 0, 'a'), (1, 0, 'b'), (2, 0, 'c'), (3, 0, 'd'), (4, 1, 'e'), (5, 1, 'f'), (6, 1, 'g'), (7, 1, 'h'), (8, 2, 'i'), (9, 2, 'j'),
	(10, 2, 'aa'), (11, 3, 'bb'), (12, 3, 'cc'), (13, 3, 'dd'), (14, 4, 'ee'), (15, 4, 'ff'), (16, 4, 'gg'), (17, 5, 'hh'), (18, 5, 'ii'), (19, 5, 'jj'),
	(20, 6, 'aaa'), (21, 6, 'bbb'), (22, 6, 'ccc'), (23, 7, 'ddd'), (24, 7, 'eee'), (25, 7, 'fff'), (26, 8, 'ggg'), (27, 8, 'hhh'), (28, 8, 'iii'), (29, 9, 'jjj'),
	(30, 9, 'aaaa'), (31, 9, 'bbbb'), (32, 10, 'cccc'), (33, 10, 'dddd'), (34, 10, 'eeee'), (35, 11, 'ffff'), (36, 11, 'gggg'), (37, 11, 'hhhh'), (38, 12, 'iiii'), (39, 12, 'jjjj'),
	(40, 12, 'aaaaa'), (41, 13, 'bbbbb'), (42, 13, 'ccccc'), (43, 13, 'ddddd'), (44, 14, 'eeeee'), (45, 14, 'fffff'), (46, 14, 'ggggg'), (47, 15, 'hhhhh'), (48, 15, 'iiiii'), (49, 15, 'jjjjj'),
	(50, 16, 'aaaaaa'), (51, 16, 'bbbbbb'), (52, 16, 'cccccc'), (53, 17, 'dddddd'), (54, 17, 'eeeeee'), (55, 17, 'ffffff'), (56, 18, 'gggggg'), (57, 18, 'hhhhhh'), (58, 18, 'iiiiii'), (59, 19, 'jjjjjj'),
	(60, 19, 'aaaaaaa'), (61, 19, 'bbbbbbb'), (62, 20, 'ccccccc'), (63, 20, 'ddddddd'), (64, 20, 'eeeeeee'), (65, 21, 'fffffff'), (66, 21, 'ggggggg'), (67, 21, 'hhhhhhh');


CREATE TABLE GeoTabela (id_pietro int NOT NULL, nazwa_pietro varchar(20), id_epoka int, nazwa_epoka varchar(20), id_okres int, nazwa_okres varchar(20), id_era int, nazwa_era varchar(20), id_eon int, nazwa_eon varchar(20));
--CREATE TABLE GeoTabela (id_epoka int, nazwa_epoka varchar(20), id_okres int, nazwa_okres varchar(20), id_era int, nazwa_era varchar(20), id_eon int, nazwa_eon varchar(20));

INSERT INTO GeoTabela 
SELECT GeoPietro.id_pietro, GeoPietro.nazwa_pietro, GeoEpoka.id_epoka, GeoEpoka.nazwa_epoka, GeoOkres.id_okres, GeoOkres.nazwa_okres, GeoEra.id_era, GeoEra.nazwa_era, GeoEon.id_eon, GeoEon.nazwa_eon FROM GeoPietro INNER JOIN GeoEpoka ON GeoPietro.id_epoka = GeoEpoka.id_epoka INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;
--INSERT INTO GeoTabela 
--SELECT GeoEpoka.id_epoka, GeoEpoka.nazwa_epoka, GeoOkres.id_okres, GeoOkres.nazwa_okres, GeoEra.id_era, GeoEra.nazwa_era, GeoEon.id_eon, GeoEon.nazwa_eon FROM GeoEpoka INNER JOIN GeoOkres ON GeoEpoka.id_okres = GeoOkres.id_okres INNER JOIN GeoEra ON GeoOkres.id_era = GeoEra.id_era INNER JOIN GeoEon ON GeoEra.id_eon = GeoEon.id_eon;

CREATE INDEX tabela_index ON GeoTabela(id_pietro);

CREATE TABLE Dziesiec(cyfra int, bit int);
CREATE TABLE Milion(liczba int,cyfra int, bit int);

CREATE INDEX milion_index ON Milion(liczba);

INSERT INTO Dziesiec (cyfra)
VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9);

INSERT INTO Milion
SELECT a1.cyfra +10* a2.cyfra +100*a3.cyfra + 1000*a4.cyfra + 10000*a5.cyfra + 10000*a6.cyfra AS liczba, 
a1.cyfra AS cyfra,
a1.bit AS bit
FROM Dziesiec a1, Dziesiec a2, Dziesiec a3, Dziesiec a4, Dziesiec a5, Dziesiec a6;


SET STATISTICS IO, TIME ON 
DBCC FREEPROCCACHE; 
DBCC DROPCLEANBUFFERS; 
CHECKPOINT
GO

--Zapytanie 1
SELECT COUNT(*) FROM Milion INNER JOIN GeoTabela ON ((Milion.liczba%68)=(GeoTabela.id_pietro));

SET STATISTICS IO, TIME ON 
DBCC FREEPROCCACHE; 
DBCC DROPCLEANBUFFERS; 
CHECKPOINT
GO

--Zapytanie 2
SELECT COUNT(*) FROM Milion INNER JOIN GeoPietro ON ((Milion.liczba%68)=GeoPietro.id_pietro) INNER JOIN GeoEpoka ON GeoPietro.id_epoka=GeoEpoka.id_epoka INNER JOIN GeoOkres ON GeoEpoka.id_okres=GeoOkres.id_okres INNER JOIN GeoEra ON GeoOkres.id_era=GeoEra.id_era INNER JOIN GeoEon ON GeoEra.id_eon=GeoEon.id_eon;

SET STATISTICS IO, TIME ON 
DBCC FREEPROCCACHE; 
DBCC DROPCLEANBUFFERS; 
CHECKPOINT
GO

--Zapytanie 3
SELECT COUNT(*) FROM Milion WHERE (Milion.liczba%68)=(SELECT id_pietro FROM GeoTabela WHERE (Milion.liczba%68)=(id_pietro));

SET STATISTICS IO, TIME ON 
DBCC FREEPROCCACHE; 
DBCC DROPCLEANBUFFERS; 
CHECKPOINT
GO

--Zapytanie 4
SELECT COUNT(*) FROM Milion WHERE (Milion.liczba%68)=(SELECT GeoPietro.id_pietro FROM GeoPietro INNER JOIN GeoEpoka ON GeoPietro.id_epoka=GeoEpoka.id_epoka INNER JOIN GeoOkres ON GeoEpoka.id_okres=GeoOkres.id_okres INNER JOIN GeoEra ON GeoOkres.id_era=GeoEra.id_era INNER JOIN GeoEon ON GeoEra.id_eon=GeoEon.id_eon WHERE (Milion.liczba%68)=(id_pietro));
