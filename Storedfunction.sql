-- Trigger bij het toevoegen van een werknemer dat voornaam en achternaam 
-- in hoofdletters worden opgeslagen
CREATE TRIGGER capital_firstname
BEFORE INSERT ON werknemers
FOR EACH ROW
SET NEW.Voornaam = UPPER(NEW.Voornaam);

CREATE TRIGGER capital_latsname
BEFORE INSERT ON werknemers
FOR EACH ROW
SET NEW.Achternaam = UPPER(NEW.Achternaam);


-- View voor zien bestellingen afgelopen maand
CREATE VIEW bestellingenvorigemaand AS
SELECT
	`OrderID`,
    `KlantID`,
    `Datumplaatsingbestellingen`
FROM
	`bestellingen`
WHERE month(`Datumplaatsingbestellingen`)=month(NOW())-1;

-- View voor zien bestellingen vorige jaar
CREATE VIEW bestellingenvorigjaar AS
SELECT
	`OrderID`,
    `KlantID`,
    `Datumplaatsingbestellingen`
FROM
	`bestellingen`
WHERE year(`Datumplaatsingbestellingen`)=year(NOW())-1;

-- View of klant ingeschreven staat voor de nieuwsbrief
Create VIEW nieuwsbrief AS
Select
    `KlantID`,
    `Voornaam`,
    `Achternaam`,
    `Aanhef`
FROM 
    `klanten`
WHERE `Nieuwsbrief` = 2;

-- View voor 
CREATE VIEW totaalbedragperklant AS
SELECT
    `KlantID`,
    `OrderID`,
    `Totaalprijs` 
FROM
    `bestellingen`
INNER JOIN `klanten` USING (`KlantID`)
GROUP BY KlantID;

-- Function btwhoog

DELIMITER $$
CREATE FUNCTION berekenbtwh (
    amount INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE btw INT(10);
    SET btw = totaalbedrag/100*21;
	RETURN (btw);
END$$

DELIMITER ;

-- Function btwlaag
DELIMITER $$
CREATE FUNCTION berekenbtwl (
    amount INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE btw INT(10);
    SET btw = totaalbedrag/100*9;
	RETURN (btw);
END$$

DELIMITER ;

-- Stored prodecedure

DROP PROCEDURE IF EXISTS waterbuddy2.addwerknemers

DELIMITER $$

CREATE PROCEDURE waterbuddy2.addwerknemers (IN Voornaam VARCHAR(60), IN Achternaam VARCHAR(60), 
IN Aanhef ENUM('Mr', 'Mrs'), IN Straatnaam VARCHAR(120), IN Huisnummer VARCHAR(6), IN Postcode VARCHAR(6), 
IN Plaatsnaam VARCHAR(120), IN Functietitel VARCHAR(30), IN Rol VARCHAR(50), IN Wachtwoord VARCHAR(50), 
IN Geboortedatum DATE, IN Indienst ENUM('Indienst', 'Uitdienst'))

BEGIN

	INSERT INTO werknemers (Voornaam, Achternaam, Aanhef, Straatnaam, Huisnummer, Postcode, Plaatsnaam, 
    Functietitel, Rol, Wachtwoord, Geboortedatum, Indienst)
    VALUE (Voornaam, Achternaam, Aanhef, Straatnaam, Huisnummer, Postcode, Plaatsnaam, 
    Functietitel, Rol, Wachtwoord, Geboortedatum, Indienst);
    
    SELECT
    		WerknemersID,
    		Voornaam,
            Achternaam
    FROM
    		werknemers;
                                       
END $$                                        
DELIMITER ;

CALL addwerknemers ('Kees', 'Nieuwehuize', 'Mr', 'Vrijheidslaan', '31', '4243TR', 'Goes', 'Inpakker', 
'INP', 'TESTINP', '1973-07-15', 'Uitdienst')


-- UPDATE Klanten SET Geboortedatum = '1995-06-13' WHERE KlantID = 1;

-- VALUES (1995-06-13)


-- UPDATE `leveranciers` SET `Telefoonnummer` = '+3145471247' WHERE `leveranciers`.`LeveranciersID` = 2;
