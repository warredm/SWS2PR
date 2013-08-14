SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `struttura` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `struttura` ;

-- -----------------------------------------------------
-- Table `struttura`.`brokers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `struttura`.`brokers` ;

CREATE  TABLE IF NOT EXISTS `struttura`.`brokers` (
  `brokers_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(100) NOT NULL ,
  `location` VARCHAR(100) NOT NULL ,
  `tel` VARCHAR(100) NOT NULL ,
  `mail` VARCHAR(100) NOT NULL ,
  `password` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`brokers_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `struttura`.`properties`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `struttura`.`properties` ;

CREATE  TABLE IF NOT EXISTS `struttura`.`properties` (
  `properties_id` INT NOT NULL AUTO_INCREMENT ,
  `KI` INT NULL ,
  `price` INT NOT NULL ,
  `buyRent` VARCHAR(4) NOT NULL ,
  `date` DATETIME NOT NULL ,
  `soldRented` VARCHAR(6) NULL ,
  `acreage` DOUBLE NOT NULL ,
  `street` VARCHAR(100) NOT NULL ,
  `number` INT NULL ,
  `zip_code` INT NOT NULL ,
  `city` VARCHAR(100) NOT NULL ,
  `province` VARCHAR(100) NOT NULL ,
  `bedrooms` INT NULL ,
  `type` VARCHAR(100) NOT NULL ,
  `bouwjaar` INT NULL ,
  `restrooms` INT NULL ,
  `brokers_id` INT NOT NULL ,
  `pictures` VARCHAR(45) NOT NULL ,
  `omschrijving` VARCHAR(3000) NULL ,
  PRIMARY KEY (`properties_id`, `brokers_id`) ,
  INDEX `fk_properties_brokers` (`brokers_id` ASC) ,
  CONSTRAINT `fk_properties_brokers`
    FOREIGN KEY (`brokers_id` )
    REFERENCES `struttura`.`brokers` (`brokers_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `struttura`.`brokers`
-- -----------------------------------------------------
START TRANSACTION;
USE `struttura`;
INSERT INTO `struttura`.`brokers` (`brokers_id`, `name`, `location`, `tel`, `mail`, `password`) VALUES (1, 'Warre De Mey', 'Damme', '0470856602', 'warredm@hotmail.com', 'Azerty123');
INSERT INTO `struttura`.`brokers` (`brokers_id`, `name`, `location`, `tel`, `mail`, `password`) VALUES (2, 'root', 'Gent', '0495138541', 'warre.demey@kahosl.be', 'Azerty123');

COMMIT;

