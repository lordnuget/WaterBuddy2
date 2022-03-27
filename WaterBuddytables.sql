-- Aanmaken klanten tabel
CREATE TABLE `klanten` (
    `KlantID` INT(9) NOT NULL AUTO_INCREMENT,
    `Voornaam` VARCHAR(60) NOT NULL,
    `Achternaam` VARCHAR(60) NOT NULL,
    `Aanhef` ENUM ('Mr', 'Mrs'),
    `Straatnaam` VARCHAR(120) NOT NULL,
    `Huisnummer` VARCHAR(6) NOT NULL,
    `Postcode` VARCHAR(6) NOT NULL,
    `Plaatsnaam` VARCHAR(120) NOT NULL,
    `Nieuwsbrief` INT(1),
    `Geboortedatum` DATE,
    `Email` VARCHAR(60) NOT NULL,
    `Wachtwoord` VARCHAR(50) NOT NULL,
    CONSTRAINT `KlantenPK`
        PRIMARY KEY (`KlantID`)
);

-- Aanmaken leveranciers tabel
CREATE TABLE `leveranciers` (
    `LeveranciersID` INT(9) NOT NULL AUTO_INCREMENT,
    `Leveranciersnaam` VARCHAR(120) NOT NULL,
    `Levertermijn` INT(9) NOT NULL,
    `Straatnaam` VARCHAR(120) NOT NULL,
    `Huisnummer` VARCHAR(6) NOT NULL,
    `Postcode` VARCHAR(6) NOT NULL,
    `Plaatsnaam` VARCHAR(120) NOT NULL,
    `Contactpersoon` VARCHAR(120) NOT NULL,
    `Telefoonnummer` INT(20) NOT NULL,
    `Email` VARCHAR (120) NOT NULL,
    CONSTRAINT `LeveranciersPK`
        PRIMARY KEY (`LeveranciersID`)
);

-- Aanmaken BTW tabel
CREATE TABLE `btw` (
    `BTWhoog` VARCHAR(20) NOT NULL,
    `BTWlaag` VARCHAR(20) NOT NULL,
    `BTWnul` VARCHAR(20) NOT NULL,
    CONSTRAINT `BTWPK`
        PRIMARY KEY (`BTWhoog`, `BTWlaag`, `BTWnul`)
);


-- Aanmaken artikel tabel
CREATE TABLE `artikelen` (
    `Artikelnaam` VARCHAR(50) NOT NULL,
    `LeveranciersID` INT(9) NOT NULL,
    `Artikelprijs` DECIMAL(10,2) NOT NULL,
    `Voorraad` INT(9) NOT NULL,
    `BTWID` VARCHAR(20) NOT NULL,
    CONSTRAINT `ArtikelenPK`
        PRIMARY KEY (`Artikelnaam`),
    CONSTRAINT `LeveranciersFK`
        FOREIGN KEY (`LeveranciersID`)
        REFERENCES `leveranciers` (`LeveranciersID`),
    CONSTRAINT `BTWFK`
        FOREIGN KEY (`BTWID`)
        REFERENCES `btw` (`BTWhoog`)

);

-- Aanmaken werknemers tabel
CREATE TABLE `werknemers` (
    `WerknemersID` INT(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Voornaam` VARCHAR(60) NOT NULL,
    `Achternaam` VARCHAR(60) NOT NULL,
    `Aanhef` ENUM('Mr', 'Mrs'),
    `Straatnaam` VARCHAR(120) NOT NULL,
    `Huisnummer` VARCHAR(6) NOT NULL,
    `Postcode` VARCHAR(6) NOT NULL,
    `Plaatsnaam` VARCHAR(120) NOT NULL,
    `Functietitel` VARCHAR(30) NOT NULL,
    `Rol` VARCHAR(50) NOT NULL,
    `Wachtwoord` VARCHAR(50) NOT NULL,
    `Geboortedatum` DATE,
    `Indienst` ENUM ('Indienst', 'Uitdienst') NOT NULL
);



-- Aanmaken bestellingen tabel
CREATE TABLE `bestellingen` (
    `OrderID` INT(9) NOT NULL AUTO_INCREMENT,
    `KlantID` INT(9) NOT NULL,
    `Datumplaatsingbestellingen` DATE NOT NULL,
    `Aantalartikelen` INT(9),
    `Totaalprijs` DECIMAL(10,2),
    `Retourgestuurd` INT(1),
    `Retourontvangen` INT(1),
    `WerknemersID` INT(9) NOT NULL,
    `Gecontroleerd` ENUM('Ja', 'Nee', 'Goed', 'Fout'),
    CONSTRAINT `BestellingenPK`
        PRIMARY KEY (`OrderID`),
    CONSTRAINT `BestellingenFK`
        FOREIGN KEY (`KlantID`)
        REFERENCES `klanten` (`KlantID`),
    CONSTRAINT `WerknemerFK`
        FOREIGN KEY (`WerknemersID`)
        REFERENCES `werknemers` (`WerknemersID`)
);




