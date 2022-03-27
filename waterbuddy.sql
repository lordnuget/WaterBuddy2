-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 24 mrt 2022 om 16:19
-- Serverversie: 10.4.22-MariaDB
-- PHP-versie: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waterbuddy`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikelen`
--

CREATE TABLE `artikelen` (
  `Artikelnaam` varchar(50) NOT NULL,
  `Artikelprijs` decimal(10,2) NOT NULL,
  `Voorraad` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingdetails`
--

CREATE TABLE `bestellingdetails` (
  `OrderID` int(9) NOT NULL,
  `KlantID` int(9) NOT NULL,
  `Artikelnaam` varchar(50) NOT NULL,
  `Aantalartikelen` int(9) NOT NULL,
  `Artikelprijs` decimal(10,2) NOT NULL,
  `Artikelbtw` decimal(10,2) NOT NULL,
  `Prijstotaal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `OrderID` int(9) NOT NULL,
  `Datumplaatsingbestellingen` date NOT NULL,
  `Retourgestuurd` int(1) DEFAULT NULL,
  `Retourontvangen` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `KlantID` int(9) NOT NULL,
  `Voornaam` varchar(60) NOT NULL,
  `Achternaam` varchar(60) NOT NULL,
  `Aanhef` enum('Mr','Mrs') DEFAULT NULL,
  `Straatnaam` varchar(120) NOT NULL,
  `Huisnummer` varchar(6) NOT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Plaatsnaam` varchar(120) NOT NULL,
  `Nieuwsbrief` int(1) DEFAULT NULL,
  `Geboortedatum` date DEFAULT NULL,
  `Email` varchar(60) NOT NULL,
  `Wachtwoord` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werknemers`
--

CREATE TABLE `werknemers` (
  `WerknemersID` int(9) NOT NULL,
  `Voornaam` varchar(60) NOT NULL,
  `Achternaam` varchar(60) NOT NULL,
  `Aanhef` enum('Mr','Mrs') DEFAULT NULL,
  `Straatnaam` varchar(120) NOT NULL,
  `Huisnummer` varchar(6) NOT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Plaatsnaam` varchar(120) NOT NULL,
  `Functietitel` varchar(30) NOT NULL,
  `Rol` varchar(50) NOT NULL,
  `Wachtwoord` varchar(50) NOT NULL,
  `Geboortedatum` date DEFAULT NULL,
  `Indienst` enum('Indienst','Uitdienst') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`Artikelnaam`);

--
-- Indexen voor tabel `bestellingdetails`
--
ALTER TABLE `bestellingdetails`
  ADD KEY `ArtikelenFK` (`Artikelnaam`),
  ADD KEY `KlantenFK` (`KlantID`),
  ADD KEY `BestellingenFK` (`OrderID`);

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`KlantID`);

--
-- Indexen voor tabel `werknemers`
--
ALTER TABLE `werknemers`
  ADD PRIMARY KEY (`WerknemersID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `OrderID` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `klanten`
--
ALTER TABLE `klanten`
  MODIFY `KlantID` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `werknemers`
--
ALTER TABLE `werknemers`
  MODIFY `WerknemersID` int(9) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestellingdetails`
--
ALTER TABLE `bestellingdetails`
  ADD CONSTRAINT `ArtikelenFK` FOREIGN KEY (`Artikelnaam`) REFERENCES `artikelen` (`Artikelnaam`),
  ADD CONSTRAINT `BestellingenFK` FOREIGN KEY (`OrderID`) REFERENCES `bestellingen` (`OrderID`),
  ADD CONSTRAINT `KlantenFK` FOREIGN KEY (`KlantID`) REFERENCES `klanten` (`KlantID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
