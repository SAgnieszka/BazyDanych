-- tworzenie bazy danych
CREATE DATABASE firma;

-- dodanie schematu
CREATE SCHEMA ksiegowosc1;

-- tworzenie tabel
CREATE TABLE ksiegowosc1.pracownicy(id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(20)  NOT NULL, nazwisko VARCHAR(20)  NOT NULL, adres VARCHAR(50), telefon VARCHAR(20));
CREATE TABLE ksiegowosc1.godziny(id_godziny INTEGER PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER  NOT NULL);
CREATE TABLE ksiegowosc1.pensje(id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY  NOT NULL);
CREATE TABLE ksiegowosc1.premie(id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY NOT NULL);
CREATE TABLE ksiegowosc1.wynagrodzenie(id_wynagrodzenia INTEGER PRIMARY KEY, data DATE NOT NULL, id_pracownika INTEGER NOT NULL, id_godziny INTEGER NOT NULL, id_pensji INTEGER NOT NULL, id_premii INTEGER);

-- dodawanie kluczy obcych
ALTER TABLE ksiegowosc1.wynagrodzenie ADD FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc1.pracownicy(id_pracownika);
ALTER TABLE ksiegowosc1.wynagrodzenie ADD FOREIGN KEY (id_godziny) REFERENCES ksiegowosc1.godziny(id_godziny);
ALTER TABLE ksiegowosc1.wynagrodzenie ADD FOREIGN KEY (id_pensji) REFERENCES ksiegowosc1.pensje(id_pensji);
ALTER TABLE ksiegowosc1.wynagrodzenie ADD FOREIGN KEY (id_premii) REFERENCES ksiegowosc1.premie(id_premii);

-- wypełnienie tabel danymi
INSERT INTO ksiegowosc1.pracownicy VALUES (1, 'Krzysztof', 'Nowak', 'al.Mickiewicza 20, Kraków', '999888777');
INSERT INTO ksiegowosc1.pracownicy VALUES (2, 'Jan', 'Wiśniowski', 'al.Słowackiego 123, Kraków', '654321321');
INSERT INTO ksiegowosc1.pracownicy VALUES (3, 'Anna', 'Kowalska', 'ul. Długa 12, Wieliczka', '236456789');
INSERT INTO ksiegowosc1.pracownicy VALUES (4, 'Alicja', 'Wójcik', 'ul. Krótka 5, Wrocław', '002569845');
INSERT INTO ksiegowosc1.pracownicy VALUES (5, 'Piotr', 'Malina', 'ul. Wrocławska 154, Kielce', '885223697');
INSERT INTO ksiegowosc1.pracownicy VALUES (6, 'Paweł', 'Stefański', 'ul. Mazowiecka 45, Gdańsk', '789523658');
INSERT INTO ksiegowosc1.pracownicy VALUES (7, 'Maria', 'Piotrowska', 'ul. Konopnickiej 15, Katowice', '236985965');
INSERT INTO ksiegowosc1.pracownicy VALUES (8, 'Anna', 'Sowa', 'ul. Basztowa 77, Kraków', '669856312');
INSERT INTO ksiegowosc1.pracownicy VALUES (9, 'Jadwiga', 'Nowakowska', 'ul. Opolska 54, Warszawa', '895658956');
INSERT INTO ksiegowosc1.pracownicy VALUES (10, 'Sebastian', 'Baran', 'ul. Karmelicka 45, Kraków', '777895635');

INSERT INTO ksiegowosc1.godziny VALUES (101, '2020-11-25', 160);
INSERT INTO ksiegowosc1.godziny VALUES (102, '2020-11-25', 165);
INSERT INTO ksiegowosc1.godziny VALUES (103, '2020-11-25', 180);
INSERT INTO ksiegowosc1.godziny VALUES (104, '2020-11-25', 162);
INSERT INTO ksiegowosc1.godziny VALUES (105, '2020-11-25', 166);
INSERT INTO ksiegowosc1.godziny VALUES (106, '2020-11-25', 170);
INSERT INTO ksiegowosc1.godziny VALUES (107, '2020-11-25', 160);
INSERT INTO ksiegowosc1.godziny VALUES (108, '2020-11-25', 170);
INSERT INTO ksiegowosc1.godziny VALUES (109, '2020-11-25', 165);
INSERT INTO ksiegowosc1.godziny VALUES (110, '2020-11-25', 161);

INSERT INTO ksiegowosc1.premie VALUES (201, 'uznaniowa', 0);
INSERT INTO ksiegowosc1.premie VALUES (202, 'regulaminowa', 200);
INSERT INTO ksiegowosc1.premie VALUES (203, 'uznaniowa', 150);
INSERT INTO ksiegowosc1.premie VALUES (204, 'uznaniowa', 100);
INSERT INTO ksiegowosc1.premie VALUES (205, 'uznaniowa', 70);
INSERT INTO ksiegowosc1.premie VALUES (206, 'regulaminowa', 170);
INSERT INTO ksiegowosc1.premie VALUES (207, 'uznaniowa', 0);
INSERT INTO ksiegowosc1.premie VALUES (208, 'uznaniowa', 0);
INSERT INTO ksiegowosc1.premie VALUES (209, 'regulaminowa', 180);
INSERT INTO ksiegowosc1.premie VALUES (210, 'regulaminowa', 200);

