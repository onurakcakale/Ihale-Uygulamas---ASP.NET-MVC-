-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.31 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ihale_uygulamasi
CREATE DATABASE IF NOT EXISTS `ihale_uygulamasi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ihale_uygulamasi`;

-- Dumping structure for table ihale_uygulamasi.admin_tablosu
CREATE TABLE IF NOT EXISTS `admin_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kullanici_adi` char(50) NOT NULL,
  `sifre` char(50) NOT NULL,
  `rol` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.admin_tablosu: ~0 rows (approximately)
/*!40000 ALTER TABLE `admin_tablosu` DISABLE KEYS */;
INSERT INTO `admin_tablosu` (`id`, `kullanici_adi`, `sifre`, `rol`) VALUES
	(1, 'onurakcakale', 'f3eb6539d16921c66eea0bd8ce745446', NULL);
/*!40000 ALTER TABLE `admin_tablosu` ENABLE KEYS */;

-- Dumping structure for table ihale_uygulamasi.ihale_hareket_tablosu
CREATE TABLE IF NOT EXISTS `ihale_hareket_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ihale_id` int(11) NOT NULL,
  `musteri_id` int(11) NOT NULL,
  `teklif_fiyati` float NOT NULL,
  `aktif` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.ihale_hareket_tablosu: ~15 rows (approximately)
/*!40000 ALTER TABLE `ihale_hareket_tablosu` DISABLE KEYS */;
INSERT INTO `ihale_hareket_tablosu` (`id`, `ihale_id`, `musteri_id`, `teklif_fiyati`, `aktif`) VALUES
	(12, 58, 5, 700, 3),
	(13, 58, 1, 8000, 3),
	(14, 59, 1, 500, 1),
	(16, 58, 6, 900, 3),
	(20, 59, 2, 600, 1),
	(21, 62, 5, 1300, 2),
	(27, 61, 1, 400, 1),
	(28, 61, 5, 800, 1),
	(29, 69, 6, 950, 3),
	(32, 58, 25, 1212, 2),
	(33, 59, 25, 600, 1),
	(34, 69, 25, 1600, 2),
	(35, 62, 2, 500, 3),
	(36, 61, 25, 600, 1),
	(38, 78, 2, 8000, 1);
/*!40000 ALTER TABLE `ihale_hareket_tablosu` ENABLE KEYS */;

