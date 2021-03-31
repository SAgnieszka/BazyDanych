-- tworzenie bazy danych
CREATE DATABASE firma;

-- dodanie schematu
CREATE SCHEMA rozliczenia;

-- tworzenie tabel
CREATE TABLE rozliczenia.pracownicy(id_pracownika INTEGER PRIMARY KEY, imie VARCHAR(20)  NOT NULL, nazwisko VARCHAR(20)  NOT NULL, adres VARCHAR(50), telefon VARCHAR(10));
CREATE TABLE rozliczenia.godziny(id_godziny INTEGER PRIMARY KEY, data DATE NOT NULL, liczba_godzin INTEGER  NOT NULL, id_pracownika INTEGER  NOT NULL);
CREATE TABLE rozliczenia.pensje(id_pensji INTEGER PRIMARY KEY, stanowisko VARCHAR(20), kwota MONEY  NOT NULL, id_premii INTEGER);
CREATE TABLE rozliczenia.premie(id_premii INTEGER PRIMARY KEY, rodzaj VARCHAR(20), kwota MONEY NOT NULL);

-- dodawanie kluczy obcych
ALTER TABLE rozliczenia.godziny ADD FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);
ALTER TABLE rozliczenia.pensje ADD FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

-- wypełnienie tabel danymi
INSERT INTO rozliczenia.pracownicy VALUES (1, 'Krzysztof', 'Nowak', 'al.Mickiewicza 20, Kraków', '999888777');
INSERT INTO rozliczenia.pracownicy VALUES (2, 'Jan', 'Wiśniowski', 'al.Słowackiego 123, Kraków', '654321321');
INSERT INTO rozliczenia.pracownicy VALUES (3, 'Anna', 'Kowalska', 'ul. Długa 12, Wieliczka', '236456789');
INSERT INTO rozliczenia.pracownicy VALUES (4, 'Alicja', 'Wójcik', 'ul. Krótka 5, Wrocław', '002569845');
INSERT INTO rozliczenia.pracownicy VALUES (5, 'Piotr', 'Malina', 'ul. Wrocławska 154, Kielce', '885223697');
INSERT INTO rozliczenia.pracownicy VALUES (6, 'Paweł', 'Stefański', 'ul. Mazowiecka 45, Gdańsk', '789523658');
INSERT INTO rozliczenia.pracownicy VALUES (7, 'Maria', 'Piotrowska', 'ul. Konopnickiej 15, Katowice', '236985965');
INSERT INTO rozliczenia.pracownicy VALUES (8, 'Anna', 'Sowa', 'ul. Basztowa 77, Kraków', '669856312');
INSERT INTO rozliczenia.pracownicy VALUES (9, 'Stefan', 'Nowakowski', 'ul. Opolska 54, Warszawa', '895658956');
INSERT INTO rozliczenia.pracownicy VALUES (10, 'Sebastian', 'Baran', 'ul. Karmelicka 45, Kraków', '777895635');

INSERT INTO rozliczenia.godziny VALUES (101, '2020-11-20', 5, 1);
INSERT INTO rozliczenia.godziny VALUES (102, '2020-10-17', 7, 2);
INSERT INTO rozliczenia.godziny VALUES (103, '2020-10-15', 8, 3);
INSERT INTO rozliczenia.godziny VALUES (104, '2020-11-10', 9, 4);
INSERT INTO rozliczenia.godziny VALUES (105, '2020-07-21', 6, 5);
INSERT INTO rozliczenia.godziny VALUES (106, '2020-06-22', 8, 6);
INSERT INTO rozliczenia.godziny VALUES (107, '2020-06-07', 8, 7);
INSERT INTO rozliczenia.godziny VALUES (108, '2020-05-03', 9, 8);
INSERT INTO rozliczenia.godziny VALUES (109, '2020-12-05', 10, 9);
INSERT INTO rozliczenia.godziny VALUES (110, '2020-01-13', 4, 10);

INSERT INTO rozliczenia.premie VALUES (201, 'uznaniowa', 300);
INSERT INTO rozliczenia.premie VALUES (202, 'regulaminowa', 200);
INSERT INTO rozliczenia.premie VALUES (203, 'uznaniowa', 150);
INSERT INTO rozliczenia.premie VALUES (204, 'uznaniowa', 100);
INSERT INTO rozliczenia.premie VALUES (205, 'uznaniowa', 70);
INSERT INTO rozliczenia.premie VALUES (206, 'regulaminowa', 170);
INSERT INTO rozliczenia.premie VALUES (207, 'uznaniowa', 240);
INSERT INTO rozliczenia.premie VALUES (208, 'uznaniowa', 210);
INSERT INTO rozliczenia.premie VALUES (209, 'regulaminowa', 180);
INSERT INTO rozliczenia.premie VALUES (210, 'regulaminowa', 200);

INSERT INTO rozliczenia.pensje VALUES (51, 'młodszy kelner', 2400, 205);
INSERT INTO rozliczenia.pensje VALUES (52, 'kucharz', 4200, 207);
INSERT INTO rozliczenia.pensje VALUES (53, 'kelner', 3000, 202);
INSERT INTO rozliczenia.pensje VALUES (54, 'kelner', 3000, 204);
INSERT INTO rozliczenia.pensje VALUES (55, 'cukiernik', 4000, 203);
INSERT INTO rozliczenia.pensje VALUES (56, 'młodszy kucharz', 3300, 206);
INSERT INTO rozliczenia.pensje VALUES (57, 'kucharz', 4200, 208);
INSERT INTO rozliczenia.pensje VALUES (58, 'kierownik sali', 5000, 210);
INSERT INTO rozliczenia.pensje VALUES (59, 'szef kuchni', 5200, 201);
INSERT INTO rozliczenia.pensje VALUES (60, 'barman', 3500, 209);


-- wyświetlenie nazwisk i adresów pracowników
SELECT nazwisko, adres FROM rozliczenia.pracownicy;

-- konwersja daty YYYY-MM-DD na dzień tygodnia i miesiąc
SELECT DATE_PART('dow', data), DATE_PART('month', data) FROM rozliczenia.godziny;

-- zmiana nazwy kolumny kwota na kwota brutto
ALTER TABLE rozliczenia.pensje RENAME COLUMN kwota TO kwota_brutto;

-- dodanie kolumny
ALTER TABLE rozliczenia.pensje ADD COLUMN kwota_netto MONEY;

-- wyliczenie wartości kwota_netto (19%)
UPDATE rozliczenia.pensje SET kwota_netto = 0.81*kwota_brutto;






