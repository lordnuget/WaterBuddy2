-- Test data invoegen in klanten tabel
Insert INTO `klanten` (
    `Voornaam`,
    `Achternaam`,
    `Aanhef`,
    `Straatnaam`,
    `Huisnummer`,
    `Postcode`,
    `Plaatsnaam`,
    `Nieuwsbrief`,
    `Geboortedatum`,
    `Email`
)

VALUES 
('Lucas', 'de Jong', 'Mr', 'Verduinstraat', '110', '4132GA', 'Vianen', '2', '1995-06-13', 'lucas@gmail.com'),
('Kees', 'Jansen', 'Mr', 'Boeier', '88', '2991KD', 'Barendrecht', '2', '1973-07-14', 'kees@gmail.com'),
('Richard', 'de Vries', 'Mr', 'Brouwerijstraat', '36', '8161XP', 'Epe', '1', '1982-02-15', 'richard@gmail.com'),
('Rik', 'van den Berg', 'Mr', 'Jan Pieter Heijestraat', '89', '1054MD', 'Amsterdam', '2', '1991-01-21', 'rik@gmail.com'),
('Mark', 'van Dijk', 'Mr', 'Mozartstraat', '78', '6561EB', 'Groesbeek', '1', '1992-12-05', 'mark@gmail.com'),
('Sanne', 'Bakker', 'Mrs', 'De Genestetstraat', '53', '3117TA', 'Schiedam', '1', '1992-11-16', 'sanne@gmail.com'),
('Shannon', 'Janssen', 'Mrs', 'Florijnburg', '105', '3437ST', 'Nieuwegein', '2', '1985-10-06', 'shannon@gmail.com'),
('Tasja', 'Visser', 'Mrs', 'Kapellerlaan', '14', '6041JC', 'Roermond', '2', '1987-02-02', 'tasja@gmail.com'),
('Julia', 'Smit', 'Mrs', 'Voorstraat', '24', '3202BA', 'Spijkenisse', '2', '1967-11-22', 'julia@gmail.com'),
('Noah', 'Meijer', 'Mr', 'Spinnersdonk', '102', '7326HG', 'Apeldoorn', '2', '1971-06-25', 'noah@gmail.com'),
('Felix', 'de Boer', 'Mr', 'Bachstraat', '50', '6904HR', 'Zevenaar', '1', '1983-08-19', 'felix@gmail.com'),
('Daan', 'Mulder', 'Mr', 'Petrarcastraat', '104', '3076WP', 'Rotterdam', '2', '1995-05-17', 'daan@gmail.com'),
('Emma', 'de Groot', 'Mrs', 'Van Oldenbarneveltplein', '92', '3317ET', 'Dordrecht', '2', '1997-04-13', 'emma@gmail.com'),
('Olivia', 'Bos', 'Mrs', 'De Schout', '184', '1251BN', 'Laren', '2', '1992-02-14', 'olivia@gmail.com'),
('Milou', 'Vos', 'Mrs', 'Willem Arntszkade', '100', '3515AG', 'Utrecht', '2', '1990-06-11', 'milou@gmail.com');

-- Test data invoegen in leveranciers tabel
INSERT INTO `Leveranciers` (
    `Leveranciersnaam`,
    `Levertermijn`,
    `Straatnaam`,
    `Huisnummer`,
    `Postcode`,
    `Plaatsnaam`,
    `Contactpersoon`,
    `Telefoonnummer`,
    `Email`
)
 
VALUES
('Plant&Co', '6', 'Joliotplaats', '172', '3069JK', 'Rotterdam', 'Edwin van Vliet', '+31857945741', 'edwin@transport.nl'),
('Dutchplants', '4', 'Sallershof', '169', '6004BP', 'Weert', 'Manon Grutter', '+3145471247', 'manon@productie.nl');

-- Test data invoegen in btw tabel
INSERT INTO `btw` (
    `BTWHOOG`,
    `BTWlaag`,
    `BTWnul`
)

VALUES
(21, 9, 0);


-- Test data invoegen in artikelen tabel
INSERT INTO `artikelen` (
    `Artikelnaam`,
    `LeveranciersID`,
    `Artikelprijs`,
    `Voorraad`,
    `BTWID`
)

VALUES
('WaterBuddy Basic', '1', '14.99', '25', '21'),
('WaterBuddy Pro', '2', '24.99', '31', '21');

-- Test data invoegen in werknemers tabel
INSERT INTO `werknemers` (
    `Voornaam`,
    `Achternaam`,
    `Aanhef`,
    `Straatnaam`,
    `Huisnummer`,
    `Postcode`,
    `Plaatsnaam`,
    `Functietitel`,
    `Rol`,
    `Wachtwoord`,
    `Geboortedatum`,
    `Indienst`
)

VALUES

('Roy', 'Schrauwen', 'Mr', 'Zuid-Oostsingel', '19', '4572TR', 'Bergen op Zoom', 'Systeembeheerder', 'IT', 'TESTIT', '1992-02-12', 'Indienst'),
('Lieke', 'Span', 'Mrs', 'Koninginnenlaan', '35', '1248FG', 'Vlaardingen', 'Sales en marketing', 'SenM', 'TESTSENM', '1993-04-11', 'Indienst'),
('Huseyin', 'Tüfekci', 'Mr', 'Soarremoarre', '140', '1251TA', 'Nes', 'CEO', 'HR', 'TESTHR', '1992-05-10', 'Indienst'),
('Milan', 'Toen', 'Mr', 'Brederolaan', '42', '4873GK', 'Etten-Leur', 'Financieel Directeur', 'FIN', 'TESTFIN', '1995-06-13', 'Indienst');


-- Test data invoegen in bestellingen tabel
INSERT INTO `bestellingen` (
    `KlantID`,
    `Datumplaatsingbestellingen`,
    `Aantalartikelen`,
    `Totaalprijs`,
    `Retourgestuurd`,
    `Retourontvangen`,
    `WerknemersID`,
    `Gecontroleerd`
)

VALUES

('1', '2021-11-02', '2', '35.68', '1', '1', '4', 'Goed'),
('2', '2021-11-03', '2', '35.68', '1', '1', '4', 'Goed'),
('3', '2021-11-04', '2', '59.48', '2', '2', '4', 'Goed'),
('4', '2021-11-04', '2', '35.68', '1', '1', '4', 'Goed'),
('5', '2021-11-11', '2', '59.48', '1', '1', '4', 'Goed'),
('6', '2021-11-12', '2', '35.68', '1', '1', '4', 'Goed'),
('7', '2021-11-23', '2', '35.68', '1', '1', '4', 'Goed'),
('8', '2021-12-09', '2', '35.68', '1', '1', '4', 'Goed'),
('9', '2022-01-22', '2', '35.68', '1', '1', '4', 'Goed'),
('10', '2022-01-29', '2', '35.68', '1', '1', '4', 'Goed'),
('11', '2022-02-11', '2', '35.68', '1', '1', '4', 'Goed'),
('11', '2022-02-11', '2', '59.48', '1', '1', '4', 'Goed'),
('12', '2022-03-02', '2', '35.68', '2', '1', '4', 'Nee'),
('13', '2022-03-04', '2', '35.68', '1', '1', '4', 'Nee'),
('14', '2022-03-04', '2', '35.68', '1', '1', '4', 'Nee'),
('15', '2022-03-04', '2', '59.48', '1', '1', '4', 'Nee'),
('3', '2022-03-04', '1', '29.74', '1', '1', '4', 'Nee');