INSERT INTO ksiegowosc1.pensje VALUES (51, 'kelner', 900);
INSERT INTO ksiegowosc1.pensje VALUES (52, 'kucharz', 2500);
INSERT INTO ksiegowosc1.pensje VALUES (53, 'kelner', 1600);
INSERT INTO ksiegowosc1.pensje VALUES (54, 'kelner', 2800);
INSERT INTO ksiegowosc1.pensje VALUES (55, 'cukiernik', 3100);
INSERT INTO ksiegowosc1.pensje VALUES (56, 'kucharz', 2900);
INSERT INTO ksiegowosc1.pensje VALUES (57, 'kierownik', 3500);
INSERT INTO ksiegowosc1.pensje VALUES (58, 'kierownik', 4000);
INSERT INTO ksiegowosc1.pensje VALUES (59, 'szef kuchni', 3200);
INSERT INTO ksiegowosc1.pensje VALUES (60, 'barman', 999);

INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1001, '2020-11-25', 1, 101, 51, 201);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1002, '2020-11-25', 2, 102, 52, 202);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1003, '2020-11-25', 3, 103, 53, 203);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1004, '2020-11-25', 4, 104, 54, 204);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1005, '2020-11-25', 5, 105, 55, 205);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1006, '2020-11-25', 6, 106, 56, 206);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1007, '2020-11-25', 7, 107, 57, 207);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1008, '2020-11-25', 8, 108, 58, 208);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (1009, '2020-11-25', 9, 109, 59, 209);
INSERT INTO ksiegowosc1.wynagrodzenie VALUES (10010, '2020-11-25', 10, 110, 60, 210);


-- a. nr telefonu pracownicy z (+48)
UPDATE ksiegowosc1.pracownicy
SET telefon = CONCAT('(+48) ', telefon)

-- b. nr telefonu pracownicy 555-444-333
UPDATE ksiegowosc1.pracownicy
SET telefon = CONCAT(SUBSTRING(pracownicy.telefon, 1, 9), '-', SUBSTRING(pracownicy.telefon, 10, 3), '-', SUBSTRING(pracownicy.telefon,13))

-- c. dane pracwonika, którego nazwisko jest najdłuższe, używając dużych liter
SELECT pracownicy.id_pracownika, UPPER(pracownicy.imie), UPPER(pracownicy.nazwisko), UPPER(pracownicy.adres), UPPER(pracownicy.telefon)
FROM ksiegowosc1.pracownicy
WHERE character_length(pracownicy.nazwisko) = (SELECT MAX(character_length(pracownicy.nazwisko)) FROM ksiegowosc1.pracownicy)

-- d. dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
SELECT pracownicy.id_pracownika, MD5(pracownicy.imie), MD5(pracownicy.nazwisko), MD5(pracownicy.adres), MD5(pracownicy.telefon), pensje.kwota
FROM ksiegowosc1.pracownicy
JOIN ksiegowosc1.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc1.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji;

-- e. pracowników, pensje i premie + złączenie lewostronne
SELECT pracownicy.id_pracownika, pracownicy.imie, pracownicy.nazwisko, pensje.kwota AS pensja, premie.kwota AS premia
FROM ksiegowosc1.pracownicy
LEFT JOIN ksiegowosc1.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc1.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc1.premie ON wynagrodzenie.id_premii = premie.id_premii;

-- f. raport (zapytanie) - treść wg schematu:
-- "Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, 
-- gdzie wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł"
ALTER TABLE ksiegowosc1.pensje 
ADD COLUMN pensja_zasadnicza MONEY;

UPDATE ksiegowosc1.pensje
SET pensja_zasadnicza = ((pensje.kwota::numeric / godziny.liczba_godzin) * 160)::money
FROM ksiegowosc1.wynagrodzenie, ksiegowosc1.godziny
WHERE pensje.id_pensji = wynagrodzenie.id_pensji AND wynagrodzenie.id_godziny = godziny.id_godziny;

ALTER TABLE ksiegowosc1.pensje 
ADD COLUMN nadgodziny MONEY;

UPDATE ksiegowosc1.pensje
SET nadgodziny = pensje.kwota - pensje.pensja_zasadnicza;


SELECT CONCAT('Pracownik ', pracownicy.imie, ' ', pracownicy.nazwisko, ' w dniu ', to_char(godziny.data, 'dd.mm.yyyy'), 
			  ' otrzymał pensję całkowitą na kwotę ', pensje.kwota + premie.kwota, 
			  ', gdzie wynagrodzenie zasadnicze wynosiło: ', pensje.pensja_zasadnicza,
			  ', premia: ', premie.kwota, 
			  ', nadgodziny: ', pensje.nadgodziny)
AS Raport
FROM ksiegowosc1.pracownicy
JOIN ksiegowosc1.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
JOIN ksiegowosc1.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc1.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc1.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny;