-- -----------------------------------------------------
-- Data for table `struttura`.`properties`
-- -----------------------------------------------------
START TRANSACTION;
USE `struttura`;
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (1, 994, 250000, 'buy', '2013-05-19 16:41:06', NULL, 100, 'bevrijdingslaan', 10, 8000, 'brugge', 'west-vlaanderen', 2, 'appartement', 1980, 1, 1, '1', 'Zonnig appartement op de 4de verdieping met prachtig zicht, 2 slaapkamers en garage. Het appartement is gelegen op wandelafstand van het centrum van Brugge en is vlot te bereiken. INDELING: Inkomhal met apart toilet - berging (3m²) met aansluiting voor wasmachine - ruime woonkamer (39m²) met veel lichtinval en toegang naar balkon - keuken (9m²) met frigo, vaatwasmachine, elektrische kookplaat, dampkap, oven, dubbele spoelbak en kasten - badkamer (9m²) met dubbele lavabo, toilet en ligbad - 2 ruime slaapkamers in laminaat (14,5m² - 12m²) waarvan één kamer met balkon - inclusief ruime individuele kelder (nr 15) en ondergrondse garagebox (nr 18) Algemeen: - ruim appartement - prachtig zicht - momenteel verhuurd - sted. inl. in aanvraag');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (2, 1199, 499000, 'buy', '2012-04-01 11:31:22', NULL, 2701, 'fortbekeweg', 1, 8000, 'brugge', 'west-vlaanderen', 4, 'woning', 1986, 2, 1, '2', 'Deze goed onderhouden villa met 4 slaapkamers ligt in een groene en rustige omgeving op een steenworp van de Damse Vaart en het centrum van Brugge. Ontspannen kunt u in de tuin van 2.701m². Gelijkvloers (115m²): inkom met trap naar eerste verdieping (19m²) - leefruimte met zit- en eetplaats (35m²) afgewerkt met balken-plafond en keramische vloer - ingerichte keuken (12m²) voorzien van gasfornuis, dampkap, oven en dubbele spoelbak - badkamer (5m²) met lavabo en ligbad - toilet - slaapkamer (12m²) met lavabo - garage (31m²) met aansluiting wasmachine - aparte bergruimte. 1ste verdieping: nachthal (24m²) - 3 ruime slaapkamers (19 m² - 12m² - 20m²). Algemeen: - goed onderhouden woning - ruim perceel: 2.701m² - prachtige ligging');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (3, NULL, 530, 'rent', '2012-12-14 09:20:31', 'sold', 136, 'boomgaardstraat', 13, 8900, 'ieper', 'west-vlaanderen', 3, 'appartement', 2008, 2, 2, '3', 'Stadswoning in centrum Ieper met 3 slaapkamers, groot terras en garage! Indeling: GELIJKVLOERS: inkomhal met apart toilet - living (14,5 m²) - keuken (9 m²) met kookplaat, dampkap, spoelbak en opbergkasten - berging - kelder - groot terras (30 m²) en opbergruimtes - garage (L: 4,7 m x B: 4,2 m) met automatische poort! VERDIEP +1: nachthal met 2 slaapkamers (20 + 15 m²) - badkamer (8,5 m²) met ligbad/douche, toilet en lavabo. VERDIEP +2: geïsoleerde zolder met zolderkamer (19 m²). => geen huisdieren! => onmiddellijk vrij => EPC 383 kWh/m² - UC 178137 (voor isolatie dak!)');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (4, NULL, 4400, 'rent', '2013-03-15 18:02:14', NULL, 1270, 'dijkstraat', 15, 9160, 'lokeren', 'oost-vlaanderen', NULL, 'bedrijfsvastgoed', 2005, NULL, 1, '4', '1150m² magazijn met 120m² kantoren en 10 parkeerplaatsen, vlakbij oprit E17Beschikbaar: onmiddellijk');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (5, NULL, 168750, 'buy', '2013-06-15 12:30:10', NULL, 675, 'afsneestraat', 12, 9000, 'gent', 'oost-vlaanderen', NULL, 'grond', NULL, NULL, 2, '5', 'Bouwgrond nabijheid centrum Afsnee en Sint-Denijs-Westrem. (ts. Afsnee en Sint-Martens-Latem)Maakt deel uit van 3 loten die naast elkaar liggen.Dit LOT 1 is links als men vanop straat ervoor staat.Het gaat hier om een half-open bebouwing.Oppervlakte : 675 m².Straatbreedte ongeveer 14 m, op 48 m diep.Adres: Afsneestraat.Alle nutsleidingen aanwezig in de straat (water, gas, electriciteit, distributie, telefoon,...)Openbaar vervoer en vlotte bereikbaarheid naar centrum en oprit E40');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (6, NULL, 25000, 'buy', '2012-07-28 15:03:55', NULL, 30, 'haantjeslei', NULL, 2000, 'antwerpen', 'antwerpen', NULL, 'garage', NULL, NULL, 2, '6', '2 staanplaatsen te koop, €25 000 per staanplaatsen');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (7, 1061, 249000, 'buy', '2013-01-25 13:04:44', NULL, 400, 'jan van helmontlaan', 44, 3500, 'hasselt', 'limburg', 8, 'woning', 1967, 2, 2, '7', 'Deze te renoveren woning te midden van de gezellige en populaire wijk Sint-Katharina bulkt als het ware van de mogelijkheden. Met maar liefst acht slaapkamers , twee badkamers en een charmante tuin ter beschikking kunnen we hier ongetwijfeld spreken van een heuse opportuniteit. Indien u op zoek bent naar een ruime woning waar u nog écht uw stempel op kan drukken, dan bent u hier aan het juiste adres. Potentieel en ruimte zijn twee kernwoorden die de rode draad vormen doorheen het hele huis. Dit geldt dus ook voor de voor –en zijtuin die momenteel nog aangelegd zijn, maar eventueel omgevormd kunnen worden tot een oprit met bijbehorende extra parkeerplaats. Binnenkomen doen we in de imposante inkomhal waar de arduinen trap alle aandacht naar zich toe trekt. Aan de rechterzijde komen we terecht in de leefruimte waar je dankzij het grote raam aan de voorzijde kan genieten van een overvloed aan natuurlijk daglicht. De keuken, living en eetkamer vormen hier één geheel en vloeien over in elkaar. Op het gelijkvloers vinden we bovendien nog een extra kamer terug die aan de leefruimte grenst en uitkijkt op de tuin. Dit is een polyvalente ruimte die onder meer kan dienen als bureau of speelkamer. Hiernaast hebben we op dit niveau ook nog een apart toilet, badkamer nummer één en de eerste slaapkamer. Deze laatste kan tevens ingevuld worden naargelang de persoonlijke noden. Wanneer we de trappen naar boven nemen komen we terecht op +1 waar de nachthal toegang biedt tot drie slaapkamers en badkamer nummer 2. Moest dit alles nog niet voldoen qua ruimte is er nog altijd de zolder die men indeelde in vier slaapkamers. Deze kan ook teruggebracht worden naar zijn oorspronkelijk staat zodat u kan genieten van een grote zolder . Een andere optie is de transformatie naar een Master Bedroom met alles erop en eraan of… etc. Dit benadrukt wederom dat we hier met een woning zitten waar u werkelijk alle kanten mee uit kan.');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (8, 1834, 585000, 'buy', '2013-02-11 11:11:25', NULL, 753, 'hefveldstraat', 107, 3500, 'hasselt', 'limburg', 4, 'woning', 1995, 3, 2, '8', 'Hoogwaardig afgewerkte en instapklare villa, residentieel en rustig gelegen op wandelafstand van het centrum van Hasselt tussen de grote en kleine ring, op een perceel van 7a53. Op het gelijkvloers bevinden zich een ruime inkomhal met apart toilet en vide, een aparte bureelruimtie die ook gebruikt kan worden als vierde slaapkamer, gezellige leefruimte met open haard en dubbele deur naar een eetplaats met zicht op de tuin. De volledig ingerichte en zeer praktische keuken is voorzien van alle toestellen, wasruimte met inbouwkasten, inpandige garage voor 2 wagens en toegang naar een zolder met CV-ruimte. Mogelijkheid om de garage met zolder in te richten als kantoor/praktijkruimte. Op verdieping is er een mooie nachthal met een apart toilet, 3 slaapkamers waarvan 1 met dressing en 1 met bijhorende badkamer, verder nog een 2e ruime badkamer met dubbele lavabo, ligbad, aparte douche en inbouwkasten en een aparte bergruimte met toegang naar de zolder. De zolderverdieping kan verder afgewerkt worden tot extra kamers. Mooie aangelegde en zuidwestelijk geörienteerde tuin met terras en tuinberging. Rolluiken aanwezig, veiligheidssloten en alarm, vloeren in natuursteen en parket, buitengevels recent geverfd,...kortom deze villa is zeer verzorgd en perfect in orde!');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (9, NULL, 2500, 'rent', '2012-05-30 14:56:30', NULL, 1700, 'wiekstraat', 33, 3600, 'genk', 'limburg', 5, 'woning', 2013, 2, 1, '9', 'Deze moderne villa, die op dit ogenblik wordt afgewerkt, beschikt over 5 ruime slaapkamers waarvan 2 met sanitair, epoxyvloeren, een volledig geïnstalleerde eilandkeuken, carport, zwemvijver, 2 badkamers, vloerverwarming, centraal stofzuigersysteem, overdekt terras, warmtepomp, zonnescreens, inbouwkasten, domotica, alarm, volledige kelder. De tuin is zuid georiënteerd, de villa biedt een zee aan licht en het meest moderne comfort. EPC -EPB 54 kW/h');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (10, NULL, 1100, 'rent', '2013-06-24 12:06:06', 'rented', 132, 'europalaan', 69, 3600, 'genk', 'limburg', NULL, 'bedrijfsvastgoed', 1989, NULL, 1, '10', 'Kantoorruimte (+/- 132 m²) opgedeeld in 3 burelen en voorzien van kitchenette, gelegen in het centrum van Genk.');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (11, NULL, 290000, 'buy', '2013-06-25 12:34:56', NULL, 1288, 'oude baan', 80, 2800, 'mechelen', 'antwerpen', NULL, 'grond', NULL, NULL, 2, '11', 'Prachtige bouwgrond aan de Oude Baan te Walem (deelgemeente van Mechelen) waarop gestart kan worden met de bouw van een woning (open bebouwing). Kadastrale sectie: 12037B0067/00A000. Bebouwing: gevelbreedte max. 24,8m en diepte 17m. Geen bouwverplichting! De bouwgrond ligt op een rustige locatie, in een verkeersluwe straat en een groene omgeving. Daarnaast is deze ideaal gelegen tussen Antwerpen, Brussel en Mechelen. Goede verbinding via de E19. Contact rechtstreeks met de eigenaars via 0497/506.505. ');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (12, 704, 135000, 'buy', '2013-07-17 16:30:01', NULL, 140, 'burgemeester nolfstraat', 9, 8500, 'kortrijk', 'west-vlaanderen', 1, 'appartement', 1994, 1, 1, '12', 'Gezellig instapklaar appartement met 1 slaapkamer en privatieve parking in residentie Lombardië, gelegen aan het oude gerechtsgebouw. De locatie is hartje Kortrijk: vlakbij grote markt, station en de belangrijkste invalswegen. Indeling van het appartement : Living bestaande uit zit- en eethoek met volledig geïnstalleerde open keuken - slaapkamer in laminaatvloer - badkamer met wastafel, douche en aansluitingen voor wasmachine - inkomhal met wc. Pre-sale 24/8 tss 13h30-15h30 EPC 105 kWh/m² UC 97827');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (13, 1782, 875000, 'buy', '2013-07-05 09:12:48', NULL, 351, 'koning leopold 1-straat', 30, 3000, 'leuven', 'vlaams-brabant', 8, 'woning', 2013, 3, 2, '13', 'In het stadscentrum gelegen herenhuis met mooie zuid gerichte tuin. De woning omvat o.a. 8 slaapkamers, nieuwe douchekamer, 2 keukens (waarvan 1 nieuwe), living met eetkamer, kelder.... Gerenoveerd in 2012 -2013 : keuken (Dovy), badkamer (Dovy), verwarming, elektriciteit en ramen (Belisol). Momenteel is het gelijkvloers verhuurd als dokterspraktijk. Het perceel geeft ook aan uit op de Willemsstraat zodat er een mogelijkheid is tot het bijbouwen van garages met een woongedeelte. Opdeling van de woning in meerdere woongelegenheden mogelijk !');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (14, NULL, 1250, 'rent', '2013-07-01 08:45:06', NULL, 201, 'linthout', 11, 9300, 'aalst', 'oost-vlaanderen', 2, 'woning', 1997, 2, 1, '14', 'Unieke open bebouwing te huur te Aalst. Deze woning is residentieel gelegen in de directe omgeving van mange, tennispleinen, golfterreinen, speelplein en jeugdplein (voetbal) Eendracht Aalst. De woning omvat een mooie inkomhal met vestiaire en toilet, ruime living en volledig ingerichte keuken die uitgeven op een prachtig aangelegde tuin (volledig zuidgericht). Aan de keuken grenzend is er een berging met alle nutsvoorzieningen evenals een praktische koele berging. Aan de voorkant van de woning bevindt zich een garage voor 2 wagens. Op de 1ste verdieping zijn er 2 slaapkamers waarvan 1 met dressing, bureel (ook te gebruiken als slaapkamer) en een badkamer (met douche, bad en dubbele wastafel). Prachtige woning, rustig gelegen, uniek design en zeer energiezuinig.');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (15, 577, 670000, 'buy', '2013-06-04 10:35:01', NULL, 110, 'kerkstraat', 25, 8340, 'damme', 'west-vlaanderen', 3, 'woning', 1986, 2, 2, '15', 'Deze hoekwoning is gelegen op unieke historisch en commerciële ligging, op de Markt van Damme tegenover het Dams stadhuis. In dit polyvalent gebouw kunt u zoals een zaak uitbaten alsook wonen. De woning biedt u oa. een ruime leefruimte, 3 slaapkamers, een grote historische kelder, garage, ingerichte keuken en badkamer, zolder. Indeling: Gelijkvloers: Inkom - ruime woonkamer met aansluitend de volledig geïnstalleerde keuken - bergplaats - apart toilet - ruime garage - grote kelder, de woning is volledig onderkelderd (toegang vanop straat) 1e verdieping: 3 ruime slaapkamers - een badkamer met ligbad, douche, toilet en lavabo - ruime zolder, mogelijkheid tot inrichten tot een 4e slaapkamer. Algemeen: - Unieke ligging in op de Markt van Damme! - Dubbel glas - CV op aardgas - renovatiejaar: eind jaren \'80 EPC: 490 kWh/m²');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (16, 361, 229000, 'buy', '2013-07-06 13:12:11', NULL, 340, 'beneluxstraat', 9, 9100, 'sint-niklaas', 'oost-vlaanderen', 4, 'woning', 1938, 2, 1, '16', 'Deze centraal gelegen woning heeft een lichte woonkamer met aansluitend een moderne open keuken en praktische berging. Ideaal voor een warme thuis!');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (17, NULL, 450, 'rent', '2012-12-15 11:33:33', NULL, 40, 'zeedijk', 94, 8400, 'oostende', 'west-vlaanderen', 1, 'appartement', 2004, 1, 2, '17', 'Aangename gezellige en gemeubelde studio met fenomenaal zeezicht gelegen op de zeedijk van Mariakerke. De studio is opgedeeld als volgt: inkomhall, toilet, badkamer met ligbad, ruime living met open zicht op zee en terras over de volledige gevelbreedte, ingerichte keuken. Pluspunten: - ligging op de zeedijk - mooi zicht vanuit de studio - volwaardige terras - mooi en klassevol gemeubeld - verzorgde studio');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (18, NULL, 1800, 'rent', '2012-11-03 15:51:21', NULL, 92, 'damse vaart-zuid', 14, 8340, 'damme', 'west-vlaanderen', NULL, 'bedrijfsvastgoed', 1984, NULL, 1, '18', 'Prachtig, uniek gelegen handelspand met woonst in Damme, uitstekend geschikt voor bakkerij of frituur. Volledig gerenoveerd gebouw met een handelsruimte ( indien gewenst kan ook appartement bijgehuurd worden).. nHet terras kan plaats bieden aan 12 personen en binnen is het aangenaam vertoeven voor 18 klanten.');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (19, 1533, 307460, 'buy', '2013-04-05 11:02:15', NULL, 481, 'groenstraat', 22, 1740, 'ternat', 'vlaams-brabant', 3, 'woning', 2012, 2, 1, '19', 'Nieuwbouwproject voor een half open bebouwing met het model CLUB 3 kamers, badkamer, driedubbel beglazing, zonnepanelen, 14cm isolatie in de muren, dubbel-flow ventilatie,â Met meerdere mogelijkheden tot het personaliseren van de woning.');
INSERT INTO `struttura`.`properties` (`properties_id`, `KI`, `price`, `buyRent`, `date`, `soldRented`, `acreage`, `street`, `number`, `zip_code`, `city`, `province`, `bedrooms`, `type`, `bouwjaar`, `restrooms`, `brokers_id`, `pictures`, `omschrijving`) VALUES (20, 6768, 1995000, 'buy', '2013-02-28 14:25:16', NULL, 1250, 'hortensialaan', 70, 8300, 'knokke', 'west-vlaanderen', 5, 'woning', 1998, 3, 2, '20', 'Privaat gelegen moderne villa met ZUID-tuin, verwarmd zwembad en overdekt zonneterras. Deze villa is gelegen op één van de beste percelen van de zeer residentiële verkaveling \"de Eglantier\" aan de Kalfstraat in Knokke');

COMMIT;
