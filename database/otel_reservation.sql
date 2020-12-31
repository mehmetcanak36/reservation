-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 31 Ara 2020, 13:33:23
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `contact`
--

INSERT INTO `contact` (`id`, `title`, `address`, `phone`, `fax`, `email`, `web`, `facebook`, `twitter`, `google_plus`, `instagram`, `youtube`, `linkedin`, `mission`, `vision`, `about_us`, `logo`, `bank_account`, `tax_id`, `mersis_id`, `google_analytics`, `map_att`, `map_lat`, `meta_keyword`, `meta_description`, `isActive`) VALUES
(1, 'oda', 'adasdas', 'asdffs', 'sdfsdf', 'sdfsdf', 'fsdfssd', 'fsfsdf', 'fsfsd', 'fsdfs', 'sdfsdf', 'fsdfsd', 'sfsdfsdfsdf', 'sfdfsdfsdfsd', 'fsdfsfsfsfsd', 'sdfsdfsdfsd', 'sdfsdfsd', 'sgdfhfh', 'fgh', 'hfghd', 'fghrt', 'fujty', 'rsyhrtf', 'fguret', 'rhtjhnur', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room`
--

INSERT INTO `room` (`id`, `title`, `detail`, `size`, `room_code`, `default_price`, `room_type_id`, `bed_type`, `bed_count`, `isActive`, `rank`, `room_properties`, `room_extra_services`, `room_capacity`) VALUES
(8, 'oda2', '<p><em>Otel</em>&nbsp;Hotel&nbsp;<em>Second Home</em>. Hotel&nbsp;<em>Second Home</em>&nbsp;... 2 kilometre uzaklıktadır. Hotel&nbsp;<em>Second Home</em>, Booking.com konuklarını 1 Ağu 2018 tarihinden beri ağırlıyor.</p>\r\n', '100', '2', 300, 13, NULL, NULL, 1, NULL, '16;19', '7;8', 4),
(7, 'oda1', '<p><em>Second Home</em>&nbsp;Hotel Kuwait City indirimli fiyatlar ile tatil.com&#39;da. Ger&ccedil;ek&nbsp;<em>otel</em>&nbsp;yorumları ile kampanyalı fiyatlar ve taksit fırsatlarını ka&ccedil;ırmayın!</p>\r\n', '300', '1', 500, 12, NULL, NULL, 1, NULL, '17;18', '8;9', 3),
(9, 'oda3', '<p>KAYAK, y&uuml;zlerce seyahat sitesinde arama yaparak en uygun&nbsp;<em>Second Home</em>&nbsp;Hostel fırsatını bulur ve rezerve etmenize yardımcı olur.&nbsp;</p>\r\n', '100', '3', 200, 14, NULL, NULL, 1, NULL, '16', '7', 1),
(10, 'oda4', '<p><em>Second Home</em>&nbsp;Hostel (Fatih, İstanbul) otelinde konaklama yapmak i&ccedil;in resimlerini incele, bilgilerine bak, uygun fiyatları g&ouml;zden ge&ccedil;ir&nbsp;</p>\r\n', '110', '4', 350, 15, NULL, NULL, 1, NULL, '15;16;17;18;19;20', '7;8;9', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_availability`
--

DROP TABLE IF EXISTS `room_availability`;
CREATE TABLE IF NOT EXISTS `room_availability` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_date` date DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `room_availability`
--

INSERT INTO `room_availability` (`id`, `daily_date`, `room_id`, `status`) VALUES
(582, '2020-12-31', 7, 1),
(583, '2021-01-01', 7, 1),
(584, '2021-01-02', 7, 1),
(585, '2021-01-03', 7, 1),
(586, '2021-01-04', 7, 1),
(587, '2021-01-05', 7, 1),
(588, '2021-01-06', 7, 1),
(589, '2021-01-07', 7, 1),
(590, '2021-01-08', 7, 1),
(591, '2021-01-09', 7, 1),
(592, '2021-01-10', 7, 1),
(593, '2020-12-31', 8, 1),
(594, '2021-01-01', 8, 1),
(595, '2021-01-02', 8, 1),
(596, '2021-01-03', 8, 1),
(597, '2021-01-04', 8, 1),
(598, '2021-01-05', 8, 1),
(599, '2020-12-31', 9, 1),
(600, '2021-01-01', 9, 1),
(601, '2021-01-02', 9, 1),
(602, '2021-01-03', 9, 1),
(603, '2021-01-04', 9, 1),
(604, '2021-01-05', 9, 1),
(605, '2021-01-06', 9, 1),
(606, '2021-01-07', 9, 1),
(607, '2021-01-08', 9, 1),
(608, '2021-01-12', 10, 1),
(609, '2021-01-13', 10, 1),
(610, '2021-01-14', 10, 1),
(611, '2021-01-15', 10, 1),
(612, '2021-01-16', 10, 1),
(613, '2021-01-17', 10, 1),
(614, '2021-01-18', 10, 1),
(615, '2021-01-19', 10, 1),
(616, '2021-01-20', 10, 1),
(617, '2021-01-24', 10, 1),
(618, '2021-01-25', 10, 1),
(619, '2021-01-26', 10, 1),
(620, '2021-01-27', 10, 1),
(621, '2021-01-12', 9, 1),
(622, '2021-01-13', 9, 1),
(623, '2021-01-14', 9, 1),
(624, '2021-01-15', 9, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `room_category`
--

INSERT INTO `room_category` (`id`, `title`, `rank`, `isActive`) VALUES
(12, 'Dorm Rooms', 0, 1),
(13, 'Shared Rooms', 0, 1),
(14, 'Private Rooms', 0, 1),
(15, 'Suite Rooms', 0, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_extra_services`
--

INSERT INTO `room_extra_services` (`id`, `title`, `icon`, `rank`, `isActive`) VALUES
(8, 'Large Double Bed', NULL, NULL, 1),
(7, 'Ceiling Fan', NULL, NULL, 1),
(6, 'Bathroom in the hall', NULL, NULL, 1),
(9, 'Air Condition', NULL, NULL, 1);

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
  `isCover` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_image`
--

INSERT INTO `room_image` (`id`, `img_id`, `room_id`, `isActive`, `rank`, `isCover`) VALUES
(27, '198e80bcdfa849aaa0ee7721c5f6132d.jpg', 8, 1, 1, 1),
(28, '9c5259bb76643a008bb55d90402cada5.jpg', 9, 1, 1, 1),
(25, '9d180fe0beb3abc0d41e908065e05bbc.jpg', 7, 1, 1, 1),
(26, '152b41b5b2da944210f632b79d191324.jpg', 8, 1, 1, 1),
(31, '61f975336bcff7193cf821ab07b650d8.jpg', 10, 1, 1, 1),
(24, '0c91a7328f5cf33dddf193084bede9f9.jpg', 7, 1, 1, 1),
(32, 'bc93aa46205055fcf61b157c3315a213.jpg', 8, 1, 1, 1),
(33, '8312cab009354825d71c4902b0e8f304.jpg', 10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_pricing`
--

DROP TABLE IF EXISTS `room_pricing`;
CREATE TABLE IF NOT EXISTS `room_pricing` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_pricing`
--

INSERT INTO `room_pricing` (`id`, `date`, `room_id`, `price`) VALUES
(100, '2021-01-09', 9, 700.00),
(99, '2021-01-08', 9, 700.00),
(103, '2021-01-12', 9, 700.00),
(104, '2020-12-31', 7, 700.00),
(105, '2021-01-01', 7, 700.00),
(98, '2021-01-07', 9, 700.00),
(102, '2021-01-11', 9, 700.00),
(97, '2021-01-06', 9, 700.00),
(96, '2021-01-05', 9, 240.00),
(95, '2021-01-04', 9, 240.00),
(94, '2021-01-03', 9, 700.00),
(93, '2021-01-02', 9, 700.00),
(92, '2021-01-01', 9, 700.00),
(91, '2021-01-07', 10, 250.00),
(90, '2021-01-06', 10, 250.00),
(89, '2021-01-05', 10, 250.00),
(88, '2021-01-04', 10, 250.00),
(87, '2021-01-03', 10, 250.00),
(86, '2021-01-02', 10, 300.00),
(85, '2021-01-01', 10, 300.00),
(84, '2020-12-31', 10, 300.00),
(83, '2021-01-08', 8, 150.00),
(82, '2021-01-07', 8, 150.00),
(81, '2021-01-06', 8, 150.00),
(80, '2021-01-03', 8, 200.00),
(79, '2021-01-02', 8, 200.00),
(78, '2021-01-01', 8, 200.00),
(77, '2020-12-31', 8, 200.00),
(101, '2021-01-10', 9, 700.00),
(106, '2021-01-02', 7, 700.00),
(107, '2021-01-06', 7, 300.00),
(108, '2021-01-07', 7, 300.00),
(109, '2021-01-08', 7, 300.00);

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `room_properties`
--

INSERT INTO `room_properties` (`id`, `title`, `icon`, `rank`, `isActive`) VALUES
(18, 'Secure lockers', NULL, NULL, 1),
(17, 'Internet / Wi-Fi', NULL, NULL, 1),
(16, '24 hour hot showers', NULL, NULL, 1),
(15, 'Television room', NULL, NULL, 1),
(19, 'Guest Kitchen	 ', NULL, NULL, 1),
(20, '24 Hour Restaurant', NULL, NULL, 1);

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
