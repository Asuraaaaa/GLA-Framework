-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.11 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for fxserver
CREATE DATABASE IF NOT EXISTS `fxserver` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fxserver`;

-- Dumping structure for table fxserver.city_doors
CREATE TABLE IF NOT EXISTS `city_doors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locked` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table fxserver.city_doors: ~0 rows (approximately)
/*!40000 ALTER TABLE `city_doors` DISABLE KEYS */;
/*!40000 ALTER TABLE `city_doors` ENABLE KEYS */;

-- Dumping structure for table fxserver.items
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fxserver.items: ~0 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table fxserver.owned_pets
CREATE TABLE IF NOT EXISTS `owned_pets` (
  `identifier` varchar(80) NOT NULL,
  `pet` varchar(80) DEFAULT NULL,
  `owner` varchar(80) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.owned_pets: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_pets` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_pets` ENABLE KEYS */;

-- Dumping structure for table fxserver.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.phone_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table fxserver.phone_numbers
CREATE TABLE IF NOT EXISTS `phone_numbers` (
  `identifier` varchar(60) NOT NULL,
  `number` varchar(60) NOT NULL,
  UNIQUE KEY `identifier` (`identifier`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.phone_numbers: ~59 rows (approximately)
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` (`identifier`, `number`) VALUES
	('steam:110000100e3cd07', '0600375366'),
	('steam:110000103b094ba', '0602282714'),
	('steam:1100001109c96d2', '0606100463'),
	('steam:110000111c7743b', '0606573486'),
	('steam:110000104de3a0c', '0606594848'),
	('steam:110000110012668', '0607934570'),
	('steam:1100001158ffdf5', '0612301635'),
	('steam:11000010bffa36e', '0614242553'),
	('steam:11000010e018799', '0615487670'),
	('steam:11000010a323e21', '0618426513'),
	('steam:1100001354dca55', '0622943115'),
	('steam:11000010ad7039e', '0625692749'),
	('steam:110000112c06662', '0625897216'),
	('steam:11000011826df11', '0627188110'),
	('steam:110000109294844', '0628424072'),
	('steam:11000010b33f427', '0628555297'),
	('steam:11000011263a69b', '0629873657'),
	('steam:1100001144dd055', '0631054687'),
	('steam:1100001037ce9e2', '0632302856'),
	('steam:110000102e35ab8', '0632644653'),
	('steam:11000010959a7b5', '0633160400'),
	('steam:11000013584b51c', '0633593750'),
	('steam:110000132a9ce2f', '0633639526'),
	('steam:11000013227d05a', '0634716796'),
	('steam:110000134e4e939', '0637210083'),
	('steam:11000010e34dbeb', '0637512207'),
	('steam:110000105d2bebf', '0637786865'),
	('steam:110000104a8a5f0', '0639355468'),
	('steam:110000106844299', '0640106201'),
	('steam:11000011b759086', '0642678833'),
	('steam:1100001047c7c29', '0644573974'),
	('steam:110000117eb9a54', '0645449829'),
	('steam:11000011ae3895e', '0647695922'),
	('steam:11000011b789ee5', '0648187255'),
	('steam:110000102bd860d', '0648657226'),
	('steam:110000134249c64', '0648937988'),
	('steam:1100001142b9e0c', '0649133300'),
	('steam:11000011739ad6a', '0650390625'),
	('steam:11000011aae6b93', '0650411987'),
	('steam:110000113123359', '0653164672'),
	('steam:110000119cb5534', '0656872558'),
	('steam:110000116648f12', '0657333374'),
	('steam:110000110fb6ede', '0660592651'),
	('steam:1100001043ef522', '0660809326'),
	('steam:110000109db64b3', '0661157226'),
	('steam:1100001055b8885', '0665759277'),
	('steam:11000010704950e', '0666098022'),
	('steam:110000107bfdab0', '0668612670'),
	('steam:11000010826e869', '0670654296'),
	('steam:1100001152f1f41', '0673394775'),
	('steam:11000010a692dc4', '0676202392'),
	('steam:110000132edebf6', '0676855468'),
	('steam:11000011ce1778f', '0681103515'),
	('steam:110000115e67f37', '0682165527'),
	('steam:110000108b027d3', '0684301757'),
	('steam:110000106743a9b', '0684362792'),
	('steam:11000010a39b5df', '0691467285'),
	('steam:1100001144d76b6', '0694396972'),
	('steam:110000134df5e1e', '0695202636');
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;

-- Dumping structure for table fxserver.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `number` varchar(10) NOT NULL,
  `display` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.phone_users_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table fxserver.police_arrests
CREATE TABLE IF NOT EXISTS `police_arrests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(80) DEFAULT NULL,
  `officer_identifier` varchar(80) DEFAULT NULL,
  `officer_name` varchar(80) DEFAULT NULL,
  `offender_identifier` varchar(80) DEFAULT NULL,
  `offender_name` varchar(80) DEFAULT NULL,
  `sentenceORfine` varchar(60) DEFAULT NULL,
  `sentence` int(11) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `charges` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.police_arrests: ~0 rows (approximately)
/*!40000 ALTER TABLE `police_arrests` DISABLE KEYS */;
/*!40000 ALTER TABLE `police_arrests` ENABLE KEYS */;

-- Dumping structure for table fxserver.police_violations
CREATE TABLE IF NOT EXISTS `police_violations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(80) DEFAULT NULL,
  `officer_identifier` varchar(80) DEFAULT NULL,
  `officer_name` varchar(80) DEFAULT NULL,
  `offender_identifier` varchar(80) DEFAULT NULL,
  `offender_name` varchar(80) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL,
  `violations` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table fxserver.police_violations: ~2 rows (approximately)
/*!40000 ALTER TABLE `police_violations` DISABLE KEYS */;
INSERT INTO `police_violations` (`id`, `timestamp`, `officer_identifier`, `officer_name`, `offender_identifier`, `offender_name`, `fine`, `violations`) VALUES
	(1, '1520707869', 'steam:11000011aae6b93', 'Ocifer lit', '', 'po', 0, '250'),
	(2, '1520708676', 'steam:11000011aae6b93', 'Serenity', '', 'John Po', 0, '250');
/*!40000 ALTER TABLE `police_violations` ENABLE KEYS */;

-- Dumping structure for table fxserver.police_warrants
CREATE TABLE IF NOT EXISTS `police_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(80) DEFAULT NULL,
  `officer_name` varchar(60) DEFAULT NULL,
  `offender_name` varchar(60) DEFAULT NULL,
  `location` varchar(80) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.police_warrants: ~0 rows (approximately)
/*!40000 ALTER TABLE `police_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `police_warrants` ENABLE KEYS */;

-- Dumping structure for table fxserver.user_appartement
CREATE TABLE IF NOT EXISTS `user_appartement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `dirtymoney` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table fxserver.user_appartement: 0 rows
/*!40000 ALTER TABLE `user_appartement` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_appartement` ENABLE KEYS */;

-- Dumping structure for table fxserver.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fxserver.user_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table fxserver.vehicle_inventory
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `plate` varchar(50) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fxserver.vehicle_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
