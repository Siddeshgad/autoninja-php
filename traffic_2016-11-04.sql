# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: traffic
# Generation Time: 2016-11-04 15:32:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table lane
# ------------------------------------------------------------

DROP TABLE IF EXISTS `lane`;

CREATE TABLE `lane` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `signal_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `signal_lane_idx_idx` (`signal_id`),
  CONSTRAINT `signal_lane_idx` FOREIGN KEY (`signal_id`) REFERENCES `signal` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `lane` WRITE;
/*!40000 ALTER TABLE `lane` DISABLE KEYS */;

INSERT INTO `lane` (`id`, `signal_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,NULL,NULL,NULL),
	(2,1,NULL,NULL,NULL),
	(3,1,NULL,NULL,NULL),
	(4,1,NULL,NULL,NULL),
	(5,2,NULL,NULL,NULL),
	(6,2,NULL,NULL,NULL),
	(7,2,NULL,NULL,NULL),
	(8,2,NULL,NULL,NULL),
	(9,3,NULL,NULL,NULL),
	(10,3,NULL,NULL,NULL),
	(11,3,NULL,NULL,NULL),
	(12,3,NULL,NULL,NULL),
	(13,4,NULL,NULL,NULL),
	(14,4,NULL,NULL,NULL),
	(15,4,NULL,NULL,NULL),
	(16,4,NULL,NULL,NULL);

/*!40000 ALTER TABLE `lane` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table signal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `signal`;

CREATE TABLE `signal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `signal` WRITE;
/*!40000 ALTER TABLE `signal` DISABLE KEYS */;

INSERT INTO `signal` (`id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,NULL,NULL,NULL),
	(2,NULL,NULL,NULL),
	(3,NULL,NULL,NULL),
	(4,NULL,NULL,NULL);

/*!40000 ALTER TABLE `signal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table switches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `switches`;

CREATE TABLE `switches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_lane_id` int(11) DEFAULT NULL,
  `to_lane_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_idx_idx` (`vehicle_id`),
  KEY `lane_idx_idx` (`from_lane_id`),
  KEY `to_lane_idx_idx` (`to_lane_id`),
  CONSTRAINT `to_lane_idx` FOREIGN KEY (`to_lane_id`) REFERENCES `lane` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `from_lane_idx` FOREIGN KEY (`from_lane_id`) REFERENCES `lane` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `vehicle_idx` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `switches` WRITE;
/*!40000 ALTER TABLE `switches` DISABLE KEYS */;

INSERT INTO `switches` (`id`, `from_lane_id`, `to_lane_id`, `vehicle_id`, `speed`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,1,2,1,30,'2016-11-03 09:37:56','2016-11-03 09:37:56',NULL),
	(2,7,8,3,25,'2016-11-03 19:37:56','2016-11-03 19:37:56',NULL),
	(3,11,12,2,30,'2016-11-04 19:37:56','2016-11-04 19:37:56',NULL),
	(4,5,6,4,20,'2016-11-03 19:37:56','2016-11-03 19:37:56',NULL),
	(5,7,8,4,35,'2016-11-03 19:37:56','2016-11-03 19:37:56',NULL),
	(6,6,7,1,28,'2016-11-03 09:43:56','2016-11-03 09:43:56',NULL),
	(7,7,6,1,32,'2016-11-03 19:37:56','2016-11-03 19:37:56',NULL),
	(8,2,1,1,26,'2016-11-03 19:47:56','2016-11-03 19:47:56',NULL);

/*!40000 ALTER TABLE `switches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehicle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(20) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_no_idx` (`reg_no`),
  KEY `vehicle_type_idx_idx` (`vehicle_type_id`),
  CONSTRAINT `vehicle_type_idx` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;

INSERT INTO `vehicle` (`id`, `reg_no`, `vehicle_type_id`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'KA03JE9870',1,NULL,NULL,NULL),
	(2,'GA05BC1456',1,NULL,NULL,NULL),
	(3,'KA51HQ403',2,NULL,NULL,NULL),
	(4,'KA51AD8866',2,NULL,NULL,NULL);

/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vehicle_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle_type`;

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wheels` int(11) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;

INSERT INTO `vehicle_type` (`id`, `wheels`, `model`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,2,'bike',NULL,NULL,NULL),
	(2,3,'auto',NULL,NULL,NULL);

/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
