-- Adminer 4.8.1 MySQL 8.0.30 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE DATABASE `uas_teknoweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uas_teknoweb`;

DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1,	'kura-kura'),
(2,	'ular'),
(3,	'kadal'),
(4,	'buaya'),
(5,	'tokek');

DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `user_id` varchar(10) NOT NULL COMMENT 'user id',
  `sandi` varchar(100) NOT NULL COMMENT 'sandi pengguna',
  `nama_pengguna` varchar(40) NOT NULL COMMENT 'nama pengguna'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `pengguna` (`user_id`, `sandi`, `nama_pengguna`) VALUES
('23',	'ac43724f16e9241d990427ab7c8f4228',	'yakub'),
('1023',	'yakub',	'admin');

DROP TABLE IF EXISTS `reptile`;
CREATE TABLE `reptile` (
  `id_reptile` int NOT NULL AUTO_INCREMENT,
  `nama_reptile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_kategori` int NOT NULL COMMENT 'FK',
  `habitat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_reptile`),
  KEY `id_kategori` (`id_kategori`),
  CONSTRAINT `reptile_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `reptile` (`id_reptile`, `nama_reptile`, `id_kategori`, `habitat`, `deskripsi`, `foto`) VALUES
(1,	'Ular Sanca',	2,	'Hutan tropis dan rawa',	'Ular besar tidak berbisa yang dapat membelit mangsanya',	'sanca.jpg'),
(3,	'Kadal Lidah Biru',	3,	'Padang rumput dan semak',	'Kadal unik dengan lidah berwarna biru sebagai pertahanan diri',	'lidah_biru.jpg'),
(4,	'Buaya Muara',	5,	'Muara sungai, rawa, laut',	'Buaya terbesar yang hidup di air asin dan sungai besar',	'buaya_muara.jpg'),
(5,	'Tokek Rumah',	5,	'Rumah dan pepohonan',	'Reptil kecil pemakan serangga yang sering ditemukan di rumah         ',	'tokek.jpg'),
(6,	'Iguanan',	5,	'Iguana umumnya ditemukan di daerah tropis dan subtropis di Amerika Tengah, Amerika Selatan, dan Karibia. Habitat mereka bervariasi tergantung spesiesnya, namun mayoritas iguana adalah hewan arboreal (penghuni pohon).',	'Ukuran: Iguana bervariasi dalam ukuran, mulai dari beberapa puluh sentimeter hingga lebih dari 2 meter (termasuk ekor). Iguana Hijau dewasa bisa mencapai panjang total sekitar 1,5 hingga 2 meter dan berat 4-6 kg, bahkan ada yang sampai 8 kg.\r\nWarna Kulit: Warna kulit iguana sangat beragam tergantung spesies dan lingkungan. Meskipun \"Green Iguana\" dinamai demikian, warnanya bisa bervariasi dari hijau cerah, kuning, oranye, hingga coklat keabu-abuan. Beberapa spesies memiliki pola bercak atau garis-garis. Ada juga varian warna hasil seleksi genetik seperti \"Red Flame\", \"Blue Diamond\", atau \"Snow Blizzard\" yang populer di kalangan pecinta reptil.',	'_iguana.jpg'),
(7,	'komodo',	3,	'Sebagian besar habitat Komodo berada dalam area Taman Nasional Komodo, yang merupakan Situs Warisan Dunia UNESCO. Lingkungan yang disukai Komodo adalah daerah yang panas dan kering, ',	'Komodo memiliki julukan \"naga purba\" karena penampilannya yang menyerupai dinosaurus.\r\nUkuran: Sebagai kadal terbesar di dunia, Komodo dewasa rata-rata memiliki panjang 2-3 meter dan berat sekitar 70-90 kg. Spesimen terbesar yang pernah tercatat bisa mencapai 3,13 meter dengan berat hingga 150 kg.       ',	'komodo.jpg'),
(9,	'ular Hognose Barat ',	2,	'Padang Rumput, Dataran Pasir dan Hutan Terbuka',	'Panjangnya bervariasi, tetapi umumnya jantan dewasa mencapai sekitar 30-60 cm, Ciri paling mencolok adalah moncongnya yang terbalik dan runcing ke atas (upturned rostral scale), menyerupai sekop kecil. Moncong ini sangat adaptif untuk menggali di tanah.',	'reptile_684b07ee99ab49.98284541.jpg'),
(10,	'kadal pohon',	3,	'pada pepohonan dan hutan tropis seperti hanya di kalimantan',	'Kadal pohon (sering disebut juga kadal hijau atau bunglon pohon, meskipun secara taksonomi berbeda dengan bunglon sejati) adalah sebutan umum untuk berbagai jenis kadal yang sebagian besar hidup dan beraktivitas di pohon atau vegetasi tinggi. Mereka sangat adaptif terhadap lingkungan arboreal, menunjukkan berbagai ciri fisik dan perilaku yang mendukung gaya hidup ini.',	'reptile_684bb6ce1fac43.25279212.png');

DROP VIEW IF EXISTS `view_reptile`;
CREATE TABLE `view_reptile` (`id_reptile` int, `nama_reptile` varchar(100), `deskripsi` text, `habitat` text, `foto` varchar(100), `nama_kategori` varchar(30));


DROP TABLE IF EXISTS `view_reptile`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_reptile` AS select `reptile`.`id_reptile` AS `id_reptile`,`reptile`.`nama_reptile` AS `nama_reptile`,`reptile`.`deskripsi` AS `deskripsi`,`reptile`.`habitat` AS `habitat`,`reptile`.`foto` AS `foto`,`kategori`.`nama_kategori` AS `nama_kategori` from (`reptile` join `kategori` on((`reptile`.`id_kategori` = `kategori`.`id_kategori`)));

-- 2025-06-13 15:21:56
