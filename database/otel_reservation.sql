-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 28 Ara 2020, 07:26:02
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `otel_reservation`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `address` text,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(17) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `google_plus` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `mission` longtext,
  `vision` longtext,
  `about_us` longtext,
  `logo` varchar(255) DEFAULT NULL,
  `bank_account` text,
  `tax_id` varchar(255) DEFAULT NULL,
  `mersis_id` varchar(255) DEFAULT NULL,
  `google_analytics` varchar(255) DEFAULT NULL,
  `map_att` varchar(255) DEFAULT NULL,
  `map_lat` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `detail` text,
  `size` varchar(255) DEFAULT NULL,
  `room_code` varchar(255) DEFAULT NULL,
  `default_price` float DEFAULT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `bed_type` varchar(255) DEFAULT NULL,
  `bed_count` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `room_properties` varchar(500) DEFAULT NULL,
  `room_extra_services` varchar(500) DEFAULT NULL,
  `room_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room`
--

INSERT INTO `room` (`id`, `title`, `detail`, `size`, `room_code`, `default_price`, `room_type_id`, `bed_type`, `bed_count`, `isActive`, `rank`, `room_properties`, `room_extra_services`, `room_capacity`) VALUES
(1, 'dwewe', 'dfgdf', '2', '58', 7.4, 9, 'normal', NULL, 1, 5, '5', '2', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_category`
--

DROP TABLE IF EXISTS `room_category`;
CREATE TABLE IF NOT EXISTS `room_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rank` int(11) DEFAULT '0',
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `room_category`
--

INSERT INTO `room_category` (`id`, `title`, `rank`, `isActive`) VALUES
(8, 'dwesdfdfd', 0, 1),
(10, 'wr433', 0, 1),
(11, '7965rytvhg', 0, 1),
(12, 'ıtyjhbkj', 0, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_extra_services`
--

DROP TABLE IF EXISTS `room_extra_services`;
CREATE TABLE IF NOT EXISTS `room_extra_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_image`
--

DROP TABLE IF EXISTS `room_image`;
CREATE TABLE IF NOT EXISTS `room_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` varchar(255) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `isActive` tinyint(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_properties`
--

DROP TABLE IF EXISTS `room_properties`;
CREATE TABLE IF NOT EXISTS `room_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_properties`
--

INSERT INTO `room_properties` (`id`, `title`, `icon`, `rank`, `isActive`) VALUES
(12, 'dwew65y65e', NULL, NULL, 1),
(8, 'erte', NULL, NULL, 1),
(13, 'ere', NULL, NULL, 1),
(11, 'wr433', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_type`
--

DROP TABLE IF EXISTS `room_type`;
CREATE TABLE IF NOT EXISTS `room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_type`
--

INSERT INTO `room_type` (`id`, `title`, `rank`, `isActive`) VALUES
(15, 'suit', 15, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