-- Dumping structure for view ihale_uygulamasi.ihale_hareket_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `ihale_hareket_view` (
	`ihale_id` INT(11) NOT NULL,
	`musteri_id` INT(11) NOT NULL,
	`musteri_adi` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`musteri_soyadi` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`puan` DOUBLE NOT NULL,
	`firma_adi` TEXT NULL COLLATE 'utf8_general_ci',
	`e_posta` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`urun_fotografi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`urun_kategorisi` INT(11) NOT NULL,
	`urun_adi` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`aciklama` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`stok_adet` INT(11) NOT NULL,
	`baslangic_tarihi` DATE NOT NULL,
	`bitis_tarihi` DATE NOT NULL,
	`aktif` INT(11) NOT NULL,
	`teklif_fiyati` FLOAT NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table ihale_uygulamasi.ihale_tablosu
CREATE TABLE IF NOT EXISTS `ihale_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_id` int(11) NOT NULL,
  `urun_kategorisi` int(11) NOT NULL,
  `urun_fotografi` varchar(50) NOT NULL,
  `urun_adi` char(50) NOT NULL,
  `aciklama` text NOT NULL,
  `stok_adet` int(11) NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `musteri_id` (`musteri_id`),
  KEY `urun_kategorisi` (`urun_kategorisi`),
  CONSTRAINT `FK_ihale_tablosu_kategori_tablosu` FOREIGN KEY (`urun_kategorisi`) REFERENCES `kategori_tablosu` (`kategori_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_stok_tablosu_musteri_tablosu` FOREIGN KEY (`musteri_id`) REFERENCES `musteri_tablosu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.ihale_tablosu: ~8 rows (approximately)
/*!40000 ALTER TABLE `ihale_tablosu` DISABLE KEYS */;
INSERT INTO `ihale_tablosu` (`id`, `musteri_id`, `urun_kategorisi`, `urun_fotografi`, `urun_adi`, `aciklama`, `stok_adet`, `baslangic_tarihi`, `bitis_tarihi`) VALUES
	(58, 2, 2, '~/Image/3214032665.png', 'Apple', 'Iphone 11 Pro', 15, '2021-08-27', '2021-09-02'),
	(59, 5, 2, '~/Image/orta2214109514.png', 'Casper', 'Nirvana 500', 12, '2021-09-01', '2021-09-05'),
	(61, 2, 1, '~/Image/icon5214739680.png', 'Samsung', 'Galaxy S11', 8, '2021-09-01', '2021-09-03'),
	(62, 1, 1, '~/Image/icon7212909963.png', 'Vestel', 'Televizyon', 22, '2021-08-31', '2021-09-02'),
	(63, 1, 4, '~/Image/facebook210519917.png', 'Huawei', 'P30 Pro', 13, '2021-08-27', '2021-09-01'),
	(69, 2, 6, '~/Image/top211808622.png', 'Sony', 'Vaio Laptop', 10, '2021-09-01', '2021-09-06'),
	(71, 2, 1, '~/Image/logo1213050340.png', 'Msi', 'B450M Anakart', 35, '2021-09-01', '2021-09-07'),
	(78, 1, 5, '~/Image/slider2214558743.jpg', 'Beko', 'Çamaşır Makinesi', 7, '2021-08-30', '2021-09-03'),
	(79, 2, 4, '~/Image/icon3210422299.png', 'Volkswagen', 'Passat 2021', 5, '2021-09-01', '2021-09-10');
/*!40000 ALTER TABLE `ihale_tablosu` ENABLE KEYS */;

-- Dumping structure for view ihale_uygulamasi.ihale_tablosu_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `ihale_tablosu_view` (
	`ihale_id` INT(11) NOT NULL,
	`musteri_id` INT(11) NULL,
	`musteri_adi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`musteri_soyadi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`firma_adi` TEXT NULL COLLATE 'utf8_general_ci',
	`urun_fotografi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`urun_kategorisi` INT(11) NOT NULL,
	`urun_adi` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`aciklama` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`stok_adet` INT(11) NOT NULL,
	`baslangic_tarihi` DATE NOT NULL,
	`bitis_tarihi` DATE NOT NULL,
	`aktif` BIGINT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view ihale_uygulamasi.ilanlarim_tablosu_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `ilanlarim_tablosu_view` (
	`id_ihale` INT(11) NOT NULL,
	`musteri_id` INT(11) NOT NULL,
	`urun_fotografi` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`urun_adi` CHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`aciklama` TEXT NOT NULL COLLATE 'utf8_general_ci',
	`stok_adet` INT(11) NOT NULL,
	`baslangic_tarihi` DATE NOT NULL,
	`bitis_tarihi` DATE NOT NULL,
	`aktif` BIGINT(11) NOT NULL,
	`toplam_teklif` BIGINT(21) NULL
) ENGINE=MyISAM;

-- Dumping structure for table ihale_uygulamasi.kategori_tablosu
CREATE TABLE IF NOT EXISTS `kategori_tablosu` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_ad` text NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.kategori_tablosu: ~12 rows (approximately)
/*!40000 ALTER TABLE `kategori_tablosu` DISABLE KEYS */;
INSERT INTO `kategori_tablosu` (`kategori_id`, `kategori_ad`) VALUES
	(1, 'Elektronik'),
	(2, 'Giyim'),
	(3, 'Aksesuar'),
	(4, 'Otomobil'),
	(5, 'Ev'),
	(6, 'Süpermarket'),
	(7, 'Kozmetik'),
	(8, 'Spor'),
	(9, 'Çocuk'),
	(10, 'Bahçe'),
	(11, 'Sanat'),
	(12, 'Kitap-Film-Müzik');
/*!40000 ALTER TABLE `kategori_tablosu` ENABLE KEYS */;

-- Dumping structure for view ihale_uygulamasi.mesajlar_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `mesajlar_view` (
	`mesaj_id` INT(11) NOT NULL,
	`gonderen_id` INT(11) NOT NULL,
	`gonderen_adi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`gonderen_soyadi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`alici_id` INT(11) NOT NULL,
	`ihale_id` INT(11) NULL,
	`urun_adi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`mesaj` LONGTEXT NOT NULL COLLATE 'utf8_general_ci',
	`mesaj_cevap_id` INT(11) NULL,
	`yanit` BIGINT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table ihale_uygulamasi.mesaj_tablosu
CREATE TABLE IF NOT EXISTS `mesaj_tablosu` (
  `mesaj_id` int(11) NOT NULL AUTO_INCREMENT,
  `gonderen_id` int(11) NOT NULL,
  `alici_id` int(11) NOT NULL,
  `ihale_id` int(11) NOT NULL,
  `mesaj` longtext NOT NULL,
  `mesaj_cevap_id` int(11) DEFAULT NULL,
  `yanit` int(11) DEFAULT NULL,
  PRIMARY KEY (`mesaj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.mesaj_tablosu: ~9 rows (approximately)
/*!40000 ALTER TABLE `mesaj_tablosu` DISABLE KEYS */;
INSERT INTO `mesaj_tablosu` (`mesaj_id`, `gonderen_id`, `alici_id`, `ihale_id`, `mesaj`, `mesaj_cevap_id`, `yanit`) VALUES
	(5, 2, 1, 58, 'Biriktirdigimiz tecrübelerimiz ile 2010 yılından beri Akçakale Web Tasarım olarak hizmet vermekteyiz. Biriktirdigimiz tecrübelerimiz ile 2010 yılından beri Akçakale Web Tasarım olarak hizmet vermekteyiz.', 0, 1),
	(36, 1, 2, 58, 'merhaba', 5, 1),
	(37, 2, 1, 58, 'selam', 36, 1),
	(38, 1, 2, 58, 'vsgfkdgf', 37, 1),
	(39, 2, 1, 58, 'jdfygkjdfh', 38, 1),
	(40, 1, 2, 58, 'uyrturhrf', 39, 1),
	(41, 2, 1, 58, 'kjblkbjcv', 40, 0),
	(42, 2, 5, 61, 'merahba', 0, 1),
	(43, 5, 2, 61, 'selam', 42, 1),
	(44, 2, 5, 61, 'aleykümselam', 43, 0);
/*!40000 ALTER TABLE `mesaj_tablosu` ENABLE KEYS */;

-- Dumping structure for table ihale_uygulamasi.musteri_puan_tablosu
CREATE TABLE IF NOT EXISTS `musteri_puan_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puan_veren_id` int(11) NOT NULL,
  `puan_veren_kullanici` text NOT NULL,
  `musteri_id` int(11) NOT NULL,
  `musteri_adi` text NOT NULL,
  `musteri_soyadi` text NOT NULL,
  `puan` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.musteri_puan_tablosu: 4 rows
/*!40000 ALTER TABLE `musteri_puan_tablosu` DISABLE KEYS */;
INSERT INTO `musteri_puan_tablosu` (`id`, `puan_veren_id`, `puan_veren_kullanici`, `musteri_id`, `musteri_adi`, `musteri_soyadi`, `puan`) VALUES
	(10, 2, 'asd', 25, 'Muhammed Onur', 'AKÇAKALE', 5),
	(11, 5, 'wer', 25, 'Muhammed Onur', 'AKÇAKALE', 4),
	(12, 1, 'onurakcakale', 5, 'ahmet', 'mehmet', 5),
	(13, 2, 'asd', 25, 'Muhammed Onur', 'AKÇAKALE', 5);
/*!40000 ALTER TABLE `musteri_puan_tablosu` ENABLE KEYS */;

-- Dumping structure for table ihale_uygulamasi.musteri_tablosu
CREATE TABLE IF NOT EXISTS `musteri_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `musteri_adi` char(50) NOT NULL,
  `musteri_soyadi` char(50) NOT NULL,
  `tc` int(11) DEFAULT NULL,
  `vergi_no` int(11) DEFAULT NULL,
  `firma_adi` text,
  `adres` varchar(100) NOT NULL,
  `telefon` text,
  `e_posta` varchar(50) NOT NULL,
  `kullanici_adi` varchar(50) NOT NULL,
  `sifre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.musteri_tablosu: ~5 rows (approximately)
/*!40000 ALTER TABLE `musteri_tablosu` DISABLE KEYS */;
INSERT INTO `musteri_tablosu` (`id`, `musteri_adi`, `musteri_soyadi`, `tc`, `vergi_no`, `firma_adi`, `adres`, `telefon`, `e_posta`, `kullanici_adi`, `sifre`) VALUES
	(1, 'onur', 'akçakale', NULL, NULL, 'akçakale', 'sadas', '05435023329', 'asdasd', 'onurakcakale', '12345'),
	(2, 'arif', 'demir', NULL, NULL, 'asd', 'sada', NULL, 'asdas', 'asd', 'asd'),
	(5, 'ahmet', 'mehmet', NULL, NULL, '', 'wer', NULL, 'wer', 'wer', 'wer'),
	(6, 'zxc', 'zxc', NULL, NULL, 'zxc', 'dfasdfda', NULL, 'zxc', 'zxc', 'zxc'),
	(25, 'Muhammed Onur', 'AKÇAKALE', NULL, NULL, 'qwe', 'Vatansever Caddesi Hürriyet Mahallesi Sanat sokak No:3/1 Yakacik/Kartal/ISTANBUL', '05435023329', 'ff', 'ff', 'ff');
/*!40000 ALTER TABLE `musteri_tablosu` ENABLE KEYS */;

-- Dumping structure for table ihale_uygulamasi.puan_tablosu
CREATE TABLE IF NOT EXISTS `puan_tablosu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table ihale_uygulamasi.puan_tablosu: ~5 rows (approximately)
/*!40000 ALTER TABLE `puan_tablosu` DISABLE KEYS */;
INSERT INTO `puan_tablosu` (`id`, `puan`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);
/*!40000 ALTER TABLE `puan_tablosu` ENABLE KEYS */;

-- Dumping structure for view ihale_uygulamasi.teklif_verenler_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `teklif_verenler_view` (
	`musteri_id` INT(11) NOT NULL,
	`ihale_id` INT(11) NOT NULL,
	`musteri_adi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`musteri_soyadi` CHAR(50) NULL COLLATE 'utf8_general_ci',
	`puan` DOUBLE NOT NULL,
	`firma_adi` TEXT NULL COLLATE 'utf8_general_ci',
	`e_posta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`aktif` INT(11) NOT NULL,
	`teklif_fiyati` FLOAT NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view ihale_uygulamasi.ihale_hareket_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `ihale_hareket_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ihale_hareket_view` AS select `ihale_tablosu`.`id` AS `ihale_id`,`musteri_tablosu`.`id` AS `musteri_id`,`musteri_tablosu`.`musteri_adi` AS `musteri_adi`,`musteri_tablosu`.`musteri_soyadi` AS `musteri_soyadi`,ifnull((select avg(`musteri_puan_tablosu`.`puan`)),0) AS `puan`,`musteri_tablosu`.`firma_adi` AS `firma_adi`,`musteri_tablosu`.`e_posta` AS `e_posta`,`ihale_tablosu`.`urun_fotografi` AS `urun_fotografi`,`ihale_tablosu`.`urun_kategorisi` AS `urun_kategorisi`,`ihale_tablosu`.`urun_adi` AS `urun_adi`,`ihale_tablosu`.`aciklama` AS `aciklama`,`ihale_tablosu`.`stok_adet` AS `stok_adet`,`ihale_tablosu`.`baslangic_tarihi` AS `baslangic_tarihi`,`ihale_tablosu`.`bitis_tarihi` AS `bitis_tarihi`,`ihale_hareket_tablosu`.`aktif` AS `aktif`,`ihale_hareket_tablosu`.`teklif_fiyati` AS `teklif_fiyati` from (((`ihale_hareket_tablosu` join `ihale_tablosu` on((`ihale_hareket_tablosu`.`ihale_id` = `ihale_tablosu`.`id`))) left join `musteri_puan_tablosu` on((`ihale_hareket_tablosu`.`musteri_id` = `musteri_puan_tablosu`.`musteri_id`))) join `musteri_tablosu` on((`ihale_hareket_tablosu`.`musteri_id` = `musteri_tablosu`.`id`))) group by `ihale_hareket_tablosu`.`id`;

-- Dumping structure for view ihale_uygulamasi.ihale_tablosu_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `ihale_tablosu_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ihale_tablosu_view` AS select `ihale_tablosu`.`id` AS `ihale_id`,`musteri_tablosu`.`id` AS `musteri_id`,`musteri_tablosu`.`musteri_adi` AS `musteri_adi`,`musteri_tablosu`.`musteri_soyadi` AS `musteri_soyadi`,`musteri_tablosu`.`firma_adi` AS `firma_adi`,`ihale_tablosu`.`urun_fotografi` AS `urun_fotografi`,`ihale_tablosu`.`urun_kategorisi` AS `urun_kategorisi`,`ihale_tablosu`.`urun_adi` AS `urun_adi`,`ihale_tablosu`.`aciklama` AS `aciklama`,`ihale_tablosu`.`stok_adet` AS `stok_adet`,`ihale_tablosu`.`baslangic_tarihi` AS `baslangic_tarihi`,`ihale_tablosu`.`bitis_tarihi` AS `bitis_tarihi`,any_value(ifnull(`ihale_hareket_tablosu`.`aktif`,0)) AS `aktif` from ((`ihale_tablosu` left join `ihale_hareket_tablosu` on((`ihale_hareket_tablosu`.`ihale_id` = `ihale_tablosu`.`id`))) left join `musteri_tablosu` on((`ihale_tablosu`.`musteri_id` = `musteri_tablosu`.`id`))) group by `ihale_tablosu`.`id`;

-- Dumping structure for view ihale_uygulamasi.ilanlarim_tablosu_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `ilanlarim_tablosu_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `ilanlarim_tablosu_view` AS select `ihale_tablosu`.`id` AS `id_ihale`,`ihale_tablosu`.`musteri_id` AS `musteri_id`,`ihale_tablosu`.`urun_fotografi` AS `urun_fotografi`,`ihale_tablosu`.`urun_adi` AS `urun_adi`,`ihale_tablosu`.`aciklama` AS `aciklama`,`ihale_tablosu`.`stok_adet` AS `stok_adet`,`ihale_tablosu`.`baslangic_tarihi` AS `baslangic_tarihi`,`ihale_tablosu`.`bitis_tarihi` AS `bitis_tarihi`,any_value(ifnull(`ihale_hareket_tablosu`.`aktif`,0)) AS `aktif`,(select count(`ihale_hareket_tablosu`.`id`) from `ihale_hareket_tablosu` where (`ihale_hareket_tablosu`.`ihale_id` = `ihale_tablosu`.`id`)) AS `toplam_teklif` from ((`ihale_tablosu` left join `ihale_hareket_tablosu` on((`ihale_hareket_tablosu`.`ihale_id` = `ihale_tablosu`.`id`))) left join `musteri_tablosu` on((`ihale_hareket_tablosu`.`musteri_id` = `musteri_tablosu`.`id`))) group by `id_ihale`;

-- Dumping structure for view ihale_uygulamasi.mesajlar_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `mesajlar_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `mesajlar_view` AS select `mesaj_tablosu`.`mesaj_id` AS `mesaj_id`,`mesaj_tablosu`.`gonderen_id` AS `gonderen_id`,`musteri_tablosu`.`musteri_adi` AS `gonderen_adi`,`musteri_tablosu`.`musteri_soyadi` AS `gonderen_soyadi`,`mesaj_tablosu`.`alici_id` AS `alici_id`,`ihale_tablosu`.`id` AS `ihale_id`,`ihale_tablosu`.`urun_adi` AS `urun_adi`,`mesaj_tablosu`.`mesaj` AS `mesaj`,`mesaj_tablosu`.`mesaj_cevap_id` AS `mesaj_cevap_id`,ifnull(`mesaj_tablosu`.`yanit`,0) AS `yanit` from ((`mesaj_tablosu` left join `ihale_tablosu` on((`ihale_tablosu`.`id` = `mesaj_tablosu`.`ihale_id`))) left join `musteri_tablosu` on((`mesaj_tablosu`.`gonderen_id` = `musteri_tablosu`.`id`)));

-- Dumping structure for view ihale_uygulamasi.teklif_verenler_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `teklif_verenler_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `teklif_verenler_view` AS select `ihale_hareket_tablosu`.`musteri_id` AS `musteri_id`,`ihale_hareket_tablosu`.`ihale_id` AS `ihale_id`,`musteri_tablosu`.`musteri_adi` AS `musteri_adi`,`musteri_tablosu`.`musteri_soyadi` AS `musteri_soyadi`,ifnull((select avg(`musteri_puan_tablosu`.`puan`)),0) AS `puan`,`musteri_tablosu`.`firma_adi` AS `firma_adi`,`musteri_tablosu`.`e_posta` AS `e_posta`,`ihale_hareket_tablosu`.`aktif` AS `aktif`,`ihale_hareket_tablosu`.`teklif_fiyati` AS `teklif_fiyati` from (((`ihale_hareket_tablosu` left join `ihale_tablosu` on((`ihale_hareket_tablosu`.`ihale_id` = `ihale_tablosu`.`id`))) left join `musteri_puan_tablosu` on((`ihale_hareket_tablosu`.`musteri_id` = `musteri_puan_tablosu`.`musteri_id`))) left join `musteri_tablosu` on((`ihale_hareket_tablosu`.`musteri_id` = `musteri_tablosu`.`id`))) group by `ihale_hareket_tablosu`.`id`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
