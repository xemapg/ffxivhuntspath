-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 02, 2020 at 06:35 AM
-- Server version: 5.6.48-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ffxiv2`
--
CREATE DATABASE IF NOT EXISTS `ffxiv2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ffxiv2`;

-- --------------------------------------------------------

DELIMITER //
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_etag`(IN `i` VARCHAR(20))
BEGIN
	DECLARE e VARCHAR(14) DEFAULT DATE_FORMAT( NOW(), '%Y%m%d%k%i%s' );
	INSERT INTO `etags` (`item`, `etag`) VALUES (i, e) 
		ON DUPLICATE KEY UPDATE `etag` = e;
END//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aetherytes_arr`
--

CREATE TABLE `aetherytes_arr` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text NOT NULL,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `cost` decimal(3,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aetherytes_arr`
--

INSERT INTO `aetherytes_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `cost`) VALUES
(1, 184, 'Summerford Farms', 'Summerford Farms', 'Vergers D\'Estival', 'Sommerfurt-Höfe', 'サマーフォード庄', NULL, 1, 26.0, 16.3, 0.0),
(2, 216, 'Wineport', 'Wineport', 'Port-aux-Vins', 'Weinhafen', 'ワインポート', NULL, 1, 18.0, 7.5, 5.2),
(3, 770, 'Limsa Lominsa Lower Decks => Zephyr Gate (Middle L', 'Limsa Lominsa Lower Decks => Zephyr Gate (Middle L', 'Limsa Lominsa - L\'Entrepont => Noscea Centrale Via', 'Untere Decks => Zephyr-Tor (Zentrales La Noscea)', 'リムサ・ロミンサ：下甲板層 => ゼファー陸門（中央ラノシア方面）', NULL, 1, 21.4, 24.3, 5.2),
(4, 337, 'Moraby Drydocks', 'Moraby Drydocks', 'Chantier Naval De Moraby', 'Moraby-Trockendocks', 'モラビー造船廠', NULL, 2, 24.5, 34.8, 0.0),
(5, 1161, 'Limsa Lominsa Lower Decks => Mist', 'Limsa Lominsa Lower Decks => Mist', 'Limsa Lominsa - L\'Entrepont => Brumée', 'Untere Decks => Nebeldorf', 'リムサ・ロミンサ：下甲板層 => ミスト・ヴィレッジ', NULL, 2, 33.3, 19.1, 7.6),
(6, 771, 'Limsa Lominsa Lower Decks => Tempest Gate (Lower L', 'Limsa Lominsa Lower Decks => Tempest Gate (Lower L', 'Limsa Lominsa - L\'Entrepont => Basse-Noscea Via La', 'Untere Decks => Sturmtor (Unteres La Noscea)', 'リムサ・ロミンサ：下甲板層 => テンペスト陸門（低地ラノシア方面）', NULL, 2, 20.9, 23.8, 5.2),
(7, 206, 'Costa Del Sol', 'Costa Del Sol', 'Costa Del Sol', 'Sonnenküste', 'コスタ・デル・ソル', NULL, 3, 31.2, 30.9, 0.0),
(8, 216, 'Wineport', 'Wineport', 'Port-aux-Vins', 'Weinhafen', 'ワインポート', NULL, 3, 21.1, 21.5, 0.0),
(9, 218, 'Swiftperch', 'Swiftperch', 'Le Martinet', 'Tölpelturm-Siedlung', 'スウィフトパーチ入植地', NULL, 4, 34.5, 31.7, 0.0),
(10, 223, 'Aleport', 'Aleport', 'Port-aux-Ales', 'Bierhafen', 'エールポート', NULL, 4, 26.7, 25.7, 0.0),
(11, 239, 'Camp Bronze Lake', 'Camp Bronze Lake', 'Camp Du Lac D\'Airain', 'Camp Bronzesee', 'キャンプ・ブロンズレイク', NULL, 5, 30.2, 23.3, 0.0),
(12, 223, 'Aleport', 'Aleport', 'Port-aux-Ales', 'Bierhafen', 'エールポート', NULL, 5, 12.2, 26.6, 7.6),
(13, 237, 'Camp Overlook', 'Camp Overlook', 'Camp Du Guet', 'Camp Ausblick', 'キャンプ・オーバールック', NULL, 6, 19.1, 17.1, 0.0),
(14, 94, 'Bentbranch Meadows', 'Bentbranch Meadows', 'Ranch De Brancharquée', 'Gut Zwieselgrund', 'ベントブランチ牧場', NULL, 7, 21.6, 22.1, 0.0),
(15, 597, 'New Gridania => Blue Badger Gate (Central Shroud)', 'New Gridania => Blue Badger Gate (Central Shroud)', 'Nouvelle Gridania => Forêt Centrale Est Via La Por', 'Neu-Gridania => Blaudachs-Pforte (zum Tiefen Wald ', 'グリダニア：新市街 => 青狢門（中央森林東方面）', NULL, 7, 24.0, 15.4, 5.2),
(16, 408, 'New Gridania => White Wolf Gate (Central Shroud)', 'New Gridania => White Wolf Gate (Central Shroud)', 'Nouvelle Gridania => Forêt Centrale Ouest Via La P', 'Neu-Gridania => Weißwolf-Pforte (zum Tiefen Wald /', 'グリダニア：新市街 => 白狼門（中央森林西方面）', NULL, 7, 15.3, 15.9, 5.2),
(17, 107, 'The Hawthorne Hut', 'The Hawthorne Hut', 'Hutte Des Hawthorne', 'Jagdhütte Der Hawthornes', 'ホウソーン家の山塞', NULL, 8, 17.7, 27.3, 0.0),
(18, 129, 'Quarrymill', 'Quarrymill', 'Moulin De La Carrière', 'Mühlenbruch', 'クォーリーミル', NULL, 9, 25.0, 20.1, 0.0),
(19, 123, 'Camp Tranquil', 'Camp Tranquil', 'Camp Des Sentes Tranquilles', 'Camp Seelenruhe', 'キャンプ・トランキル', NULL, 9, 16.8, 28.6, 0.0),
(20, 140, 'Fallgourd Float', 'Fallgourd Float', 'Radeau De La Calebasse', 'Herbstkürbis-See', 'フォールゴウド', NULL, 10, 20.6, 26.1, 0.0),
(21, 598, 'New Gridania => Yellow Serpent Gate (North Shroud)', 'New Gridania => Yellow Serpent Gate (North Shroud)', 'Nouvelle Gridania => Forêt Du Nord Via La Porte De', 'Neu-Gridania => Gelbschlangen-Pforte (zum Nordwald', 'グリダニア：新市街 => 黄蛇門（北部森林方面）', NULL, 10, 30.4, 25.4, 5.2),
(22, 271, 'Horizon', 'Horizon', 'Horizon', 'Horizont', 'ホライズン', NULL, 11, 22.7, 16.9, 0.0),
(23, 779, 'Ul\'dah - Steps Of Nald => Gate Of The Sultana (Wes', 'Ul\'dah - Steps Of Nald => Gate Of The Sultana (Wes', 'Ul\'dah - Faubourg De Nald => Thanalan Occidental V', 'Nald-Kreuzgang => Neues Sultana-Tor (Westliches Th', 'ウルダハ：ナル回廊 => ナナモ新門（西ザナラーン方面）', NULL, 11, 30.4, 24.8, 5.2),
(24, 781, 'Ul\'dah - Steps Of Nald => Gate Of Thal (Central Th', 'Ul\'dah - Steps Of Nald => Gate Of Thal (Central Th', 'Ul\'dah - Faubourg De Nald => Thanalan Central Sud ', 'Nald-Kreuzgang => Tor Des Thal (Zentrales Thanalan', 'ウルダハ：ナル回廊 => ザル大門（中央ザナラーン南方面）', NULL, 12, 22.2, 33.0, 5.2),
(25, 780, 'Ul\'dah - Steps Of Nald => Gate Of Nald (Central Th', 'Ul\'dah - Steps Of Nald => Gate Of Nald (Central Th', 'Ul\'dah - Faubourg De Nald => Thanalan Central Nord', 'Nald-Kreuzgang => Tor Des Nald (Zentrales Thanalan', 'ウルダハ：ナル回廊 => ナル大門（中央ザナラーン北方面）', NULL, 12, 19.0, 27.6, 5.2),
(26, 290, 'Black Brush Station', 'Black Brush Station', 'Gare De Roncenoire', 'Kohlenstaub-Bahnhof', 'ブラックブラッシュ停留所', NULL, 12, 21.2, 18.1, 0.0),
(27, 325, 'Camp Bluefog', 'Camp Bluefog', 'Camp De Brumebleue', 'Camp Blauer Dunst', 'キャンプ・ブルーフォグ', NULL, 12, 20.9, 11.8, 7.6),
(28, 300, 'Camp Drybone', 'Camp Drybone', 'Camp Des Os Desséchés', 'Camp Knochenbleich', 'キャンプ・ドライボーン', NULL, 13, 13.7, 24.3, 0.0),
(29, 123, 'Camp Tranquil', 'Camp Tranquil', 'Camp Des Sentes Tranquilles', 'Camp Seelenruhe', 'キャンプ・トランキル', NULL, 13, 28.7, 15.7, 10.4),
(30, 313, 'Little Ala Mhigo', 'Little Ala Mhigo', 'Petite Ala Mhigo', 'Klein-Ala Mhigo', 'リトルアラミゴ', NULL, 14, 18.3, 13.1, 0.0),
(31, 323, 'Forgotten Springs', 'Forgotten Springs', 'Oasis Oubliée', 'Die Vergessene Oase', '忘れられたオアシス', NULL, 14, 14.9, 29.6, 0.0),
(32, 325, 'Camp Bluefog', 'Camp Bluefog', 'Camp De Brumebleue', 'Camp Blauer Dunst', 'キャンプ・ブルーフォグ', NULL, 15, 21.8, 30.5, 0.0),
(33, 331, 'Ceruleum Processing Plant', 'Ceruleum Processing Plant', 'Usine De Céruleum', 'Erdseim-Fabrik', '青燐精製所', NULL, 15, 20.9, 20.8, 0.0),
(34, 411, 'Revenant\'s Toll', 'Revenant\'s Toll', 'Glas Des Revenants', 'Geisterzoll', 'レヴナンツトール', NULL, 16, 16.7, 35.1, 8.6),
(35, 388, 'Camp Dragonhead', 'Camp Dragonhead', 'Camp De La Tête Du Dragon', 'Camp Drachenkopf', 'キャンプ・ドラゴンヘッド', NULL, 16, 26.0, 16.8, 0.0),
(36, 411, 'Revenant\'s Toll', 'Revenant\'s Toll', 'Glas Des Revenants', 'Geisterzoll', 'レヴナンツトール', NULL, 17, 22.2, 8.1, 0.0);

--
-- Triggers `aetherytes_arr`
--
DELIMITER $$
CREATE TRIGGER `aeth_arr_del` AFTER DELETE ON `aetherytes_arr` FOR EACH ROW BEGIN
	CALL update_etag('distances_arr');
	CALL update_etag('aeth_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_arr_ins` AFTER INSERT ON `aetherytes_arr` FOR EACH ROW BEGIN
	CALL update_etag('distances_arr');
	CALL update_etag('aeth_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_arr_upd` AFTER UPDATE ON `aetherytes_arr` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.cost <> OLD.cost OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_arr');
    END IF;
	CALL update_etag('aeth_arr');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aetherytes_hw`
--

CREATE TABLE `aetherytes_hw` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text NOT NULL,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `cost` decimal(3,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aetherytes_hw`
--

INSERT INTO `aetherytes_hw` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `cost`) VALUES
(1, 2204, 'Falcon\'s Nest', 'Falcon\'s Nest', 'Nid Du Faucon', 'Falkenhorst', 'ファルコンネスト', '隼巢', 1, 32.1, 36.6, 0.0),
(2, 2116, 'Camp Cloudtop', 'Camp Cloudtop', 'Camp De Cime-des-nuages', 'Camp Wolkenwipfel', 'キャンプ・クラウドトップ', '云顶营地', 2, 10.3, 33.5, 0.0),
(3, 2123, 'Ok\' Zundu', 'Ok\' Zundu', 'Ok\' Zundu', 'Ok\' Zundo', 'オク・ズンド', '尊杜集落', 2, 10.4, 14.1, 0.0),
(4, 2018, 'Tailfeather', 'Tailfeather', 'La Penne', 'Fiederhag', 'テイルフェザー', '尾羽集落', 3, 33.2, 23.1, 0.0),
(5, 2025, 'Anyx Trine', 'Anyx Trine', 'Annexe Trine', 'Trinär-Annex', '不浄の三塔', '不洁三塔', 3, 16.4, 23.2, 0.0),
(6, 2042, 'Moghome', 'Moghome', 'Nid-Mog', 'Moglingen', 'モグモグホーム', '莫古力之家', 4, 27.6, 34.4, 0.0),
(7, 2046, 'Zenith', 'Zenith', 'Zénith', 'Kreidetempel', '白亜の宮殿', '天极白垩宫', 4, 10.9, 28.9, 0.0),
(8, 2082, 'Idyllshire', 'Idyllshire', 'Idyllée', 'Frohehalde', 'イディルシャイア', '田园郡', 5, 14.0, 11.0, 5.2),
(9, 2131, 'Helix', 'Helix', 'Hélice', 'Helix', 'ポート・ヘリックス', '螺旋港', 6, 8.0, 10.5, 0.0);

--
-- Triggers `aetherytes_hw`
--
DELIMITER $$
CREATE TRIGGER `aeth_hw_del` AFTER DELETE ON `aetherytes_hw` FOR EACH ROW BEGIN
	CALL update_etag('distances_hw');
	CALL update_etag('aeth_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_hw_ins` AFTER INSERT ON `aetherytes_hw` FOR EACH ROW BEGIN
	CALL update_etag('distances_hw');
	CALL update_etag('aeth_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_hw_upd` AFTER UPDATE ON `aetherytes_hw` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.cost <> OLD.cost OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_hw');
    END IF;
	CALL update_etag('aeth_hw');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aetherytes_sb`
--

CREATE TABLE `aetherytes_sb` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `cost` decimal(3,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aetherytes_sb`
--

INSERT INTO `aetherytes_sb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `cost`) VALUES
(1, 2613, 'Castrum Oriens', 'Castrum Oriens', 'Castrum Oriens', 'Castrum Oriens', 'カストルム・オリエンス', '帝国东方堡', 1, 8.8, 11.3, 0.0),
(2, 2634, 'The Peering Stones', 'The Peering Stones', 'Rochers D\'aguet', 'Die Spähenden Steine', 'ピーリングストーンズ', '对等石', 1, 29.8, 26.5, 0.0),
(3, 2504, 'Rhalgr\'s Reach', 'Rhalgr\'s Reach', 'Temple Du Poing (entrée)', 'Rhalgrs Wacht', 'ラールガーズリーチ', '神拳痕', 1, 30.5, 10.7, 5.2),
(4, 2646, 'Ala Gannha', 'Ala Gannha', 'Ala Gannha', 'Ala Gannha', 'アラガーナ', '阿拉加纳', 2, 23.8, 6.5, 0.0),
(5, 2660, 'Ala Ghiri', 'Ala Ghiri', 'Ala Ghiri', 'Ala Ghiri', 'アラギリ', '阿拉基利', 2, 16.0, 36.3, 0.0),
(6, 2504, 'Rhalgr\'s Reach', 'Rhalgr\'s Reach', 'Temple Du Poing (entrée)', 'Rhalgrs Wacht', 'ラールガーズリーチ', '神拳痕', 2, 9.0, 7.0, 5.2),
(7, 2404, 'Kugane', 'Kugane', 'Kugane', 'Kugane', 'クガネ', '黄金港', 3, 38.4, 38.3, 5.2),
(8, 2773, 'Onokoro', 'Onokoro', 'Onokoro', 'Onokoro', 'オノコロ島', '自凝岛', 3, 23.2, 9.7, 0.0),
(9, 2769, 'Tamamizu', 'Tamamizu', 'Tamamizu', 'Tamamizu', '碧のタマミズ', '碧玉水', 3, 28.6, 16.2, 5.2),
(10, 2793, 'Namai', 'Namai', 'Namai', 'Namai', 'ナマイ村', '茨菰村', 4, 30.1, 19.6, 0.0),
(11, 2805, 'The House of the Fierce', 'The House of the Fierce', 'Cercle Des Intrépides', 'Klause Der Grimmigen', '烈士庵', '烈士庵', 4, 26.3, 13.3, 0.0),
(12, 2814, 'Reunion', 'Reunion', 'Ralliement', 'Reunion', '再会の市', '重逢集市', 5, 32.5, 28.2, 0.0),
(13, 2822, 'The Dawn Throne', 'The Dawn Throne', 'Trône De L\'Aube', 'Morgenthron', '明けの玉座', '晨曦王座', 5, 23.0, 22.1, 0.0),
(14, 2670, 'Porta Praetoria', 'Porta Praetoria', 'Porta Praetoria', 'Porta Praetoria', 'ポルタ・プレトリア', '天营门', 6, 8.4, 21.1, 0.0),
(15, 2693, 'The Ala Mhigan Quarter', 'The Ala Mhigan Quarter', 'Faubourg Mhigois', 'Mhigisches Wohnviertel', 'アラミガン・クォーター', '阿拉米格人居住区', 6, 34.0, 34.0, 0.0),
(16, 2850, 'Dhoro Iloh', 'Dhoro Iloh', 'Dhoro Iloh', 'Dhoro Iloh', 'ドーロ・イロー', 'Dhoro Iloh', 5, 6.4, 23.8, 0.0);

--
-- Triggers `aetherytes_sb`
--
DELIMITER $$
CREATE TRIGGER `aeth_sb_del` AFTER DELETE ON `aetherytes_sb` FOR EACH ROW BEGIN
	CALL update_etag('distances_sb');
	CALL update_etag('aeth_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_sb_ins` AFTER INSERT ON `aetherytes_sb` FOR EACH ROW BEGIN
	CALL update_etag('distances_sb');
	CALL update_etag('aeth_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_sb_upd` AFTER UPDATE ON `aetherytes_sb` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.cost <> OLD.cost OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_sb');
    END IF;
	CALL update_etag('aeth_sb');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aetherytes_shb`
--

CREATE TABLE `aetherytes_shb` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text NOT NULL,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `z` decimal(3,1) DEFAULT NULL,
  `cost` decimal(3,1) UNSIGNED NOT NULL DEFAULT '0.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aetherytes_shb`
--

INSERT INTO `aetherytes_shb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `z`, `cost`) VALUES
(1, 3335, 'The Crystarium => Tessellation (Lakeland)', 'The Crystarium => Tessellation (Lakeland)', 'Cristarium => Le Pavage', 'Crystarium => Mosaikbrücke (ins Seenland)', 'クリスタリウム => テセレーション鉄橋（レイクランド方面）', NULL, 1, 38.0, 29.6, 0.3, 5.2),
(2, 3044, 'Fort Jobb', 'Fort Jobb', 'Fort Jobb', 'Jobb-Feste', 'ジョッブ砦', '乔布要塞', 1, 36.5, 20.9, 0.2, 0.0),
(3, 3057, 'The Ostall Imperative', 'The Ostall Imperative', 'L\'Impératif d\'Ostall', 'Ostalls Befehl', 'オスタル厳命城', '奥斯塔尔严命城', 1, 6.7, 16.8, 0.5, 0.0),
(4, 3351, 'Eulmore => The Path to Glory (Kholusia)', 'Eulmore => The Path to Glory (Kholusia)', 'Eulmore => Marches de la Gloire (Kholusia)', 'Eulmore => Pfad zum Ruhm (Kholusia)', 'ユールモア => 栄光の道（コルシア島方面）', NULL, 2, 24.9, 38.4, 0.5, 5.2),
(5, 3075, 'Stilltide', 'Stilltide', 'Douceonde', 'Stillwasser', 'スティルタイド', '滞潮村', 2, 34.8, 27.2, 0.2, 0.0),
(6, 3094, 'Wright', 'Wright', 'Cherpant', 'Werfting', 'ライト村', '工匠村', 2, 16.6, 29.1, 0.1, 0.0),
(7, 3105, 'Tomra', 'Tomra', 'Tomra', 'Tomra', 'トメラの村', '图姆拉村', 2, 12.9, 8.9, 4.1, 0.0),
(8, 3122, 'Mord Souq', 'Mord Souq', 'Mord Souq', 'Mordh Souq', 'モルド・スーク', '鼹灵集市', 3, 26.4, 17.0, 1.2, 0.0),
(9, 3129, 'The Inn At Journey\'s Head', 'The Inn At Journey\'s Head', 'Auberge du Grand Départ', 'Ruhstatt vor der Langen Reise', '旅立ちの宿', '上路客店', 3, 29.4, 27.6, 0.9, 0.0),
(10, 3135, 'Twine', 'Twine', 'Queues-liées', 'Pfotenschlag', 'トゥワイン', '络尾聚落', 3, 11.2, 17.1, 1.6, 0.0),
(11, 3147, 'Lydha Lran', 'Lydha Lran', 'Lydha Lran', 'Lydha Lran', 'リダ・ラーン', '群花馆', 4, 14.5, 31.6, 0.4, 0.0),
(12, 3156, 'Pla Enni', 'Pla Enni', 'Pla Enni', 'Pla Enni', 'プラ・エンニ茸窟', NULL, 4, 20.0, 4.3, 1.0, 6.4),
(13, 3157, 'Wolekdorf', 'Wolekdorf', 'Wolekdorf', 'Wolekdorf', 'ヴォレクドルフ', '云村', 4, 29.1, 7.7, 0.8, 0.0),
(14, 3170, 'Slitherbough', 'Slitherbough', 'Serpentige', 'Schlangenzweig', 'スリザーバウ', '蛇行枝', 5, 19.3, 27.4, -0.2, 0.0),
(15, 3179, 'Fanow', 'Fanow', 'Fanow', 'Fanow', 'ファノヴの里', '法诺村', 5, 29.1, 17.6, 0.2, 0.0),
(16, 3195, 'The Ondo Cups', 'The Ondo Cups', 'Baïne', 'Ondo-Becken', 'オンドの潮溜まり', '鳍人潮池', 6, 32.6, 17.4, -2.0, 0.0),
(17, 3205, 'The Macarenses Angle', 'The Macarenses Angle', 'Carré macarien', 'Macarenses-Forum', 'マカレンサス広場', '马克连萨斯广场', 6, 18.6, 25.9, -8.3, 0.0);

--
-- Triggers `aetherytes_shb`
--
DELIMITER $$
CREATE TRIGGER `aeth_shb_del` AFTER DELETE ON `aetherytes_shb` FOR EACH ROW BEGIN
	CALL update_etag('distances_shb');
	CALL update_etag('aeth_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_shb_ins` AFTER INSERT ON `aetherytes_shb` FOR EACH ROW BEGIN
	CALL update_etag('distances_shb');
	CALL update_etag('aeth_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `aeth_shb_upd` AFTER UPDATE ON `aetherytes_shb` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.cost <> OLD.cost OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_shb');
    END IF;
	CALL update_etag('aeth_shb');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `etags`
--

CREATE TABLE `etags` (
  `item` varchar(20) NOT NULL,
  `etag` varchar(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `etags`
--

INSERT INTO `etags` (`item`, `etag`) VALUES
('distances_arr', '20180929121118'),
('mobs_arr', '20180929121118'),
('mobs_hw', '20190303134627'),
('distances_hw', '20190303134627'),
('mobs_sb', '2020020272511'),
('distances_sb', '2020020272511'),
('aeth_arr', '20170712174317'),
('aeth_hw', '2017100974106'),
('aeth_sb', '2020020272510'),
('fates_arr', '20170712174317'),
('region_arr', '20170712174317'),
('zones_arr', '20170712174317'),
('zones_hw', '2017100974106'),
('zones_sb', '2020020272512'),
('zones_shb', '2020020272512'),
('distances_shb', '2020020272512'),
('aeth_shb', '2020020272510'),
('mobs_shb', '2020020273245');

-- --------------------------------------------------------

--
-- Table structure for table `fates_arr`
--

CREATE TABLE `fates_arr` (
  `id` int(10) NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fates_arr`
--

INSERT INTO `fates_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`) VALUES
(1, 265, 'One Pickman Enters', 'One Pickman Enters', 'Bonne Pioche', 'Dafür Gibt\'s Haue', '精強なる山師「ピックマン426 ブ・ガ」', NULL),
(2, 599, 'Stopping The Shakes', 'Stopping The Shakes', 'Défi: L\'allocutaire De La Roche', 'Beschwörer Des Herrn Der Felsen', '岩神呼びし者「ペイトリアーク05 ゼ・ブ」', NULL),
(3, 575, 'Watch Your Tongue', 'Watch Your Tongue', 'Marquée De Votre Lame', 'Oberschlange', '海蛇の船長「刻印のエルムスイス」', NULL),
(4, 126, 'Leader Of The Pack', 'Leader Of The Pack', 'Défi: Le Chef De La Horde', 'Alphatier', '健脚の暴君「アルファ・アノール」', NULL),
(5, 128, 'Alux Of The Draw', 'Alux Of The Draw', 'Défi: Danger Dans Les Geôles', 'Alux Eingekerkert', '強大なる小鬼「アルシュ」', NULL),
(6, 430, 'Return To Cinder', 'Return To Cinder', 'Défi: Sombre Futur Pour Le Voyant', 'Schwarze Zukunft', '運命の代弁者「黒煙のペグジ・チャー」', NULL),
(7, 357, 'There Might Be Giants', 'There Might Be Giants', 'Défi: Un Gênant Géant', 'Die Riesen Sind Los', '黄金兜の大巨人「悲嘆のブリアレオス」', NULL),
(8, 185, 'Micromanaging', 'Micromanaging', 'Défi: Un Parfum De Catastrophe', 'Kleiner Stinker', '幻惑の芳香「クルピラ」', NULL),
(9, 616, 'Breaking Dawn', 'Breaking Dawn', 'Défi: Daxio Le Chimiste', 'Gar Nicht So Harmlos', '幽谷の薬師「覚醒のダキシオ」', NULL),
(10, 650, 'Tender Buttons', 'Tender Buttons', 'Défi: Volatile Carnivore', 'Der Kleine Nimmersatt', '暴食の怪鳥「グルタナスガーティ」', NULL),
(11, 407, 'Spare The Hair', 'Spare The Hair', 'Défi: Comme Un œuf', 'Zum Haare Raufen', '毛髪の簒奪者「ゴッサマー」', NULL),
(12, 634, 'Smells Like Tree Spirit', 'Smells Like Tree Spirit', 'Défi: Chêne Déchaîné', 'Wie Man In Den Wald Ruft', '怒れる守護者「グレートオーク」', NULL),
(13, 374, 'Wrecked Rats', 'Wrecked Rats', 'Ivres Comme Des Rats', 'Revolution Der Ratten', '底無の酒豪「飲んべえググルン」', NULL),
(14, 209, 'My Baby Green', 'My Baby Green', 'Défi: Le Géant Vert', 'Essen Macht Durstig', '水源の破壊者「ジェイデッド・ジョディ」', NULL),
(15, 692, 'What A Boar', 'What A Boar', 'Défi: Ben Mon Cochon!', 'Jetzt Gibt\'s Keile', '狂乱の闘猪「カフレ」', NULL),
(16, 323, 'Giant Enemy Crab', 'Giant Enemy Crab', 'Défi: Crabe Qui Ne Pond Pas...', 'Wehrhafte Delikatesse', '脅威の元食材「カルキノス」', NULL),
(17, 280, 'Jewels Of The Isle', 'Jewels Of The Isle', 'Défi: Voler Aux Riches', 'Was Auf Die Finger', '彷徨の業師「弾指のココルン」', NULL),
(18, 479, 'A Freeze Is Coming', 'A Freeze Is Coming', 'Défi: Glacial Et Mortel', 'Exergoninduzierte Eiszeit', '凍てつく波動「リュタン」', NULL),
(19, 245, 'One Prince', 'One Prince', 'Défi: Le Prince', 'Der Albtraumprinz', '不吉なる王子「マンドラプリンス」', NULL),
(20, 564, 'Say My Name', 'Say My Name', 'Défi: Celui Dont On Ne Doit Pas Prononcer Le Nom', 'Metshaldjas Von Rechts', '不吉な球根「メツハルジャス」', NULL),
(21, 594, 'I\'m A Rock, Not A Number', 'I\'m A Rock, Not A Number', 'Défi: Je Ne Suis Pas Un Numéro', 'Fehlschöpfung', '廃棄された実験体「ナンバー128」', NULL),
(22, 322, 'Truth In Faerie Tales', 'Truth In Faerie Tales', 'Défi: Attention, ça Mord', 'Oannes Aus Dem Grünenden Weiher', '石緑湖の主「オアンネス」', NULL),
(23, 333, 'Under The Bridge', 'Under The Bridge', 'Défi: Lien Brisé', 'Da Bist Du Platt', '豪然たる魔犬「パッドフット」', NULL),
(24, 591, 'Peryton, Perhaps', 'Peryton, Perhaps', 'Défi: Qui A Vu Mon Dragon ?', 'Ende Eines Gerüchts', '伝説の巨竜「ペリュトン」', NULL),
(25, 622, 'The Gale That Rocks The Cradle', 'The Gale That Rocks The Cradle', 'Défi: Une Pulsion Contre Pulxio', 'Ramuh-Früherziehung', '敬虔なる養育者「風狂のプルシオ」', NULL),
(26, 331, 'Peeping Ja', 'Peeping Ja', 'Défi: Un Baigneur Gênant', 'Tänzer Müssen Draußen Bleiben', '悲運の傭兵「美男のブガージャ」', NULL),
(27, 561, 'Closing Time', 'Closing Time', 'Défi: Alcool Triste', 'Geschmack An Wein Und Unrecht', '酒飲み魔獣「セクメト」', NULL),
(28, 153, 'The Hunted', 'The Hunted', 'Défi: La Chasse', 'Großwildjagd', '神速の羚羊「シロッコ」', NULL),
(29, 389, 'A Warm Welcome', 'A Warm Welcome', 'Défi: Un Accueil Brûlant', 'Einen Kühlen Kopf Bewahren', '怒れる宝主「スピットファイア」', NULL),
(30, 455, 'Revenge Of The Worms', 'Revenge Of The Worms', 'La Revanche Des Vers', 'Wir Sind Gewurmt', '砂漠の神皇帝「ウルハドシ」', NULL),
(31, 385, 'Cold-blooded', 'Cold-blooded', 'Défi: Cruelle Créature', 'Sadistisches Vergnügen', '不浄なる大蝦蟇「ヴォジャノーイ」', NULL),
(32, 572, 'Sharknado', 'Sharknado', 'Défi: Qui Veut La Peau Du Requin ?', 'Voll Unter Kontrolle', '冷徹なる戦略家「鮫肌のヴォル」', NULL),
(33, 530, 'V For Vinedetta', 'V For Vinedetta', 'Défi: Parfum Trompeur', 'Hab Vivian Satt', '甘い誘惑「ボラプチュア・ビビアン」', NULL),
(34, 554, 'Spark Off The Bench', 'Spark Off The Bench', 'Défi: Un Hepugg à épurer', 'Schneller Schütze', '速射の名手「火打のハプグ・ロー」', NULL),
(35, 169, 'A Tale Of Two-tails', 'A Tale Of Two-tails', 'Défi: Marché Noir', 'Schwarzer Freitag', '闇市の元締「双尾のヤビ・カータポ」', NULL),
(36, 329, 'Shell Shocked', 'Shell Shocked', 'Défi: Prudence Avec L\'eau Chaude...', 'Kind Der Heißen Quellen', '温泉の申し子「ゾレドナイト」', NULL),
(37, 257, 'I Melt With You', 'I Melt With You', 'Défi: Une Bonne Digestion', 'Zum Dahinschmelzen', '浮かぶ胃袋「クアハック」', NULL),
(38, 619, 'Bush Blade', 'Bush Blade', 'Défi: Vilain Volxia', 'Sylphenkommandantin', '幽谷の衛士「葉刃のヴォルキシア」', NULL),
(39, 178, 'Dschubba Snacks', 'Dschubba Snacks', 'Défi: L\'élu Des Acari', 'In Jedem Siebten Ei', '赤王の幼生「ジュバ」', NULL),
(40, 480, 'Giant Seps', 'Giant Seps', 'Défi: Le Dernier Jour De Seps', 'Schuppe Um Schuppe', '騎兵の天敵「セプス」', NULL),
(41, 589, 'Make It Rain', 'Make It Rain', 'Défi: Peur De L\'orage?', 'Auf Wolkenbruch Raus', '雷雨呼ぶ者「ブラウンガー」', NULL),
(42, 120, 'Clever Girls', 'Clever Girls', 'La Partie De Chasse', 'Dein Revier Endet Hier', '森駆けるスプリンター', NULL),
(43, 121, 'One Enchanted Eve', 'One Enchanted Eve', 'Magie, Magie', 'Magische Pilze', '楽しいキノコ狩り', NULL),
(44, 122, 'Sprig Cleaning', 'Sprig Cleaning', 'スプリガンのお引っ越し', 'In Die Weite Welt Hinein', 'スプリガンのお引っ越し', NULL),
(45, 123, 'Something In The Water', 'Something In The Water', 'Défi: Histoire D\'eau', 'Wasseranomalie', '淀みの奔流「スタグナントスプライト」', NULL),
(46, 124, 'The Sting', 'The Sting', 'Qui S\'y Frotte...', 'Umschwärmt', '虫刺されにご用心', NULL),
(47, 125, 'Asipatra Attacks', 'Asipatra Attacks', 'Défi: Légende Urbaine', 'Fliegendes Verderben', '人喰いの怪鳥「アシパトラ」', NULL),
(48, 127, 'A Mother Scorned', 'A Mother Scorned', 'Qui Vivra Verra', 'Zorn Der Mütter', '怒りの猪突猛進', NULL),
(49, 130, 'エバーシェイドの収穫祭', 'エバーシェイドの収穫祭', 'Sauvetage De Fruits', 'エバーシェイドの収穫祭', 'エバーシェイドの収穫祭', NULL),
(50, 131, 'Lethe On My Mind', 'Lethe On My Mind', 'Le Grand Ménage', 'Auf Dem Präsentierteller', '忘れ得ぬ地神の忘却', NULL),
(51, 136, 'Training Day', 'Training Day', 'La Bleusaille', 'Scharfer Drill', '怒れる教官「激高のミロードン」', NULL),
(52, 137, 'Bleeding Green', 'Bleeding Green', 'Défi: Purification Florale', 'Blattblutbefall', '病毒の妖花「マタガイガイ」', NULL),
(53, 138, 'Tastes Like Chick', 'Tastes Like Chick', 'Limaces Voraces', 'Kükenschutz', 'チョコチョコチョコチョコボ', NULL),
(54, 139, 'Sleep Tight', 'Sleep Tight', 'Le Repos éternel', 'Wie Neu Gestorben', 'あなたの魂に安らぎあれ', NULL),
(55, 140, 'Spirithold Run', 'Spirithold Run', 'Les évadés', 'Ausgangssperre', '大脱走', NULL),
(56, 141, 'Love Is In The Air', 'Love Is In The Air', 'Il Y A De L\'amour Dans L\'air', 'Vergebliche Liebesmüh', 'ガルヴァンス監視哨の援軍要請', NULL),
(57, 142, 'There\'s Something About Lou', 'There\'s Something About Lou', 'Défi: Lou Y Es-tu?', 'Nicht Zum Verzehr Bestimmt', '軟体の大食漢「ル・カルコル」', NULL),
(58, 143, 'Now I See Bees I Won', 'Now I See Bees I Won', 'Le Miel Et Les Abeilles', 'Imp Gegen Imme', '蜂蜜戦争', NULL),
(59, 144, 'Royal Rumble', 'Royal Rumble', 'Défi: Match Au Sommet', 'Nase Zu Und Durch', '悪疫散布器「プリンス・オブ・ペスト」', NULL),
(60, 145, '戦場までは何マルム？', '戦場までは何マルム？', 'Jusqu\'au Champ De Bataille', '戦場までは何マルム？', '戦場までは何マルム？', NULL),
(61, 148, 'What A Bee Wants', 'What A Bee Wants', 'Massacre De Limaces', 'Futterneid', '秘密の花園', NULL),
(62, 149, 'Stopping The Spread', 'Stopping The Spread', 'Stop à La Propagation', 'Eingeschleppt', '繁殖期の終わり', NULL),
(63, 150, 'Jack Of All Trades', 'Jack Of All Trades', 'Défi: Les Fauteurs De Trouble', 'Affenbande', '若き魔猿「ジャッカネイプス」', NULL),
(64, 151, 'リトルブリッジの戦い', 'リトルブリッジの戦い', 'Le Petit Pont De Bois', 'リトルブリッジの戦い', 'リトルブリッジの戦い', NULL),
(65, 152, 'Protecting The Patch', 'Protecting The Patch', 'La Protection Du Massif', 'Wirr Im Wipfel', '狂える守護者たち', NULL),
(66, 154, 'Eft For Dead', 'Eft For Dead', 'Menace Amphibie', 'Molchminimierung', '根を渡って沼地を越えて', NULL),
(67, 158, 'The Negotiators', 'The Negotiators', 'Les Négociateurs', 'Schlichtungsstelle', '密猟売買両成敗', NULL),
(68, 159, 'Breaching The Hive', 'Breaching The Hive', 'Nid De Guêpes: Les Infiltrés', 'Das Nest Sprengen', 'レッドベリー砦の戦い：攻略戦', NULL),
(69, 160, 'Clearing The Hive', 'Clearing The Hive', 'Nid De Guêpes: Colonisation', 'Das Nest Säubern', 'レッドベリー砦の戦い：占領戦', NULL),
(70, 161, 'Defending The Hive', 'Defending The Hive', 'Nid De Guêpes: Alliance Défensive', 'Das Nest Verteidigen', 'レッドベリー砦の戦い：防衛戦', NULL),
(71, 162, 'Keeping The Hive', 'Keeping The Hive', 'Nid De Guêpes: Défense Du Nid', 'Das Nest Halten', 'レッドベリー砦の戦い：迎撃戦', NULL),
(72, 163, 'Kickin\' It With The Kedtraps', 'Kickin\' It With The Kedtraps', 'Désherbage Massif', 'Fallenfäller', '最後の一葉', NULL),
(73, 164, 'The Coeurl King', 'The Coeurl King', 'Défi: Imposture Royale', 'Königsklauen Stutzen', '秀麗なる無法者「密猟王クァールクロウ」', NULL),
(74, 166, 'Another Round', 'Another Round', 'Une Tournée De Trop', 'Eine Runde Aufs Haus', '酒房の常連「酔客のスペンサー」', NULL),
(75, 167, 'Stag Parting', 'Stag Parting', 'Brames Dans La Nuit', 'Ruhig Blut', '愛に時間を', NULL),
(76, 168, 'Hide And Seek', 'Hide And Seek', 'Sus à La Contrebande', 'Kurzen Prozess', '動かぬ証拠', NULL),
(77, 170, 'To Whom The Toll Goes', 'To Whom The Toll Goes', 'À Qui Profite Le Crime', 'Mautstelle', '通行料の支払いは刃で', NULL),
(78, 171, 'Eat In, Hide Out', 'Eat In, Hide Out', 'Bandits En Fuite', 'Hinterholz', '立ち退き要求', NULL),
(79, 172, 'Robbin\' Goblins', 'Robbin\' Goblins', 'Gobelins Malhonnêtes', 'Unrecht Gut', '失われた品を求めて', NULL),
(80, 173, '※β1不要：ウォータースプライトの大量発生', '※β1不要：ウォータースプライトの大量発生', '※β1不要：ウォータースプライトの大量発生', '※β1不要：ウォータースプライトの大量発生', '※β1不要：ウォータースプライトの大量発生', NULL),
(81, 174, 'No Birds Allowed', 'No Birds Allowed', 'Voler Dans Les Plumes', 'Dreh Dich Nicht Um', '烏合の衆', NULL),
(82, 178, 'Dschubba Snacks', 'Dschubba Snacks', 'Défi: L\'élu Des Acari', 'In Jedem Siebten Ei', '赤王の幼生「ジュバ」', NULL),
(83, 179, 'Now Fall', 'Now Fall', 'Protecteur Du Radeau', 'Milbenstopp', 'フォールゴウドの守り手', NULL),
(84, 180, 'That Which Binds Us', 'That Which Binds Us', 'Le Lien De Vie', 'Emeth', '山師の願い', NULL),
(85, 182, '真理は死んだ', '真理は死んだ', 'Sans Logique', 'Dogma', '真理は死んだ', NULL),
(86, 183, 'Breaking Bud', 'Breaking Bud', 'Menace Simiesque', 'Gesegnete Zone', '猿の惑乱', NULL),
(87, 184, 'The Magical Fruit', 'The Magical Fruit', 'La Faim Des Haricots', 'Verbotene Frucht', 'みんな大好きムントゥイ豆', NULL),
(88, 187, 'The Big Issue', 'The Big Issue', 'La Caravane Passe', 'Angriff Der Ixal', 'イクサル族強襲部隊の迎撃', NULL),
(89, 188, 'It Ziz What It Is', 'It Ziz What It Is', 'Un Appétit D\'oiseau', 'Ziz Will Einen Keks', '餓えたるジズが求めるもの', NULL),
(90, 189, 'Hare Today', 'Hare Today', 'Dangereux Xylophages', 'Rutschstopp', 'アルダースプリングスの清掃', NULL),
(91, 190, 'Where The Stone Rolls', 'Where The Stone Rolls', 'Défi: Un Grand Fracas', 'Kehr Zurück In Deinen Staub', '孤独なる石兵「ヌニュヌウィ」', NULL),
(92, 191, 'Attack On Highbridge: Prelude', 'Attack On Highbridge: Prelude', 'Assaut Sur Le Viaduc: Prélude', 'Schlacht Um Hohenbrück: Der Ansturm', 'ハイブリッジの死闘：前哨戦', NULL),
(93, 192, 'Attack On Highbridge: Act I', 'Attack On Highbridge: Act I', 'Assaut Sur Le Viaduc: Acte I', 'Schlacht Um Hohenbrück: Die Verteidigung', 'ハイブリッジの死闘：防衛戦', NULL),
(94, 193, 'Attack On Highbridge: Act II', 'Attack On Highbridge: Act II', 'Assaut Sur Le Viaduc: Acte II', 'Schlacht Um Hohenbrück: Duell Mit Zuzuroon', 'ハイブリッジの死闘：ズズルン排撃', NULL),
(95, 194, 'Attack On Highbridge: Act III', 'Attack On Highbridge: Act III', 'Assaut Sur Le Viaduc: Acte III', 'Schlacht Um Hohenbrück: Duell Mit Nayokk Roh', 'ハイブリッジの死闘：ナヨク・ロー排撃', NULL),
(96, 195, 'Attack On Highbridge: Denouement', 'Attack On Highbridge: Denouement', 'Assaut Sur Le Viaduc: Dénouement', 'Schlacht Um Hohenbrück: Die Entscheidung', 'ハイブリッジの死闘：市民奪還作戦', NULL),
(97, 196, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(98, 197, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(99, 198, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(100, 199, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(101, 200, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(102, 201, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(103, 202, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(104, 203, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(105, 204, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(106, 205, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(107, 206, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(108, 207, 'Steel Reign', 'Steel Reign', 'Défi: Le Chevalier Des Ombres', 'Der Dunkle Reiter', '古の闘神「オーディン」', NULL),
(109, 208, 'Lady Killer', 'Lady Killer', 'Massacre D\'insectes', 'Käfer Außer Rand Und Band', 'レディキラー', NULL),
(110, 212, 'Ivy League', 'Ivy League', 'Les Envahisseurs', 'Neunundneunzig Efeuranken', 'ナインティナインアイビー', NULL),
(111, 213, 'Thunderstruck', 'Thunderstruck', 'L\'offrande', 'Von Den Sylphen Verweht', 'シルフと共に去りぬ', NULL),
(112, 214, 'Carrion Baggage', 'Carrion Baggage', 'Le Festin Des Vautours', 'Geierschmaus', '禿鷲の饗宴', NULL),
(113, 215, 'Conspiracy Theory', 'Conspiracy Theory', 'Pas De Pitié Pour Les Truands', 'Wie Motten Zum Licht', '飛んで火に入る似我蜂団', NULL),
(114, 216, 'Waiting For A Moon To Fall', 'Waiting For A Moon To Fall', 'Les Rejetons De La Lune Rouge', 'Mondgestein', '月の反逆者', NULL),
(115, 217, 'What Have You Done For Mead Lately', 'What Have You Done For Mead Lately', 'L\'appel De L\'hydromel', 'Die Süße Versuchung', '甘い香りの運び人', NULL),
(116, 218, 'Lazy For You', 'Lazy For You', 'Défi: Laurence Pas Ravie', 'Undank Des Faulen', '非情な収穫者「レジー・ローレンス」', NULL),
(117, 220, 'Menuis At Work', 'Menuis At Work', 'Défi: Menuis Le Terrible', 'Aus Dir Mach Ich Suppe', '巨躯の猛牛「メヌイス」', NULL),
(118, 221, 'Overnight Migration', 'Overnight Migration', 'Migration Nocturne', 'Schlimmer Als Unkraut', 'サマーフォードの怪', NULL),
(119, 222, 'Go Wespe', 'Go Wespe', 'Ça Va Piquer', 'Palastrevolte', 'ヴェスパとイエロージャケット', NULL),
(120, 223, 'A Mad, Mad, Mad Sergeant', 'A Mad, Mad, Mad Sergeant', 'Un Homme à Abattre', 'Die Harte Schule', 'デネベール関門防衛訓練', NULL),
(121, 225, 'Thwack-a-Mole', 'Thwack-a-Mole', 'Taupe Départ', 'Mulle Auf Die Stulle', '果てなきモグラ叩き', NULL),
(122, 226, 'Yellow-bellied Greenbacks', 'Yellow-bellied Greenbacks', 'Pitoyables Recrues', 'Übermut Tut Selten Gut', '海軍式の通過儀礼', NULL),
(123, 227, 'On The Lamb', 'On The Lamb', 'La Violence Des Agneaux', 'Unter Schafen', '羊たちの騒乱', NULL),
(124, 229, 'The Orange Boxes', 'The Orange Boxes', 'Les Caisses D\'oranges', 'Es Rappelt In Der Kiste', '上には上がある', NULL),
(125, 231, 'Shearing Is Caring', 'Shearing Is Caring', 'Défi: Qui S\'y Frotte S\'y Pique', 'Das Große Krabbenpulen', '切断狂「シアリング・シェリダン」', NULL),
(126, 233, 'The Boy Who Cried Jackal', 'The Boy Who Cried Jackal', 'L\'enfant Qui Criait Au Loup', 'Schalk Und Schakale Im Nacken', '追う者と追われる者', NULL),
(127, 235, 'Sister Crustacean', 'Sister Crustacean', 'La Famille Avant Tout', 'Nicht Ohne Meine Eier', 'その水棲動物を見よ', NULL),
(128, 237, 'Hello, Work', 'Hello, Work', 'De Nouvelles Perspectives', 'Gekenterte Existenzen', '農場にかける橋', NULL),
(129, 238, 'The Truth Is Out There', 'The Truth Is Out There', 'Défi: La Vérité Est Ailleurs', 'Blut Geleckt', '血濡れの猛犬「チュパカブラ」', NULL),
(130, 239, 'Taking It To The Streams', 'Taking It To The Streams', 'Nettoyage De Printemps', 'Frischer Fisch Frisst Fischers Fische', '麗しのローグ川', NULL),
(131, 240, 'Crying Over Spilled Salt', 'Crying Over Spilled Salt', 'Agriculture Sauvage', 'Salziger Regen', 'クラゲが飛んだ日', NULL),
(132, 246, 'Fight The Flower', 'Fight The Flower', 'Dangereux Végétaux', 'Eine Rose Ist Eine Rose', '危ない野良仕事', NULL),
(133, 249, 'You Call That A Toad', 'You Call That A Toad', 'Problème De Nuisibles', 'Krötenplage', '蛙の子は蛙', NULL),
(134, 250, 'Caving In', 'Caving In', 'Virus Fulgurant', 'Fledermäuse Mit Biss', '黒い翼', NULL),
(135, 251, 'Man Of The Flour', 'Man Of The Flour', 'Vol De Farine', 'Rätselhafte Galagos', '小麦粉戦争', NULL),
(136, 260, 'Away In A Bilge Hold', 'Away In A Bilge Hold', 'Mise Au Placard', 'Blinder Passagier', '迷惑千万「密航のアクトシュティム」', NULL),
(137, 261, 'In The Name Of Love', 'In The Name Of Love', 'Défi: Au Nom De L\'amour', 'Liebe Reimt Sich Auf Hiebe', '俺たちゃ海賊', NULL),
(138, 262, 'Don\'t Drink The Water', 'Don\'t Drink The Water', 'Eau Non Potable', 'Wir Müssen Draußen Bleiben', '水場の争い', NULL),
(139, 264, 'Enter Beastman', 'Enter Beastman', 'L\'éveil Des Bêtes', 'Lauter Klabauter', 'シダーウッドの戦い', NULL),
(140, 267, 'Finding Wine', 'Finding Wine', 'Partage De La Soif', 'Mein Wein Bleibt Mein Wein', 'ワインよこせ！', NULL),
(141, 268, 'The Thirst', 'The Thirst', 'Plan De Poivrots', 'Seeräubersommelier In Spe', 'ワイン飲みてぇ！', NULL),
(142, 271, 'Thrill Of The Hunt', 'Thrill Of The Hunt', 'Peur Du Vide', 'Frischfleischlieferung', '新鮮な生肉', NULL),
(143, 272, 'The Pelican Briefing', 'The Pelican Briefing', 'Appel Aux Pélicans', 'Wo Gesammelt Wird, Da Fliegen Federn', 'エッグモンスター', NULL),
(144, 274, 'Them', 'Them', 'Microcosme', 'Mantis Mantis Timpe Te', 'ミクロの決死隊', NULL),
(145, 278, 'Careless Whiskers', 'Careless Whiskers', 'Maudites Moustaches', 'Rattige Hausbesetzer', '白い巨塔', NULL),
(146, 279, 'No Lip', 'No Lip', 'Colibris Voleurs', 'Kalkreiche Kost', 'コリブリたちの食卓', NULL),
(147, 282, 'Crab And Go', 'Crab And Go', 'La Fin Des Crabes', 'Schnippische Schnippler', '海辺のスニッパー', NULL),
(148, 286, 'Follow The Light', 'Follow The Light', 'Suivez La Lumière', 'Angriff Der Geisterpiraten', '死者の代弁者', NULL),
(149, 287, 'Just A Matter Of Rut', 'Just A Matter Of Rut', 'La Saison Des Amours', 'Weibchenlos, Ledig, Jung', '愛はさだめ、さだめは死', NULL),
(150, 289, 'Absolutely, Positively', 'Absolutely, Positively', 'Livraison De Missive', 'Für Nachschub Ist Gesorgt', '補給線を支えろ', NULL),
(151, 290, 'Tender Buttons', 'Tender Buttons', 'Défi: Volatile Carnivore', 'Der Kleine Nimmersatt', '暴食の怪鳥「グルタナスガーティ」', NULL),
(152, 291, 'The Killing Fields', 'The Killing Fields', 'Sauvagerie Animale', 'Zwischen Ähren Liegt Ehre', '小麦畑でつかまえて', NULL),
(153, 295, '(I Just) Died In Six Arms Tonight', '(I Just) Died In Six Arms Tonight', 'Défi: Le Crabe De Légende', 'Sechs Richtige ... Arme', '古強者「オールドシックスアームズ」', NULL),
(154, 297, 'Iron Contra Affair', 'Iron Contra Affair', 'La Fin De La Contrebande', 'Steuerprüfung', '税関公社の強制捜査', NULL),
(155, 298, 'Don\'t Call Him A Fishback', 'Don\'t Call Him A Fishback', 'De Redoutables Aquatiques', 'Plündernde Schlangen', '敵は海賊・海蛇の舌', NULL),
(156, 303, 'Letters From Tidegate', 'Letters From Tidegate', 'Lettres Du Front', 'Grüße Aus Der Heimat', '故郷からの手紙', NULL),
(157, 304, 'The Last Straw', 'The Last Straw', 'Destruction De Nids', 'Turtel-Dodos', 'ドードーの巣破壊命令', NULL),
(158, 306, 'Barometz Soup', 'Barometz Soup', 'Défi: Soupe De Barometz', 'Ausgewogene Ernährung', '死活の罠「バロメッツ」', NULL),
(159, 308, 'Goblin Chain', 'Goblin Chain', 'Barrage De Gobelins', 'Geplatzte Verhandlungen', '交渉決裂', NULL),
(160, 309, 'Tryp Fantastic', 'Tryp Fantastic', 'Défi: L\'adieu Au Mercenaire', 'Der Typ Rafft\'s Nicht', '愚鈍な用心棒「間抜のトリップティックス」', NULL),
(161, 310, 'Between Aurochs', 'Between Aurochs', 'Expulsion D\'aurochs', 'Straßenblockade', '決闘デネベール街道', NULL),
(162, 312, 'In The Sac', 'In The Sac', 'Sac Mortel', 'Erst Wimmeln, Dann Wimmern', '昆虫軍団現わる', NULL),
(163, 314, 'Simurgh Is The Word', 'Simurgh Is The Word', 'Défi: Simurgh Le Redoutable', 'Schrecken Der Coeurl', '豹喰いの妖鳥「シームルグ」', NULL),
(164, 317, 'Surprise', 'Surprise', 'Escorte Pour Le Guet', 'Schutz Und Hilfe', '輸送部隊防衛命令', NULL),
(165, 320, 'The Road More Traveled', 'The Road More Traveled', 'Mamool Repart Chez Maman', 'Heute Freund, Morgen Feind', '昨日の友は今日の敵', NULL),
(166, 321, 'Nine-ilm Snails', 'Nine-ilm Snails', 'Frapper Dans L\'œuf', 'Schlammschlacht', '湯煙温泉殺貝事件', NULL),
(167, 332, 'Hop, Skip, And A Jump', 'Hop, Skip, And A Jump', 'Trop D\'œufs, Bonjour Les Dégâts', 'Läufer überm Bronzesee', '湖面を駆けろ！', NULL),
(168, 334, 'Consigned, Sealed, And Undelivered', 'Consigned, Sealed, And Undelivered', 'Complainte D\'une Fille De Choix', 'Frühlingsnachtstraum', '夏への扉', NULL),
(169, 335, 'It\'s Not Lupus', 'It\'s Not Lupus', 'Défi: Cancer, Le Casque De Mort', 'Krabbe XXL', '死顔の簒奪者「キャンサー」', NULL),
(170, 336, 'The Mandragoras', 'The Mandragoras', 'Le Gang Des Légumes', 'Die Botanische Revolution', '野菜革命「マンドラーズ」', NULL),
(171, 342, 'Needles To Slay', 'Needles To Slay', 'Épineux Végétaux', 'Chaos In Grün', '緊急停止', NULL),
(172, 343, 'Things That Make You Go Home', 'Things That Make You Go Home', 'Investir Dans La Pierre', 'Knabberspaß', '強制立ち退き', NULL),
(173, 344, 'Deface The Facts', 'Deface The Facts', 'V Pour Vandalisme', 'V Wie Vandalen', '階級的怒りの鉄槌', NULL),
(174, 345, 'Please Hammers, Don\'t Hurt Them', 'Please Hammers, Don\'t Hurt Them', 'Bruyants Volatiles', 'Hammerharte Hammerschnäbel', '大地のハンマー', NULL),
(175, 346, 'The Cores', 'The Cores', 'Le Nerf De La Terre', 'Der Kern Der Sache', 'ミッション・アース', NULL),
(176, 347, 'Doomed', 'Doomed', 'Défi: Maudit Crapaud Maudit', 'Verdammt Und Verdorben', '謎の巨大生物「ドゥーム・ギガントード」', NULL),
(177, 348, 'The Villain', 'The Villain', 'Défi: Le Hors-la-loi', 'Kaktor Jack', '砂漠の覇王「カクター・ジャック」', NULL),
(178, 349, 'Copied Peistes', 'Copied Peistes', 'La Peste Soit Des Peistes', 'Wegelagerer', '荒野の用心棒', NULL),
(179, 350, 'Dog Eat Dog', 'Dog Eat Dog', 'Attention, Hourets Méchants', 'Gemischte Gefühle', '野良犬たちの挽歌', NULL),
(180, 352, 'Bigger Fish To Fry', 'Bigger Fish To Fry', 'Sauvetage De Pêcheurs', 'Orobon Overkill', '罪のない残虐', NULL),
(181, 353, 'Bubble Trouble', 'Bubble Trouble', 'Défi: Douceur Locale', 'Bernie Gegen Den Rest Der Welt', '飽食の大蟹「バブリーバーニー」', NULL),
(182, 354, 'Tripped Up By The Fruit Of Another', 'Tripped Up By The Fruit Of Another', 'Attention, Sol Glissant', 'Krankentransport', '負傷者を護送せよ', NULL),
(183, 355, 'Juggernaut Down', 'Juggernaut Down', 'Les Décombres Du Juggernaut', 'Die Kämpfe Dauern Fort', '戦いは、なおも続いた', NULL),
(184, 356, 'A Matter Of Rust', 'A Matter Of Rust', 'Une Question De Minerai', 'Kobalos-Wanderung', 'コブラン族の大移動', NULL),
(185, 361, 'Pound For Pound', 'Pound For Pound', 'Coup Sur Coup', 'Schnabelweise Vögel', 'ハンマーチャンス', NULL),
(186, 366, 'He\'s Got Legs', 'He\'s Got Legs', 'Défi: Le Monstre Aux Grandes Pattes', 'Opa Lässt Das Meucheln Nicht', '足長おやじ「ダディーロングレッグ」', NULL),
(187, 367, 'Staying Dead', 'Staying Dead', 'Retour à La Mort', 'Geisterjäger', 'ゴーストバスター', NULL),
(188, 370, 'Something To Prove', 'Something To Prove', 'Défi: Quelque Chose à Prouver', 'Kräftemessen', '粗野な勝負師「無頼のグリスヒルド」', NULL),
(189, 373, 'Like An Eft Out Of Water', 'Like An Eft Out Of Water', 'Comme Un Triton Hors De L\'eau', 'Füttern Verboten', '夕飯を渡すな！', NULL),
(190, 375, 'Survivor Rats', 'Survivor Rats', 'Des Rats Bien Téméraires', 'Die Würfel Sind Gefallen', 'コッファー与えず、コフィンに送れ', NULL),
(191, 376, 'Cracked', 'Cracked', 'Défi: Fêlure', 'Windelweich Gekocht', '半熟英雄「半熟のババルン」', NULL),
(192, 377, 'Orobon Part Two: The Spawning', 'Orobon Part Two: The Spawning', 'Animé Par La Vengeance', 'Ein Angler Am Haken', '殺人魚スポーニングキラー', NULL),
(193, 378, 'Let Them Eat Cactus', 'Let Them Eat Cactus', 'Salade De Cactuars', 'Mein Kleiner Grüner Kaktor', 'サボテンサラダ', NULL),
(194, 379, 'For The Queen', 'For The Queen', 'Pour La Reine', 'Ameisen Auf Wohnungssuche', 'アリだー！', NULL),
(195, 381, 'A Few Arrows Short Of A Quiver', 'A Few Arrows Short Of A Quiver', 'Le Manoir Aux Voleurs', 'Identitätsdiebe', 'キヴロン家の住人', NULL),
(196, 383, 'Big Time', 'Big Time', 'Massacre De Volatiles', 'Freie Fahrt Für Freie Bürger', '街道をゆく', NULL),
(197, 393, 'Leaving The Nest', 'Leaving The Nest', 'Défi: Sortie Du Nid', 'Sein Letztes Kommando', '砂城の猛将「ネストコマンダー」', NULL),
(198, 394, 'Men Who See Goats', 'Men Who See Goats', 'Des Chèvres Voraces', 'Ganz Schön Bockig', '野獣死すべし', NULL),
(199, 395, 'License To Quill', 'License To Quill', 'De Mortels Piquants', 'Wer Anderen Eine Grube Gräbt', 'その硬さ、鋼の如し', NULL),
(200, 397, 'Westward Bound', 'Westward Bound', 'En Route Vers L\'ouest', 'Vormarsch Der Amalj\'aa', 'アマルジャ軍迎撃作戦', NULL),
(201, 398, 'Bad Camp', 'Bad Camp', 'Défi: Destruction De Camp', 'Ein Paar Aufs Maul', '侵攻作戦を阻止せよ', NULL),
(202, 400, 'Bazaar Blood Triangle', 'Bazaar Blood Triangle', 'Quel Bazar', 'Verteidigung Des Goldbasars', 'ゴールドバザー防衛戦', NULL),
(203, 401, 'Grim Undertakings', 'Grim Undertakings', 'Défi: Deux Yalms Sous Terre', 'Rendezvous Mit Dem Tod', '煉獄の墓掘人「アンダーテイカー」', NULL),
(204, 402, 'Simple Minds', 'Simple Minds', 'Esprits Malfaisants', 'Räuber Und Gendarm', '盗賊もどきの成敗', NULL),
(205, 406, 'Manifest Destiny', 'Manifest Destiny', 'Volonté Divine', 'Den Spieß Umdrehen', '東部戦線異状なし', NULL),
(206, 409, 'Desert Rose', 'Desert Rose', 'Rose Des Sables', 'Unerwünschtes Unkraut', '妖花前線', NULL),
(207, 412, 'Almost Paradise', 'Almost Paradise', 'Le Prix De L\'eau', 'Sicherung Der Wasserversorgung', '楽園の泉', NULL),
(208, 413, 'Deep In The Heart Of Sagolii', 'Deep In The Heart Of Sagolii', 'Les Longues-cornes Se Cachent Pour Mourir', 'Hörner Sind Zum Stutzen Da', '長角の古老「エルダー・ロングホーン」', NULL),
(209, 419, 'Adventures In Throat Slitting', 'Adventures In Throat Slitting', 'Défi: Mise à Mort', 'Miluda Die Schlitzerin', '骸の頭目「流転のミルウーダ」', NULL),
(210, 420, 'The Corpse Bribe', 'The Corpse Bribe', 'Adieu Les Pots-de-vin', 'Gefallene Helden', 'スープに肉を入れるため', NULL),
(211, 421, 'Downwind', 'Downwind', 'Odeur Alléchante', 'Verteidigung Von Klein-Ala Mhigo', 'リトルアラミゴ防衛戦', NULL),
(212, 422, 'Soul Man', 'Soul Man', 'Tout Pour L\'âme', 'Marmor, Stein Und Eisen Brechen', '真理を解き明かせ', NULL),
(213, 423, 'Bigger Than Life', 'Bigger Than Life', 'Défi: Attention, Aspidochélon Méchant', 'Kröte Mit Eisernem Schild', '大らかな圧殺者「アスピドケロン」', NULL),
(214, 424, 'Heroes Of The 2nd', 'Heroes Of The 2nd', 'Protéger Ses Arrières', 'Hauptbrigadier Für Einen Tag', '我ら第二戦闘大隊', NULL),
(215, 427, 'Diamond In The Rough', 'Diamond In The Rough', 'Défi: La Meilleure Défense...', 'Auf Der Abschussliste', '怒濤の怪力「金剛のネゼド・ガー」', NULL),
(216, 429, 'Children Of The Sands', 'Children Of The Sands', 'Enfants Des Sables', 'Die Kinder Der Wüste', '砂漠の子供たち', NULL),
(217, 431, 'Hunters And The Hunted', 'Hunters And The Hunted', 'Chasser Ou être Chassé', 'Kein Nachschub Für Zanr\'ak', '狩る者と狩られる者', NULL),
(218, 432, 'From Point A', 'From Point A', 'Escorte Culturelle', 'Begleitschutz', '工神ビエルゴの守護者', NULL),
(219, 434, 'Run Like A Flame', 'Run Like A Flame', 'Course-poursuite Mortelle', 'Der Kundschafter Und Seine Unerwünschte Kundschaft', '偵察兵の仕事', NULL),
(220, 436, 'Blood, Augur, Hex, Magicks', 'Blood, Augur, Hex, Magicks', 'Défi: Une Magie Maléfique', 'Der Gift Und Galle Spuckt', '無道の暗殺者「呪言のマラド・チャー」', NULL),
(221, 437, 'Fish Out Of Water', 'Fish Out Of Water', 'Mise En Ordre', 'Mehr Strand Als Meer', '渇きの海', NULL),
(222, 441, 'Harder, Bigger, Faster, Stronger', 'Harder, Bigger, Faster, Stronger', 'Survie Du Plus Apte', 'Ein Maulkorb Für Kampf-Drakons', 'まるで我が子の様に', NULL),
(223, 446, 'With One Eye Open', 'With One Eye Open', 'Défi: Le Borgne Ravisseur', 'Arimaspi-Alarm', '虚像の眼「アリマスピ」', NULL),
(224, 447, 'Under The Nails', 'Under The Nails', 'Basilics Illicites', 'Erdseim Geht Vor', '爪切り', NULL),
(225, 449, 'Boom Goes The Ceruleum', 'Boom Goes The Ceruleum', 'Le Feu Aux Poudres', 'Brandschutzmaßnahmen', '火の用心', NULL),
(226, 450, 'Knock On Steel', 'Knock On Steel', 'Défi: Le Drone De Fer', 'Der Erste Wird Der Letzte Sein', '新装甲採用機「魔導ヴァンガード試験型」', NULL),
(227, 451, 'Poor Maid\'s Mess', 'Poor Maid\'s Mess', 'Pauvre Hameau: Des Rats Qui Grignotent', 'Köter Gegen Ratten', 'プアメイドミル復興：食料防衛', NULL),
(228, 452, 'Poor Maid\'s Mishap', 'Poor Maid\'s Mishap', 'Pauvre Hameau: Des Kobolds Qui Saccagent', 'Ungebetene Gäste', 'プアメイドミル復興：ゲ・ブ排撃', NULL),
(229, 453, 'Poor Maid\'s Misfortune', 'Poor Maid\'s Misfortune', 'Pauvre Hameau: Des Coeurls Qui Battent', 'Vorsicht Bissig', 'プアメイドミル復興：クァール討伐', NULL),
(230, 454, 'Poor Maid\'s Misadventure', 'Poor Maid\'s Misadventure', 'Pauvre Hameau: Des Buffles Qui Piétinent', 'Büffeln Statt Büffel', 'プアメイドミル復興：野牛討伐', NULL),
(231, 456, 'Bump And Grind', 'Bump And Grind', 'Défi: Exécution Sommaire', 'Buße Sollst Du Tun', '持たざる者「破戒のギスフリッド」', NULL),
(232, 457, 'Reverse Engineering', 'Reverse Engineering', 'Ingénierie Inversée', 'Reverse Engineering', 'リバースエンジニアリング', NULL),
(233, 460, 'Twelve Ilms Of Snow', 'Twelve Ilms Of Snow', 'Un Loup Pour L\'homme', 'Wer Fürchtet Sich', '白狼たちの戦旗', NULL),
(234, 463, 'Baa Baa Black Sheep', 'Baa Baa Black Sheep', 'Défi: Tondre Le Mouton Noir', 'Pech Für Schwarze Schafe', '黒き弾丸「ダウニーダンスタン」', NULL),
(235, 464, 'Gavial', 'Gavial', 'Défi: Cric, Crac, Croc!', 'Gaviator - Tag Der Abrechnung', '川辺の復讐者「ガビアル」', NULL),
(236, 465, 'Whiteout', 'Whiteout', 'Conte D\'hiver', 'Hart Ist Der Winter', '冬物語', NULL),
(237, 466, 'A Log Up', 'A Log Up', 'Prier Sa Bonne étoile', 'Astrologische Aufzeichnungen', '星に願いを', NULL),
(238, 467, 'Croc-y Road', 'Croc-y Road', 'Imbroglio Avec Crocos', 'Domigator-Dompteur', 'ワイルドダイルダンディー', NULL),
(239, 469, 'The Grey', 'The Grey', 'Dans La Gueule Du Piège', 'Wölfe Wittern Blut', 'クルザスの白狼', NULL),
(240, 470, 'Simply Red', 'Simply Red', 'Pillards à Corne Rouge', 'Nichts Da', '動く要塞', NULL),
(241, 472, 'Spring Forward, Fall Back', 'Spring Forward, Fall Back', 'La Source Des Ennuis', 'Wertschöpfung', '流れよ我が涙', NULL),
(242, 473, 'A Fire In The Distance', 'A Fire In The Distance', 'Le Comble De La Crevasse', 'Irregeleitet', '歓喜、慚愧、猛吹雪', NULL),
(243, 474, 'Coming To A Head', 'Coming To A Head', 'Ici Sont Les Dragons', 'Drachenbelagerung', 'エイビスキラー', NULL),
(244, 475, 'Bellyful', 'Bellyful', 'Défi: Dans La Gamelle De Gargamelle', 'Schluss Mit Gargamelle', '大口の悪鬼「ガルガメル」', NULL),
(245, 480, 'Giant Seps', 'Giant Seps', 'Défi: Le Dernier Jour De Seps', 'Schuppe Um Schuppe', '騎兵の天敵「セプス」', NULL),
(246, 482, 'Riddle Me This', 'Riddle Me This', 'Savoir Asséner La Bonne Réponse', 'Riesenumweg', '血と肉の街道舗装', NULL),
(247, 483, 'Judge, Jury, And Executioner', 'Judge, Jury, And Executioner', 'Le Dernier Rempart Du Jugement', 'Drachenfliegen', '引き起こされた戦争', NULL),
(248, 484, 'In The Saint\'s Wake', 'In The Saint\'s Wake', 'Défi: Périlleuse Pérégrination', 'Pilger In Gefahr', '骨貪る者「ロンジュール」', NULL),
(249, 486, 'Tower Of Power', 'Tower Of Power', 'Un Giga Problème', 'Der Wille Von Haillenarte', 'アインハルトの意地', NULL),
(250, 487, 'Turn Off Your Hearthlight', 'Turn Off Your Hearthlight', 'Durendaire Dur à Cuire', 'Auf Der Suche Nach Wärme', '暖を求めて', NULL),
(251, 489, 'What\'s On Your Mind', 'What\'s On Your Mind', 'Ce Qui Vient Du Néant Doit Y Repartir', 'Zerstreuung Für Pilger', '巡礼の道', NULL),
(252, 490, 'The Bigger They Are', 'The Bigger They Are', 'Défi: Que Ferait Un Géant Sans Son Chef?', 'Kein Sieg Für Klythios', '愚鈍なる勇者「クリュティオス」', NULL),
(253, 491, 'Wish Upon A Star', 'Wish Upon A Star', 'Ce Que Disent Les étoiles', 'Horoskop Für Drachenkopf', '星の光、今は遠く', NULL),
(254, 493, 'The Taste Of Fear', 'The Taste Of Fear', 'Défi: Se Battre Sobek Et Ongles', 'Späte Vergeltung', '雪山の襲撃者「セベク」', NULL),
(255, 494, 'Roc Of Ages', 'Roc Of Ages', 'Défi: Volatile Pêcheur', 'Rotgeflügelter Roc', '赤い翼「ロック」', NULL),
(256, 496, 'Front And Center', 'Front And Center', 'Qu\'ils S\'arrêtent à L\'Arête', 'Auf Ruf Der Drachen', 'それは竜の意思！', NULL),
(257, 497, 'If This Wall Could Talk', 'If This Wall Could Talk', 'Élémentaires à Congeler', 'Abtauen', '氷づけになるがいい！', NULL),
(258, 498, 'Does Anyone Hear It', 'Does Anyone Hear It', 'Déforestation Sauvage', 'Gestohlen Gut', '入植を阻止せよ', NULL),
(259, 499, 'The Four Winds', 'The Four Winds', 'Défi: Les Quatre Sœurs Du Malheur', 'Wilde Schwestern', '烈風の勇士「フェロック四姉妹」', NULL),
(260, 500, 'Inspector Hatchet', 'Inspector Hatchet', 'Défi: Le Tronçonneur', 'Kein Holz Für Natalan', '匠の技「工匠のゴゾル・イツカン」', NULL),
(261, 501, 'Svara\'s Flight', 'Svara\'s Flight', 'Svara S\'en Est Venu: Dragon En Vue', 'Wettlauf Gegen Svara', 'スヴァラ迎撃作戦：工兵護送', NULL),
(262, 502, 'Svara\'s Fear', 'Svara\'s Fear', 'Svara S\'en Est Venu: Le Siège', 'Kanone Gegen Svara', 'スヴァラ迎撃作戦：砲撃準備', NULL),
(263, 503, 'Svara\'s Fall', 'Svara\'s Fall', 'Svara S\'en Est Venu: Les Canons Anti-dragon', 'Feuer Frei Auf Svara', 'スヴァラ迎撃作戦：砲撃応戦', NULL),
(264, 504, 'Svara\'s Fury', 'Svara\'s Fury', 'Svara S\'en Est Venu: La Colère Du Dragon', 'Wehrlos Vor Svara', 'スヴァラ迎撃作戦：人海戦術', NULL),
(265, 505, 'Behold Now Behemoth', 'Behold Now Behemoth', 'Défi: L\'ire Du Béhémoth', 'Der Legendäre Behemoth', '伝説の魔獣「ベヒーモス」', NULL),
(266, 506, 'He Taketh It With His Eyes', 'He Taketh It With His Eyes', 'Défi: Contre-traque', 'Kein Weg Zurück', '手負いの魔獣「ベヒーモス」', NULL),
(267, 507, 'The Eyes Have It', 'The Eyes Have It', 'Défi: L\'œil De La Tête', 'Mehr Augen, Mehr Ärger', '帰ってきた男「ステロペス」', NULL),
(268, 508, 'The Storm Caller', 'The Storm Caller', 'Défi: Le Prophète Du Vent', 'Beschwörer Der Herrin Der Winde', '嵐神呼びし者「風標のコゾル・ノモトル」', NULL),
(269, 512, 'Toll Collector', 'Toll Collector', 'Des Crapauds En Trop', 'Aus Kameradschaft', '失われた風景', NULL),
(270, 514, 'Mud About You', 'Mud About You', 'Enchevêtrement Fatal', 'Großreinemachen Im Schlingwald', 'タングル湿林の大掃除', NULL),
(271, 516, 'Black And Nburu', 'Black And Nburu', 'Défi: Sonner Le Glas Pour Nburu', 'Nburus Bitterkeit', '湿林の怨念「ンブル」', NULL),
(272, 517, 'Good To Be Bud', 'Good To Be Bud', 'Trop De Morbols Tuent Les Morbols', 'Ausgekeimt', 'モルボル怒りの大増殖', NULL),
(273, 520, 'Standing Guard', 'Standing Guard', 'Ces Tests Doivent échouer', 'Wartung Aller Waffen', '統合整備計画', NULL),
(274, 521, 'Another Notch On The Torch', 'Another Notch On The Torch', 'Défi: Porus Et Les 1000 Chasseurs', 'Nichts Geht Mehr', '残忍なる悪鬼「ポリュス」', NULL),
(275, 522, 'One Giant Leap', 'One Giant Leap', 'Chacun Sa Terre Sainte', 'Umkämpfter Kristallturm', '聖地巡礼', NULL),
(276, 523, 'Among Giants', 'Among Giants', 'Sus Aux Gigas', 'Hände Weg Von Geisterzoll', '巨漢の地上げ屋', NULL),
(277, 524, 'Another Day, Another Demon', 'Another Day, Another Demon', 'À Chaque Jour Suffit Son Monstre', 'Hippogryhpen Greifen An', 'ヒッポグリフの晩餐会', NULL),
(278, 525, 'That\'s What Adventurers Are For', 'That\'s What Adventurers Are For', 'Défi: Dioné-nous La Force', 'Dione Muss Schweigen', '乱れ髪「銀髪のディオネ」', NULL),
(279, 526, 'Home Is Where The Horn Is', 'Home Is Where The Horn Is', 'Pas Les Bienvenus', 'Die Hapaliten Sind Los', '銀泪湖ガラガラドッカン', NULL),
(280, 527, 'Gone With The Shadow', 'Gone With The Shadow', 'Défi: En Proie Aux Ombres', 'Recht Gilt Auch Des Nachts', '夜襲の魔獣「グウィルギ」', NULL),
(281, 529, 'The Prodigal Son', 'The Prodigal Son', 'Une Escorte Pour La Science', 'Forsch Und Forscher', '旅の仲間', NULL),
(282, 532, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(283, 533, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(284, 534, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(285, 535, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(286, 536, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(287, 537, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(288, 538, 'Return Of The King', 'Return Of The King', 'Le Retour D\'un Roi', 'Comeback Mit Knall', '帰ってきた大炎獣「キングボンバード」', NULL),
(289, 540, 'Quartz Coupling', 'Quartz Coupling', 'Quitte Ou Doblyn', 'Dem Quarz Zuliebe', 'ワサワサドブラン', NULL),
(290, 541, 'A Man Rides Through', 'A Man Rides Through', 'De L\'autre Côté Du Miroir', 'Angst Vor Dem Unbekannten', '鏡像の騎士', NULL),
(291, 542, 'Bad Hair Day', 'Bad Hair Day', 'Défi: Pelote En Colère', 'Holder Knabe In Lockigem Haar', '金髪の貴公子「アイエテス」', NULL),
(292, 543, 'The Big Bagoly Theory', 'The Big Bagoly Theory', 'Défi: Se Forger Des Chimères', 'Großer Badu, Große Gefahr', '醜悪なる合成獣「バドゥ」', NULL),
(293, 545, 'Call Me, Mayhaps', 'Call Me, Mayhaps', 'Le Feu Sacré', 'Zeremonienverderber', '荒野の消火活動', NULL),
(294, 546, 'Book Of Pride', 'Book Of Pride', 'Défi: Bibireze Le Maudit', 'Ifrit Nahm Sein Leben', '哀しき闘士「純鉄のビビレゼ」', NULL),
(295, 548, 'Tempered, Tempered', 'Tempered, Tempered', 'Feu Aux Poudres', 'Ifrits Quell Der Kraft', '正義についての話をしよう', NULL),
(296, 549, 'Full Of Rigor Mortis', 'Full Of Rigor Mortis', 'Le Maillon Faible', 'Verwüsten Verboten', '甲羅を蹴飛ばせ！', NULL),
(297, 550, 'An Inconvenient Truth', 'An Inconvenient Truth', 'La Horde De La Discorde', 'Blutige Aussichten', '精鋭部隊「ゴアホード」', NULL),
(298, 551, 'Future Shock', 'Future Shock', 'Horoscope Du Jour', 'Kein Glückstag', '今日の運勢', NULL),
(299, 552, 'Taken', 'Taken', 'Que Décline Son Armée', 'Geflüchtet Und Entführt', '友と、家族と', NULL),
(300, 553, 'Gyve Talk', 'Gyve Talk', 'Massacre Derrière La Herse', 'Tumult Am Ersten Tor', '第一関門攻略戦', NULL),
(301, 555, 'Fallen Corpses Writhe In Style', 'Fallen Corpses Writhe In Style', 'D\'élégants Morts-vivants', 'Fäulnis Mit Stil', '砂の上の足あと', NULL),
(302, 556, 'Core Blimey', 'Core Blimey', 'Ne Jetez Pas Les Noyaux !', 'Erdkern Für Erdseim', '青燐精製所のお手伝い', NULL),
(303, 557, 'Quenching The Flame', 'Quenching The Flame', 'L\'élite Des Crocs', 'Aufflammende Gewalt', 'アマルジャ軍特殊部隊「炎牙衆」', NULL),
(304, 558, 'He\'s A Firestarter', 'He\'s A Firestarter', 'Défi: L\'attiseur Des Flammes Infernales', 'Beschwörer Des Herrn Des Infernos', '焔神呼びし者「火印のアファジ・コー」', NULL),
(305, 560, '9 To 5', '9 To 5', 'L\'insécurité De L\'emploi', 'Geld Oder Leben', '野蛮な餓えた傭兵の反乱', NULL),
(306, 562, 'Sweeter Than Honey', 'Sweeter Than Honey', 'Entre Miel Et Terre', 'Liebliche Weinblüten', '蜜蜂誘う甘い蜜', NULL),
(307, 563, 'Ho Ho Ho', 'Ho Ho Ho', 'Défi: Ho, Ho, Ho!', 'Glüxi Grün', '深緑の巨獣「ジョリーグリーン」', NULL),
(308, 565, 'Long Way Home', 'Long Way Home', 'Laissez-moi Rentrer Chez Moi !', 'Nach Hause Teleportieren', 'お家に帰ろう', NULL),
(309, 566, 'Cliff Hanger', 'Cliff Hanger', 'Quand Le Liège Assiège', 'Straßenverwüster', '球根つぶし', NULL),
(310, 568, 'Gauging North Tidegate', 'Gauging North Tidegate', 'Reconnaissance Au Barrage Du Nord', 'Aufklärung Am Norddamm', '北防波壁の戦い：威力偵察', NULL),
(311, 569, 'Breaching North Tidegate', 'Breaching North Tidegate', 'Percée Du Barrage Du Nord', 'Schlacht Am Norddamm', '北防波壁の戦い：本隊強襲', NULL),
(312, 570, 'Gauging South Tidegate', 'Gauging South Tidegate', 'Reconnaissance Au Barrage Du Sud', 'Aufklärung Am Süddamm', '南防波壁の戦い：威力偵察', NULL),
(313, 571, 'Breaching South Tidegate', 'Breaching South Tidegate', 'Percée Du Barrage Du Sud', 'Schlacht Am Süddamm', '南防波壁の戦い：本隊強襲', NULL),
(314, 574, 'Tail Of A Whale', 'Tail Of A Whale', 'La Tentation Du Serpent De Mer', 'Von Der Schlange Verführt', '海蛇の末路', NULL),
(315, 576, 'Dead Man\'s Rest', 'Dead Man\'s Rest', 'C\'est Pas L\'homme Qui Prend La Mer...', 'Totengeleit', '死の行進', NULL),
(316, 577, 'The King\'s Justice', 'The King\'s Justice', 'Défi: Mante à L\'eau', 'Verhängnisvolle Fracht', '異国の魔蟲「マンティスキング」', NULL),
(317, 578, 'Making Waves', 'Making Waves', 'Défi: Le Messager Des Vagues', 'Beschwörer Des Herrn Der Wogen', '水神呼びし者「水鬼のヤァル」', NULL),
(318, 580, 'The Only Way Is Up', 'The Only Way Is Up', 'De Hauteur De Golem', 'Basaltblockade', 'ザ・ロード', NULL),
(319, 581, 'By A Whisker', 'By A Whisker', 'Défi: Un Coeurl à Prendre', 'Für Unsere Pioniere', '黒渦団の仇敵「オセ」', NULL),
(320, 583, 'When The Coeurl\'s Away', 'When The Coeurl\'s Away', 'Hauts Les Coeurls', 'Ein Prachtvoller Feind', '豹よ、豹よ！', NULL),
(321, 586, 'The Miner In The Mirror', 'The Miner In The Mirror', 'Défi: Pas De Concession Sur Les Concessions', 'Riecher Für Erz', '土竜の山師「ピックマン59 ベ・ゼ」', NULL),
(322, 587, 'Schism', 'Schism', 'Défi: Un Kobold Sachant Forer...', 'Gras Grüner, Gestein Größer', '試掘地強襲作戦', NULL),
(323, 588, 'Fire In The Hole', 'Fire In The Hole', 'Le Temps Est à La Grenade', 'Granaten In Sicht', 'ファイア・イン・ザ・ホール', NULL),
(324, 589, 'Make It Rain', 'Make It Rain', 'Défi: Peur De L\'orage?', 'Auf Wolkenbruch Raus', '雷雨呼ぶ者「ブラウンガー」', NULL),
(325, 593, 'Restless In O\'Ghomoro', 'Restless In O\'Ghomoro', 'Véloces Raptors', 'Keine Fragen. Renn.', '狂気の山脈', NULL),
(326, 595, 'Overlooking The Obvious', 'Overlooking The Obvious', 'Kobolds En Embuscade', 'Ladenbesitzer In Not', '補給部隊救出命令', NULL),
(327, 597, 'Full Metal Alchemist', 'Full Metal Alchemist', 'Défi: Révolution Industrielle', 'Asbest? Nein Danke!', '鋼虫の養殖者「ビーズマン59 ビ・ゴ」', NULL),
(328, 598, 'Spandy Balidet', 'Spandy Balidet', 'Défi: Ne Pas Réveiller La Statue Qui Dort...', 'Schlafende Monster', '目覚めし石像「バリデト」', NULL),
(329, 600, 'The Lindwurm Has Turned', 'The Lindwurm Has Turned', 'Mornes Lindwurms', 'Wurmige Ernte', '強襲リンドヴルム', NULL),
(330, 601, 'What\'s Your Poison', 'What\'s Your Poison', 'Soigner Le Mal Par Le Mal', 'Dosis Macht Gift', 'とても楽しいキノコ狩り', NULL),
(331, 602, 'Revenant Things', 'Revenant Things', 'Départs', 'Frieden Ihrer Seele', '送り火と', NULL),
(332, 603, 'If I Only Had A Soul', 'If I Only Had A Soul', 'Un Golem, Comment ça Marche ?', 'Geheimnis Des Lebens', '真理を求めて', NULL),
(333, 604, 'In Spite Of It All', 'In Spite Of It All', 'Défi: Le Plus Revanchard Des Deux', 'Schadenfröhlich', '陰険なる魔物「スパイトフル」', NULL),
(334, 607, 'Collecting Keepsakes', 'Collecting Keepsakes', 'Vivre Libre Ou Mourir', 'Sylphenfreundschaft', '過ぎ去りし日々の光', NULL),
(335, 608, 'All Vine And No Popotoes', 'All Vine And No Popotoes', 'Occlusion D\'otyughs', 'Grenzschutz', 'オチュー狩り', NULL),
(336, 609, 'The Squirrel Trapper\'s Wife', 'The Squirrel Trapper\'s Wife', 'Défi: Cassienova', 'Ein Happen Für Cassie', '気まぐれ婦人「カプリシャス・キャシー」', NULL),
(337, 610, 'The Enemy Of My Enemy', 'The Enemy Of My Enemy', 'Entre Deux Feux', 'Schwere Entscheidung', 'ラークスコール遭遇戦', NULL),
(338, 611, 'The Enmity Of My Enemy', 'The Enmity Of My Enemy', 'Subjugués Ingrats', 'Mehr Ist Nicht Genug', '続ラークスコール遭遇戦', NULL),
(339, 612, 'Below His Station', 'Below His Station', 'Défi: Une Option Sur L\'optio', 'Jetzt Oder Nie', '千人隊長「アウルス・レム・ヴルソ」', NULL),
(340, 615, 'Got Milkroot', 'Got Milkroot', 'Repénalisation', 'Milchrausch', 'ミルク・クラッシュ', NULL),
(341, 618, 'Handful Of Dreams', 'Handful Of Dreams', 'Un Rêve Sans Fin', 'Traumkröten Für Den Eigenbedarf', 'ビューティフル・ドリーマー', NULL),
(342, 619, 'Bush Blade', 'Bush Blade', 'Défi: Vilain Volxia', 'Sylphenkommandantin', '幽谷の衛士「葉刃のヴォルキシア」', NULL),
(343, 620, 'Everything\'s Better', 'Everything\'s Better', 'Flapi Chapeau', 'Ende Der Pilzsaison', 'とてとて楽しいキノコ狩り', NULL),
(344, 624, 'Rogue On The Water', 'Rogue On The Water', 'Vaincre Le Mal Par Les Racines', 'Nicht Versumpfen', '液状化現象', NULL),
(345, 626, 'To Train A Tortoise', 'To Train A Tortoise', 'Tortues Torturées', 'Abgelenkt', 'カメェェェッー！', NULL),
(346, 627, 'Fate Is A Fecal Mistress', 'Fate Is A Fecal Mistress', 'Traitement Des Eaux Usées', 'Stinkt Zum Himmel', '臭い物にはフタをしろ', NULL),
(347, 628, 'What Gored Before', 'What Gored Before', 'Défi: Phaïa Pas L\'inviter', 'Grimmiges Beißendes', '最後の闘猪王「パイア」', NULL),
(348, 631, 'Don\'t Disturb This Grove', 'Don\'t Disturb This Grove', 'Touche Pas à Mon Arbre !', 'Versuchter Frevel', '伐採部隊迎撃戦', NULL),
(349, 632, 'Rude Awakening', 'Rude Awakening', 'Défi: Les Morts En Marche', 'Skandal Im Sperrgebiet', '遺跡の亡霊騎士「ダイダロス」', NULL),
(350, 633, 'Air Supply', 'Air Supply', 'Raid Sur Le Site De Déboisement Ixal', 'Illegaler Holzexport', 'イクサル軍伐採所強襲作戦', NULL),
(351, 637, 'The Red Baron', 'The Red Baron', 'Défi: Le Baron Rouge', 'Spritfresser', '灼熱の男爵「ボムバロン」', NULL),
(352, 638, 'Just A Sip', 'Just A Sip', 'Précieux Céruleum', 'Nur Quarz Im Schädel', 'ゴクゴクドブラン', NULL),
(353, 639, 'East Meets Worst', 'East Meets Worst', 'Chacun Sa Tour', 'Augen Auf', '監視者の影', NULL),
(354, 641, 'Twinkle, Twinkle Little Trap', 'Twinkle, Twinkle Little Trap', 'Piège De Quartz', 'Durstige Dobalosse', '鋼虫の罠', NULL),
(355, 642, 'The Ceruleum Road', 'The Ceruleum Road', 'La Route Du Céruleum', 'Ehrenwache', 'セルリウムロード', NULL),
(356, 643, 'Dark Devices - The Plea', 'Dark Devices - The Plea', 'Culte Maudit: L\'enlèvement', 'Von Kultisten Entführt', '救世神の生贄：誘拐編', NULL),
(357, 644, 'Dark Devices - The Bait', 'Dark Devices - The Bait', 'Culte Maudit: L\'embuscade', 'Unkluge Kultisten', '救世神の生贄：待伏編', NULL),
(358, 645, 'Dark Devices - The Switch', 'Dark Devices - The Switch', 'Culte Maudit: L\'aveu', 'Die Sektenführer', '救世神の生贄：誅殺編', NULL),
(359, 646, 'Dark Devices - The End', 'Dark Devices - The End', 'Culte Maudit: L\'affront', 'Ergreifendes Opfer', '救世神の生贄：妖異編', NULL),
(360, 647, 'Go, Go, Gorgimera', 'Go, Go, Gorgimera', 'Défi: Gorgimère Indigne', 'Etwas Von Allem', '荒れ狂う巨獣「ゴーキマイラ」', NULL),
(361, 649, 'Sister Crustacean', 'Sister Crustacean', 'La Famille Avant Tout', 'Nicht Ohne Meine Eier', 'その水棲動物を見よ', NULL),
(362, 651, 'Lightning Strikes - Armored Beast', 'Lightning Strikes - Armored Beast', 'Retour D\'éclair: Créature Inconnue', 'Bestie Aus Der Anderswelt', '閃光の影向：巨獣迎撃戦', NULL),
(363, 652, 'Lightning Strikes - Armored Beast', 'Lightning Strikes - Armored Beast', 'Retour D\'éclair: Créature Inconnue', 'Bestie Aus Der Anderswelt', '閃光の影向：巨獣迎撃戦', NULL),
(364, 653, 'Lightning Strikes - Dread On Arrival', 'Lightning Strikes - Dread On Arrival', 'Retour D\'éclair: Cuirassé Outrecuidant', 'Killermaschine Aus Der Anderswelt', '閃光の影向：機獣討伐戦', NULL),
(365, 654, 'Lightning Strikes - Dread On Arrival', 'Lightning Strikes - Dread On Arrival', 'Retour D\'éclair: Cuirassé Outrecuidant', 'Killermaschine Aus Der Anderswelt', '閃光の影向：機獣討伐戦', NULL),
(366, 655, 'Lightning Strikes - Anubys Assault', 'Lightning Strikes - Anubys Assault', 'Retour D\'éclair: Anubis Annonciateurs', 'Vorboten Des Chaos', '閃光の影向：アヌビス殲滅戦', NULL),
(367, 656, 'Lightning Strikes - Anubys Assault', 'Lightning Strikes - Anubys Assault', 'Retour D\'éclair: Anubis Annonciateurs', 'Vorboten Des Chaos', '閃光の影向：アヌビス殲滅戦', NULL),
(368, 657, 'Lightning Strikes - On Wings Of Chaos', 'Lightning Strikes - On Wings Of Chaos', 'Retour D\'éclair: Le Dragon Du Chaos', 'Herr Des Chaos', '閃光の影向：屍竜討滅戦', NULL),
(369, 658, 'Lightning Strikes - On Wings Of Chaos', 'Lightning Strikes - On Wings Of Chaos', 'Retour D\'éclair: Le Dragon Du Chaos', 'Herr Des Chaos', '閃光の影向：屍竜討滅戦', NULL),
(370, 660, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(371, 661, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem De Pierre', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(372, 662, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(373, 663, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem D\'or', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(374, 664, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(375, 665, 'Brick By Gold Brick', 'Brick By Gold Brick', 'Fort Comme Une Brique: Golem D\'or', 'Der Goldgolem Aus Einer Anderen Welt', '不思議な魔物「ゴールドマン」', NULL),
(376, 666, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(377, 667, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem De Pierre', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(378, 668, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(379, 669, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem De Pierre', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(380, 670, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(381, 671, 'Brick By Gold Brick', 'Brick By Gold Brick', 'Fort Comme Une Brique: Golem D\'or', 'Der Goldgolem Aus Einer Anderen Welt', '不思議な魔物「ゴールドマン」', NULL),
(382, 672, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(383, 673, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem De Pierre', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(384, 674, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(385, 675, 'Brick By Stone Brick', 'Brick By Stone Brick', 'Fort Comme Une Brique: Golem De Pierre', 'Der Steingolem Aus Einer Anderen Welt', '不思議な魔物「ストーンマン」', NULL),
(386, 676, 'Brick By Brick', 'Brick By Brick', 'Fort Comme Une Brique: Golems', 'Golems Aus Einer Anderen Welt', '不思議な魔物「ゴーレム」', NULL),
(387, 677, 'Brick By Gold Brick', 'Brick By Gold Brick', 'Fort Comme Une Brique: Golem D\'or', 'Der Goldgolem Aus Einer Anderen Welt', '不思議な魔物「ゴールドマン」', NULL),
(388, 679, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(389, 680, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL),
(390, 681, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(391, 682, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL),
(392, 683, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(393, 684, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL),
(394, 685, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(395, 686, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL),
(396, 687, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(397, 688, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL);
INSERT INTO `fates_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`) VALUES
(398, 689, 'Embiggened Spriggans', 'Embiggened Spriggans', 'Manigances Manifestes: Quand La Magie Fait Rage', 'Der Schwarze Dämon: Experiment Geglückt', '黒い悪魔：実験の成果', NULL),
(399, 690, 'Tower Of Power', 'Tower Of Power', 'Manigances Manifestes: La Tour Infernale', 'Der Schwarze Dämon: Frau Größenwahn', '黒い悪魔：過激な淑女', NULL),
(400, 691, 'A Wrench In The Works', 'A Wrench In The Works', 'Défi: Bon Pour La Ferraille', 'Prototyp Des Grauens', '高機動試作機「プロトアーマー」', NULL),
(401, 693, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(402, 694, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(403, 695, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(404, 696, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(405, 697, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(406, 698, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(407, 699, 'Stay Frosty', 'Stay Frosty', 'L\'effet Boule De Neige', 'Tauwetter Nach Art Des Imps', '星芒祭：魔法の雪だるま', NULL),
(408, 700, 'Making The Rounds', 'Making The Rounds', 'Défi: Le Plus Barjot Des Hommes-taupes', 'Bezwinger Des Bezwingers', '妖異殺し「ラウンズマン59 ゲ・ガ」', NULL),
(409, 701, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(410, 702, 'Eggcelsior', 'Eggcelsior', 'Attention Au Cholestérol!', 'Das Ei Der Weisen', '賢者のタマゴ「ジョーカー・エッガー」', NULL),
(411, 703, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(412, 704, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(413, 705, 'Eggcelsior', 'Eggcelsior', 'Attention Au Cholestérol!', 'Das Ei Der Weisen', '賢者のタマゴ「ジョーカー・エッガー」', NULL),
(414, 706, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(415, 707, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(416, 708, 'What\'s Yours Is Mine', 'What\'s Yours Is Mine', 'Ce Qui Est à Nous Est à Nous', 'Lustige Eiersuche', '狂乱のエッグハント', NULL),
(417, 709, 'Eggcelsior', 'Eggcelsior', 'Attention Au Cholestérol!', 'Das Ei Der Weisen', '賢者のタマゴ「ジョーカー・エッガー」', NULL),
(418, 716, 'Main Street Spectral Parade', 'Main Street Spectral Parade', 'La Parade Intercontinentale', 'Die Allerschutzheiligen-Parade', 'コンチネンタル・パレード', NULL),
(419, 717, 'Gloria In Eggcelsis', 'Gloria In Eggcelsis', 'La Chasse Aux Fabulœufs', 'Die Giganteneiersuche', 'ジャイアントエッグハント', NULL),
(420, 718, 'Gloria In Eggcelsis', 'Gloria In Eggcelsis', 'La Chasse Aux Fabulœufs', 'Die Giganteneiersuche', 'ジャイアントエッグハント', NULL),
(421, 719, 'Gloria In Eggcelsis', 'Gloria In Eggcelsis', 'La Chasse Aux Fabulœufs', 'Die Giganteneiersuche', 'ジャイアントエッグハント', NULL),
(422, 720, 'Gloria In Eggcelsis', 'Gloria In Eggcelsis', 'La Chasse Aux Fabulœufs', 'Die Giganteneiersuche', 'ジャイアントエッグハント', NULL),
(423, 722, 'Gloria In Eggcelsis', 'Gloria In Eggcelsis', 'La Chasse Aux Fabulœufs', 'Die Giganteneiersuche', 'ジャイアントエッグハント', NULL),
(424, 725, 'Wave Good-bye', 'Wave Good-bye', 'Au Revoir Les Poissons', 'Badeausflug', 'キャッチ・アンド・リリース', NULL),
(425, 726, 'The Nuts', 'The Nuts', 'Noix Farceuses', 'Dumme Nuss', 'さよならアルケオダイノス', NULL),
(426, 727, 'Glycon Air', 'Glycon Air', 'Défi: C\'est Complètement Glycon', 'Von Schwarzem Blut', '黒竜の使徒「グリコン」', NULL),
(427, 728, 'Coin Toss', 'Coin Toss', 'Pile Ou Face Mog', 'Teures Hobby', 'モーグリ金融道', NULL),
(428, 731, 'Supper Time', 'Supper Time', 'Mangeurs De Mogs', 'Zum Fressen Gern', '失われた世界', NULL),
(429, 732, 'Sprite Club', 'Sprite Club', 'Équilibre élémentaire', 'Vorsicht Hochspannung', '雲海に轟く雷鳴', NULL),
(430, 735, 'Whole Food', 'Whole Food', 'Défi: Mog En Un Seul Morceau', 'Schlecht Gekaut Ist Halb Unverdaut', '飽食の恐竜「アベリスク」', NULL),
(431, 736, 'Say It Tulihand', 'Say It Tulihand', 'Tulihänds à Tuer', 'Alle Hände Voll Zu Tun', 'トゥリヘンド・スクランブル', NULL),
(432, 737, 'Vouivre Believre', 'Vouivre Believre', 'Vouivre Ou Mourir', 'Vivel La Revolution', 'トゥリヘンド・ベロシティ', NULL),
(433, 738, 'Waugyl Waugyl Waugyl', 'Waugyl Waugyl Waugyl', 'Défi: Waugyl Le Belliqueux', 'Ich Bin Der Waugyl', '遺跡の番人「ウォーギル」', NULL),
(434, 740, 'How To Cane Your Dragon', 'How To Cane Your Dragon', 'Danse Avec Les Dragons', 'Tanz Mit Den Drachen', '竜との舞踏', NULL),
(435, 741, 'Aevis Has Left The Building', 'Aevis Has Left The Building', 'Nouvelle Danse Avec Les Dragons', 'Tanz Mit Den Wolken', '続・竜との舞踏', NULL),
(436, 742, 'Asah, I Came, I Conquered', 'Asah, I Came, I Conquered', 'Défi: Asah Commence à Bien Faire', 'Hindernis Auf Der Fahrbahn', '甲鱗の猛竜「クエレブレ」', NULL),
(437, 744, 'Waiting For Fjalar To Stall', 'Waiting For Fjalar To Stall', 'Défi: Marre De Fjalar', 'Fjalar Gegen Den Rest Der Welt', '夜と霧', NULL),
(438, 746, 'Don\'t Know Wyvern', 'Don\'t Know Wyvern', 'Wyverne De Représailles', 'Brennt, Wyvern, Brennt!', '燃えよワイバーン', NULL),
(439, 747, 'From Dusk Till Gone', 'From Dusk Till Gone', 'Défi: La Vengeance Du Vigile', 'Tag Der Abrechnung', '薄暮の飛竜「ミナルジャ」', NULL),
(440, 748, 'Treehouse Of The Spirits', 'Treehouse Of The Spirits', 'De Quoi Je Me Mélias?', 'Meliaden-Marmelade', '来たのは誰だ', NULL),
(441, 751, 'As The World Burns', 'As The World Burns', 'Défi: Kucedre Le Maudit', 'Der Angeschwärzte', '猛炎の焔竜「クシェドレ」', NULL),
(442, 752, 'It\'s The Moogle, Reinvented', 'It\'s The Moogle, Reinvented', 'Des Mogs Au Ménage', 'Putzkolonnen-Eskorte', '吸引力は変わらない', NULL),
(443, 753, 'Corporal Pomishment', 'Corporal Pomishment', 'Défi: Châtiment Kupporel', 'Ein Großes Kupowetter', '雲海の問題児「悪童のモグーシ」', NULL),
(444, 754, 'Infamous', 'Infamous', 'Galar En Galère', 'Sonne Gegen Schatten', '聖と邪の交わるひずみ', NULL),
(445, 755, 'Ain\'t Misbehaving', 'Ain\'t Misbehaving', 'Défi: Mogvais Garçon', 'Immer Auf Die Kleinen', '愚行の問題児「悪童のモグーシ」', NULL),
(446, 756, 'Metal Gears Rising', 'Metal Gears Rising', 'Bouts De Ferraille', 'Die Krawallmetaller', '悪魔の機械', NULL),
(447, 757, 'Metal Gears Revengeance', 'Metal Gears Revengeance', 'Vengeurs De Ferraille', 'Rache Der Schwermetaller', 'リベンジャーズ', NULL),
(448, 758, 'Metal Gears Revengeance 2', 'Metal Gears Revengeance 2', 'Défi: Vengeurs De Ferraille II', 'Vollmetallalchemisten', '全面改修機「III号ゴブリガードJ型」', NULL),
(449, 759, 'Tarantula Hawk, Pro Stinger', 'Tarantula Hawk, Pro Stinger', 'Tarentules En Rupture De Stock', 'Nicht Spinne, Nicht Falke', 'タランチュラホークの襲撃', NULL),
(450, 760, 'Wild Wilde Death', 'Wild Wilde Death', 'D\'une Pierre Deux Nuisibles', 'Doppelte Schädlingsbekämpfung', 'ワイルドでいこう！', NULL),
(451, 761, 'Gets The Red Out', 'Gets The Red Out', 'Défi: Une épitaphe Pour Épaphos', 'Das Ging Ins Auge', '巨眼の魔牛「エパポス」', NULL),
(452, 762, 'Makes The Very Best...Nests', 'Makes The Very Best...Nests', 'Le Bal Des Demoiselles', 'Kammerjägerkommando', '図書館清掃', NULL),
(453, 763, 'Olympus Has Pollen', 'Olympus Has Pollen', 'Rhume Des Narbroois', 'Und Täglich Tropft Der Nasenschleim', '花粉前線異常アリ', NULL),
(454, 764, 'Feed Me, See More', 'Feed Me, See More', 'Défi: Ruginis à éliminer', 'Sie Kam Aus Der Luft', '吸血の浮遊草「ルギニス」', NULL),
(455, 766, 'Pop Goes The Whizzle', 'Pop Goes The Whizzle', 'Mécanismes à Enrayer', 'Blaue Hände, Blaue Augen', 'ゴブゴブ紛争', NULL),
(456, 767, 'Revenge Of The Vengeful Revengeance', 'Revenge Of The Vengeful Revengeance', 'Défi: Moundrinix Le Virtuose', 'Satz Mit X: Hubbelknix', '熟練の戦闘指揮官「八丁のマウンドリンクス」', NULL),
(457, 768, 'Ratel And Hum', 'Ratel And Hum', 'Ratels Au Casse-pipe', 'Von Wegen Tolle Wut', '尻尾を立てろ！', NULL),
(458, 769, 'Dobharch Did It For The Best', 'Dobharch Did It For The Best', 'Défi: Dobharch La Matriarche', 'Der Zorn Einer Mutter', '野獣の家長「ダルウフー」', NULL),
(459, 770, 'Infant Vangob', 'Infant Vangob', 'Écrabouillage D\'Écrabouilleuse', 'Keine Vesper Für Die Esper', '西方電撃戦', NULL),
(460, 771, 'Morbol Man', 'Morbol Man', 'Morbol D\'air Frais', 'Das Große Stinken', 'モルボルをブッコろせ', NULL),
(461, 772, 'On Melancholic Hill', 'On Melancholic Hill', 'Défi: Broyer Du Moira', 'Melancholie Und Die Unendliche Unersättlichkeit', '憂鬱なる令嬢「メランコリック・モイラ」', NULL),
(462, 773, 'Sun Bear, Sun Bear, What Do You Eat', 'Sun Bear, Sun Bear, What Do You Eat', 'Bruan Aime, Bruan Reste', 'Ein Platz An Der Sonnenbärspeisetafel', 'イディルシャイア猟友会', NULL),
(463, 774, 'The Bear Up There', 'The Bear Up There', 'Défi: Dubhe Ration', 'Krieger, Grüß Mir Die Sonne', '血濡れの暴君「ドゥーベ」', NULL),
(464, 775, 'The Birds And The Bears', 'The Birds And The Bears', 'Pauvres Bruans', 'Vögel Gegen Bären', '悲しみのベアー', NULL),
(465, 777, 'Poroggo Stuck', 'Poroggo Stuck', 'Escorte De Poroggo', 'Molchaugen, Unkenzehen', '使い魔はつらいよ', NULL),
(466, 778, 'Frog Days Of Summer', 'Frog Days Of Summer', 'Des Poroggos Courroucés', 'Jetzt Schlägt\'s Drei Zehen', '蛙のために弔鐘は鳴る', NULL),
(467, 779, 'Toss \'Em Back', 'Toss \'Em Back', 'Vilains Opkens', 'Wasserschutzpolizei', 'シャーレアンの影', NULL),
(468, 780, 'Tome Raider', 'Tome Raider', 'Le Bien Dérobé D\'un Bibliophile Voleur', 'Bücher Sind Für Fische Nichts', 'ビブロフィリアの憂鬱', NULL),
(469, 781, 'Cockatrice Block', 'Cockatrice Block', 'Cocatrix De Bibliothèque', 'Bücherhühner', 'コカトリスの思い出', NULL),
(470, 782, 'Come Shells Or High Water', 'Come Shells Or High Water', 'Biféricéras à Terrasser', 'Bifericeras Müssen Weg', '果しなき流れの果てで', NULL),
(471, 783, 'Toad Alone', 'Toad Alone', 'Défi: Triste Bero Roggo', 'Die Einsamkeit Des Poroggo-Familiars', '主を待つ者「孤独のベロ・ロッゴ」', NULL),
(472, 784, 'How Do You Feed A Hungry Manlike Monster', 'How Do You Feed A Hungry Manlike Monster', 'Défi: Un Poisson Bipède Et Vorace', 'Er Kam Von Weitem übers Meer', '魚喰いの魚人「オプロケプロン」', NULL),
(473, 785, 'Out Of The Woodwork', 'Out Of The Woodwork', 'Prendre Les Gens Pour Des Cocons', 'Kriech Mir Aus Den Augen', 'クロウラーの巣', NULL),
(474, 786, 'Silkworm', 'Silkworm', 'Défi: Défiler Habetrot', 'Ein Ganz Großer Spinner', '糸紡ぎ巧者「ハベロット」', NULL),
(475, 787, 'Eye In The Sky', 'Eye In The Sky', 'Observateurs Surveillés', 'Was Gibt\'s Da Zu Glotzen?', '誰か見てるぞ！', NULL),
(476, 788, 'A Dung Deal', 'A Dung Deal', 'Une Histoire De Crottin', 'Ins Bocknäpfchen Getreten', '巡礼の騎士', NULL),
(477, 789, 'Land Of The Freeze', 'Land Of The Freeze', 'Savoir Briser La Glace', 'Wasser Ist Zum Waschen Da', '凍結スリップ注意！', NULL),
(478, 791, 'Dawn Of The Mylodons', 'Dawn Of The Mylodons', 'Dans Le Mylodon', 'Revierausweitung', '黒鉄橋の戦い', NULL),
(479, 792, 'Don Of The Mylodons', 'Don Of The Mylodons', 'Défi: Les Veules Et La Velue', 'Peluda Tobt', '剛毛の白獣「ペルダ」', NULL),
(480, 793, 'We Fought A Dzu', 'We Fought A Dzu', 'Défi: Ne Pas Douter Face à Dzu Teh', 'Die Rückkehr Des Yeti-Ritters', 'ヤク喰い巨人「ズウティ」', NULL),
(481, 794, 'True Convictions', 'True Convictions', 'Crier Au Convictoire Trop Vite', 'Wem Ehre Gebührt', '栄光の聖フィネア連隊', NULL),
(482, 795, 'The Polar Express', 'The Polar Express', 'Glacial Garde-manger', 'Ich Möchte Kein Eisbär Sein', '熊出没注意', NULL),
(483, 796, 'Apparent Trap', 'Apparent Trap', 'Défi: Gare Aux Piège-yétis', 'Den Mund Zu Voll Genommen', '雪男の天敵「イエティトラップ」', NULL),
(484, 798, 'Abominable Me', 'Abominable Me', 'Plus Moche Que Méchant', 'Wärmflasche Wider Willen', '獣人雪男', NULL),
(485, 800, 'Requiem For A Dragon', 'Requiem For A Dragon', 'Requiem Pour Un Dragon', 'Der Traum Ist Aus', '臥竜島の戦い', NULL),
(486, 801, 'Follow The Sleet', 'Follow The Sleet', 'Extermination De Piège-grésils', 'Man Jätet, Was Man Sieht', '凍った花', NULL),
(487, 802, 'Sick Pack', 'Sick Pack', 'Qui A Peur De La Meute Géante?', 'Die Stärke Des Rudels', 'ダスクの銀狼', NULL),
(488, 805, 'In Command', 'In Command', 'Congédier Les Commandants Gelés', 'Das Geringere Übel', 'コマンダー！', NULL),
(489, 807, 'What You See Is What You Get', 'What You See Is What You Get', 'Défi: Taper Dans L\'œil', 'Im Auge Des Betrachters', '幻惑の視線「ビホルダー」', NULL),
(490, 809, 'Panic Rheum', 'Panic Rheum', 'Entre Appétit Et Dégoût', 'Unliebsame Nichtsgesandtschaft', 'スノーホワイト', NULL),
(491, 810, 'Sugar, Sugar', 'Sugar, Sugar', 'Défi: Tartufo Et Truffe Blanche', 'Die Hungerspiele', '人喰い氷菓「タルトゥフォ＆ホワイトトリュフ」', NULL),
(492, 811, 'Unsilent Vigil', 'Unsilent Vigil', 'La Chasse Aux Archéornis', 'Kampf Gegen Die Vorhut', '竜の眷属を討て', NULL),
(493, 812, 'Pico De Gallows', 'Pico De Gallows', 'Défi: Arrête De Picolaton', 'Kampf Gegen Die Hauptstreitmacht', '鳥竜の大王「ピコラトン」', NULL),
(494, 813, 'Run, Riders, Run', 'Run, Riders, Run', 'Les Grands Méchants Loups Argentés', 'Wettlauf Mit Dem Tod', '氷上の狼', NULL),
(495, 814, 'One Whiskey, One Goat, One Spear', 'One Whiskey, One Goat, One Spear', 'Défi: Heidrun L\'insatiable', 'Auf Den Geschmack Gekommen', '酒浸り野獣「ヘイズルーン」', NULL),
(496, 815, 'No Ifs, Ands, Or Butts', 'No Ifs, Ands, Or Butts', 'Défi: Alaimbert Le Risible', 'Herzallerwertest', '若き竜騎士「鋭槍のアランベール」', NULL),
(497, 816, 'Null And Void', 'Null And Void', 'Adieu Aux Bergthurs', 'Nach Hause Teleportieren', 'ファルコンネストの脅威', NULL),
(498, 817, 'Dishonored', 'Dishonored', 'Défi: Avec ça, On Est Werner', 'Heuchlerische Helden', '功績泥棒「卑怯者のウェルナー」', NULL),
(499, 818, 'By The Horns', 'By The Horns', 'Défi: Un Mâle De Chocobo', 'Erfüllung Eines Traums', '伝説の馬鳥「ブルチョコボ」', NULL),
(500, 819, 'Ladies First', 'Ladies First', 'De Mauvais Chasseurs, Ce Sont...', 'Retter Des Chocobo-Waldes', 'チョコボの森の番人', NULL),
(501, 820, 'Run, Run Away', 'Run, Run Away', 'Défi: Yowie Ne Vit Qu\'une Fois', 'Ein Kopf Zu Groß', '巧妙なる狩人「ヨーウィ」', NULL),
(502, 821, 'Birds Of A Feather', 'Birds Of A Feather', 'Ça En Vaut La Penne', 'Mit Federn Macht Man Mäuse', 'アンブロークン・アロー', NULL),
(503, 822, 'Glawackus On, Glawackus Off', 'Glawackus On, Glawackus Off', 'Défi: Glawackus Le Gourmand', 'Der Schrecken Der Chocobos', '孤高の猛獣「グラワッカス」', NULL),
(504, 823, 'Bear Apparent', 'Bear Apparent', 'Touche Pas à Nos Saumons', 'Bist Du Zu Lax, Gibt\'s Keinen Lachs', 'サーモン戦争', NULL),
(505, 824, 'Who\'s The Moss', 'Who\'s The Moss', 'Pique-puces De Mossy Peak', 'Du Riechst So Gut, Ich Flieg Auf Dich', '美しく複雑なアロマ', NULL),
(506, 825, 'The Rite Stuff', 'The Rite Stuff', 'Sus Aux Hérétiques!', 'Das Urteil Der Furie', '異形の巡礼者', NULL),
(507, 826, 'Dead Meat', 'Dead Meat', 'Vathe-ci Vathe-là', 'Wir Haben Hunger', 'いかにも肉って肉', NULL),
(508, 827, 'The Whole Truth', 'The Whole Truth', 'Gare à Toi, Hérétique!', 'Fanatisch, Didaktisch, Ungut', '敵の敵も敵', NULL),
(509, 828, 'Nothing But The Truth', 'Nothing But The Truth', 'Défi: La Pacification D\'Hubairtien', 'Vorsicht, Bluthochdruck!', '異端の扇動者「熱狂のウベルティアン」', NULL),
(510, 829, 'Drone Under', 'Drone Under', 'Repousser Les Gnathes', 'Ein Exempel Statuieren', '戦いを終わらせるもの', NULL),
(511, 830, 'El Miacid', 'El Miacid', 'Ça Vathe Mieux Comme ça', 'Entscheidung Am Weiland-Fluss', '境界の川', NULL),
(512, 831, 'Cerf\'s Up', 'Cerf\'s Up', 'Bas Les Hippogriffes', 'Der Dracheneierkrieg', '卵をめぐる竜の戦争', NULL),
(513, 832, 'Elephant In The Brume', 'Elephant In The Brume', 'Défi: L\'exécution De Svarog', 'Svarog Der Schreckliche', '雲霧街の虐殺者「スヴァローグ」', NULL),
(514, 833, 'The Migas Touch', 'The Migas Touch', 'Défi: La Folie De Migas', 'Der Zorn Einer Mutter', '怒れる母「ミガス」', NULL),
(515, 834, 'Hearing Voices', 'Hearing Voices', 'Ça Tourne Au Vinaigrier', 'Der Ruf Ihrer Stimmen', '地底の足音', NULL),
(516, 835, 'The Mourning After', 'The Mourning After', 'Défi: Robairlain L\'écailleux', 'Das Mourn-Massaker', '下克上の眷属「竜人のロベルラン」', NULL),
(517, 836, 'Stamp The Yard', 'Stamp The Yard', 'Gallimimus En Furie', 'Tödliche Hufe', '殺しが五月蠅くやって来る', NULL),
(518, 837, 'Come To My Arms', 'Come To My Arms', 'Un Flux De Dragons Fulgurants', 'Quell Des Unfriedens', '楽園の泉', NULL),
(519, 838, 'Special Tarasque Force', 'Special Tarasque Force', 'Défi: Terrasser La Tarasque', 'Die Hasspredigerin', '爆着の甲竜「タラスク」', NULL),
(520, 839, 'Mint Condition', 'Mint Condition', 'Des Répulsifs Attirants', 'Angriff Der Naschkatzen', '猫まっしぐら', NULL),
(521, 840, 'Saved The Nests For Last', 'Saved The Nests For Last', 'Des Oiseaux Soporifiques', 'Luftverbessernde Maßnahme', 'ガストルニスの巣破壊命令', NULL),
(522, 841, 'One Turned Over The Cloudkin\'s Nest', 'One Turned Over The Cloudkin\'s Nest', 'Défi: La Diatribe De Diatryma', 'Wir Müssen Mal Reden', '鮮やかなる丸鳥「ディアトリマ」', NULL),
(523, 842, 'Food Fight', 'Food Fight', 'Un Rongeur, Un Volatile, Une Belle Pagaille', 'Futterneid', '雲海の大乱闘', NULL),
(524, 843, 'Leech The Sky', 'Leech The Sky', 'Hirudothérapie Géante', 'Eine Frage Der Größe', '薔薇の血を吸いたくて', NULL),
(525, 844, 'Anzu Trois', 'Anzu Trois', 'Et Zou, Plus D\'anzus !', 'Früh übt Sich, Oder Auch Nicht', '黒い鳥', NULL),
(526, 845, 'Youth Must Be Severed', 'Youth Must Be Severed', 'La Guerre Des Gundu', 'Der Übermut Der Jungen Gundo', '若気の至り', NULL),
(527, 846, 'A Long Way Down', 'A Long Way Down', 'Défi: De Haut En Bas', 'Ein Langer Fall', '不法投棄者「アポタムキン」', NULL),
(528, 847, 'This Is How We Gundu', 'This Is How We Gundu', 'Jeter La Première Pierre', 'Eindruck Schinden', '雲海の戦士', NULL),
(529, 851, 'Come To My Window', 'Come To My Window', 'Un Abus De Demainsels', 'Böses Erwachen', '素晴らしい新世界', NULL),
(530, 852, 'Obey Their Thirst', 'Obey Their Thirst', 'Des Noyaux Désaltérants', 'Der Kern Des Problems', '空の上の雲', NULL),
(531, 853, 'The Fugitive', 'The Fugitive', 'Le Repose-pieds Fugitif', 'Im Schweiße Seiner Hühneraugen', '逃亡者', NULL),
(532, 854, 'Zuns On The Run', 'Zuns On The Run', 'Le Repose-pieds Pris à Contre-pied', 'Ein Vundo Lässt Nicht Locker', '追跡者', NULL),
(533, 855, 'On Dangerous Ground', 'On Dangerous Ground', 'Défi: Mangeur De Terre Gardée', 'Wider Die Eigene Natur', '暴食の岩人形「グランズイーター」', NULL),
(534, 856, 'Leather And Mace', 'Leather And Mace', 'Des Durs En Cuir', 'Gebt Her Euer Leder', '補給線を断て', NULL),
(535, 857, 'Hearts Like Steel, Fists Like Thunder', 'Hearts Like Steel, Fists Like Thunder', 'Les Ennemis De Mes Ennemis...', 'Trimm Zwei', '招かれざる客', NULL),
(536, 860, 'Bones', 'Bones', 'Défi: Il Y A Un Os à Plume', 'Die Knochenjägerin', '恐怖の対象「積乱のオヌバリ」', NULL),
(537, 861, 'Bismarcking Time', 'Bismarcking Time', 'Défi: L\'incantateur Des Brumes', 'Primae Müssen Draußen Bleiben', '雲神の司祭「入道のケナバヌ」', NULL),
(538, 862, 'Let There Be Acolytes', 'Let There Be Acolytes', 'Les Acolytes De L\'incantateur', 'Rache Für Kena Vanu', 'ケナバヌの弟子たち', NULL),
(539, 863, 'A Disturbing Lack Of Faith', 'A Disturbing Lack Of Faith', 'Défi: L\'incantateur Des Brumes Revient', 'Der Priester Mit Dem Vogel', '復讐の司祭「入道のケナバヌ」', NULL),
(540, 864, 'Guano A Mano', 'Guano A Mano', 'Alerte Aux Bombardements Aériens', 'Erspart Uns Den Mist', '絨毯爆撃', NULL),
(541, 865, 'The Sound Of Madness', 'The Sound Of Madness', 'Défi: Podarge Au Pot', 'Wahnsinn Vorprogrammiert', '狂気の歌声「ポダルゲー」', NULL),
(542, 866, 'You Eat What You Aren\'t', 'You Eat What You Aren\'t', 'Défi: Dans Les Griffes D\'Akhekhu', 'Vanu Mit Soße', '雲海の狂風「アケク」', NULL),
(543, 867, 'A Dream, Perchance To Eat', 'A Dream, Perchance To Eat', 'Oiseaux Peu Lyriques', 'Die Traumfresser', '不吉な鳥は雲の彼方へ飛ぶ', NULL),
(544, 868, 'Darkscale Descendeth', 'Darkscale Descendeth', 'Défi: Sus à Sombrécaille', 'Dunkelschuppe I: Ein Drache Dreht Auf', 'ダークスケール征討戦：白竜支援', NULL),
(545, 869, 'Darkscale Disappeareth', 'Darkscale Disappeareth', 'Défi: Sombrécaille Se Soigne', 'Dunkelschuppe II: Ein Drache Dreht Ab', 'ダークスケール征討戦：追撃作戦', NULL),
(546, 870, 'Darkscale Devoureth', 'Darkscale Devoureth', 'Défi: Quand Sombre Sombrécaille', 'Dunkelschuppe III: Ein Drache Gibt Den Löffel Ab', 'ダークスケール征討戦：総力決戦', NULL),
(547, 871, 'Vedrfolnir Devoteth', 'Vedrfolnir Devoteth', 'Défi: Duel Amical Contre Vedrfolnir', 'Ehrenduell Mit Dem Weißen', '蒼天の白竜「ヴェズルフェルニル」', NULL),
(548, 872, 'End Of The Rainbow', 'End Of The Rainbow', 'Garde De Bébé Dragon', 'Aufpassdrachenkind', '白亜の宮殿防衛戦：子竜救援', NULL),
(549, 873, 'Rastaban Vibration', 'Rastaban Vibration', 'Sus Aux Sous-fifres!', 'Rastabans Rage', '白亜の宮殿防衛戦：猛竜討伐', NULL),
(550, 874, 'Mogicide', 'Mogicide', 'Défi: Touche Pas Mes Mogs', 'Sadistische Spiele', '白亜の宮殿防衛戦：モーグリ救援', NULL),
(551, 875, 'Rebel Yehl', 'Rebel Yehl', 'Défi: Clouer Le Bec à Yehl', 'Der Schrecken Der Lüfte', '大嘴の怪鳥「イェル」', NULL),
(552, 877, 'Prey Online', 'Prey Online', 'Proto-Ultima: La Menace Surgie Du Passé', 'Ultima: Ein Prototyp Tankt Auf', '太古の脅威：ノクチルカ撃滅戦', NULL),
(553, 878, 'Prey Online', 'Prey Online', 'Proto-Ultima: La Menace Surgie Du Passé', 'Ultima: Ein Prototyp Tankt Auf', '太古の脅威：ノクチルカ撃滅戦', NULL),
(554, 879, 'Prey Online', 'Prey Online', 'Proto-Ultima: La Menace Surgie Du Passé', 'Ultima: Ein Prototyp Tankt Auf', '太古の脅威：ノクチルカ撃滅戦', NULL),
(555, 880, 'A Bug\'s Death', 'A Bug\'s Death', '1001 Circuits Morts', 'Lockere Schrauben', 'バグ報告ナンバー壱九九', NULL),
(556, 881, 'The Late Escape', 'The Late Escape', 'Fuite Tardive', 'Wir Packen Unseren Koffer', '輪廻の蛇', NULL),
(557, 882, 'Still Ticking', 'Still Ticking', 'Défi: Des Frasques à La Défrag\'', 'Der Fürst Und Der Richter', 'アラグ脅威のメカニズム', NULL),
(558, 883, 'Life Of Brain', 'Life Of Brain', 'Défi: Euthanasie Cérébrale', 'Hungriges Hirn', '狡知の魔獣「キマイラブレイン」', NULL),
(559, 884, 'The Monster Mass', 'The Monster Mass', 'Une Masse De Monstres', 'Empusen-Epidemie', '魔獣狩り', NULL),
(560, 885, 'Pet, Smart', 'Pet, Smart', 'Défi: Couchée, Sale Bête !', 'Blinde Wut', '忠義の妖王「ムチャリンダ」', NULL),
(561, 886, 'The Root Of Evil', 'The Root Of Evil', 'Des Plantes Monstres', 'Der Giftgrüne Daumen', 'ミュータントフラワーズ', NULL),
(562, 887, 'The Mystery Machine', 'The Mystery Machine', 'Gare à L\'avant-garde', 'Wehe, Wenn Sie Alleingelassen', 'スチールシティ', NULL),
(563, 888, 'Rampant Speculation', 'Rampant Speculation', 'Guerre Technologique', 'Das Bleibt Lieber Vergessen', 'ロストテクノロジー', NULL),
(564, 889, 'Put The Knives Down', 'Put The Knives Down', 'Bas Les Griffes', 'Alle Klauen Voll Zu Tun', '全自動手作業', NULL),
(565, 890, 'Scared Sylla', 'Scared Sylla', 'Défi: Mettre Sylla à Mal', 'Der Chef Ist Sauer', '魔導技師長「シラ・マル・アルビヌス」', NULL),
(566, 891, 'Phi Slamma Gamma East', 'Phi Slamma Gamma East', 'Recadrer Le Quadrant Est', 'Vertreibung Aus Gamma-Ost', 'ガンマ戦線バースト：東部', NULL),
(567, 892, 'Phi Slamma Gamma West', 'Phi Slamma Gamma West', 'Recadrer Le Quadrant Ouest', 'Vertreibung Aus Gamma-West', 'ガンマ戦線バースト：西部', NULL),
(568, 893, 'Phi Slamma Gamma South', 'Phi Slamma Gamma South', 'Recadrer Le Quadrant Sud', 'Vertreibung Aus Gamma-Süd', 'ガンマ戦線バースト：南部', NULL),
(569, 894, 'Yak It Up', 'Yak It Up', 'Yak à Le Faire', 'Tödliche Unzurechnungsfähigkeit', '無知性化の嵐', NULL),
(570, 895, 'No Greater Goryshche', 'No Greater Goryshche', 'Défi: Décapitation De Goryschche', 'Feuer Mit Feuer Bekämpfen', '人造多頭竜「ゴリシュチェ」', NULL),
(571, 897, 'Harvest Moon', 'Harvest Moon', 'Alerte Dans Le Vide', 'Ernter Des Todes', '大量誤発注事件', NULL),
(572, 898, 'Out Of Sight, Out Of Mind', 'Out Of Sight, Out Of Mind', 'Défi: Sthéno En Quarantaine', 'Stheno Abschreiben', '不吉なる実験体「ステンノー」', NULL),
(573, 899, 'A Room Without Books', 'A Room Without Books', 'Traitement D\'amphiptère', 'Seelenlose Grausamkeit', '魂なき肉体のごとし', NULL),
(574, 900, 'Curiously Strong Things', 'Curiously Strong Things', 'Reptoïdes Tueurs à Tuer', 'Reptilische Rächer', 'ハイアラガンユーザー', NULL),
(575, 901, 'Do Spinners Dream Of Electric Rooks', 'Do Spinners Dream Of Electric Rooks', 'Défi: Les Drilles Rêvent-ils De Meules électriques ?', 'Der Rotierende Turm Von Azys Lla', '夢見る無人機「リックスピナー」', NULL),
(576, 902, 'Long Live The Coeurl', 'Long Live The Coeurl', 'Défi: Mort à La Reine Des Coeurls', 'Angriff Der Königin', '雷獣の女王「クァールレギナ」', NULL),
(577, 903, 'Coeurls Chase Boys', 'Coeurls Chase Boys', 'Défi: Du Coeurl à L\'ouvrage', 'Rückkehr Der Königin', '逆襲の女王「クァールレギナ」', NULL),
(578, 904, 'Coeurls Chase Boys', 'Coeurls Chase Boys', 'Défi: Du Coeurl à L\'ouvrage', 'Rückkehr Der Königin', '逆襲の女王「クァールレギナ」', NULL),
(579, 905, 'Coeurls Chase Boys Chase Coeurls', 'Coeurls Chase Boys Chase Coeurls', 'Défi: Coeurls Brisés', 'Entmachtung Der Königin', '幻影の女王「クァールレギナ」', NULL),
(580, 906, 'Coeurls Chase Boys Chase Coeurls', 'Coeurls Chase Boys Chase Coeurls', 'Défi: Coeurls Brisés', 'Entmachtung Der Königin', '幻影の女王「クァールレギナ」', NULL),
(581, 907, 'Coeurls Chase Boys Chase Coeurls', 'Coeurls Chase Boys Chase Coeurls', 'Défi: Coeurls Brisés', 'Entmachtung Der Königin', '幻影の女王「クァールレギナ」', NULL),
(582, 908, 'Sphenopalatine Ganglioneuralgia', 'Sphenopalatine Ganglioneuralgia', 'De La Glace à Piler!', 'Eiskalte Killer', 'アイスクリーム頭痛', NULL),
(583, 909, 'A Stihi Situation', 'A Stihi Situation', 'Défi: Stihi, C\'est Fini!', 'Der Erzfeind Der Vollstrecker', '冷酷なる氷竜「スティヒ」', NULL),
(584, 910, 'Ware The Maiden Fair', 'Ware The Maiden Fair', 'Défi: La Vierge Marrie', 'Drachenmaid, Hast Du Heut Für Mich Zeit', '変貌せし乙女「ドラゴンメイデン」', NULL),
(585, 911, 'Recurring Bugs', 'Recurring Bugs', 'Corriger Les Bugs', 'Wiederkehrende Bugs', 'バグフィックス', NULL),
(586, 912, 'Recurring Bugs', 'Recurring Bugs', 'Corriger Les Bugs', 'Wiederkehrende Bugs', 'バグフィックス', NULL),
(587, 913, 'The Sarong Song', 'The Sarong Song', 'Défi: Le Regard Froid Du Mamool Ja', 'Eins, Zwei, Sittenpolizei', '紅蓮祭「良俗の守護者」', NULL),
(588, 914, 'The Belle Of The Beach', 'The Belle Of The Beach', 'Ce N\'est Qu\'un Amour De Vacances', 'Verrückt Nach Dir', '紅蓮祭「一夏の熱狂」', NULL),
(589, 915, 'Sparking Up The Wrong Beach', 'Sparking Up The Wrong Beach', 'Jouer Avec Le Feu', 'Zündeln Verboten', '紅蓮祭「危険な火遊び」', NULL),
(590, 916, 'It Came From Beneath The Deep', 'It Came From Beneath The Deep', 'Défi: Dressé Contre Son Maître', 'Seeungeheuer Bitte Anleinen', '紅蓮祭「海獣の調教師」', NULL),
(591, 917, 'Life\'s A Beach', 'Life\'s A Beach', 'Dragueurs De Bac à Sable', 'Badelust, Badefrust', '紅蓮祭「軟派者の末路」', NULL),
(592, 918, 'Feeling Groggy', 'Feeling Groggy', 'Des Bouteilles à La Mer', 'Und Ne Buddel Voll Rum', '紅蓮祭「海賊の密造酒」', NULL),
(593, 932, 'Our Favorite Pastime', 'Our Favorite Pastime', 'Crabes Martyrs', 'Räuber Mit Den Scherenhänden', '星唄異聞：あなたの為に', NULL),
(594, 933, 'The Way Of The Samurai', 'The Way Of The Samurai', 'De L\'excellence Du Samouraï', 'Der Weg Des Samurai', '星唄異聞：偉大な侍の証', NULL),
(595, 934, 'Serket Breaker', 'Serket Breaker', 'Un Scorpion Pas Si Pacifique', 'Skorpione Beißen Nicht', '星唄異聞：計り知れない強敵', NULL),
(596, 935, 'The Key To Amatsu: Kyori', 'The Key To Amatsu: Kyori', 'Le Secret D\'Amatsu: Kyôri', 'Der Schlüssel Zu Amatsu Kyori', '星唄異聞：「鏡裏」の極意', NULL),
(597, 936, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(598, 937, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(599, 938, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(600, 939, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(601, 940, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(602, 941, 'Pounding Rice, Pounding Hearts', 'Pounding Rice, Pounding Hearts', 'Le Mochi, ça Rend Marteau!', 'Reis Stampfen, Herzen Erobern', '降神祭「モチモチ餅持ち逃げろ！」', NULL),
(603, 942, 'Eggstract And Eggspedite', 'Eggstract And Eggspedite', 'Chasse Aux Prœufs', 'Fröhliche Eiersuche', 'エッグハント「集めろ飾りタマゴ」', NULL),
(604, 943, 'Eggstract And Eggspedite', 'Eggstract And Eggspedite', 'Chasse Aux Prœufs', 'Fröhliche Eiersuche', 'エッグハント「集めろ飾りタマゴ」', NULL),
(605, 944, 'Eggstract And Eggspedite', 'Eggstract And Eggspedite', 'Chasse Aux Prœufs', 'Fröhliche Eiersuche', 'エッグハント「集めろ飾りタマゴ」', NULL),
(606, 945, 'In Deep Water', 'In Deep Water', 'Pourvu Que Les Méchants Perdent!', 'Heiße Gewässer', '紅蓮祭「襲来 ボンバード！」', NULL),
(607, 946, 'Trial By Fire', 'Trial By Fire', 'Pourvu Que Les Gentils Gagnent!', 'Die Rückkehr Des Königs', '紅蓮祭「登場 火消しの戦士！」', NULL),
(608, 959, 'Pounding More Mochi, Pounding More Hearts', 'Pounding More Mochi, Pounding More Hearts', 'Pour Une Poignée De Mochi', 'Mehr Reis Stampfen, Mehr Herzen Erobern', '降神祭「モチモチ餅取り逃げろ！」', NULL),
(609, 960, 'Pounding More Mochi, Pounding More Hearts', 'Pounding More Mochi, Pounding More Hearts', 'Pour Une Poignée De Mochi', 'Mehr Reis Stampfen, Mehr Herzen Erobern', '降神祭「モチモチ餅取り逃げろ！」', NULL),
(610, 963, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(611, 964, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(612, 965, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(613, 966, 'Prepare For Gory', 'Prepare For Gory', 'Le Parfum Enivrant De L\'éther', 'Im Schatten Von Kerkes', '大雲海を行く渡り鳥', NULL),
(614, 967, 'Prepare For Gory', 'Prepare For Gory', 'Le Parfum Enivrant De L\'éther', 'Im Schatten Von Kerkes', '大雲海を行く渡り鳥', NULL),
(615, 968, 'Secret Of The Lost Legend', 'Secret Of The Lost Legend', 'Défi: Brachiosaures En Famille', 'Geheimnis Der Verschollenen Legende', '星呼の古代獣「ブラキオレイドス」', NULL),
(616, 969, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(617, 970, 'Slaughter Of The Lost Legend', 'Slaughter Of The Lost Legend', 'Petit, Un Jour Tu Ne Seras Pas Grand', 'Ende Der Verschollenen Legende', '恐竜伝説ベイビー', NULL),
(618, 971, 'Embrace Of The Serpent', 'Embrace Of The Serpent', 'Défi: Le Serpent Aux écailles D\'argent', 'Tödliche Umarmung', '銀鱗の雲海蛇「バシロサウルス」', NULL),
(619, 972, 'The Pelican Grief', 'The Pelican Grief', 'La Brise De Pierre', 'Das Pelikan-Problem', '石の夜風', NULL),
(620, 973, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(621, 974, 'Late Night Torama Queen', 'Late Night Torama Queen', 'La Nuit Du Chasseur', 'Torama Queen', '狩人の夜', NULL),
(622, 975, 'Late Night Torama Queen', 'Late Night Torama Queen', 'La Nuit Du Chasseur', 'Torama Queen', '狩人の夜', NULL),
(623, 976, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(624, 977, 'Crawllateral Damage', 'Crawllateral Damage', 'Amitié Entomologique', 'Insektenbund', '雲海最大のヒモ', NULL),
(625, 978, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(626, 979, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(627, 980, 'I Can Wring A Rainbow', 'I Can Wring A Rainbow', 'Les Dévoreuses De Couleurs', 'Regenbogenfresser', '虹を喰う者たち', NULL),
(628, 981, 'I Can Wring A Rainbow', 'I Can Wring A Rainbow', 'Les Dévoreuses De Couleurs', 'Regenbogenfresser', '虹を喰う者たち', NULL),
(629, 982, 'I Can Wring A Rainbow', 'I Can Wring A Rainbow', 'Les Dévoreuses De Couleurs', 'Regenbogenfresser', '虹を喰う者たち', NULL),
(630, 983, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(631, 984, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(632, 985, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(633, 986, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(634, 987, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(635, 988, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(636, 989, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(637, 990, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(638, 991, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(639, 992, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(640, 993, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(641, 994, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(642, 995, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(643, 996, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(644, 997, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(645, 998, 'How I Met Your Marid', 'How I Met Your Marid', 'Défi: Crise De Noctambulisme', 'Unruhige Nächte', '夢遊の長老「イリズイマ」', NULL),
(646, 999, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(647, 1000, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(648, 1001, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(649, 1002, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(650, 1003, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(651, 1004, 'Shard To Get', 'Shard To Get', 'Les éléments S\'éclatent!', 'Scherbenhaufen', '放属性シャードの回収', NULL),
(652, 1005, 'Root Of The Problem', 'Root Of The Problem', 'Nécrophagie Végétale', 'Wurzel Des Problems', '死に花を咲かせよ', NULL),
(653, 1006, 'Root Of The Problem', 'Root Of The Problem', 'Nécrophagie Végétale', 'Wurzel Des Problems', '死に花を咲かせよ', NULL),
(654, 1007, 'Root Of The Problem', 'Root Of The Problem', 'Nécrophagie Végétale', 'Wurzel Des Problems', '死に花を咲かせよ', NULL),
(655, 1008, 'Nice Pirates', 'Nice Pirates', 'La Détresse D\'un Pirate', 'Pirat In Not', 'ある空賊の受難', NULL),
(656, 1009, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(657, 1010, 'Pretty Flies', 'Pretty Flies', 'Accros à L\'hémoglobine', 'Blutsauger', '虫沸きぬ', NULL),
(658, 1011, 'Late-night Snack', 'Late-night Snack', 'Gorilles Dans Les Ténèbres', 'Mitternachtssnack', '闇夜のギガントピテクス', NULL),
(659, 1012, 'Late-night Snack', 'Late-night Snack', 'Gorilles Dans Les Ténèbres', 'Mitternachtssnack', '闇夜のギガントピテクス', NULL),
(660, 1013, 'Any Which Way', 'Any Which Way', 'Les Mauvais Garçons', 'Einzelgänger', 'ダーティファイター', NULL),
(661, 1014, 'Any Which Way', 'Any Which Way', 'Les Mauvais Garçons', 'Einzelgänger', 'ダーティファイター', NULL),
(662, 1015, 'Nice Pirates', 'Nice Pirates', 'La Détresse D\'un Pirate', 'Pirat In Not', 'ある空賊の受難', NULL),
(663, 1016, 'Who\'ll Stop The Sovereign', 'Who\'ll Stop The Sovereign', 'Défi: La Vengeance D\'un Monarque', 'Stoppt Den Souverän', '復讐の猿人王「キングウフィティ」', NULL),
(664, 1017, 'Who\'ll Stop The Sovereign', 'Who\'ll Stop The Sovereign', 'Défi: La Vengeance D\'un Monarque', 'Stoppt Den Souverän', '復讐の猿人王「キングウフィティ」', NULL),
(665, 1018, 'Who\'ll Stop The Sovereign', 'Who\'ll Stop The Sovereign', 'Défi: La Vengeance D\'un Monarque', 'Stoppt Den Souverän', '復讐の猿人王「キングウフィティ」', NULL),
(666, 1019, 'Hard Of Heren', 'Hard Of Heren', 'Carnivores Des Nuages', 'Hungriger Herensugue', '失われた雲海', NULL),
(667, 1020, 'Battle Toads', 'Battle Toads', 'Périr Le Ventre Vide', 'Gefräßige Kröten', '食べる前に殺す', NULL),
(668, 1021, 'Battle Toads', 'Battle Toads', 'Périr Le Ventre Vide', 'Gefräßige Kröten', '食べる前に殺す', NULL),
(669, 1022, 'Battle Toads', 'Battle Toads', 'Périr Le Ventre Vide', 'Gefräßige Kröten', '食べる前に殺す', NULL),
(670, 1023, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(671, 1024, 'Loose Endymions', 'Loose Endymions', 'Les Séducteurs Ailés', 'Die Endymien Sind Los', '北洋の人拐い', NULL),
(672, 1025, 'Bounty Hunter', 'Bounty Hunter', 'Défi: La Terreur Des Aéronefs', 'Kopfgeldjäger', '雲海の撃墜王「ホイタ」', NULL),
(673, 1026, 'Bounty Hunter', 'Bounty Hunter', 'Défi: La Terreur Des Aéronefs', 'Kopfgeldjäger', '雲海の撃墜王「ホイタ」', NULL),
(674, 1027, 'Lords Of The Sting', 'Lords Of The Sting', 'Circulez, Y A Pas D\'ombrelles', 'Gefährliche Jagdgründe', 'ワスプストライク', NULL),
(675, 1028, 'Lords Of The Sting', 'Lords Of The Sting', 'Circulez, Y A Pas D\'ombrelles', 'Gefährliche Jagdgründe', 'ワスプストライク', NULL),
(676, 1029, 'Lords Of The Sting', 'Lords Of The Sting', 'Circulez, Y A Pas D\'ombrelles', 'Gefährliche Jagdgründe', 'ワスプストライク', NULL),
(677, 1030, 'Lords Of The Sting', 'Lords Of The Sting', 'Circulez, Y A Pas D\'ombrelles', 'Gefährliche Jagdgründe', 'ワスプストライク', NULL),
(678, 1031, 'Cloudy With A Chance Of...Thal\'s Balls', 'Cloudy With A Chance Of...Thal\'s Balls', 'Les Nuages Mangeurs D\'hommes', 'Bewölkt Bis Gefräßig', '沸き立つ雲のように', NULL),
(679, 1032, 'Cloudy With A Chance Of...Thal\'s Balls', 'Cloudy With A Chance Of...Thal\'s Balls', 'Les Nuages Mangeurs D\'hommes', 'Bewölkt Bis Gefräßig', '沸き立つ雲のように', NULL),
(680, 1033, 'Cloudy With A Chance Of...Thal\'s Balls', 'Cloudy With A Chance Of...Thal\'s Balls', 'Les Nuages Mangeurs D\'hommes', 'Bewölkt Bis Gefräßig', '沸き立つ雲のように', NULL),
(681, 1034, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(682, 1035, 'Where\'s The Beef', 'Where\'s The Beef', 'Défi: Le Bovin Mythique', 'Aufgebrachte Herde', '古の巨獣「フォゴットン・ウィセント」', NULL),
(683, 1036, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(684, 1037, 'Sticking Celphies', 'Sticking Celphies', 'Un Regard Très Perçant', 'Gefährliche Augenblicke', '魔眼の光', NULL),
(685, 1038, 'Can You Smell The Blood Tonight', 'Can You Smell The Blood Tonight', 'Rois Ou Empereurs?', 'Blutige Rache', '大帝か王か', NULL),
(686, 1039, 'Can You Smell The Blood Tonight', 'Can You Smell The Blood Tonight', 'Rois Ou Empereurs?', 'Blutige Rache', '大帝か王か', NULL),
(687, 1040, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(688, 1041, 'Hail To The E', 'Hail To The E', 'Défi: Efflorescence Fétide', 'Luftverschmutzung', '異臭の華族「エクセントリック・イヴ」', NULL),
(689, 1042, 'Lunantishee In The Sky', 'Lunantishee In The Sky', 'Entreprise De Désodorisation', 'Lunantishees In Der Luft', '消臭力尽く', NULL),
(690, 1043, 'Lunantishee In The Sky', 'Lunantishee In The Sky', 'Entreprise De Désodorisation', 'Lunantishees In Der Luft', '消臭力尽く', NULL),
(691, 1044, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(692, 1045, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(693, 1046, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(694, 1047, 'Whiplash', 'Whiplash', 'Experts En Torture', 'Peitschenschlag', 'ムチとムチ', NULL),
(695, 1048, 'Whiplash', 'Whiplash', 'Experts En Torture', 'Peitschenschlag', 'ムチとムチ', NULL),
(696, 1049, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(697, 1050, 'Blood Wings', 'Blood Wings', 'À Tire D\'aile', 'Sanfte Gewalt', '翼をさずける', NULL),
(698, 1051, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(699, 1052, 'NOT THE TREES', 'NOT THE TREES', 'Les Géants Au Feuillage Touffu', 'Mein Freund, Der Baum?', '根も葉もある噂', NULL),
(700, 1053, 'NOT THE TREES', 'NOT THE TREES', 'Les Géants Au Feuillage Touffu', 'Mein Freund, Der Baum?', '根も葉もある噂', NULL),
(701, 1054, 'NOT THE TREES', 'NOT THE TREES', 'Les Géants Au Feuillage Touffu', 'Mein Freund, Der Baum?', '根も葉もある噂', NULL),
(702, 1055, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(703, 1056, 'Tightropen', 'Tightropen', 'Défi: Pêche Au Gros', 'Fischersterben', 'ヌシを超える者「ローペン」', NULL),
(704, 1057, 'I\'m The Scatman', 'I\'m The Scatman', 'Migration Interdite', 'Unerwünschte Einwanderer', '営巣を阻止せよ', NULL),
(705, 1058, 'Wild Hunt', 'Wild Hunt', 'Les Yeux Plus Gros Que Le Ventre', 'Wilde Jagd', 'ワイルドハント', NULL),
(706, 1059, 'Wild Hunt', 'Wild Hunt', 'Les Yeux Plus Gros Que Le Ventre', 'Wilde Jagd', 'ワイルドハント', NULL),
(707, 1060, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(708, 1061, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(709, 1062, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(710, 1063, '(You\'re) Killing My Mitelings', '(You\'re) Killing My Mitelings', 'Le Temps Des Amours', 'Milbenbefall', 'バルーニングの季節', NULL),
(711, 1064, '(You\'re) Killing My Mitelings', '(You\'re) Killing My Mitelings', 'Le Temps Des Amours', 'Milbenbefall', 'バルーニングの季節', NULL),
(712, 1065, '(You\'re) Killing My Mitelings', '(You\'re) Killing My Mitelings', 'Le Temps Des Amours', 'Milbenbefall', 'バルーニングの季節', NULL),
(713, 1066, '(You\'re) Killing My Mitelings', '(You\'re) Killing My Mitelings', 'Le Temps Des Amours', 'Milbenbefall', 'バルーニングの季節', NULL),
(714, 1067, '(You\'re) Having My Mitelings', '(You\'re) Having My Mitelings', 'Lune De Miel Sans Fin', 'Wo Die Liebe Hinfällt', 'ダイアマイト・ウェディングパーティー', NULL),
(715, 1068, 'Nice Pirates', 'Nice Pirates', 'La Détresse D\'un Pirate', 'Pirat In Not', 'ある空賊の受難', NULL),
(716, 1069, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(717, 1070, '(You\'re Not) Having My Mitelings', '(You\'re Not) Having My Mitelings', 'Les Malheurs Du Célibat', 'Liebesfrust', 'ダイアマイト・バチェラーパーティー', NULL),
(718, 1071, '(You\'re Not) Having My Mitelings', '(You\'re Not) Having My Mitelings', 'Les Malheurs Du Célibat', 'Liebesfrust', 'ダイアマイト・バチェラーパーティー', NULL),
(719, 1072, 'Root Of The Problem', 'Root Of The Problem', 'Nécrophagie Végétale', 'Wurzel Des Problems', '死に花を咲かせよ', NULL),
(720, 1073, 'Good-bye Solo', 'Good-bye Solo', 'Défi: Le Félin Ermite', 'Einsamer Tiger', '孤高の剣虎「ガージス」', NULL),
(721, 1074, 'Purple Haze', 'Purple Haze', 'Défi: Un Régime à Base De Calories', 'Der Große Purpurwurm Nimmersatt', '偏食の地底王「パープルウォーム」', NULL),
(722, 1075, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(723, 1076, 'Fly By Day', 'Fly By Day', 'Ça Part En Vrille!', 'Achtung, Hornfliegen!', '飛ぶ飛空艇を落とす勢い', NULL),
(724, 1077, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(725, 1078, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(726, 1079, 'Forest For The Trees', 'Forest For The Trees', 'Arbres En Folie', 'Bäume Im Rausch Des Wahnsinns', 'ディアデムの森', NULL),
(727, 1080, 'Forest For The Trees', 'Forest For The Trees', 'Arbres En Folie', 'Bäume Im Rausch Des Wahnsinns', 'ディアデムの森', NULL),
(728, 1081, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(729, 1082, 'Hard Of Heren', 'Hard Of Heren', 'Carnivores Des Nuages', 'Hungriger Herensugue', '失われた雲海', NULL),
(730, 1083, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(731, 1084, 'The Other White Meat', 'The Other White Meat', 'Empêcheurs De Pêcher En Rond', 'Frische Fischer', '生まれ出ずる悩み', NULL),
(732, 1085, 'Mad Ventures In Retainer-sitting', 'Mad Ventures In Retainer-sitting', 'Dévouement Aveugle', 'Riskante Unternehmungen', '無謀すぎた探索', NULL),
(733, 1086, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(734, 1087, 'Westwhirled', 'Westwhirled', 'Invasion De Sanuwas', 'Luftturbulenzen', '大空のサヌワ', NULL),
(735, 1088, 'Am I Blue', 'Am I Blue', 'Le Bleu De La Mer De Nuages', 'Tiefes Blau Sieht Rot', '不幸せの青い雲', NULL),
(736, 1089, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(737, 1090, 'Excitable Boys', 'Excitable Boys', 'Radiations Néfastes', 'Elementarer Wahnsinn', '放属性シャードの悪影響', NULL),
(738, 1091, 'Who\'s For Dinner', 'Who\'s For Dinner', 'Sus Aux Constricteurs', 'Die Würger Vom Diadem', '叫び声さえ呑み込まれる', NULL),
(739, 1092, 'Who\'s For Dinner', 'Who\'s For Dinner', 'Sus Aux Constricteurs', 'Die Würger Vom Diadem', '叫び声さえ呑み込まれる', NULL),
(740, 1093, 'Who\'s For Dinner', 'Who\'s For Dinner', 'Sus Aux Constricteurs', 'Die Würger Vom Diadem', '叫び声さえ呑み込まれる', NULL),
(741, 1094, 'On The Inside', 'On The Inside', 'Défi: L\'éventreur De L\'azur', 'Die Schlitzer Vom Diadem', '美食の凶鳥「ガルピュデス」', NULL),
(742, 1095, 'Blacker Than The Foulest Witch', 'Blacker Than The Foulest Witch', 'Les Admiratrices Du Cheval Ailé', 'Fabelwesen In Aufruhr', '翼をください', NULL),
(743, 1096, 'Blacker Than The Foulest Witch', 'Blacker Than The Foulest Witch', 'Les Admiratrices Du Cheval Ailé', 'Fabelwesen In Aufruhr', '翼をください', NULL),
(744, 1097, 'Blacker Than The Foulest Witch', 'Blacker Than The Foulest Witch', 'Les Admiratrices Du Cheval Ailé', 'Fabelwesen In Aufruhr', '翼をください', NULL),
(745, 1098, 'How I Met Your Marid', 'How I Met Your Marid', 'Défi: Crise De Noctambulisme', 'Unruhige Nächte', '夢遊の長老「イリズイマ」', NULL),
(746, 1099, 'Lunantishee In The Sky', 'Lunantishee In The Sky', 'Entreprise De Désodorisation', 'Lunantishees In Der Luft', '消臭力尽く', NULL),
(747, 1100, 'Pretty Flies', 'Pretty Flies', 'Accros à L\'hémoglobine', 'Blutsauger', '虫沸きぬ', NULL),
(748, 1103, 'A Horse Outside', 'A Horse Outside', 'Défi: L\'étalon Survolté', 'Höllenross', '伝説の雷馬「イクシオン」', NULL),
(749, 1104, 'A Horse Outside', 'A Horse Outside', 'Défi: L\'étalon Survolté', 'Höllenross', '伝説の雷馬「イクシオン」', NULL),
(750, 1105, 'A Horse Outside', 'A Horse Outside', 'Défi: L\'étalon Survolté', 'Höllenross', '伝説の雷馬「イクシオン」', NULL),
(751, 1106, 'Foxy Lady', 'Foxy Lady', 'Défi: La Renarde Fait Surface', 'Fuchsige Dame', '九尾の妖狐「玉藻御前」', NULL),
(752, 1107, 'Foxy Lady', 'Foxy Lady', 'Défi: La Renarde Fait Surface', 'Fuchsige Dame', '九尾の妖狐「玉藻御前」', NULL),
(753, 1108, 'Foxy Lady', 'Foxy Lady', 'Défi: La Renarde Fait Surface', 'Fuchsige Dame', '九尾の妖狐「玉藻御前」', NULL),
(754, 1109, 'Outfoxed', 'Outfoxed', 'Rusera Bien Qui Rusera Le Dernier', 'Ausgefuchst', 'その名はミクズメ', NULL),
(755, 1110, 'Freedom Flies', 'Freedom Flies', 'Prétendants Gênants', 'Kinko In Gefahr', 'キンコの願い', NULL),
(756, 1111, 'More To Offer', 'More To Offer', 'Les Offrandes De Ginko', 'Ginkos Opfergaben', 'ギンコの願い', NULL),
(757, 1112, 'Showing The Recruits What For', 'Showing The Recruits What For', 'Donner La Réplique Aux Soldats', 'Training Für Rekruten', 'ブートキャンプ：兵卒編', NULL),
(758, 1113, 'Showing The Officers What For', 'Showing The Officers What For', 'Donner La Réplique Aux Sous-officiers', 'Training Für Unteroffiziere', 'ブートキャンプ：下士編', NULL),
(759, 1114, 'Showing The Commanders What For', 'Showing The Commanders What For', 'Donner La Réplique Aux Officiers', 'Training Für Offiziere', 'ブートキャンプ：士官編', NULL),
(760, 1115, 'Death Beckons', 'Death Beckons', 'Et Au Milieu Coule Un Ruisseau', 'Krokomania', 'ワニワニ、ワニっす！', NULL),
(761, 1116, 'Unbearable', 'Unbearable', 'Danse Avec Les Ours', 'Die Mit Den Bären Tanzen', '熊と踊れ', NULL),
(762, 1117, 'The Secret Life Of Plants', 'The Secret Life Of Plants', 'Saprias, C\'est Fini', 'Pflanzen Mit Großem Magen', 'チルドレン・オブ・ザ・サプリア', NULL),
(763, 1118, 'Dizzy Miss Grizzly', 'Dizzy Miss Grizzly', 'Défi: Bon Ours, Bon œil', 'Wiedergänger, Wiederkäuer', '混交林の大熊「シャープアイ・グリズリー」', NULL),
(764, 1119, 'Roid Rage', 'Roid Rage', 'Défi: Dopage Alchimique', 'Angriff Der Killerkrokos', '悲劇の変異体「ギガゲイター」', NULL),
(765, 1120, 'Keeping The Peace', 'Keeping The Peace', 'Purge Aux Marges', 'Aushilfsjäger', '辺境パトロール', NULL),
(766, 1121, 'Keeping More Peace', 'Keeping More Peace', 'Nouvelle Purge Aux Marges', 'Die Aushilfsjäger Jagen Wieder', '続・辺境パトロール', NULL),
(767, 1122, 'Double Dhara', 'Double Dhara', 'Gare Aux Dharas', 'Dhara-Derby', '次の岩に続く', NULL),
(768, 1124, 'Bold This Way', 'Bold This Way', 'Gaganas Pique-assiette', 'Völlig Gaga', 'チョコボではない', NULL),
(769, 1125, 'The Morning After', 'The Morning After', 'Pulsions Déplacées', 'Fleischeslüste', 'トンボ身重く横たわる', NULL),
(770, 1126, 'Thank You For Not Mossling', 'Thank You For Not Mossling', 'Repousser Les Moussemousses', 'Ohne Moos Mehr Los', '実はモス生まれ', NULL),
(771, 1127, 'The Mail Must Get Through', 'The Mail Must Get Through', 'Sus Aux Saillots', 'Poststau', '果しなき河よ我を誘え', NULL),
(772, 1128, 'Diakka Round', 'Diakka Round', 'Au Diable Les Diakkas!', 'Dickes Ding', 'グゥレイト！', NULL),
(773, 1129, 'The Evil Seed', 'The Evil Seed', 'Défi: Mauvaise Graine', 'Die Saat Des Bösen', '樹人の長老「キルニス」', NULL),
(774, 1130, 'The Spiderweb Chronicles', 'The Spiderweb Chronicles', 'Défi: La Colline A Huit Yeux', 'Ich Glaub, Ich Spinne!', '人喰い大蜘蛛「アンカブート」', NULL),
(775, 1131, 'The Antlion\'s Share', 'The Antlion\'s Share', 'Un Fourmilion Fort Mignon', 'Ameisenlöwenhunger', 'アントリオンは大人しいんだ', NULL),
(776, 1132, 'Really Don\'t Keratyrannos', 'Really Don\'t Keratyrannos', 'Défi: Un Tyran Au Ban', 'Der Unnahbare', '大角の脱走兵「ケラチラノス」', NULL),
(777, 1133, 'Get Sharp', 'Get Sharp', 'Chasse En Hauteur', 'Steinsplitterzeit', '新石器時代', NULL),
(778, 1134, 'The Tele-tale Hunt', 'The Tele-tale Hunt', 'Les Caches Font De La Résistance', 'Finger Weg!', '所有せざる人々', NULL),
(779, 1135, 'Pop The Trunk', 'Pop The Trunk', 'Défi: Martyriser Les Marids', 'Hiebe Aus Liebe', '暴走の巨象「ランページング・マーリド」', NULL),
(780, 1136, 'A Pain In The Neck', 'A Pain In The Neck', 'Colliers Serrés', 'Der Schmuckraub', '血をわけた姉妹', NULL),
(781, 1137, 'Flappy Berda', 'Flappy Berda', 'Défi: ça Va Barder Pour Berda', 'Flappy Berda', '白銀の人拐い「ベルダ」', NULL),
(782, 1138, 'Ananta And Her Sisters', 'Ananta And Her Sisters', 'Défi: Sœurs Vengeresses', 'Klauen Des Grauens', '鱗斬りの鉤爪「ジャターユ」', NULL),
(783, 1139, 'Raisin\' Hell', 'Raisin\' Hell', 'Défi: La Fille Du Soleil', 'Sonne Des Schreckens', '太陽の娘「ドリサナ」', NULL),
(784, 1140, 'Yes, This Is Dogs', 'Yes, This Is Dogs', 'Honnis Soient Les Canis', 'Wer Ließ Die Hunde Frei?', '野良犬', NULL),
(785, 1141, 'M Bop', 'M Bop', 'La Chasse Gardée Des M', 'Stolze Kriegerinnen', '高い村の女', NULL),
(786, 1142, 'Wet', 'Wet', 'Défi: L\'eau Elle Aime ça', 'Das Mädchen Mit Dem Nassen Haar', '牛鬼の使い「ヌレオンナ」', NULL),
(787, 1143, 'Clean Bill Of Health', 'Clean Bill Of Health', 'De Corvée Avec Les Bucorves', 'Stinkevögel', '迷惑な落とし物', NULL),
(788, 1144, 'Quoth The Raven', 'Quoth The Raven', 'Défi: à Tout Jamais', 'Für Immer Und Immer', '不吉な怪鳥「イツマデ」', NULL),
(789, 1145, 'Lay Of The Lang', 'Lay Of The Lang', 'Défi: On Craint Gedan', 'Langfinger Lang', '漁村の脅威「ケイボクロウ」', NULL),
(790, 1146, 'Pool Party', 'Pool Party', 'Vidange Pour Les Bleus', 'Pool-Party', '青い紅玉', NULL);
INSERT INTO `fates_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`) VALUES
(791, 1147, 'Soak Up The Sun', 'Soak Up The Sun', 'Défi: Le Crabe Marche Sous La Tête', 'Schnipp-schnapp, Kopf Ab!', '敗戦の大兜「ミシルシ」', NULL),
(792, 1148, 'Agni\'s Philosophy', 'Agni\'s Philosophy', 'Défi: La Philosophie D\'Agni', 'Agnis Philosophie', '炎纏う者「アグニ」', NULL),
(793, 1149, 'The Coral High Ground', 'The Coral High Ground', 'Bons Comptes à OK Corail', 'Rubinrote Korallen', '赤い珊瑚礁', NULL),
(794, 1150, 'The Big Banquet Theory', 'The Big Banquet Theory', 'Privés De Banquet', 'Überfall Auf Die Korallentafeln', '紅甲羅関所破り', NULL),
(795, 1151, 'Uncivil Serpents', 'Uncivil Serpents', 'Des Serpents Dans Les îlots', 'Kriecher Aus Der Tiefe', '海からの侵略生物', NULL),
(796, 1152, 'Ray Band', 'Ray Band', 'Lâcher De Raies', 'Kampfrochen', '紅甲羅あばれ凧', NULL),
(797, 1153, 'Princess, Princess', 'Princess, Princess', 'Défi: La Princesse Aux Longues Dents', 'Prinzessin Yahiro', '飛鮫の姫君「ヤヒロノワニ」', NULL),
(798, 1154, 'Kill The Messenger', 'Kill The Messenger', 'Athlétiques Bibao', 'Unglücksraben', '渇きの海', NULL),
(799, 1155, 'The F-bomb', 'The F-bomb', 'Pêche à La Bombe', 'Bomber Oder Fisch?', '指きり拳万', NULL),
(800, 1156, 'Raise The Red Flag', 'Raise The Red Flag', 'L\'écarlate Scélérate', 'Kriegsherrin Der Rotpanzer', '紅甲羅海を渡る', NULL),
(801, 1157, 'Double Dream Clams', 'Double Dream Clams', 'Mollusque à Brusquer', 'Magische Muscheln', '夢の丘', NULL),
(802, 1158, 'There Be Dragonflies', 'There Be Dragonflies', 'Les Horreurs De L\'aurore', 'Vom Nordwind Gebracht', '北風のうしろ', NULL),
(803, 1159, 'Bilge-hold Jin', 'Bilge-hold Jin', 'Défi: Prendre Le Clandestin Par Les Cornes', 'Ein Berg Von Einem Gyuki', '無礼なる牛鬼「ジンリンキ」', NULL),
(804, 1160, 'Days Of Plunder', 'Days Of Plunder', 'Le Butin, ça Va, ça Vient', 'Des Wahnsinns Fette Beute', 'されど修羅ゆく君は', NULL),
(805, 1161, 'Forever Younglier', 'Forever Younglier', 'Défi: Le Chevalier D\'écailles', 'Junge, Junge, Diese Rotpanzer', '激流の亀忍者「十代のカタビラ」', NULL),
(806, 1162, 'Treasure Island', 'Treasure Island', 'Reprendre N\'est Pas Voler', 'Schatzsuche', '紅甲羅千両首', NULL),
(807, 1163, 'Sailor Marooned', 'Sailor Marooned', 'Maille à Partir', 'Jetzt Gibt\'s Tote', '知らぬが仏', NULL),
(808, 1164, 'Jumping The Shark', 'Jumping The Shark', 'Les Vils Requins', 'Haie Im Anflug', 'スカイシャークズ', NULL),
(809, 1165, 'Red Cliff', 'Red Cliff', 'Défi: Fais Tes Prières, Sogenbi', 'Sogenbis Sühne', '不徳の僧侶「ソウゲンビ」', NULL),
(810, 1166, 'Ranging Bull', 'Ranging Bull', 'Avant Qu\'il Ne Soit Taureau Tard', 'Rette Die Fische - Und Die Fischer!', '牛鬼泥棒', NULL),
(811, 1167, 'Another One Bites The Dust', 'Another One Bites The Dust', 'Défi: Le Samouraï Vagabond', 'Der Samurai Aus Den Bergen', '兵法修行人「一刀のセンバン」', NULL),
(812, 1168, 'Turtle Power', 'Turtle Power', 'Vagabond Contre Chasseur', 'Eingekesselt', '紅甲羅逆手斬り', NULL),
(813, 1170, 'Crab Mentality', 'Crab Mentality', 'Casse-toi Et Marche En Crabe', 'Einfach Mal Treiben Lassen', '兜割', NULL),
(814, 1171, 'Independence Ray', 'Independence Ray', 'Enrayer Les Raies Rayées', '12½ Rochen', '海の貴婦人', NULL),
(815, 1172, 'Never Say Daimyo', 'Never Say Daimyo', 'Défi: Amocher Les Daimyo', 'Fürstlicher Appetit', '夢見る大名「ダイミョウユメミ」', NULL),
(816, 1173, 'A New Leaf', 'A New Leaf', 'Le Qiqirn Végétarien', 'Der Freundliche Nager Von Nebenan', '完全菜食主義', NULL),
(817, 1174, 'Salad Days', 'Salad Days', 'Le Top De La Fraîcheur', 'Der Unfreundliche Nager Von Nebenan', '精進料理', NULL),
(818, 1175, 'A Bone To Pick', 'A Bone To Pick', 'Défi: Le Qiqirn Sournois Au Ventre Vide', 'Genug Genagt!', '空腹の詐欺師「肉食のミミルン」', NULL),
(819, 1176, 'And The Bandits Played On', 'And The Bandits Played On', 'Qu\'il Est Long, Le Chemin Du Retour', 'Und Täglich Grüßt Das Nagetier', '死ぬのは奴らだ', NULL),
(820, 1177, 'Of Mice And Men', 'Of Mice And Men', 'Repas à La Ferme', 'Feldmäuse In Groß', '血の収穫', NULL),
(821, 1178, 'Churlish Chapuli', 'Churlish Chapuli', 'Défi: Le Cauchemar Des Paysans', 'Gefräßiges Chapuli', '農民の悪夢「スパーナル・チャプリ」', NULL),
(822, 1179, 'Down With The Sickness', 'Down With The Sickness', 'Pic De Pollution', 'Einfach Nur Zum Heulen', 'ブラッドミュージック', NULL),
(823, 1180, 'Child\'s Plague', 'Child\'s Plague', 'Tenir Tête Au Fléau', 'Kinder Der Plage', 'チャプリの移民', NULL),
(824, 1181, 'You Don\'t Know Jack', 'You Don\'t Know Jack', 'Défi: Le Bûcheron Silencieux', 'Mit Dem Kopf Durch Den Wald', '沈黙の木樵「ランバージャック」', NULL),
(825, 1182, 'Winging It', 'Winging It', 'Défi: Etain, La Reine Des Fluturinis', 'Lila Lethargie', '魔蝶の王妃「エーディン」', NULL),
(826, 1184, 'Beat Boxes', 'Beat Boxes', 'Rats Dégriffés', 'Waffentruhe Zu Waffenruhe', 'アラガーナ防衛線', NULL),
(827, 1185, 'Barbershoppe', 'Barbershoppe', 'Défi: Le Barbier Diabolique', 'Ein Flotter Schnitt', '伝説の藪医者「ブルータルバーバー」', NULL),
(828, 1186, 'Fletching Returns', 'Fletching Returns', 'Empennage De Qualité', 'Federn Lassen', 'グリフィンの物語', NULL),
(829, 1187, 'Days Of Fluturini Past', 'Days Of Fluturini Past', 'Éclosion Lépidoptère', 'Alter Falter', '胡蝶の夢', NULL),
(830, 1188, 'Diceman Cometh', 'Diceman Cometh', 'Défi: Quitte Ou Double', 'Der Klotz, Der Aus Der Hölle Kam', '凶悪なる骰子「クラッブス」', NULL),
(831, 1189, 'Stuck In The Muud', 'Stuck In The Muud', 'Un Appétit D\'ogre', 'Gern Auch Gammelfleisch', '拷問者の影', NULL),
(832, 1190, 'Eat Big Or Go Home', 'Eat Big Or Go Home', 'La Hantise Des Hyurgoths', 'Wenn Der Große Hunger Kommt', 'ハイランダー悪魔の虫', NULL),
(833, 1191, 'Love Me, Tindalos', 'Love Me, Tindalos', 'Défi: L\'immonde Chien Féroce', 'Zum Fressen Gern', '不浄なる獣「ティンダロス」', NULL),
(834, 1193, 'Home On The Range', 'Home On The Range', 'L\'appel De L\'aventure', 'Plötzliches Heimweh', 'エルカ探検隊の大冒険', NULL),
(835, 1194, 'Rattle And Humbaba', 'Rattle And Humbaba', 'Défi: L\'affreux Humbaba', 'Hunba, Hunba, Hunba, Tätärä!', '豪腕の襲撃者「フンババ」', NULL),
(836, 1195, 'Forget-me-not', 'Forget-me-not', 'Prière Exaucée', 'Vergissmeinnicht', '待ってたんだ！', NULL),
(837, 1196, 'The Day Of The Griffins', 'The Day Of The Griffins', 'Oiseau De Proie', 'Zum Greifen Nah', '血より生まれし', NULL),
(838, 1197, 'Venting', 'Venting', 'Défi: Autant En Emporte Le Ventus', 'Hyperventilation', '暴風の元凶「ウェントゥス」', NULL),
(839, 1198, 'Breakneck', 'Breakneck', 'Défi: Casse-cou S\'abstenir', 'Hals- Und Genickbruch', '執行人の家系「ネックブリーカー」', NULL),
(840, 1199, 'Attack Of The Groans', 'Attack Of The Groans', 'Tourbillon De Poussière', 'Staub, Staub, überall Staub!', '風と共に来たる', NULL),
(841, 1200, 'Moth To A Flame', 'Moth To A Flame', 'Défi: Le Pyromane Des Pics', 'Feuer Ist Für Motten Nichts', '優雅なる放火魔「イグナモス」', NULL),
(842, 1201, 'Resist, Die, Repeat', 'Resist, Die, Repeat', 'Abnégation Héroïque', 'Definitionssache', 'チャプリの勇敢', NULL),
(843, 1202, 'Slaughterwife-five', 'Slaughterwife-five', 'Défi: Le Veuf Vengeur', 'Fünf Ist Trümpf', '復讐の寡男「ネナウニル」', NULL),
(844, 1203, 'Das Bhoot', 'Das Bhoot', 'Le Don Du Repos éternel', 'Und Was Sich Reimt, Ist Bhut', 'エクソシスト', NULL),
(845, 1204, '5-year Energy', '5-year Energy', 'Défi: Métamorphose En Suspens', 'Fünf Nahrhafte Jahre', '幸運なる大食漢「エナジェティック・エルカ」', NULL),
(846, 1205, 'Mouth For Water', 'Mouth For Water', 'Guerrière De La Tribu Des J', 'Die Grauen Panteras', 'ジャ族の戦士', NULL),
(847, 1207, 'The Magitek Is Back', 'The Magitek Is Back', 'Défi: Alarme Fatale', 'Brennpunkt Reifstein', '暴走最終兵器「リーサルウェポン」', NULL),
(848, 1208, 'A Tisket, A Tasket', 'A Tisket, A Tasket', 'Détrousseurs Koja', 'Gyogun Im Pech', 'ギョグンの不運', NULL),
(849, 1209, 'A Fish To Fry', 'A Fish To Fry', 'Détrousseurs Namazu', 'Gyogun Im Unglück', 'ギョグンの非運', NULL),
(850, 1210, 'Falling Drown', 'Falling Drown', 'Défi: Gyogun Le Garde-pêche', 'Gyogun Dreht Durch', '痺れる激情「豊漁のギョグン」', NULL),
(851, 1211, 'Scared Straightheart', 'Scared Straightheart', 'Le Lupin Est Un Loup Pour Le Lupin', 'Die Wolfskriege', '人狼：紅い足跡', NULL),
(852, 1212, 'Wolves Of A Feather', 'Wolves Of A Feather', 'La Meute Sanguinaire', 'Die Wolfskriege II', '人狼：鋼鉄の猟犬', NULL),
(853, 1213, 'Goodwill Hunterling', 'Goodwill Hunterling', 'Défi: Wakizashi Le Chasseur De Lames', 'Die Wolfskriege: Letzte Jagd', '紅い甲羅「刀狩のワキザシ」', NULL),
(854, 1214, 'Stay Of Eggsecution', 'Stay Of Eggsecution', 'Prise De Bec', 'Schnäbelrasseln', 'ベニツノ凶鳥狩り', NULL),
(855, 1215, 'Get Ready For A Nu Wave', 'Get Ready For A Nu Wave', 'Défi: Ovipare Ovivore', 'Nesträuber', '鯰狙いの大蛇「ニュ・ワー」', NULL),
(856, 1216, 'Deep Red Sea', 'Deep Red Sea', 'Les Dents Du Ciel', 'Wenn Haie Hunger Haben', '戦慄の血飛沫', NULL),
(857, 1217, 'To Catch A Weasel', 'To Catch A Weasel', 'Défi: Il Court, Il Court, Le Furet', 'Das Blutdurstige Wiesel', '扶持の狩手「フチカリ」', NULL),
(858, 1218, 'Footing The Bills', 'Footing The Bills', 'Éclosion Explosive', 'Skandal, Sie Schnäbeln Wieder!', '遮二無二', NULL),
(859, 1219, 'Tiger Need', 'Tiger Need', 'Tigres Grégaires', 'Das Auge Des Tigers', '虎のゆりかご', NULL),
(860, 1220, 'Leave The Meters Running', 'Leave The Meters Running', 'Topographie Rizicole', 'Die Nimmersatten Raupen', '怪しい虫', NULL),
(861, 1221, 'The Long And Rhino Road', 'The Long And Rhino Road', 'Régulation De Population', 'Hörner Stutzen', '狩って兜の緒を締めよ', NULL),
(862, 1222, 'Raze The Red Lantern', 'Raze The Red Lantern', 'La Meute De L\'ombre', 'Die Ganze Affenbande Brüllt', '猿の大軍団', NULL),
(863, 1223, 'Long Hands, Long Fingers', 'Long Hands, Long Fingers', 'Racines Ambulantes', 'Lange Hände, Lange Finger', 'テナガおじさん', NULL),
(864, 1224, 'Rice And Shine', 'Rice And Shine', 'Les écumeurs De Rizières', 'Sonst Setzlingst Was!', '稲生物怪録', NULL),
(865, 1225, 'In One Basket', 'In One Basket', 'La Recette De L\'omelette', 'Bauernfrühstück', 'ベニツノの卵は誰のもの', NULL),
(866, 1226, 'Tsurubebi Snugly', 'Tsurubebi Snugly', 'Défi: La Lueur Des Champs', 'Heiß, Heiß, Baby', '田園の怪火「ツルベビ」', NULL),
(867, 1227, 'Motherly Love', 'Motherly Love', 'Défi: Le Comédien Pourpre', 'Fürsorgliche Mutter', '紅色の役者「ショウシ」', NULL),
(868, 1228, 'Killer Apsaras', 'Killer Apsaras', 'Défi: Pollution Environnementale', 'Umweltsünden', '汚水の精「アプサラス」', NULL),
(869, 1229, 'Linquan Continental', 'Linquan Continental', 'Défi: Le Chien Noir De Yanxia', 'Hundsgemein', '青黒の妖犬「リンチュアン」', NULL),
(870, 1230, 'This Is A Da, This Is A Peng', 'This Is A Da, This Is A Peng', 'Défi: L\'éclipse à Plumes', 'Der Schrecken Der Sonnenanbeter', '日食の巨鳥「タイホウ」', NULL),
(871, 1231, 'Oneblade Wonder', 'Oneblade Wonder', 'Défi: Qui épouvante L\'épouvantail?', 'Albtraumhafte Scheuche', '狂える案山子「クエビコ」', NULL),
(872, 1232, 'Mister Whiskers', 'Mister Whiskers', 'Les Malandrins Du Goûter', 'Niederträchtige Namazuo', 'ナマズオどうしよう', NULL),
(873, 1233, 'Crying Wolves', 'Crying Wolves', 'Les Lupins Solitaires', 'Gefallene Wölfe', '人狼の野武士', NULL),
(874, 1234, 'Mada\'s Ilk', 'Mada\'s Ilk', 'Renforts Intrépides', 'Grimmige Blicke', '烈士伝', NULL),
(875, 1235, 'Tora Tora Tora', 'Tora Tora Tora', 'Tora! Tora! Tora!', 'Getrübter Badespaß', 'トラ、トラ、トラ！', NULL),
(876, 1236, 'Ragoh To Extremes', 'Ragoh To Extremes', 'Défi: Ragoh Perd La Tête', 'Von Allen Guten Geistern Verlassen', '巨頭の暴君「ラゴウ」', NULL),
(877, 1237, 'Très Bian', 'Très Bian', 'Défi: Avis D\'éviction', 'Tiger Troll Dich', '精強なる老虎「ヘイカン」', NULL),
(878, 1238, 'Curiosity Killed The Catfish', 'Curiosity Killed The Catfish', 'Défi: Le Géant De Fer', 'Naseweise Namazuo', '逆心の巨兵「キドウ丸」', NULL),
(879, 1239, 'The Virgin Homicides', 'The Virgin Homicides', 'Chiens De Bonne Herpe', 'Auf Den Hund Gekommen', '妖犬伝説', NULL),
(880, 1240, 'Dead To Rites: Kiyofusa', 'Dead To Rites: Kiyofusa', 'Cosmologie Hingashienne: Le Shikigami Kiyofusa', 'Die Geister, Die Sie Riefen', '陰陽師：清房ノ巻', NULL),
(881, 1241, 'Dead To Rites: Koja', 'Dead To Rites: Koja', 'Cosmologie Hingashienne: Le Shikigami Koja', 'Die Geister, Die Er Rief', '陰陽師：鼓子ノ巻', NULL),
(882, 1242, 'Don\'t You Mean Kirata', 'Don\'t You Mean Kirata', 'Défi: La Proie Vengeresse', 'Gejagte Jäger', '狩人を狩る者「キラタ」', NULL),
(883, 1243, 'The State Of Reunion', 'The State Of Reunion', 'Défi: Silence, ça Pousse!', 'Blutrünstiger Narantsetseg', '再会を阻む者「ナランツェツェグ」', NULL),
(884, 1244, 'Cold Comes The Wind', 'Cold Comes The Wind', 'Défi: Refroidir Le Vent Glaçant', 'Kalter Nordwind', '北部の女傑「寒風のクァトゥン」', NULL),
(885, 1245, 'A Tall Order', 'A Tall Order', 'Chasse Privée', 'Rivalisierende Jäger', '密猟者たち', NULL),
(886, 1246, 'Duck And Cover', 'Duck And Cover', 'Défi: Buffet à Volonté', 'Wüstenvogel', '大空の誘拐者「サムパティ」', NULL),
(887, 1247, 'Feel The Noise', 'Feel The Noise', 'Défi: Taratata', 'Lautes Heulen In Der Steppe', '叫声の野人「ルドラ」', NULL),
(888, 1248, 'Get Out The Vochu', 'Get Out The Vochu', 'Défi: Tondeuse Sur Pattes', 'Grasverderber', '除草の達人「ブオチュー」', NULL),
(889, 1249, 'Buzzkill', 'Buzzkill', 'Vombrellules En Surnombre', 'Schlanke Brummer', 'ザ・フライ', NULL),
(890, 1250, 'A Good Day To Die', 'A Good Day To Die', 'Sur Un Malentendu...', 'Uneinsichtiger Falschspieler', '沈黙の制裁', NULL),
(891, 1251, 'Wooly Boys', 'Wooly Boys', 'On Ne Marchande Pas Avec Un Mammouth', 'Mammutaufgabe', 'マンモスと暮らすには', NULL),
(892, 1252, 'Razing The Baras', 'Razing The Baras', 'Bon, Des Baras', 'Jagdrudel', '草原の赤いイナズマ', NULL),
(893, 1253, 'The Fangover', 'The Fangover', 'En Emportant Le Duvet Qui était Son Nid Un Beau Matin', 'Gefräßiges Federvieh', '鳥', NULL),
(894, 1254, 'Hat\'s Off', 'Hat\'s Off', 'Défi: Contrôle Des Naissances', 'Königin Der Brummer', '多産の王妃「ステップ・ハタン」', NULL),
(895, 1255, 'Rock For Food', 'Rock For Food', 'On Ne Peut Pas Tromper Mille Fois Une Personne', 'Übers Ohr Gehauen', '時には懺悔を', NULL),
(896, 1256, 'Purbol Reign', 'Purbol Reign', 'Le Bol D\'air Pue', 'Unerträglicher Gestank', 'プルプルプル', NULL),
(897, 1257, 'Eat You Better', 'Eat You Better', 'Défi: Cinq Troncs Et Feuillages Par Jour', 'Der Keimling Undsiig', '飢えたる根人「フン・ウンデス」', NULL),
(898, 1258, 'Man To Mangas', 'Man To Mangas', 'Défi: L\'indomptable', 'Eine Ausgeburt Der Steppe', '大草原の怪物「マンガス」', NULL),
(899, 1259, 'Not Just A Tribute', 'Not Just A Tribute', 'Défi: Gergei A La Bougeotte', 'In Stein Gemeißelt', '石人の英雄「ゲルゲイ・チョロー」', NULL),
(900, 1260, 'Good Day To Mate', 'Good Day To Mate', 'Il Va Y Avoir Du Sport', 'Gefährliche Kröten', '亀がアウラに言ったこと', NULL),
(901, 1261, 'Killing Dzo', 'Killing Dzo', 'Qui Veut La Peau De Mon Hainag?', 'Lebensgrundlage Der Olkund', '家路につく牛飼いの少女', NULL),
(902, 1262, 'Burn After Evening', 'Burn After Evening', 'Désert Brûlant', 'Feuriger Wüstenwind', '赤い砂漠', NULL),
(903, 1263, 'Hey, Manzasiri', 'Hey, Manzasiri', 'Manzasiri, Y Es-tu?', 'Fressen Und Gefressen Werden', '野獣狩り', NULL),
(904, 1264, 'Khan Artist', 'Khan Artist', 'Défi: Repousser Du Gulo', 'Der Khan Der Gulo Gulo', '残虐な覇者「グログロハーン」', NULL),
(905, 1265, 'Hook, Like, And Stinker', 'Hook, Like, And Stinker', 'Défi: L\'odeur De La Tortue Verte', 'Stinker Stinkhaut', '這い寄る悪臭「スティンクスキン」', NULL),
(906, 1266, 'Fired', 'Fired', 'Les Analas Se Mettent Au Vert', 'Steppe In Flammen', '野火', NULL),
(907, 1267, 'Wham, Bam, Thank You, Mammoth', 'Wham, Bam, Thank You, Mammoth', 'Défi: Attention, Passage De Mammouths', 'Tödliche Hauer', '長牙の圧殺者「マヒシャスラ」', NULL),
(908, 1268, 'More Than You Chaochu', 'More Than You Chaochu', 'Bataille Pour Les Pâturages Du Milieu', 'Die Pflanzenwelt Schlägt Zurück', '優しき雑草の反抗', NULL),
(909, 1269, 'They Shall Not Want', 'They Shall Not Want', 'Je T\'ai Volé Ton Lait', 'In Der Gewalt Der Buduga', 'つかのまの悪夢', NULL),
(910, 1270, 'A Walk Through The Valley', 'A Walk Through The Valley', 'Berger, Un Métier à Risque', 'Schutz Vor Den Buduga', 'よみがえる悪夢', NULL),
(911, 1271, 'Live For The Mettle', 'Live For The Mettle', 'Défi: Où Es-tu, Mani Manikantha?', 'Auf Bardams Probe Gestellt', '覇道の帰還者「マニカンタ」', NULL),
(912, 1272, 'Off Their Yabby', 'Off Their Yabby', 'Sélection Semi-naturelle', 'Dämpfer Am Seldsee', 'ロッホ・セル湖畔の戦い', NULL),
(913, 1273, 'Foul Bachelor Frogamander', 'Foul Bachelor Frogamander', 'Défi: Ce Pataud De Crapaud', 'Der Forsche Frosch', '不動の大蝦蟇「フロガマンダー」', NULL),
(914, 1274, 'Old Bucket Of Boruta', 'Old Bucket Of Boruta', 'Défi: La Belle Est La Bête', 'Die Tragische Jungfrau', '悲恋の乙女「ボルータ」', NULL),
(915, 1275, 'Dusk Till Abaddon', 'Dusk Till Abaddon', 'Pollution Sonore', 'Froschbelästigung', '騒音アバドン', NULL),
(916, 1276, 'The Smell That Leeched Her Heart', 'The Smell That Leeched Her Heart', 'Défi: Le Sent-bon De La Sangsue', 'Der Duft Des Todes', '死の芳香「アロマ・リーチ」', NULL),
(917, 1277, 'Tall Tale', 'Tall Tale', 'Défi: Ciel, Mon Sosie', 'Zwei Hohe Berge', '白色大顔面「トール・マウンテン」', NULL),
(918, 1278, 'Taking Kurrea Business', 'Taking Kurrea Business', 'Défi: Célibataire Enforci', 'Kurrea, Der Abgrundtief Hässliche', '不人気の怪物「クレア」', NULL),
(919, 1279, 'Dude, Where\'s My Karya', 'Dude, Where\'s My Karya', 'Défi: L\'arbre Carnivore', 'Wurzelbehandlung Mit Blutverlust', '虚ろなる老木「カリュアー」', NULL),
(920, 1280, 'Sisyphus Cooling', 'Sisyphus Cooling', 'Défi: Il Faut L\'imaginer Heureux', 'Der Lehmmann-Schock', '剥落せし岩獣「シーシュポス」', NULL),
(921, 1281, 'Minotaurs On My Mind', 'Minotaurs On My Mind', 'Défi: Les Minots Ont Tort', 'Brust Oder Keule', '雷光の魔牛「アステリオス」', NULL),
(922, 1282, 'Dive In', 'Dive In', 'Sans Rancune', '999 Stufen In Den Tod', '断頭台への招待', NULL),
(923, 1283, 'Pounding Salt', 'Pounding Salt', 'Anilas Ah Ah Ah', 'Versalzene Ruinen', '過ぎ去りし日々の風', NULL),
(924, 1284, 'Lalla Land', 'Lalla Land', 'Défi: L\'ami Asthme', 'Hauch Des Todes', '死病の運び手「ラッラミラ」', NULL),
(925, 1285, 'When It Pains It Pours', 'When It Pains It Pours', 'Une Dérouillée Pour Les Soblyns', 'Schaltet Den Schmerz An, Schnell', '死を告げる白虫', NULL),
(926, 1286, 'Sob Story', 'Sob Story', 'Défi: Soblyn-minal', 'Verrückt Vor Schmerz', '狂気の鉱虫「クレイジーソブラン」', NULL),
(927, 1287, 'Par For The Course', 'Par For The Course', 'Vous Ne Pondrez Point', 'Eine Ist Keine, Zwei Sind Der Tod', '濡れた魚', NULL),
(928, 1288, 'Sip When I\'m Dead', 'Sip When I\'m Dead', 'Cadavres Exquis', 'Bis Zum Letzten Tropfen', '死人に口なし', NULL),
(929, 1289, 'Who\'s Phoebad', 'Who\'s Phoebad', 'Rétention D\'éther', 'Ich Bin Ein Phoebad - Holt Mich Hier Raus!', '塩の恋人', NULL),
(930, 1290, 'Yabby Hunters', 'Yabby Hunters', 'Défi: Thalassina Thérapie', 'Das Seldmonster', '純白の鉄鋏「ロッホロッホ」', NULL),
(931, 1291, 'Enemy Territory', 'Enemy Territory', 'C\'est Pas Ma Guerre', 'Nanka-Zanker', 'ナンカ移動時代', NULL),
(932, 1292, 'One Bad Mother Chukwa', 'One Bad Mother Chukwa', 'Défi: C\'est Toujours Pas Ma Guerre', 'Chukwas Rache', '白き侵略者「チュクワ」', NULL),
(933, 1293, 'Give Bees A Chance', 'Give Bees A Chance', 'Papillonnez En Paix', 'Bienen Und Blumen Und Saprias', '花粉戦争', NULL),
(934, 1294, 'About Face', 'About Face', 'Mimétisme Royal', 'Königin Edilas Vermächtnis', '草の女王', NULL),
(935, 1295, 'No Time Is A Good Time', 'No Time Is A Good Time', 'Défi: Que Serra Serra?', 'Vorsicht, Bissig', '塩湖の金鋸「セラ」', NULL),
(936, 1296, 'Mazeless Runner', 'Mazeless Runner', 'Tu Casses, Tu Répares', 'Stier Mich Nicht An!', 'ミノタウロスのお皿', NULL),
(937, 1297, 'Kingsgrave', 'Kingsgrave', 'La Garde Meurt, Mais Ne Se Rend Pas Compte Qu\'elle Est Morte', 'Grab Der Könige', 'キングズガード', NULL),
(938, 1298, 'Fate No Morpho', 'Fate No Morpho', 'Butinez En Paix', 'Schmetterlingseffekt', 'バタフライエフェクト', NULL),
(939, 1299, 'I Can Feel The Earth Move', 'I Can Feel The Earth Move', 'Développement Dhara-ble', 'Senklochsauger', 'ミリオンダラ・ソルティ', NULL),
(940, 1300, 'To Leech His Own', 'To Leech His Own', 'Sangsues Sans Frontières', 'Mit Kind Und Egel', '薬用リーチ', NULL),
(941, 1301, 'Tellus A Tale', 'Tellus A Tale', 'Défi: Un Petit Pas Pour Le Colosse', 'Das Wandelnde Erdbeben', '動く震源地「テルース」', NULL),
(942, 1302, 'OK, Golem', 'OK, Golem', 'L\'argile Est Agile', 'Nachwehen Der Katastrophe', 'マウンテン', NULL),
(943, 1303, 'Ancelot\'s Fear', 'Ancelot\'s Fear', 'L\'affliction D\'Anselot', 'Respektlose Gäste', 'アンセロットの嘆き', NULL),
(944, 1304, 'Ancelot\'s Folly', 'Ancelot\'s Folly', 'La Hantise D\'Anselot', 'Verirrte Schatten', 'アンセロットの恐れ', NULL),
(945, 1305, 'Ancelot\'s Finale', 'Ancelot\'s Finale', 'La Dernière Volonté D\'Anselot', 'Auferstehung Des Königs', 'アンセロットの願い', NULL),
(946, 1306, 'The Dataqi Chronicles: Departures', 'The Dataqi Chronicles: Departures', 'Sur La Route Des Dataq', 'Das Leben Der Dataq: Nomaden', 'ダタクの旅：バズフライ遭遇', NULL),
(947, 1307, 'The Dataqi Chronicles: Distractions', 'The Dataqi Chronicles: Distractions', 'Toujours Dataq', 'Das Leben Der Dataq: Raubtiere', 'ダタクの旅：ガーダン襲撃', NULL),
(948, 1308, 'The Dataqi Chronicles: Duty', 'The Dataqi Chronicles: Duty', 'La Première Traite N\'attend Pas', 'Das Leben Der Dataq: Schafsmilch', 'ダタクの旅：羊乳搾り', NULL),
(949, 1309, 'The Dataqi Chronicles: Deprivation', 'The Dataqi Chronicles: Deprivation', 'Une Faim De Berger', 'Das Leben Der Dataq: Dzo-Jagd', 'ダタクの旅：ケナガウシ狩り', NULL),
(950, 1310, 'The Dataqi Chronicles: Deterrence', 'The Dataqi Chronicles: Deterrence', 'Le Retour Du Gedan', 'Das Leben Der Dataq: Ausgehungert', 'ダタクの旅：ガーダン再襲撃', NULL),
(951, 1311, 'The Dataqi Chronicles: Desperation', 'The Dataqi Chronicles: Desperation', 'Je Veux Tes Vêtements, Tes Bottes Et Ton Outre D\'aïrag!', 'Das Leben Der Dataq: Ugund-Räuber', 'ダタクの旅：ウグンド強襲', NULL),
(952, 1312, 'The Dataqi Chronicles: Distress', 'The Dataqi Chronicles: Distress', 'Compagnons D\'infortune', 'Das Leben Der Dataq: Mammuts', 'ダタクの旅：狩人救出', NULL),
(953, 1313, 'The Dataqi Chronicles: Displacement', 'The Dataqi Chronicles: Displacement', 'Chasse Préventive', 'Das Leben Der Dataq: Herdenschutz', 'ダタクの旅：グログロ討伐', NULL),
(954, 1315, 'The Dataqi Chronicles: Diplomacy', 'The Dataqi Chronicles: Diplomacy', 'Un Voisin Qui Trompe énormément', 'Das Leben Der Dataq: Matanga', 'ダタクの旅：マタンガ強襲', NULL),
(955, 1316, 'The Dataqi Chronicles: Decimation', 'The Dataqi Chronicles: Decimation', 'Rancune D\'éléphant', 'Das Leben Der Dataq: Blutrache', 'ダタクの旅：マタンガ遭遇', NULL),
(956, 1318, 'The Dataqi Chronicles: Divergence', 'The Dataqi Chronicles: Divergence', 'Dataq, Goro, Même Combat', 'Das Leben Der Dataq: Verbündete', 'ダタクの旅：ゴロ族救出', NULL),
(957, 1319, 'The Dataqi Chronicles: Declarations', 'The Dataqi Chronicles: Declarations', 'On Prend Les Matanga Et On Recommence', 'Das Leben Der Dataq: Unerbittlich', 'ダタクの旅：マタンガ逆襲', NULL),
(958, 1320, 'The Dataqi Chronicles: Dominion', 'The Dataqi Chronicles: Dominion', 'Le Roi Des Matanga', 'Das Leben Der Dataq: Anjana', 'ダタクの旅：大王出陣', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mobs_arr`
--

CREATE TABLE `mobs_arr` (
  `id` int(10) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED DEFAULT NULL,
  `y` decimal(3,1) UNSIGNED DEFAULT NULL,
  `lvl` tinyint(3) DEFAULT NULL,
  `slain` tinyint(2) DEFAULT NULL,
  `is_fate` tinyint(1) DEFAULT '0',
  `id_fate` smallint(5) UNSIGNED DEFAULT NULL,
  `is_visible` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `is_multiple` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobs_arr`
--

INSERT INTO `mobs_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `lvl`, `slain`, `is_fate`, `id_fate`, `is_visible`, `is_multiple`) VALUES
(1, 395, 'Bee Cloud', 'Bee Cloud', 'Nuage D\'avettes', 'Bienenwolke', 'ビー・クラウド', NULL, 1, 24.2, 17.1, 7, NULL, 0, NULL, 0, 0),
(2, 404, 'Bogy', 'Bogy', 'épouvantôme', 'Spukgespenst', 'ボギー', NULL, 1, 20.5, 18.6, 7, NULL, 0, NULL, 0, 0),
(3, 419, 'Captain Petyr Pigeontoe', 'Captain Petyr Pigeontoe', 'Capitaine Petyr Peton-d\'oie', 'Kapitän Petyr Pigeontoe', 'キャプテン・ピーター', NULL, 1, 20.4, 17.0, 11, NULL, 0, NULL, 0, 0),
(5, 1320, 'Farmer In Need', 'Farmer In Need', 'Fermier Ennuyé', 'Hilfsbedürftig[a] Bauer', '助けを求める農夫', NULL, 1, 21.8, 15.4, 9, NULL, 1, NULL, 0, 0),
(6, 953, 'Flower Wespe', 'Flower Wespe', 'Frelon Des Vergers', 'Blumen-Vespula', 'フラワー・ヴェスパ', NULL, 1, 23.0, 17.9, 6, NULL, 0, NULL, 0, 0),
(7, 367, 'Goblin Fisher', 'Goblin Fisher', 'Pêcheur Gobelin', 'Goblin-Fischer', 'ゴブリン・フィッシャー', NULL, 1, 23.9, 21.8, 5, NULL, 0, NULL, 0, 0),
(8, 3099, 'Goblin Gambler', 'Goblin Gambler', 'Parieur Gobelin', 'Goblin-Glücksspieler', 'ゴブリン・ギャンブラー', NULL, 1, 23.6, 21.5, 7, NULL, 0, NULL, 0, 0),
(9, 421, 'Grounded Pirate', 'Grounded Pirate', 'Pirate échoué', 'Gestrandet[a] Pirat', 'グラウンデッド・パイレーツ', NULL, 1, 20.1, 17.1, 9, NULL, 0, NULL, 0, 0),
(10, 418, 'Grounded Raider', 'Grounded Raider', 'Maraudeur échoué', 'Gestrandet[a] Räuber', 'グラウンデッド・レイダー', NULL, 1, 20.3, 16.8, 5, NULL, 0, NULL, 0, 0),
(11, 893, 'King Wespe', 'King Wespe', 'Frelon Royal', 'Vespula-Königin', 'キング・ヴェスパ', NULL, 1, 14.1, 14.8, 13, NULL, 1, NULL, 0, 0),
(12, 392, 'Lost Lamb', 'Lost Lamb', 'Agneau égaré', 'Schaf', 'シープ', NULL, 1, 22.5, 25.3, 4, NULL, 0, NULL, 0, 0),
(13, 561, 'Megalocrab', 'Megalocrab', 'Mégalocrabe', 'Megalokrabbe', 'メガロクラブ', NULL, 1, 21.2, 37.6, 13, NULL, 0, NULL, 0, 1),
(14, 354, 'Mossless Goobbue', 'Mossless Goobbue', 'Goobbue Dépouillé', 'Flechten-Goobbue', 'モスレスグゥーブー', NULL, 1, 20.4, 16.2, 12, NULL, 0, NULL, 0, 1),
(15, 833, 'Pack Jackal', 'Pack Jackal', 'Chacal En Meute', 'Rottenschakal', 'パックジャッカル', NULL, 1, 17.5, 9.4, 11, NULL, 1, NULL, 0, 0),
(16, 640, 'Pugil', 'Pugil', 'Pugil', 'Pugil', 'プギル', NULL, 1, 23.7, 22.1, 4, NULL, 0, NULL, 0, 0),
(17, 401, 'Puk Hatchling', 'Puk Hatchling', 'Jeune Puk', 'Jung[a] Puk', 'プーク・ハッチリング', NULL, 1, 20.8, 22.1, 4, NULL, 0, NULL, 0, 0),
(18, 3183, 'Qiqirn Plucker', 'Qiqirn Plucker', 'Qiqirn Plumeur', 'Qiqirn-Pflücker', 'キキルン・プラッカー', NULL, 1, 21.6, 15.5, 20, NULL, 0, NULL, 0, 0),
(19, 3184, 'Qiqirn Roostkeep', 'Qiqirn Roostkeep', 'Qiqirn Garde-poulailler', 'Qiqirn-Hühnerhirte', 'キキルン・ルーストキープ', NULL, 1, 21.7, 15.5, 20, NULL, 0, NULL, 0, 0),
(20, 850, 'Shearing Sheridan', 'Shearing Sheridan', 'Sheridan Le Découpeur', 'Sheridan', 'シアリング・シェリダン', NULL, 1, 16.3, 14.3, 10, NULL, 1, NULL, 0, 0),
(22, 1331, 'Storm Sergeant', 'Storm Sergeant', 'Sergent Des Tempêtes', 'Mahlstrom-Maat', '黒渦団甲軍曹', NULL, 1, 17.5, 8.8, 14, NULL, 1, NULL, 0, 0),
(23, 405, 'Tiny Mandragora', 'Tiny Mandragora', 'Mini-mandragore', 'Winzig[a] Mandragora', 'タイニー・マンドラゴラ', NULL, 1, 18.3, 16.3, 7, NULL, 0, NULL, 0, 1),
(24, 641, 'Wespe', 'Wespe', 'Frelon', 'Vespula', 'ヴェスパ', NULL, 1, 14.5, 14.4, 12, NULL, 0, NULL, 0, 0),
(25, 358, 'Wounded Aurochs', 'Wounded Aurochs', 'Auroch Blessé', 'Verwundet[a] Auerochse', 'ウーンデッド・オーロックス', NULL, 1, 18.9, 17.2, 8, NULL, 0, NULL, 0, 0),
(26, 853, 'Ahctstymm Shadowlurker', 'Ahctstymm Shadowlurker', 'Ahctstymm Le Clandestin', 'Ahctstymm', '密航のアクトシュティム', NULL, 2, 21.5, 37.8, 11, NULL, 1, NULL, 0, 0),
(27, 563, 'Aurelia', 'Aurelia', 'Aurélie', 'Aurelia', 'オーレリア', NULL, 2, 25.3, 22.6, 3, NULL, 0, NULL, 0, 1),
(29, 895, 'Cane Toad', 'Cane Toad', 'Crapaud Buffle', 'Aga-Kröte', 'ケーントード', NULL, 2, 23.7, 22.4, 2, NULL, 1, NULL, 0, 0),
(30, 364, 'Cave Bat', 'Cave Bat', 'Chauve-souris Cavernicole', 'Höhlenfledermaus', 'ケーブバット', NULL, 2, 27.0, 15.9, 7, NULL, 0, NULL, 0, 0),
(31, 408, 'Galago', 'Galago', 'Galago', 'Galago', 'ガラゴ', NULL, 2, 30.7, 14.6, 8, NULL, 0, NULL, 0, 0),
(32, 368, 'Kobold Dustman', 'Kobold Dustman', 'éboueur Kobold', 'Kobold-Schuttfeger', 'コボルド・ダストマン', NULL, 2, 31.9, 12.3, 9, NULL, 0, NULL, 0, 0),
(33, 378, 'Kobold Potman', 'Kobold Potman', 'Serviteur Kobold', 'Kobold-Kollektor', 'コボルド・ポットマン', NULL, 2, 32.3, 12.7, 9, NULL, 1, NULL, 0, 0),
(34, 372, 'Kobold Supplicant', 'Kobold Supplicant', 'Suppliant Kobold', 'Kobold-Bittsteller', 'コボルド・サプリカント', NULL, 2, 31.6, 13.2, 7, NULL, 0, NULL, 0, 0),
(35, 117, 'Lightning Sprite', 'Lightning Sprite', 'élémentaire De Foudre', 'Blitz-Exergon', 'ライトニングスプライト', NULL, 2, 18.8, 34.7, 30, NULL, 0, NULL, 0, 1),
(36, 1357, 'Mandragora Prince', 'Mandragora Prince', 'Prince Mandragore', 'Mandra-Prinz', 'マンドラプリンス', NULL, 2, 20.1, 37.4, 13, 1, 1, 19, 1, 0),
(37, 409, 'Moraby Mole', 'Moraby Mole', 'Taupe De Moraby', 'Moraby-Mull', 'モラビーモール', NULL, 2, 20.3, 34.9, 12, NULL, 0, NULL, 0, 0),
(38, 299, 'Nesting Buzzard', 'Nesting Buzzard', 'Jeune Busard', 'Nistend[a] Bussard', 'ネストリング・バザード', NULL, 2, 32.7, 17.0, 6, NULL, 0, NULL, 0, 1),
(39, 857, 'Padfoot', 'Padfoot', 'Patte-molle', 'Plattfuß', 'パッドフット', NULL, 2, 20.5, 33.5, 10, 1, 1, 23, 1, 0),
(40, 350, 'Qiqirn Eggdigger', 'Qiqirn Eggdigger', 'Qiqirn Déterre-œuf', 'Qiqirn-Strandguträuber', 'キキルン・ビーチコンバー', NULL, 2, 18.2, 34.9, 13, NULL, 0, NULL, 0, 0),
(41, 1334, 'Red Rooster Tiller', 'Red Rooster Tiller', 'Métayer Du Coq Rouge', 'Gockelburg-Bauer', 'レッドルースター農場の農夫', NULL, 2, 27.2, 17.9, 1, NULL, 1, NULL, 0, 0),
(42, 349, 'Rivertoad', 'Rivertoad', 'Crapaud De Rivière', 'Flusskröte', 'リバートード', NULL, 2, 23.8, 21.6, 4, NULL, 0, NULL, 0, 0),
(43, 201, 'Syrphid Cloud', 'Syrphid Cloud', 'Nuage De Syrphes', 'Mistfliegenwolke', 'サーフィド・クラウド', NULL, 2, 20.2, 15.2, 9, NULL, 0, NULL, 0, 1),
(781, 1517, 'Metshaldjas', 'Metshaldjas', 'Metshaldjas', 'Metshaldjas', 'メツハルジャス', NULL, 3, 18.0, 25.0, 32, 1, 1, 20, 1, 0),
(45, 1272, 'Yellowjacket Patrol', 'Yellowjacket Patrol', 'Casaque Jaune', 'Gelbjacken-Wache', 'イエロージャケット警備兵', NULL, 2, 20.8, 30.6, 35, NULL, 0, NULL, 0, 1),
(46, 1337, 'Yellowjacket Veteran', 'Yellowjacket Veteran', 'Vétéran Des Casaques Jaunes', 'Gelbjacken-Veteran', '熟練の警備兵', NULL, 2, 21.3, 38.5, 11, NULL, 1, NULL, 0, 0),
(47, 1823, '2nd Cohort Eques', '2nd Cohort Eques', 'Eques De La 2e Cohorte', 'Eques[p] Der II. Kohorte', 'IIコホルス・エクエス', NULL, 3, 27.8, 20.9, 49, 3, 0, NULL, 1, 0),
(48, 1821, '2nd Cohort Hoplomachus', '2nd Cohort Hoplomachus', 'Hoplomachus De La 2e Cohorte', 'Hoplomachus[p] Der II. Kohorte', 'IIコホルス・ホプロマクス', NULL, 3, 28.9, 21.1, 49, NULL, 0, NULL, 0, 0),
(49, 1822, '2nd Cohort Laquearius', '2nd Cohort Laquearius', 'Laquearius De La 2e Cohorte', 'Laquearius[p] Der II. Kohorte', 'IIコホルス・ラクエリウス', NULL, 3, 25.6, 20.9, 49, 3, 0, NULL, 1, 0),
(50, 1824, '2nd Cohort Secutor', '2nd Cohort Secutor', 'Secutor De La 2e Cohorte', 'Secutor[p] Der II. Kohorte', 'IIコホルス・セクトール', NULL, 3, 27.6, 21.2, 49, NULL, 0, NULL, 0, 0),
(51, 1825, '2nd Cohort Signifer', '2nd Cohort Signifer', 'Signifer De La 2e Cohorte', 'Signifer[p] Der II. Kohorte', 'IIコホルス・シグニフェル', NULL, 3, 28.7, 20.9, 49, 3, 0, NULL, 1, 0),
(52, 1826, '2nd Cohort Vanguard', '2nd Cohort Vanguard', 'Avant-garde De La 2e Cohorte', 'Frontbrecher[p] Der II. Kohorte', 'IIコホルス・ヴァンガード', NULL, 3, 29.3, 20.6, 50, 3, 0, NULL, 1, 0),
(53, 1201, 'Acubens', 'Acubens', 'Acubens', 'Acubens', 'アクベンス', NULL, 3, 31.1, 35.4, 30, NULL, 1, NULL, 0, 0),
(770, 1506, 'Cindersoot Pegujj Chah', 'Cindersoot Pegujj Chah', 'Pegujj Chah Le Fuligineux', 'Zunderruß Pegujj Chah', '黒煙のペグジ・チャー', NULL, 14, 24.0, 26.0, 49, 1, 1, 6, 1, 0),
(55, 341, 'Apkallu', 'Apkallu', 'Apkallu', 'Apkallu', 'アプカル', NULL, 3, 27.5, 35.7, 30, 4, 0, NULL, 1, 0),
(56, 361, 'Bloodshore Bell', 'Bloodshore Bell', 'Cloche Des Rives Sanglantes', 'Rotgischt-Helmqualle', 'ブラッドショア・ベル', NULL, 3, 31.1, 26.6, 33, 3, 0, NULL, 1, 0),
(780, 2367, 'Kafre', 'Kafre', 'Kafre', 'Kafre', 'カフレ', NULL, 8, 23.0, 18.0, 49, 1, 1, 15, 1, 0),
(58, 1608, 'Butting Buffalo', 'Butting Buffalo', 'Buffle Rueur', 'Angriffslustig[a] Büffel', 'バッティング・バッファロー', NULL, 3, 28.2, 28.5, 28, NULL, 1, NULL, 0, 0),
(59, 1200, 'Cancer', 'Cancer', 'Cancer', 'Cancer', 'キャンサー', NULL, 3, 31.2, 35.5, 32, NULL, 1, NULL, 0, 0),
(60, 1732, 'Cluster Mantis', 'Cluster Mantis', 'Bébé Mante Rouge', 'Schwarmmantis', 'タイニー・レッドマンティス', NULL, 3, 15.7, 28.1, 30, NULL, 1, NULL, 0, 0),
(61, 1869, 'Clutch Pelican', 'Clutch Pelican', 'Pélican Rafleur', 'Klauen-Pelikan', 'クラッチ・ペリカン', NULL, 3, 21.8, 31.8, 29, NULL, 1, NULL, 0, 0),
(62, 1092, 'Coastal Mandragora', 'Coastal Mandragora', 'Mandragore Des Côtes', 'Küsten-Mandragora', 'コスタル・マンドラゴラ', NULL, 3, 30.2, 27.6, 23, NULL, 0, NULL, 0, 0),
(63, 639, 'Colibri', 'Colibri', 'Colibri', 'Kolibri', 'コリブリ', NULL, 3, 31.9, 25.2, 33, 4, 0, NULL, 1, 0),
(64, 684, 'Cork Bulb', 'Cork Bulb', 'Bulbe De Liège', 'Korkknolle', 'コルク・バルブ', NULL, 3, 19.6, 25.1, 32, NULL, 0, NULL, 0, 0),
(65, 396, 'Dung Midge Swarm', 'Dung Midge Swarm', 'Nuée De Moucherons Bousiers', 'Dungmückenschwarm', 'ダンミッヂ・スウォーム', NULL, 3, 16.7, 31.3, 33, NULL, 0, NULL, 0, 0),
(66, 1274, 'Gegeruju Manor Guard', 'Gegeruju Manor Guard', 'Garde Privé De Gegeruju', 'Gegeruju-Wächter', 'ゲゲルジュ氏の私兵', NULL, 3, 30.8, 29.2, 35, NULL, 0, NULL, 0, 0),
(67, 366, 'Giant Pelican', 'Giant Pelican', 'Pélican Géant', 'Riesenpelikan', 'ジャイアントペリカン', NULL, 3, 20.5, 33.0, 32, NULL, 0, NULL, 0, 0),
(68, 26, 'Gigantoad', 'Gigantoad', 'Crapaud Géant', 'Karpfenkröte', 'ギガントード', NULL, 3, 19.1, 26.2, 33, 3, 0, NULL, 1, 0),
(69, 353, 'Goobbue', 'Goobbue', 'Goobbue', 'Goobbue', 'グゥーブー', NULL, 3, 18.3, 33.9, 33, 3, 0, NULL, 1, 0),
(70, 411, 'Grass Raptor', 'Grass Raptor', 'Raptor Des Plaines', 'Gras-Raptor', 'グラスラプトル', NULL, 3, 23.0, 21.3, 32, 4, 0, NULL, 1, 0),
(779, 1520, 'Karkinos', 'Karkinos', 'Karkinos', 'Karkinos', 'カルキノス', NULL, 5, 13.0, 24.0, 21, 1, 1, 16, 1, 0),
(72, 687, 'Hoary Goobbue', 'Hoary Goobbue', 'Goobbue Chenu', 'Ergraut[a] Goobbue', 'ホアリーグゥーブー', NULL, 3, 22.0, 31.3, 50, NULL, 0, NULL, 0, 0),
(73, 1855, 'Jijiroon Of The Silver Clutch', 'Jijiroon Of The Silver Clutch', 'Jijiroon Le Pique-argent', 'Jijiroon', '銀卵のジジルン', NULL, 3, 20.5, 31.0, 33, NULL, 1, NULL, 0, 0),
(74, 352, 'Jungle Coeurl', 'Jungle Coeurl', 'Coeurl Des Jungles', 'Dschungel-Coeurl', 'ジャングルクァール', NULL, 3, 17.8, 28.4, 34, 4, 0, NULL, 1, 0),
(75, 373, 'Kobold Missionary', 'Kobold Missionary', 'Missionnaire Kobold', 'Kobold-Missionar', 'コボルド・ミッションアリー', NULL, 3, 27.7, 25.5, 34, 4, 0, NULL, 1, 0),
(76, 369, 'Kobold Pitman', 'Kobold Pitman', 'Mineur Kobold', 'Kobold-Steiger', 'コボルド・ピットマン', NULL, 3, 27.8, 25.9, 34, 4, 0, NULL, 1, 1),
(77, 858, 'Kokoroon Quickfingers', 'Kokoroon Quickfingers', 'Kokoroon Doigtvifs', 'Kokoroon Drecksgriffel', '弾指のココルン', NULL, 3, 26.3, 32.9, 32, 1, 1, 17, 1, 0),
(78, 1313, 'Large Buffalo', 'Large Buffalo', 'Buffle', 'Groß[a] Büffel', 'バッファロー', NULL, 3, 30.6, 32.3, 31, 3, 0, NULL, 1, 0),
(79, 414, 'Mamool Ja Breeder', 'Mamool Ja Breeder', 'éleveur Mamool Ja', 'Mamool Ja-Brüter', 'マムージャ・ブリーダー', NULL, 3, 23.8, 19.9, 31, 3, 0, NULL, 1, 1),
(80, 415, 'Mamool Ja Sophist', 'Mamool Ja Sophist', 'Sophiste Mamool Ja', 'Mamool Ja-Sophist', 'マムージャ・ソフィスト', NULL, 3, 24.2, 20.4, 29, NULL, 0, NULL, 0, 1),
(81, 355, 'Mildewed Goobbue', 'Mildewed Goobbue', 'Goobbue Mildiousé', 'Mehltau-Goobbue', 'ミルデューグゥーブー', NULL, 3, 16.9, 32.5, 34, NULL, 0, NULL, 0, 0),
(82, 1660, 'Off-duty Porter', 'Off-duty Porter', 'Livreur Rentrant Du Travail', 'Träger[p] Außer Dienst', '仕事帰りの荷運び人', NULL, 3, 18.1, 32.1, 37, NULL, 1, NULL, 0, 0),
(83, 1363, 'Oyster Hunter', 'Oyster Hunter', 'Cueilleuse D\'huîtres', 'Austernsammlerin', '虹蝶貝を探す女', NULL, 3, 31.9, 24.5, 50, NULL, 1, NULL, 0, 0),
(84, 351, 'Qiqirn Gullroaster', 'Qiqirn Gullroaster', 'Qiqirn Grille-mouette', 'Qiqirn-Möwenbrater', 'キキルン・ガルロースター', NULL, 3, 26.2, 32.2, 32, 3, 0, NULL, 1, 0),
(85, 2011, 'Restless Harrier', 'Restless Harrier', 'Harceleur Agité', 'Rastlos[a] Plünderer', 'レストレス・ハリアー', NULL, 3, 23.3, 20.3, 40, NULL, 0, NULL, 0, 0),
(86, 2012, 'Restless Raptor', 'Restless Raptor', 'Raptor Agité', 'Rastlos[a] Raptor', 'レストレス・ラプトル', NULL, 3, 23.4, 20.3, 30, NULL, 0, NULL, 0, 0),
(87, 894, 'Rutting Buffalo', 'Rutting Buffalo', 'Buffle En Rut', 'Brunftig[a] Büffel', 'ラッティング・バッファロー', NULL, 3, 27.3, 29.5, 28, NULL, 1, NULL, 0, 0),
(88, 560, 'Snipper', 'Snipper', 'Cisailleur', 'Schnippler', 'スニッパー', NULL, 3, 30.8, 35.5, 32, 4, 0, NULL, 1, 0),
(90, 1339, 'Thrill-seeking Milksop', 'Thrill-seeking Milksop', 'Homme Craignant Les Fantômes', 'Abergläubisch[a] Angsthase', '亡霊を恐れる男', NULL, 3, 29.7, 30.1, 1, NULL, 1, NULL, 0, 0),
(91, 1340, 'Thrill-seeking Skeptic', 'Thrill-seeking Skeptic', 'Homme Incrédule', 'Abenteuerlustig[a] Skeptiker', '亡霊を信じない男', NULL, 3, 29.7, 30.1, 1, NULL, 1, NULL, 0, 0),
(92, 981, 'Yellowjacket', 'Yellowjacket', 'Casaque Jaune', 'Gelbjacken-Seesoldat', 'イエロージャケット陸戦兵', NULL, 3, 23.9, 20.3, 2, NULL, 1, NULL, 0, 1),
(93, 357, 'Aurochs', 'Aurochs', 'Auroch', 'Auerochse', 'オーロックス', NULL, 4, 29.7, 25.9, 12, NULL, 1, NULL, 0, 0),
(94, 1831, 'Axolotl', 'Axolotl', 'Axolotl', 'Drakolurch', 'アクソロトル', NULL, 4, 14.1, 15.4, 48, NULL, 0, NULL, 0, 0),
(95, 1078, 'Bloodsucker Bat', 'Bloodsucker Bat', 'Chauve-souris Suce-sang', 'Blutsauger-Fledermaus', 'ブラッドサッカー・バット', NULL, 4, 28.1, 24.4, 15, NULL, 0, NULL, 0, 0),
(96, 3133, 'Captain Jacke', 'Captain Jacke', 'Capitaine Jacke', 'Meisterschurke Jack', '双刃のジャック', NULL, 4, 33.4, 27.8, 30, NULL, 0, NULL, 0, 0),
(97, 1315, 'Cattle Tyrant', 'Cattle Tyrant', 'Moucherolle Querelleur', 'Rinder-Tyrann', 'キャトル・タイラント', NULL, 4, 27.4, 24.5, 18, NULL, 0, NULL, 0, 0),
(778, 451, 'Yabi Two-tails', 'Yabi Two-tails', 'Yabi Kaatapoh Deux-queues', 'Yabi Zweischwanz', '双尾のヤビ・カータポ', NULL, 9, 14.0, 33.0, 32, 1, 1, 35, 1, 0),
(99, 1854, 'Dead Man\'s Moan', 'Dead Man\'s Moan', 'Mort Gémissant', 'Totenkläger', 'デッドマン', NULL, 4, 14.6, 36.0, 42, NULL, 0, NULL, 0, 0),
(100, 363, 'Dusk Bat', 'Dusk Bat', 'Chauve-souris Crépusculaire', 'Dämmerfledermaus', 'ダスクバット', NULL, 4, 27.0, 23.5, 15, NULL, 0, NULL, 0, 0),
(101, 1027, 'Evenfall Firefly', 'Evenfall Firefly', 'Luciole Du Crépuscule', 'Abendstern-Leuchtkäfer', 'イブンフォール・ファイアフライ', NULL, 4, 27.5, 23.0, 16, NULL, 0, NULL, 0, 0),
(102, 394, 'Fat Dodo', 'Fat Dodo', 'Dodo Dodu', 'Fett[a] Dodo', 'ファットドードー', NULL, 4, 33.9, 28.7, 12, NULL, 0, NULL, 0, 0),
(103, 1087, 'Feral Dodo', 'Feral Dodo', 'Dodo Sauvage', 'Verwildert[a] Dodo', 'フェラル・ドードー', NULL, 4, 33.8, 31.1, 11, NULL, 0, NULL, 0, 0),
(104, 129, 'Firefly', 'Firefly', 'Luciole', 'Leuchtkäfer', 'ファイアフライ', NULL, 4, 23.1, 20.3, 19, NULL, 0, NULL, 0, 1),
(105, 2531, 'Fresh Whelk Ballista', 'Fresh Whelk Ballista', 'Baliste De Bulot Frais', 'Neuartig[a] Wellhorn-Balliste', 'フレッシュユミール・バリスタ', NULL, 4, 15.6, 14.3, 46, NULL, 0, NULL, 0, 0),
(106, 1173, 'Galeborn Buccaneer', 'Galeborn Buccaneer', 'Boucanier Des Rafales Cinglantes', 'Sturmgeboren[a] Seeräuber', 'ゲイルボーン・バッカニア', NULL, 4, 32.0, 29.5, 18, NULL, 0, NULL, 0, 0),
(107, 3142, 'Game Fowl', 'Game Fowl', 'Gibier à Plumes', 'Wildhenne', 'ゲームファウル', NULL, 4, 33.0, 28.0, 15, NULL, 0, NULL, 0, 0),
(108, 225, 'Goblin Hunter', 'Goblin Hunter', 'Chasseur Gobelin', 'Goblin-Jäger', 'ゴブリン・ハンター', NULL, 4, 26.4, 22.7, 11, NULL, 0, NULL, 0, 1),
(109, 1360, 'Goblin Trader', 'Goblin Trader', 'Négociant Gobelin', 'Goblin-Händler', 'ゴブリン・トレーダー', NULL, 4, 26.5, 22.7, 18, NULL, 1, NULL, 0, 0),
(110, 403, 'Hedgemole', 'Hedgemole', 'Héritaupe', 'Stachelmull', 'ヘッジモール', NULL, 4, 26.4, 23.7, 15, NULL, 0, NULL, 0, 0),
(111, 1369, 'Hysterical Hawker', 'Hysterical Hawker', 'Marchand Contrarié', 'Hysterisch[a] Krämer', '困り果てた商人', NULL, 4, 29.9, 26.0, 15, NULL, 1, NULL, 0, 0),
(112, 3140, 'Jolly Merchant Barber', 'Jolly Merchant Barber', 'Barbier Du Camelot Fringant', 'Schiffsarzt[p] Der Schädelbande', 'クフサド商船団の船医', NULL, 4, 33.2, 27.8, 15, NULL, 0, NULL, 0, 0),
(113, 3139, 'Jolly Merchant Lodesman', 'Jolly Merchant Lodesman', 'Pilote Du Camelot Fringant', 'Steuermann[p] Der Schädelbande', 'クフサド商船団の航海士', NULL, 4, 33.3, 27.8, 16, NULL, 0, NULL, 0, 0),
(114, 3141, 'Jolly Merchant Waister', 'Jolly Merchant Waister', 'Marin Du Camelot Fringant', 'Matrose[p] Der Schädelbande', 'クフサド商船団の甲板員', NULL, 4, 33.1, 27.9, 15, NULL, 0, NULL, 0, 0),
(115, 644, 'Killer Mantis', 'Killer Mantis', 'Mante Tueuse', 'Killermantis', 'キラーマンティス', NULL, 4, 22.3, 20.7, 16, NULL, 0, NULL, 0, 0),
(116, 1853, 'Lammergeyer', 'Lammergeyer', 'Gypaète', 'Bartgeier', 'ラマーガイアー', NULL, 4, 12.4, 36.3, 41, NULL, 0, NULL, 1, 0),
(117, 1062, 'Memeroon', 'Memeroon', 'Memeroon La Nantie', 'Memeroon', '金主のメメルン', NULL, 4, 27.7, 25.6, 19, NULL, 0, NULL, 0, 0),
(118, 1701, 'Mouu The Puller', 'Mouu The Puller', 'Mouu Le Refluant', 'Mouu [t] Zieher', '引潮のモォウ', NULL, 4, 18.7, 21.8, 45, NULL, 1, NULL, 0, 0),
(120, 1060, 'O\'adebh Whitemane', 'O\'adebh Whitemane', 'O\'adebh Blanche-chevelure', 'O\'adebh Weißmähne', '白髪のオ・アデブ', NULL, 4, 30.8, 27.5, 18, NULL, 0, NULL, 0, 0),
(121, 3138, 'Perimu Haurimu Underfoot', 'Perimu Haurimu Underfoot', 'Perimu Haurimu Le Coursier', 'Perimu Haurimu', '追廻のペリム・ハウリム', NULL, 4, 32.9, 27.8, 30, NULL, 0, NULL, 0, 0),
(122, 46, 'Plasmoid', 'Plasmoid', 'Plasmoïde', 'Plasmodium', 'プラズモイド', NULL, 4, 16.5, 31.6, 34, 4, 0, NULL, 1, 1),
(123, 1852, 'Preying Mantis', 'Preying Mantis', 'Mante Prédatrice', 'Mantis-Dämon', 'マンティスデビル', NULL, 4, 14.2, 35.4, 40, 3, 0, NULL, 1, 0),
(124, 402, 'Puk Hatchling', 'Puk Hatchling', 'Puk', 'Puk', 'プーク', NULL, 4, 29.8, 25.7, 15, NULL, 0, NULL, 0, 0),
(125, 2532, 'Reinforced Whelk Ballista', 'Reinforced Whelk Ballista', 'Baliste De Bulot Renforcée', 'Verstärkt[a] Wellhorn-Balliste', '強化ユミール・バリスタ', NULL, 4, 13.0, 14.1, 48, NULL, 0, NULL, 0, 0),
(126, 420, 'Rhotano Buccaneer', 'Rhotano Buccaneer', 'Boucanier De Rhotano', 'Rhotano-Seeräuber', 'ロータノ・バッカニア', NULL, 4, 33.8, 27.4, 14, NULL, 0, NULL, 0, 0),
(127, 1171, 'Rope-burned Buccaneer', 'Rope-burned Buccaneer', 'Boucanier Encordé', 'Striemen-Seeräuber', 'ロープボーンド・バッカニア', NULL, 4, 28.6, 23.1, 18, NULL, 0, NULL, 0, 0),
(128, 400, 'Roseling', 'Roseling', 'Callisia', 'Rösling', 'ローズリング', NULL, 4, 35.1, 30.2, 10, NULL, 0, NULL, 0, 0),
(129, 1181, 'Rothlyt Pelican', 'Rothlyt Pelican', 'Pélican De Rothlyt', 'Rothlyt-Pelikan', 'ロズリトペリカン', NULL, 4, 23.9, 24.6, 16, NULL, 0, NULL, 0, 0),
(130, 2165, 'Sahagin Sapper', 'Sahagin Sapper', 'Piquier Sahuagin', 'Sahagin-Sappeur', 'サハギン・サパー', NULL, 4, 21.1, 19.5, 41, NULL, 1, NULL, 0, 0),
(131, 2166, 'Sahagin Skirmisher', 'Sahagin Skirmisher', 'Escarmoucheur Sahuagin', 'Sahagin-Hellebardier', 'サハギン・スカーミッシャー', NULL, 4, 18.5, 21.9, 42, NULL, 1, NULL, 0, 0),
(132, 1075, 'Sanguinary Buccaneer', 'Sanguinary Buccaneer', 'Boucanier Sanguinaire', 'Blutrünstig[a] Seeräuber', 'サングイナリィ・バッカニア', NULL, 4, 28.2, 24.8, 18, NULL, 0, NULL, 0, 0),
(133, 2527, 'Sapsa Elbst', 'Sapsa Elbst', 'Elbst De Sapsa', 'Sapsa-Elbst', 'サプサ・エルブスト', NULL, 4, 16.5, 15.0, 46, NULL, 0, NULL, 0, 0),
(134, 1828, 'Sapsa Shelfclaw', 'Sapsa Shelfclaw', 'Griffe-des-profondeurs De Sapsa', 'Sapsa-Panzerklaue', 'サプサ・シェルフクロウ', NULL, 4, 14.3, 13.2, 49, 3, 0, NULL, 1, 0),
(135, 1827, 'Sapsa Shelfscale', 'Sapsa Shelfscale', 'écaille-des-profondeurs De Sapsa', 'Sapsa-Panzerschuppe', 'サプサ・シェルフスケール', NULL, 4, 14.7, 14.3, 49, NULL, 0, NULL, 0, 0),
(136, 1829, 'Sapsa Shelfspine', 'Sapsa Shelfspine', 'épine-des-profondeurs De Sapsa', 'Sapsa-Panzerdorn', 'サプサ・シェルフスパイン', NULL, 4, 15.6, 14.2, 49, 3, 0, NULL, 1, 0),
(137, 1830, 'Sapsa Shelftooth', 'Sapsa Shelftooth', 'Dent-des-profondeurs De Sapsa', 'Sapsa-Panzerzahn', 'サプサ・シェルフトゥース', NULL, 4, 14.5, 13.6, 47, 3, 0, NULL, 1, 0),
(138, 360, 'Sea Wasp', 'Sea Wasp', 'Guêpe Des Mers', 'Seewespe', 'シーワスプ', NULL, 4, 13.6, 17.4, 48, 3, 0, NULL, 1, 0),
(140, 410, 'Sewer Mole', 'Sewer Mole', 'Taupe D\'égout', 'Kloaken-Mull', 'シュアモール', NULL, 4, 33.3, 28.5, 11, NULL, 0, NULL, 0, 0),
(141, 342, 'Shallowtail Reaver', 'Shallowtail Reaver', 'Queue Des Pillards Du Serpent', 'Flachflossen-Plünderer', '海蛇の尾', NULL, 4, 24.5, 23.7, 15, NULL, 0, NULL, 0, 0),
(142, 345, 'Shelfclaw Reaver', 'Shelfclaw Reaver', 'Aiguillon Des Pillards Du Serpent', 'Seichtklauen-Plünderer', '海蛇の赤き爪', NULL, 4, 13.6, 17.1, 48, NULL, 0, NULL, 0, 0),
(143, 384, 'Shelfclaw Sahagin', 'Shelfclaw Sahagin', 'Sahuagin Griffe-des-profondeurs', 'Panzerklauen-Sahagin', 'シェルフクロウ・サハギン', NULL, 4, 17.7, 19.1, 44, 4, 0, NULL, 1, 0),
(144, 2675, 'Shelfclaw Sentry', 'Shelfclaw Sentry', 'Sentinelle Griffe-des-profondeurs', 'Panzerklauen-Wache', 'シェルフクロウ・セントリー', NULL, 4, 19.1, 18.5, 50, NULL, 0, NULL, 0, 0),
(145, 559, 'Shelfeye Reaver', 'Shelfeye Reaver', 'Prunelle Des Pillards Du Serpent', 'Seichtaugen-Plünderer', '海蛇の赤き目', NULL, 4, 12.6, 17.1, 48, 3, 0, NULL, 1, 0),
(146, 347, 'Shelfscale Reaver', 'Shelfscale Reaver', 'Scutelle Des Pillards Du Serpent', 'Seichtschuppen-Plünderer', '海蛇の赤き鱗', NULL, 4, 12.9, 17.1, 48, NULL, 0, NULL, 0, 0),
(147, 386, 'Shelfscale Sahagin', 'Shelfscale Sahagin', 'Sahuagin écaille-des-profondeurs', 'Panzerschuppen-Sahagin', 'シェルフスケール・サハギン', NULL, 4, 20.7, 18.4, 44, 3, 0, NULL, 1, 0),
(148, 389, 'Shelfspine Sahagin', 'Shelfspine Sahagin', 'Sahuagin épine-des-profondeurs', 'Panzerdorn-Sahagin', 'シェルフスパイン・サハギン', NULL, 4, 19.7, 19.0, 44, NULL, 0, NULL, 0, 0),
(149, 2524, 'Shoalclaw Sahagin', 'Shoalclaw Sahagin', 'Sahuagin Griffe-d\'écueil', 'Schwarmklauen-Sahagin', 'ショアルクロウ・サハギン', NULL, 4, 18.6, 15.7, 46, NULL, 0, NULL, 0, 0),
(150, 2525, 'Shoalscale Sahagin', 'Shoalscale Sahagin', 'Sahuagin écaille-d\'écueil', 'Schwarmschuppen-Sahagin', 'ショアルスケール・サハギン', NULL, 4, 18.1, 15.7, 46, NULL, 0, NULL, 0, 0),
(151, 2523, 'Shoalspine Sahagin', 'Shoalspine Sahagin', 'Sahuagin épine-d\'écueil', 'Schwarmdorn-Sahagin', 'ショアルスパイン・サハギン', NULL, 4, 16.6, 17.9, 46, NULL, 0, NULL, 0, 0),
(152, 2526, 'Shoaltooth Sahagin', 'Shoaltooth Sahagin', 'Sahuagin Dent-d\'écueil', 'Schwarmfang-Sahagin', 'ショアルトゥース・サハギン', NULL, 4, 17.3, 15.9, 46, NULL, 0, NULL, 0, 0),
(153, 1370, 'Sleepless Citizen', 'Sleepless Citizen', 'Citadine Apeurée', 'Verängstigt[a] Bürgerin', '魔物に怯える市民', NULL, 4, 28.7, 25.6, 15, NULL, 1, NULL, 0, 0),
(154, 1346, 'Storm Courier', 'Storm Courier', 'Coursière Du Maelstrom', 'Mahlstrom-Botin', '黒渦団の輸送兵', NULL, 4, 26.0, 25.7, 13, NULL, 1, NULL, 0, 0),
(155, 1332, 'Storm Private', 'Storm Private', 'Soldat 3e Classe Des Tempêtes', 'Sturmmariner', '黒渦団二等甲兵', NULL, 4, 18.5, 21.9, 40, NULL, 1, NULL, 0, 1),
(156, 1172, 'Tar-stained Buccaneer', 'Tar-stained Buccaneer', 'Boucanier Taché De Goudron', 'Teerbefleckt[a] Seeräuber', 'タールステイン・バッカニア', NULL, 4, 28.1, 23.8, 17, NULL, 0, NULL, 0, 0),
(157, 565, 'Trenchtooth Sahagin', 'Trenchtooth Sahagin', 'Sahuagin Dent-des-fosses', 'Grabenzahn-Sahagin', 'トレンチトゥース・サハギン', NULL, 4, 20.1, 19.8, 48, 3, 0, NULL, 1, 0),
(158, 3129, 'V\'kebbe The Stray', 'V\'kebbe The Stray', 'V\'kebbe L\'errante', 'V\'kebbe [t] Streunerin', '野良猫のヴァ・ケビ', NULL, 4, 32.9, 27.8, 30, NULL, 0, NULL, 0, 0),
(159, 1518, 'Voll The Sharkskinned', 'Voll The Sharkskinned', 'Voll Peau De Requin', 'Voll [t] Haihäutig[a]', '鮫肌のヴォル', NULL, 4, 18.6, 18.9, 44, 1, 1, 32, 1, 0),
(160, 2167, 'Voll\'s Fang', 'Voll\'s Fang', 'Croc De Voll', 'Volls Fang[p]', 'ヴォルの鮫牙', NULL, 4, 18.7, 19.2, 41, NULL, 1, NULL, 0, 0),
(161, 1056, 'Warren Warden', 'Warren Warden', 'Gardien De Garenne', 'Stollenjäger', '賞金首：ウォーレン・ワーデン', NULL, 4, 33.8, 29.9, 14, NULL, 0, NULL, 0, 0),
(162, 2530, 'Whelk Ballista', 'Whelk Ballista', 'Baliste De Bulot', 'Wellhorn-Balliste', 'ユミール・バリスタ', NULL, 4, 19.8, 19.3, 44, NULL, 0, NULL, 0, 0),
(163, 393, 'Wild Dodo', 'Wild Dodo', 'Dodo', 'Dodo', 'ドードー', NULL, 4, 28.8, 20.4, 7, NULL, 0, NULL, 0, 1),
(164, 399, 'Wild Jackal', 'Wild Jackal', 'Chacal Sauvage', 'Wild[a] Schakal', 'ジャッカル', NULL, 4, 21.0, 32.7, 10, NULL, 0, NULL, 0, 1),
(165, 2356, 'Yarr The Wavefiend', 'Yarr The Wavefiend', 'Yarr', 'Wellenteufel Yarr', '水鬼のヤァル', NULL, 4, 11.5, 14.0, 49, 1, 1, 317, 1, 0),
(166, 1043, 'Yarzon Lurker', 'Yarzon Lurker', 'Yarzon Rôdeur', 'Lauernd[a] Yarzon', 'ヤーゾン・ラーカー', NULL, 4, 34.8, 29.9, 14, NULL, 0, NULL, 0, 0),
(167, 1359, 'Yellowjacket Captain', 'Yellowjacket Captain', 'Capitaine D\'infanterie Des Casaques', 'Gelbjacken-Hauptmann', 'イエロージャケット陸士長', NULL, 4, 27.2, 23.7, 16, NULL, 1, NULL, 0, 0),
(168, 28, 'Coeurl Pup', 'Coeurl Pup', 'Jeune Coeurl', 'Coeurl-Jungtier', 'クァール・パップ', NULL, 5, 9.0, 21.5, 23, NULL, 0, NULL, 0, 0),
(169, 381, 'Forest Yarzon', 'Forest Yarzon', 'Yarzon Des Forêts', 'Wald-Yarzon', 'フォレスト・ヤーゾン', NULL, 5, 11.0, 21.3, 22, NULL, 0, NULL, 0, 0),
(170, 380, 'Kobold Footman', 'Kobold Footman', 'Fantassin Kobold', 'Kobold-Fußsoldat', 'コボルド・フットマン', NULL, 5, 11.8, 22.0, 24, NULL, 0, NULL, 0, 0),
(171, 379, 'Kobold Patrolman', 'Kobold Patrolman', 'Patrouilleur Kobold', 'Kobold-Grenzsoldat', 'コボルド・パトロールマン', NULL, 5, 28.3, 18.5, 34, NULL, 0, NULL, 0, 1),
(172, 370, 'Kobold Pickman', 'Kobold Pickman', 'Piocheur Kobold', 'Kobold-Hauer', 'コボルド・ピックマン', NULL, 5, 12.0, 22.1, 24, NULL, 0, NULL, 0, 0),
(173, 376, 'Kobold Sidesman', 'Kobold Sidesman', 'Bedeau Kobold', 'Kobold-Diener', 'コボルド・サイズマン', NULL, 5, 26.7, 19.6, 34, 4, 0, NULL, 1, 0),
(174, 413, 'Mamool Ja Executioner', 'Mamool Ja Executioner', 'Exécuteur Mamool Ja', 'Mamool Ja-Henker', 'マムージャ・エクスキューショナー', NULL, 5, 32.0, 24.7, 33, 4, 0, NULL, 1, 1),
(175, 416, 'Mamool Ja Infiltrator', 'Mamool Ja Infiltrator', 'Infiltrateur Mamool Ja', 'Mamool Ja-Spion', 'マムージャ・インフィルトレーター', NULL, 5, 33.2, 25.7, 33, NULL, 0, NULL, 0, 0),
(177, 642, 'Mud Pugil', 'Mud Pugil', 'Pugil Vaseux', 'Schmodder-Pugil', 'マッドプギル', NULL, 5, 32.9, 25.6, 30, NULL, 0, NULL, 0, 0),
(768, 859, 'Gluttonous Gertrude', 'Gluttonous Gertrude', 'Gertrude La Gloutonne', 'Gierschlund Gertrude', 'グルタナスガーティ', NULL, 4, 32.0, 28.0, 12, 1, 1, 10, 1, 0),
(180, 1519, 'Oannes', 'Oannes', 'Oannes', 'Oannes', 'オアンネス', NULL, 5, 34.3, 24.2, 30, 1, 1, 22, 1, 0),
(181, 1238, 'Rabid Ratata', 'Rabid Ratata', 'Ratata L\'enragée', 'Ratata [t] Wüterin[p]', '狂犬のラタタ', NULL, 5, 10.4, 23.6, 21, NULL, 1, NULL, 0, 0),
(182, 391, 'Salamander', 'Salamander', 'Salamandre', 'Salamander', 'サラマンダー', NULL, 5, 27.4, 22.3, 34, 4, 0, NULL, 1, 0),
(183, 1239, 'Salthound Boatswain', 'Salthound Boatswain', 'Matelot Des Dogues De Mer', 'Meeresköter-Bootsmann', '猟犬同盟の甲板員', NULL, 5, 12.5, 25.3, 17, NULL, 1, NULL, 0, 0),
(184, 1240, 'Salthound Gunner', 'Salthound Gunner', 'Pilote Des Dogues De Mer', 'Meeresköter-Navigator', '猟犬同盟の航海士', NULL, 5, 11.2, 22.8, 17, NULL, 1, NULL, 0, 0),
(185, 638, 'Stoneshell', 'Stoneshell', 'Coquepierre', 'Steinschale', 'ストーンシェル', NULL, 5, 13.6, 24.3, 21, NULL, 0, NULL, 0, 0),
(186, 39, 'Tree Slug', 'Tree Slug', 'Limace Arboricole', 'Baumschnecke', 'ツリースラッグ', NULL, 5, 12.9, 26.1, 10, NULL, 0, NULL, 0, 1),
(187, 643, 'Uragnite', 'Uragnite', 'Uragnite', 'Uragnit', 'ウラグナイト', NULL, 5, 28.8, 22.1, 31, 4, 0, NULL, 1, 0),
(188, 1180, 'Wild Wolf', 'Wild Wolf', 'Loup Sauvage', 'Wildwolf', 'ワイルドウルフ', NULL, 5, 14.0, 25.3, 20, NULL, 0, NULL, 0, 0),
(189, 1521, 'Zoredonite', 'Zoredonite', 'Zoredonite', 'Zoredonit', 'ゾレドナイト', NULL, 5, 28.6, 24.5, 31, 1, 1, 36, 1, 0),
(190, 1670, '59th Order Bedesman Bi Go', '59th Order Bedesman Bi Go', 'Bi Go Prieur Du 59e Ordre', 'Fürbeter[p] Bi Go Vom 59. Orden', 'ビーズマン59 ビ・ゴ', NULL, 6, 24.5, 6.5, 49, 1, 1, 327, 1, 0),
(191, 1524, '59th Order Pickman Be Ze', '59th Order Pickman Be Ze', 'Be Ze Piocheur Du 59e Ordre', 'Hauer[p] Be Ze Vom 59. Orden', 'ピックマン59 ベ・ゼ', NULL, 6, 22.9, 11.8, 44, 1, 1, 321, 1, 0),
(192, 2516, '59th Order Roundsman Ge Ga', '59th Order Roundsman Ge Ga', 'Ge Ga Livreur Du 59e Ordre', 'Laufbursche Ge Ga Vom 59. Orden', 'ラウンズマン59 ゲ・ガ', NULL, 6, 22.4, 6.4, 47, 1, 1, 408, 1, 0),
(193, 2357, '5th Order Patriarch Ze Bu', '5th Order Patriarch Ze Bu', 'Ze Bu Patriarche Du 5e Ordre', 'Ze Bu Vom 5. Orden', 'ペイトリアーク05 ゼ・ブ', NULL, 6, 22.5, 8.3, 47, 1, 1, 2, 1, 0),
(195, 1671, 'Asbestos Coblyn', 'Asbestos Coblyn', 'Doblyn D\'asbeste', 'Asbest-Kobalos', 'アスベスト・ドブラン', NULL, 6, 24.7, 6.4, 45, NULL, 1, NULL, 0, 0),
(196, 1528, 'Balidet', 'Balidet', 'Balidet', 'Balidet', 'バリデト', NULL, 6, 21.7, 5.8, 47, NULL, 1, NULL, 0, 0),
(197, 365, 'Basalt Golem', 'Basalt Golem', 'Golem De Basalte', 'Basaltgolem', 'バサルトゴーレム', NULL, 6, 17.1, 16.2, 31, NULL, 0, NULL, 0, 0),
(198, 2699, 'Big Shrapnel', 'Big Shrapnel', 'Shrapnelo Géant', 'Groß[a] Schrapnell', 'ビッグ・シュラプネル', NULL, 6, 25.8, 9.9, 44, NULL, 0, NULL, 0, 0),
(199, 2528, 'Bomb Incubator', 'Bomb Incubator', 'Bombocubateur', 'Bomber-Brutofen', 'ボム培養炉', NULL, 6, 22.5, 11.3, 44, NULL, 0, NULL, 0, 0),
(200, 106, 'Coeurl', 'Coeurl', 'Coeurl', 'Coeurl', 'クァール', NULL, 6, 14.9, 11.1, 34, 3, 0, NULL, 1, 0),
(201, 1723, 'Cowering Coachman', 'Cowering Coachman', 'Fourrier Embarrassé', 'Gestrandet[a] Ladenbesitzer', '困り果てた御者', NULL, 6, 21.1, 17.3, 31, NULL, 1, NULL, 0, 0),
(202, 2708, 'Dazzling Bomb', 'Dazzling Bomb', 'Bombo étincelant', 'Gleißend[a] Bomber', 'ブリリアント・ボム', NULL, 6, 27.1, 5.4, 48, NULL, 0, NULL, 0, 0),
(203, 2521, 'Elite Bedesman', 'Elite Bedesman', 'Prieur D\'élite', 'Elite-Fürbeter', 'エリート・ビーズマン', NULL, 6, 25.0, 5.9, 49, NULL, 0, NULL, 0, 0),
(204, 2520, 'Elite Priest', 'Elite Priest', 'Prêtre D\'élite', 'Elite-Priester', 'エリート・プリースト', NULL, 6, 26.7, 5.4, 49, NULL, 0, NULL, 0, 0),
(205, 2519, 'Elite Quarryman', 'Elite Quarryman', 'Terrassier D\'élite', 'Elite-Steinschlepper', 'エリート・クォーリーマン', NULL, 6, 26.0, 8.4, 49, NULL, 0, NULL, 0, 0),
(206, 2518, 'Elite Roundsman', 'Elite Roundsman', 'Livreur D\'élite', 'Elite-Laufbursche', 'エリート・ラウンズマン', NULL, 6, 25.1, 8.4, 49, NULL, 0, NULL, 0, 0),
(207, 2707, 'Glowing Bomb', 'Glowing Bomb', 'Bombo Incandescent', 'Leuchtend[a] Bomber', 'ブライト・ボム', NULL, 6, 27.1, 5.6, 48, NULL, 0, NULL, 0, 0),
(208, 398, 'Highland Condor', 'Highland Condor', 'Condor Des Hautes Terres', 'Hochland-Kondor', 'ハイランド・コンドル', NULL, 6, 16.6, 17.8, 34, NULL, 0, NULL, 0, 0),
(209, 375, 'Kobold Bedesman', 'Kobold Bedesman', 'Prieur Kobold', 'Kobold-Fürbeter', 'コボルド・ビーズマン', NULL, 6, 22.9, 12.4, 41, 4, 0, NULL, 1, 0),
(210, 374, 'Kobold Deacon', 'Kobold Deacon', 'Aruspice Kobold', 'Kobold-Diakon', 'コボルド・ディーコン', NULL, 6, 22.1, 6.0, 44, NULL, 1, NULL, 0, 0),
(211, 371, 'Kobold Priest', 'Kobold Priest', 'Prêtre Kobold', 'Kobold-Priester', 'コボルド・プリースト', NULL, 6, 23.4, 12.1, 41, 4, 0, NULL, 1, 0),
(212, 562, 'Kobold Quarryman', 'Kobold Quarryman', 'Terrassier Kobold', 'Kobold-Steinschlepper', 'コボルド・クォーリーマン', NULL, 6, 21.4, 15.1, 31, 4, 0, NULL, 1, 0),
(213, 377, 'Kobold Roundsman', 'Kobold Roundsman', 'Livreur Kobold', 'Kobold-Laufbursche', 'コボルド・ラウンズマン', NULL, 6, 22.8, 15.2, 41, 4, 0, NULL, 1, 0),
(214, 1856, 'Lost Lalafell', 'Lost Lalafell', 'Lalafell égaré', 'Verirrt[a] Lalafell', '迷い込んだ冒険者', NULL, 6, 15.6, 10.7, 1, NULL, 1, NULL, 0, 0),
(215, 2749, 'Mark II Limpet Bomb', 'Mark II Limpet Bomb', 'Bombo Collant évolué', 'Brandneu[a] Haft-Bomber', '新式リムペットボム', NULL, 6, 23.6, 8.7, 48, NULL, 0, NULL, 0, 0),
(216, 1604, 'Pack Chocobo', 'Pack Chocobo', 'Chocobo De Bât', 'Karawanen-Chocobo', '荷運びチョコボ', NULL, 6, 22.1, 17.4, 1, NULL, 1, NULL, 0, 1),
(217, 2529, 'Prototype Bomb Incubator', 'Prototype Bomb Incubator', 'Bombocubateur évolué', 'Brandneu[a] Bomber-Brutofen', '新式ボム培養炉', NULL, 6, 27.1, 5.1, 48, NULL, 0, NULL, 0, 0),
(218, 62, 'Pteroc', 'Pteroc', 'Ptéroc Des Embruns', 'Pterosaurus', 'テロック', NULL, 6, 15.0, 19.0, 30, NULL, 0, NULL, 0, 0),
(219, 1863, 'Restless Raptor', 'Restless Raptor', 'Raptor Agité', 'Rastlos[a] Raptor', 'レストレス・ラプトル', NULL, 6, 17.7, 16.2, 31, NULL, 1, NULL, 0, 0),
(220, 407, 'Ringtail', 'Ringtail', 'Galago à Queue Annelée', 'Katzenfrett', 'リングテイル', NULL, 6, 15.7, 11.0, 34, NULL, 0, NULL, 0, 0),
(221, 1273, 'Storm Recruit', 'Storm Recruit', 'Soldat Du Maelstrom', 'Mahlstrom-Rekrut', '黒渦団の兵卒', NULL, 6, 18.3, 15.8, 46, NULL, 0, NULL, 0, 1),
(222, 1836, 'Synthetic Doblyn', 'Synthetic Doblyn', 'Doblyn Synthétique', 'Synthetisch[a] Dobalos', 'シンセティック・ドブラン', NULL, 6, 21.9, 9.3, 48, 3, 0, NULL, 1, 0),
(223, 1834, 'U\'Ghamaro Bedesman', 'U\'Ghamaro Bedesman', 'Prieur D\'U\'Ghamaro', 'U\'Ghamaro-Fürbeter', 'ウ・ガマロ・ビーズマン', NULL, 6, 22.6, 7.2, 48, 3, 0, NULL, 1, 0),
(224, 2522, 'U\'Ghamaro Golem', 'U\'Ghamaro Golem', 'Golem D\'U\'Ghamaro', 'U\'Ghamaro-Golem', 'ウ・ガマロ・ゴーレム', NULL, 6, 27.2, 7.4, 49, NULL, 0, NULL, 0, 0),
(225, 2715, 'U\'Ghamaro Patrolman', 'U\'Ghamaro Patrolman', 'Patrouilleur D\'U\'Ghamaro', 'U\'Ghamaro-Grenzsoldat', 'ウ・ガマロ・パトロールマン', NULL, 6, 23.5, 8.6, 48, NULL, 0, NULL, 0, 0),
(226, 1835, 'U\'Ghamaro Priest', 'U\'Ghamaro Priest', 'Prêtre D\'U\'Ghamaro', 'U\'Ghamaro-Priester', 'ウ・ガマロ・プリースト', NULL, 6, 22.1, 6.3, 48, 3, 0, NULL, 1, 0),
(227, 1833, 'U\'Ghamaro Quarryman', 'U\'Ghamaro Quarryman', 'Terrassier D\'U\'Ghamaro', 'U\'Ghamaro-Steinschlepper', 'ウ・ガマロ・クォリーマン', NULL, 6, 23.7, 6.5, 48, 3, 0, NULL, 1, 0),
(228, 1832, 'U\'Ghamaro Roundsman', 'U\'Ghamaro Roundsman', 'Livreur D\'U\'Ghamaro', 'U\'Ghamaro-Laufbursche', 'ウ・ガマロ・ラウンズマン', NULL, 6, 22.5, 9.9, 48, 4, 0, NULL, 1, 0),
(229, 412, 'Velociraptor', 'Velociraptor', 'Velociraptor', 'Velociraptor', 'ヴェロキラプトル', NULL, 6, 20.3, 15.4, 34, 3, 0, NULL, 1, 0),
(231, 2192, 'Young Coeurl', 'Young Coeurl', 'Coeurl Pubère', 'Jung[a] Coeurl', 'ヤング・クァール', NULL, 6, 16.1, 15.1, 34, NULL, 0, NULL, 0, 0),
(232, 120, 'Anole', 'Anole', 'Anolis', 'Anolis', 'アノール', NULL, 7, 30.4, 19.3, 9, NULL, 0, NULL, 0, 0),
(233, 511, 'Barricade', 'Barricade', 'Barricade', 'Barriere', 'バリケード', NULL, 7, 19.1, 20.5, 25, NULL, 0, NULL, 0, 0),
(234, 196, 'Black Eft', 'Black Eft', 'Jeune Triton Noir', 'Schwarzmolch', 'ブラックエフト', NULL, 7, 25.8, 21.9, 6, NULL, 0, NULL, 0, 0),
(235, 197, 'Bog Yarzon', 'Bog Yarzon', 'Yarzon Des Marais', 'Sumpf-Yarzon', 'ボッグヤーゾン', NULL, 7, 22.4, 20.7, 7, NULL, 0, NULL, 0, 0),
(236, 1385, 'Bomb', 'Bomb', 'Bombe', 'Bombe', '爆弾', NULL, 7, 19.2, 20.5, 50, NULL, 0, NULL, 0, 0),
(237, 221, 'Brood Ziz', 'Brood Ziz', 'Ziz Poussin', 'Brütend[a] Ziz', 'ブルード・ジズ', NULL, 7, 15.4, 20.5, 30, NULL, 0, NULL, 0, 0),
(238, 181, 'Carrion Chigoe', 'Carrion Chigoe', 'Chigoe Charognard', 'Aasmücke', 'キャリオンチゴー', NULL, 7, 21.5, 20.2, 10, NULL, 0, NULL, 0, 0),
(239, 131, 'Crater Golem', 'Crater Golem', 'Golem Des Cratères', 'Krater-Golem', 'クレーターゴーレム', NULL, 7, 9.8, 18.3, 43, 3, 0, NULL, 1, 0),
(240, 55, 'Deathgaze', 'Deathgaze', 'Mortalis', 'Thanatos', 'デスゲイズ', NULL, 7, 17.8, 22.2, 33, 4, 0, NULL, 1, 0),
(241, 10, 'Diremite', 'Diremite', 'Acarus', 'Schaudermilbe', 'ダイアマイト', NULL, 7, 20.2, 18.2, 12, NULL, 0, NULL, 0, 0),
(242, 1328, 'Entomophobic Woodcutter', 'Entomophobic Woodcutter', 'Bûcheron Entomophobe', 'Insekten Hassend[a] Holzfäller', '蟲嫌いの木こり', NULL, 7, 28.2, 21.6, 6, NULL, 1, NULL, 0, 0),
(243, 207, 'Floating Eye', 'Floating Eye', 'œil Flottant', 'Schwebauge', 'フローティングアイ', NULL, 7, 10.9, 23.5, 31, 4, 0, NULL, 1, 0),
(244, 47, 'Forest Funguar', 'Forest Funguar', 'Fungus Des Forêts', 'Forst-Fungus', 'フォレストファンガー', NULL, 7, 24.2, 18.6, 4, NULL, 0, NULL, 0, 0),
(245, 464, 'Goblin Outlaw', 'Goblin Outlaw', 'Hors-la-loi Gobelin', 'Goblin-Bandit', 'ゴブリン・アウトロー', NULL, 7, 19.8, 20.3, 25, NULL, 0, NULL, 0, 0),
(246, 519, 'Greatloam Farmer', 'Greatloam Farmer', 'Botaniste Du Courtil', 'Erntehelfer', '収穫に来た園芸師', NULL, 7, 14.7, 17.9, 1, NULL, 1, NULL, 0, 0),
(247, 2057, 'Halitostroper', 'Halitostroper', 'Halitostoroper', 'Halit-Todesweide', 'ハリトストローパー', NULL, 7, 15.0, 21.3, 31, NULL, 0, NULL, 0, 0),
(248, 195, 'Hoglet', 'Hoglet', 'Goret', 'Schweinchen', 'ホグレット', NULL, 7, 29.0, 23.3, 8, NULL, 0, NULL, 0, 0),
(249, 54, 'Hornet Swarm', 'Hornet Swarm', 'Nuée De Frelons', 'Hornissenschwarm', 'ホーネット・スウォーム', NULL, 7, 11.3, 23.9, 14, NULL, 0, NULL, 0, 1),
(250, 1329, 'Jaded Jody', 'Jaded Jody', 'Jody L\'aigrie', 'Satt[a] Susi', 'ジェイデッド・ジョディ', NULL, 7, 13.3, 22.4, 31, 1, 1, 14, 1, 0),
(251, 178, 'Leafbleed Mite', 'Leafbleed Mite', 'Mite Feuillesang', 'Blattblutmilbe', 'リーフブリード・マイト', NULL, 7, 19.0, 19.1, 8, NULL, 0, NULL, 0, 0),
(252, 180, 'Leafbleed Roseling', 'Leafbleed Roseling', 'Roselette Feuillesang', 'Blattblut-Rösling', 'リーフブリード・ローズレット', NULL, 7, 18.9, 20.8, 12, NULL, 0, NULL, 0, 1),
(253, 177, 'Leafbleed Slug', 'Leafbleed Slug', 'Limace Feuillesang', 'Blattblutschnecke', 'リーフブリード・スラッグ', NULL, 7, 18.5, 19.5, 10, NULL, 0, NULL, 0, 0),
(254, 2190, 'Lightning Spark', 'Lightning Spark', 'éclair Fulgurant', 'Blitzfunken', 'ライトニングスパーク', NULL, 7, 15.7, 17.9, 29, NULL, 0, NULL, 0, 0),
(255, 130, 'Lindwurm', 'Lindwurm', 'Lindwurm', 'Lindwurm', 'リンドヴルム', NULL, 7, 14.5, 18.4, 33, 3, 0, NULL, 1, 0),
(256, 49, 'Little Ladybug', 'Little Ladybug', 'Coccinelle', 'Marienkäfer', 'レディバグ', NULL, 7, 25.0, 18.3, 2, NULL, 0, NULL, 0, 1),
(257, 448, 'Lou Carcolh', 'Lou Carcolh', 'Lou Carcolh', 'Lou Carcolh', 'ル・カルコル', NULL, 7, 14.7, 25.4, 14, 1, 1, 57, 1, 0),
(258, 592, 'Lumber Toad', 'Lumber Toad', 'Crapaud Bûcheron', 'Holzkröte', 'ランバートード', NULL, 7, 24.7, 31.3, 13, NULL, 0, NULL, 0, 0),
(259, 20, 'Magicked Bones', 'Magicked Bones', 'Squelette Maudit', 'Verhext[a] Gerippe', 'マジックドボーンズ', NULL, 7, 19.5, 27.8, 13, NULL, 0, NULL, 0, 0),
(260, 517, 'Miraudont The Madder', 'Miraudont The Madder', 'Miraudont Le Furieux', 'Manisch[a] Miraudont', '激高のミロードン', NULL, 7, 24.1, 19.7, 5, NULL, 1, NULL, 0, 0),
(261, 2175, 'Nameless Conjurer', 'Nameless Conjurer', 'élémentaliste Curieuse', 'Wissbegierig[a] Seher', '謎に挑む道士', NULL, 7, 12.5, 16.5, 1, NULL, 1, NULL, 0, 0),
(262, 218, 'Qiqirn Scrambler', 'Qiqirn Scrambler', 'Qiqirn Farfouilleur', 'Qiqirn-Störenfried', 'キキルン・スクランブラー', NULL, 7, 17.8, 19.8, 10, NULL, 0, NULL, 0, 0),
(263, 22, 'Roselet', 'Roselet', 'Roselette', 'Rösling', 'ローズレット', NULL, 7, 20.6, 30.3, 10, NULL, 0, NULL, 0, 0),
(264, 188, 'Saprophagous Slug', 'Saprophagous Slug', 'Limace Nécrophage', 'Saprophage', 'ネクロファガス・スラッグ', NULL, 7, 19.6, 31.1, 10, NULL, 0, NULL, 0, 0),
(265, 518, 'Serpent Recruit', 'Serpent Recruit', 'Jeune Recrue Des Deux Vipères', 'Neu[a] Rekrut', '双蛇党の新兵', NULL, 7, 24.4, 20.0, 3, NULL, 1, NULL, 0, 0),
(266, 2996, 'Slate Golem', 'Slate Golem', 'Golem D\'ardoise', 'Tongolem', 'スレートゴーレム', NULL, 7, 11.8, 17.3, 30, NULL, 1, NULL, 0, 0),
(267, 91, 'Spriggan', 'Spriggan', 'Spriggan', 'Spriggan', 'スプリガン', NULL, 7, 12.5, 16.7, 33, 4, 0, NULL, 1, 0),
(268, 445, 'Stagnant Water Sprite', 'Stagnant Water Sprite', 'élémentaire Stagnant', 'Anomal[a] Wasser-Exergon', 'スタグナントスプライト', NULL, 7, 23.8, 24.1, 8, 1, 1, 45, 1, 0),
(269, 465, 'Stikflix Grumblytoss', 'Stikflix Grumblytoss', 'Stikflix Le Grincheux', 'Stickflix Grummeltoss', '仏頂面のスティックフリックス', NULL, 7, 17.1, 18.2, 28, NULL, 0, NULL, 0, 0),
(270, 199, 'Stumbling Funguar', 'Stumbling Funguar', 'Fungus Trébuchant', 'Stolper-Fungus', 'スタンブリング・ファンガー', NULL, 7, 22.6, 24.4, 19, NULL, 0, NULL, 0, 1),
(271, 41, 'Syrphid Swarm', 'Syrphid Swarm', 'Nuée De Syrphes', 'Mistfliegenschwarm', 'サーフィド・スウォーム', NULL, 7, 26.3, 25.1, 8, NULL, 0, NULL, 0, 0),
(272, 48, 'Toadstool', 'Toadstool', 'Vesse-de-crapaud', 'Krötenstuhl', 'トードスツール', NULL, 7, 15.5, 18.2, 29, NULL, 0, NULL, 0, 0),
(273, 492, 'Trickster Imp', 'Trickster Imp', 'Imp Farceur', 'Gauner-Imp', 'トリックスター', NULL, 7, 19.0, 18.9, 15, NULL, 0, NULL, 0, 0),
(274, 21, 'Trickster Imp', 'Trickster Imp', 'Imp', 'Gauner-Imp', 'インプ', NULL, 7, 27.2, 25.2, 9, NULL, 0, NULL, 0, 0),
(275, 491, 'Wandering Wisp', 'Wandering Wisp', 'Feu Follet Errant', 'Umherstreifend[a] Irrlicht', 'ワンダリング・ウィスプ', NULL, 7, 18.6, 20.8, 13, NULL, 0, NULL, 0, 0),
(769, 1522, 'Scarface Bugaal Ja', 'Scarface Bugaal Ja', 'Bugaal Ja Le Balafré', 'Narbengesicht Bugaal Ja', '美男のブガージャ', NULL, 5, 28.0, 23.0, 33, 1, 1, 26, 1, 0),
(278, 2173, '3rd Cohort Optio', '3rd Cohort Optio', 'Optio De La 3e Cohorte', 'Optio[p] Der III. Kohorte', 'IIIコホルス・オプティオ', NULL, 8, 32.5, 20.4, 41, NULL, 1, NULL, 0, 0),
(279, 1663, 'Aulus Rem Vulso', 'Aulus Rem Vulso', 'Aulus Rem Vulso', 'Aulus Rem Vulso', 'アウルス・レム・ヴルソ', NULL, 8, 32.4, 20.5, 44, NULL, 1, NULL, 0, 0),
(280, 2314, 'Banestool', 'Banestool', 'Vesse-de-fléau', 'Fluchhut', 'ドクキリタケ', NULL, 8, 27.1, 22.5, 41, NULL, 0, NULL, 0, 0),
(281, 38, 'Black Bat', 'Black Bat', 'Chauve-souris Noire', 'Schwarz[a] Fledermaus', 'ブラックバット', NULL, 8, 16.5, 22.8, 20, NULL, 0, NULL, 0, 0),
(282, 612, 'Blood Bat', 'Blood Bat', 'Chauve-souris Vampire', 'Blutfledermaus', 'ブラッドバット', NULL, 8, 22.3, 28.2, 15, NULL, 0, NULL, 0, 0),
(283, 240, 'Boar Poacher', 'Boar Poacher', 'Braconnière De Sangliers', 'Keiler-Wilderin', 'ボア・ポーチャー', NULL, 8, 19.7, 30.1, 18, NULL, 0, NULL, 0, 0),
(284, 36, 'Boring Weevil', 'Boring Weevil', 'Hanneton', 'Rüsselkäfer', 'ウィーヴィル', NULL, 8, 23.9, 30.2, 16, NULL, 0, NULL, 0, 0),
(285, 524, 'Bothered Beekeeper', 'Bothered Beekeeper', 'Apiculteur En Colère', 'Verdrossen[a] Imker', '怒れる養蜂家', NULL, 8, 11.8, 24.7, 8, NULL, 1, NULL, 0, 0),
(286, 1662, 'Capricious Cassie', 'Capricious Cassie', 'Cassie La Capricieuse', 'Kapriziös[a] Cassie', 'カプリシャス・キャシー', NULL, 8, 23.2, 20.6, 43, 1, 1, 336, 1, 0),
(287, 1664, 'Daxio Of The Dawn', 'Daxio Of The Dawn', 'Daxio', 'Daxio', '覚醒のダキシオ', NULL, 8, 32.1, 14.2, 47, 1, 1, 9, 1, 0),
(288, 232, 'Diseased Treant', 'Diseased Treant', 'Tréant Malade', 'Krank[a] Baumschrat', 'ディズィーズ・トレント', NULL, 8, 16.4, 22.7, 21, NULL, 0, NULL, 0, 0),
(289, 164, 'Dreamtoad', 'Dreamtoad', 'Crapaud Rêveur', 'Traumkröte', 'ドリームトード', NULL, 8, 28.2, 17.7, 46, 3, 0, NULL, 1, 0),
(290, 220, 'Faerie Funguar', 'Faerie Funguar', 'Fungus Fée', 'Feen-Fungus', 'フェアリーファンガー', NULL, 8, 18.5, 28.5, 16, NULL, 0, NULL, 0, 0),
(291, 1203, 'Fruiting Fungus', 'Fruiting Fungus', 'Fungus Fructifiant', 'Frucht-Fungus', 'フルーティング・ファンガー', NULL, 8, 23.3, 30.1, 18, NULL, 1, NULL, 0, 0),
(292, 2157, 'Gall Gnat', 'Gall Gnat', 'Taon Galeux', 'Gallenschnake', 'ガルナット', NULL, 8, 22.3, 30.9, 21, NULL, 0, NULL, 0, 0),
(293, 77, 'Gelmorran Cogfinder', 'Gelmorran Cogfinder', 'Quêteuse De Rouages De Gelmorra', 'Gelmorrisch[a] Zahnrädlerin', 'コッグファインダー', NULL, 8, 17.6, 28.9, 17, NULL, 0, NULL, 0, 0),
(294, 2316, 'Giant Banestool', 'Giant Banestool', 'Vesse-de-fléau Géante', 'Beseelt[a] Fluchhut', '特大ドクキリタケ', NULL, 8, 23.9, 15.0, 48, NULL, 0, NULL, 0, 0),
(295, 7, 'Giant Gnat', 'Giant Gnat', 'Taon Géant', 'Dämonenschnake', 'ナット', NULL, 8, 19.5, 26.5, 16, NULL, 0, NULL, 0, 0),
(296, 2876, 'Giant Treant', 'Giant Treant', 'Tréant Géant', 'Riesenbaumschrat', 'ジャイアント・トレント', NULL, 8, 32.0, 15.0, 50, NULL, 0, NULL, 0, 0),
(297, 211, 'Glowfly', 'Glowfly', 'Lampyre', 'Glühwürmchen', 'グロウフライ', NULL, 8, 16.1, 21.2, 24, NULL, 0, NULL, 0, 0),
(298, 1136, 'Gnarled Treant', 'Gnarled Treant', 'Tréant Noueux', 'Knorrig[a] Baumschrat', 'ナールド・トレント', NULL, 8, 17.9, 28.3, 26, NULL, 0, NULL, 0, 0),
(299, 621, 'Gods\' Quiver Bow', 'Gods\' Quiver Bow', 'Flèche Divine', 'Soldat[p] Von Nophicas Schar', '神勇隊の隊士 ', NULL, 8, 21.2, 29.7, 13, NULL, 1, NULL, 0, 0),
(300, 2315, 'Greater Banestool', 'Greater Banestool', 'Grosse Vesse-de-fléau', 'Groß[a] Fluchhut', '大ぶりドクキリタケ', NULL, 8, 27.2, 15.6, 44, NULL, 0, NULL, 0, 0),
(301, 553, 'Honeybee Swarm', 'Honeybee Swarm', 'Nuée D\'abeilles', 'Honigbienenschwarm', 'ハニービー・スウォーム', NULL, 8, 11.3, 22.2, 8, NULL, 0, NULL, 0, 0),
(302, 2757, 'Hungry Buzzard', 'Hungry Buzzard', 'Busard Affamé', 'Hungrig[a] Bussard', 'ハングリー・バザード', NULL, 8, 20.4, 27.4, 16, NULL, 0, NULL, 0, 0),
(303, 449, 'Jackanapes', 'Jackanapes', 'Zigoto', 'Naseweis', 'ジャッカネイプス', NULL, 8, 21.1, 29.9, 19, 1, 1, 63, 1, 0),
(304, 535, 'Jackanapes\'s Bean-bearer', 'Jackanapes\'s Bean-bearer', 'Sbire De Zigoto', 'Naseweis-Gefolgsmann', 'ジャッカネイプスの手下', NULL, 8, 21.1, 29.9, 17, NULL, 1, NULL, 0, 0),
(305, 44, 'Jumping Djigga', 'Jumping Djigga', 'Djigga Sautilleur', 'Hopsend[a] Haarmücke', 'ヂッガ', NULL, 8, 16.2, 20.8, 24, NULL, 0, NULL, 0, 0),
(306, 1202, 'Lazy Laurence', 'Lazy Laurence', 'Laurence La Lambine', 'Faul[a] Laurence', 'レジー・ローレンス', NULL, 8, 23.4, 29.8, 20, NULL, 1, NULL, 0, 0),
(307, 203, 'Leathervine Microchu', 'Leathervine Microchu', 'Microtyugh à Sarment', 'Lederranken-Mikrochu', 'レザーヴァイン・コチュー', NULL, 8, 17.5, 29.1, 18, NULL, 0, NULL, 0, 0),
(308, 1143, 'Lefquene The Mystic', 'Lefquene The Mystic', 'Milburh La Mystique', 'Milburh', '魔性のレフケン', NULL, 8, 18.4, 28.0, 24, NULL, 0, NULL, 0, 0),
(309, 6, 'Lemur', 'Lemur', 'Lémur', 'Lori', 'レミュー', NULL, 8, 21.5, 27.8, 18, NULL, 0, NULL, 0, 0),
(310, 531, 'Little Solace Sylph', 'Little Solace Sylph', 'Sylphe Du Refuge', 'Zufluchts-Sylphe', '仮宿のシルフ', NULL, 8, 21.7, 26.3, 16, NULL, 1, NULL, 0, 0),
(311, 1144, 'Long-winded Lemur', 'Long-winded Lemur', 'Lémur Prolixe', 'Langatmig[a] Lori', 'ロングウィンド・レミュー', NULL, 8, 18.1, 28.3, 24, NULL, 0, NULL, 0, 0),
(312, 107, 'Mandragora', 'Mandragora', 'Mandragore', 'Mandragora', 'マンドラゴラ', NULL, 8, 14.0, 25.7, 13, NULL, 0, NULL, 0, 0),
(313, 1330, 'Mead-porting Midlander', 'Mead-porting Midlander', 'Livreur D\'hydromel', 'Met Schleppend[a] Wiesländer[p]', '蜂蜜酒の運び人', NULL, 8, 17.8, 27.0, 18, NULL, 1, NULL, 0, 0),
(315, 1729, 'Mianne Thousandmalm', 'Mianne Thousandmalm', 'Mianne', 'Mianne Tausendmalm', '千里眼のミアヌ', NULL, 8, 28.3, 20.3, 40, NULL, 1, NULL, 0, 0),
(316, 165, 'Milkroot Cluster', 'Milkroot Cluster', 'Grappe De Tuberculait', 'Milchwurzel-Knöterich', 'ミルクルート・クラスター', NULL, 8, 24.0, 16.6, 48, 3, 0, NULL, 1, 0),
(317, 162, 'Milkroot Sapling', 'Milkroot Sapling', 'Pousse De Tuberculait', 'Milchwurzel-Schössling', 'ミルクルート・サップリング', NULL, 8, 23.4, 14.7, 48, 3, 0, NULL, 1, 0),
(318, 222, 'Molted Ziz', 'Molted Ziz', 'Ziz Déplumé', 'Gehäutet[a] Ziz', 'モルテッド・ジズ', NULL, 8, 27.0, 24.2, 40, 3, 0, NULL, 1, 0),
(319, 237, 'Morbol', 'Morbol', 'Morbol', 'Morbol', 'モルボル', NULL, 8, 23.0, 20.7, 43, 3, 0, NULL, 1, 1),
(320, 183, 'North Shroud Lemur', 'North Shroud Lemur', 'Lémur De La Forêt Du Nord', 'Nordwald-Lori', 'ノースシュラウド・レミュー', NULL, 8, 15.8, 26.7, 15, NULL, 0, NULL, 0, 0),
(321, 12, 'Northern Vulture', 'Northern Vulture', 'Vautour', 'Kapgeier', 'ヴァルチャー', NULL, 8, 14.4, 26.3, 13, NULL, 0, NULL, 0, 0),
(322, 33, 'Ochu', 'Ochu', 'Otyugh', 'Ochu', 'オチュー', NULL, 8, 25.5, 24.6, 44, NULL, 0, NULL, 0, 0),
(323, 233, 'Old-growth Treant', 'Old-growth Treant', 'Tréant Centenaire', 'Alt[a] Baumschrat', 'オールドグロウス・トレント', NULL, 8, 25.6, 20.8, 41, 3, 0, NULL, 1, 0),
(324, 507, 'Orphaned Sylph', 'Orphaned Sylph', 'Sylphe Orphelin', 'Sylphen-Waise', '孤児シルフ', NULL, 8, 21.2, 27.1, 19, NULL, 0, NULL, 0, 0),
(325, 214, 'Overgrown Ivy', 'Overgrown Ivy', 'Lierre Envahissant', 'Wuchernd[a] Efeuranke', 'オーバーグロウン・アイビー', NULL, 8, 20.8, 29.7, 21, NULL, 0, NULL, 0, 0),
(326, 1137, 'Pannixia Of The Woven Wing', 'Pannixia Of The Woven Wing', 'Pannixia à L\'aile Tissée', 'Pannixia', '大羽のパニシア', NULL, 8, 18.2, 27.6, 29, NULL, 0, NULL, 0, 0),
(327, 513, 'Prince Of Pestilence', 'Prince Of Pestilence', 'Prince De La Pestilence', 'Pestilenzio', 'プリンス・オブ・ペスト', NULL, 8, 19.1, 27.6, 16, 1, 1, 59, 1, 0),
(328, 125, 'Pus Gnat', 'Pus Gnat', 'Taon Pyophage', 'Eiterdämonenschnake', 'パスナット', NULL, 8, 19.1, 28.1, 17, NULL, 0, NULL, 0, 0),
(329, 239, 'Raptor Poacher', 'Raptor Poacher', 'Braconnière De Raptors', 'Raptoren-Wilderin', 'ラプトル・ポーチャー', NULL, 8, 19.8, 30.1, 18, NULL, 0, NULL, 0, 0),
(330, 474, 'Seven-year Gnat', 'Seven-year Gnat', 'Gnat De Sept Ans', 'Verflixt[a] Dämonenschnake', '賞金首：セブンイヤー・ナット', NULL, 8, 15.9, 27.6, 18, NULL, 0, NULL, 0, 0),
(331, 179, 'Shroudbee Swarm', 'Shroudbee Swarm', 'Nuée D\'abeilles De Sombrelinceul', 'Waldbienenschwarm', 'シュラウドビー・スウォーム', NULL, 8, 16.4, 28.3, 17, NULL, 0, NULL, 0, 0),
(332, 184, 'South Shroud Opo-opo', 'South Shroud Opo-opo', 'Opo-opo De La Forêt Du Sud', 'Südwald-Opo-Opo', 'サウスシュラウド・オポオポ', NULL, 8, 17.9, 29.0, 13, NULL, 0, NULL, 0, 0),
(334, 2187, 'Swollen Djigga', 'Swollen Djigga', 'Djigga Boursouflé', 'Schwell-Haarmücke', 'スウォーレン・ヂッガ', NULL, 8, 15.7, 21.3, 24, NULL, 0, NULL, 0, 0),
(335, 166, 'Sylph Bonnet', 'Sylph Bonnet', 'Chapeau Sylphe', 'Sylphenkappe', 'シルフボンネット', NULL, 8, 26.6, 13.5, 48, 3, 0, NULL, 1, 0),
(336, 67, 'Sylpheed Screech', 'Sylpheed Screech', 'Crieur Sylphe', 'Sylphen-Kreischerin', 'シルフィード・スクリーチ', NULL, 8, 30.0, 11.9, 47, 3, 0, NULL, 1, 0),
(337, 68, 'Sylpheed Sigh', 'Sylpheed Sigh', 'Soupireur Sylphe', 'Sylphen-Seufzerin', 'シルフィード・サイ', NULL, 8, 28.7, 16.9, 45, 3, 0, NULL, 1, 0),
(338, 69, 'Sylpheed Snarl', 'Sylpheed Snarl', 'Grondeur Sylphe', 'Sylphen-Keiferin', 'シルフィード・スナール', NULL, 8, 28.5, 16.3, 45, 3, 0, NULL, 1, 0),
(339, 567, 'Sylphlands Condor', 'Sylphlands Condor', 'Condor Des Terres Sylphes', 'Sylphenland-Kondor', 'シルフランド・コンドル', NULL, 8, 28.2, 17.0, 46, 3, 0, NULL, 1, 0),
(340, 163, 'Sylphlands Sentinel', 'Sylphlands Sentinel', 'Sentinelle Des Terres Sylphes', 'Sylphenland-Wächter', 'シルフランド・センチネル', NULL, 8, 21.3, 10.5, 48, 3, 0, NULL, 1, 0),
(341, 231, 'Sylvan Groan', 'Sylvan Groan', 'Gémisseur Sylvain', 'Silvanisch[a] Ächzerin', 'シルヴァン・グローン', NULL, 8, 20.0, 21.8, 23, NULL, 1, NULL, 0, 0),
(342, 229, 'Sylvan Scream', 'Sylvan Scream', 'Hurleur Sylvain', 'Silvanisch[a] Schreierin', 'シルヴァン・スクリーム', NULL, 8, 18.8, 21.4, 23, NULL, 1, NULL, 0, 0),
(343, 64, 'Sylvan Screech', 'Sylvan Screech', 'Crieur Sylvain', 'Silvanisch[a] Kreischerin', 'シルヴァン・スクリーチ', NULL, 8, 23.8, 20.6, 43, 4, 0, NULL, 1, 0),
(344, 65, 'Sylvan Sigh', 'Sylvan Sigh', 'Soupireur Sylvain', 'Silvanisch[a] Seufzerin', 'シルヴァン・サイ', NULL, 8, 25.0, 21.4, 43, NULL, 0, NULL, 1, 0),
(345, 66, 'Sylvan Snarl', 'Sylvan Snarl', 'Grondeur Sylvain', 'Silvanisch[a] Keiferin', 'シルヴァン・スナール', NULL, 8, 28.5, 20.5, 43, 4, 0, NULL, 1, 0),
(346, 230, 'Sylvan Sough', 'Sylvan Sough', 'Murmureur Sylvain', 'Silvanisch[a] Heulerin', 'シルヴァン・サウ', NULL, 8, 18.7, 21.4, 23, NULL, 1, NULL, 0, 0),
(347, 136, 'Tainted Water Sprite', 'Tainted Water Sprite', 'élémentaire D\'eau Corrompu', 'Unrein[a] Wasser-Exergon', '淀んだウォータースプライト', NULL, 8, 16.0, 28.8, 15, NULL, 0, NULL, 0, 0),
(348, 538, 'Tempered Sylph', 'Tempered Sylph', 'Sylphe Subjugué', 'Besessen[a] Sylphe', 'テンパード・シルフ', NULL, 8, 19.6, 21.9, 23, NULL, 1, NULL, 0, 0),
(349, 2312, 'Tipsy Sylph', 'Tipsy Sylph', 'Sylphe Brindezingue', 'Halluzinierend[a] Sylphe', '酩酊したシルフ', NULL, 8, 20.5, 28.2, 45, NULL, 0, NULL, 0, 0),
(351, 128, 'Treant Sapling', 'Treant Sapling', 'Pousse De Tréant', 'Baumschrat-Ableger', 'トレント・サップリング', NULL, 8, 13.6, 25.6, 14, NULL, 0, NULL, 0, 1),
(352, 1028, 'Trickster Imp', 'Trickster Imp', 'Imp Farceur', 'Scharlatan-Imp', 'トリックスター・インプ', NULL, 8, 18.5, 27.7, 25, NULL, 0, NULL, 0, 0),
(353, 1975, 'Tusked Hog', 'Tusked Hog', 'Verrat à Défenses', 'Eber', 'タスケッド・ホッグ', NULL, 8, 20.1, 25.2, 21, NULL, 0, NULL, 0, 0),
(354, 2319, 'Violet Screech', 'Violet Screech', 'Crieur Violet', 'Violett[a] Kreischerin', 'ヴァイオレット・スクリーチ', NULL, 8, 23.8, 15.0, 49, NULL, 0, NULL, 0, 0),
(355, 2317, 'Violet Sigh', 'Violet Sigh', 'Soupireur Violet', 'Violett[a] Seufzerin', 'ヴァイオレット・サイ', NULL, 8, 23.9, 15.5, 49, NULL, 0, NULL, 0, 0),
(356, 2318, 'Violet Snarl', 'Violet Snarl', 'Grondeur Violet', 'Violett[a] Keiferin', 'ヴァイオレット・スナール', NULL, 8, 23.8, 17.6, 49, NULL, 0, NULL, 0, 0),
(357, 1141, 'Vodoriga Cur', 'Vodoriga Cur', 'Vodoriga Croisée', 'Vodoriga-Köter', 'ヴォドリガ・カー', NULL, 8, 18.4, 28.0, 20, NULL, 0, NULL, 0, 0);
INSERT INTO `mobs_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `lvl`, `slain`, `is_fate`, `id_fate`, `is_visible`, `is_multiple`) VALUES
(358, 16, 'Wild Boar', 'Wild Boar', 'Sanglier Sauvage', 'Wild[a] Keiler', 'ワイルドボア', NULL, 8, 16.6, 23.8, 21, NULL, 0, NULL, 0, 0),
(360, 14, 'Wild Hoglet', 'Wild Hoglet', 'Goret Sauvage', 'Wildschweinchen', 'ワイルドホグレット', NULL, 8, 17.0, 25.4, 14, NULL, 0, NULL, 0, 0),
(361, 115, 'Wind Sprite', 'Wind Sprite', 'élémentaire De Vent', 'Wind-Exergon', 'ウィンドスプライト', NULL, 8, 28.7, 20.5, 42, NULL, 0, NULL, 0, 1),
(362, 241, 'Wolf Poacher', 'Wolf Poacher', 'Braconnière De Loups', 'Wolfs-Wilderin', 'ウルフ・ポーチャー', NULL, 8, 19.6, 30.2, 18, NULL, 0, NULL, 0, 0),
(363, 498, 'Zezeroon Stickyfingers', 'Zezeroon Stickyfingers', 'Zezeroon Le Gourmand', 'Zezerix Klebeklau', '食道楽のゼゼルン', NULL, 8, 17.6, 29.1, 19, NULL, 0, NULL, 0, 0),
(364, 223, 'Ziz Gorlin', 'Ziz Gorlin', 'Petit Ziz', 'Jung-Ziz', 'ジズ・ゴーリン', NULL, 8, 20.9, 26.4, 20, NULL, 0, NULL, 0, 0),
(365, 57, '3rd Cohort Decurion', '3rd Cohort Decurion', 'Decurio De La 3e Cohorte', 'Decurio[p] Der III. Kohorte', 'IIIコホルス・デクリオン', NULL, 9, 18.6, 18.8, 23, NULL, 0, NULL, 0, 0),
(366, 529, 'Abused Adventurer', 'Abused Adventurer', 'Client Embarrassé', 'Belästigt[a] Stammgast', '困り果てた常連客', NULL, 9, 17.5, 20.6, 20, NULL, 1, NULL, 0, 0),
(367, 34, 'Adamantoise', 'Adamantoise', 'Adamankhélone', 'Adaman-Taimai', 'アダマンタス', NULL, 9, 15.9, 29.6, 33, 4, 0, NULL, 1, 0),
(368, 475, 'Alpha Stag', 'Alpha Stag', 'Cerf Alpha', 'Alpha-Antilopenbock', '賞金首：アルファスタッグ', NULL, 9, 23.6, 21.4, 20, NULL, 0, NULL, 0, 0),
(370, 508, 'Angered Elm', 'Angered Elm', 'Orme Furieux', 'Erzürnt[a] Ulme', 'アンガード・エルム', NULL, 9, 23.8, 21.6, 22, NULL, 0, NULL, 0, 0),
(371, 3, 'Antelope Doe', 'Antelope Doe', 'Antilope Biche', 'Antilopenkuh', 'アンテロープ・ドゥ', NULL, 9, 18.2, 22.5, 23, NULL, 0, NULL, 0, 0),
(372, 4, 'Antelope Stag', 'Antelope Stag', 'Antilope Cerf', 'Antilopenbock', 'アンテロープ・スタッグ', NULL, 9, 27.1, 22.6, 26, NULL, 0, NULL, 0, 0),
(373, 228, 'Bark Eft', 'Bark Eft', 'Triton Noir', 'Rindenmolch', 'バークエフト', NULL, 9, 19.6, 22.6, 23, NULL, 0, NULL, 0, 0),
(374, 235, 'Bigmouth Orobon', 'Bigmouth Orobon', 'Orobon Grande Gueule', 'Großmaul-Orobon', 'ビッグマウス・オロボン', NULL, 9, 17.8, 30.5, 31, 3, 0, NULL, 1, 0),
(375, 2163, 'Burchard Swiftspear', 'Burchard Swiftspear', 'Burchard Vive-lance', 'Burchard Flinkspeer', '豪槍のバーカード', NULL, 9, 23.6, 18.3, 32, NULL, 1, NULL, 0, 0),
(376, 43, 'Chigoe', 'Chigoe', 'Chigoe', 'Stechmücke', 'チゴー', NULL, 9, 27.2, 18.1, 9, NULL, 0, NULL, 0, 1),
(377, 2647, 'Clockwork Footman', 'Clockwork Footman', 'Soldat Mécanique', 'Uhrwerk-Fußsoldat', 'アラガンワーク・フットマン', NULL, 9, 21.6, 21.7, 50, NULL, 0, NULL, 0, 0),
(378, 2648, 'Clockwork Warrior', 'Clockwork Warrior', 'Chevalier Mécanique', 'Uhrwerk-Kämpfer', 'アラガンワーク・ウォーリア', NULL, 9, 21.4, 21.7, 50, NULL, 0, NULL, 0, 0),
(379, 169, 'Coeurlclaw Cutter', 'Coeurlclaw Cutter', 'Trancheuse Griffecoeurl', 'Coeurlklauen-Sammlerin', 'クァールクロウ・カッター', NULL, 9, 26.1, 21.8, 29, NULL, 0, NULL, 0, 0),
(380, 139, 'Coeurlclaw Hunter', 'Coeurlclaw Hunter', 'Chasseresse Griffecoeurl', 'Coeurlklauen-Jägerin', 'クァールクロウ・ハンター', NULL, 9, 15.0, 33.8, 29, NULL, 0, NULL, 0, 0),
(381, 140, 'Coeurlclaw Poacher', 'Coeurlclaw Poacher', 'Braconnière Griffecoeurl', 'Coeurlklauen-Wilderin', 'クァールクロウ・ポーチャー', NULL, 9, 24.0, 21.0, 27, NULL, 0, NULL, 0, 0),
(382, 520, 'Crestfallen Merchant', 'Crestfallen Merchant', 'Marchand Penaud', 'Geknickt[a] Händler', '途方に暮れた商人', NULL, 9, 27.3, 21.0, 30, NULL, 1, NULL, 0, 0),
(383, 170, 'Deepvoid Deathmouse', 'Deepvoid Deathmouse', 'Souris Meurtrière Du Néant Profond', 'Zwielicht-Todesmaus', 'ディープヴォイド・ドーマウス', NULL, 9, 25.2, 21.7, 35, 4, 0, NULL, 1, 0),
(384, 501, 'Despicable Devilet', 'Despicable Devilet', 'Diablotin Infâme', 'Jämmerlich[a] Eufel', 'ディスピッカブル・デビレット', NULL, 9, 26.2, 19.8, 28, NULL, 0, NULL, 0, 0),
(385, 454, 'Disorderly Adventurer', 'Disorderly Adventurer', 'Aventurier Brutal', 'Ungestüm[a] Abenteurer', '荒々しい冒険者', NULL, 9, 18.6, 20.6, 35, NULL, 0, NULL, 0, 0),
(386, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 9, 26.3, 21.8, 14, NULL, 0, NULL, 0, 1),
(387, 480, 'Figgy Pudding', 'Figgy Pudding', 'Pudding Aux Figues', 'Feigenpudding', 'フィギープリン', NULL, 9, 26.2, 20.0, 30, NULL, 0, NULL, 0, 0),
(388, 176, 'Foraging Doe', 'Foraging Doe', 'Biche Ruminant', 'Futtersuchend[a] Antilopenkuh', 'フォージング・ドゥ', NULL, 9, 23.7, 20.5, 25, NULL, 0, NULL, 0, 0),
(389, 460, 'Foraging Stag', 'Foraging Stag', 'Cerf Ruminant', 'Futtersuchend[a] Antilopenbock', 'フォージング・スタッグ', NULL, 9, 25.1, 18.8, 25, NULL, 0, NULL, 0, 0),
(390, 50, 'Goblin Thug', 'Goblin Thug', 'Malfrat Gobelin', 'Goblin-Strolch', 'ゴブリン・サグ', NULL, 9, 26.0, 22.0, 28, NULL, 0, NULL, 0, 0),
(391, 502, 'Greedy Hog', 'Greedy Hog', 'Verrat Affamé', 'Hungrig[a] Schwein', 'グリーディ・ホッグ', NULL, 9, 26.1, 19.8, 28, NULL, 0, NULL, 0, 0),
(393, 523, 'Hive Gate', 'Hive Gate', 'Porte Du Guêpier Des Ventrerouge', 'Nesttür', 'レッドベリー砦の門扉', NULL, 9, 22.7, 17.7, 32, NULL, 1, NULL, 0, 0),
(394, 168, 'Hoverfly Swarm', 'Hoverfly Swarm', 'Nuée De Mouches', 'Schwebfliegenschwarm', 'ホバーフライ・スウォーム', NULL, 9, 16.2, 33.9, 30, NULL, 0, NULL, 0, 0),
(395, 8, 'Ked', 'Ked', 'Pou Volant', 'Dämonenfliege', 'ケッド', NULL, 9, 31.5, 23.8, 47, 3, 0, NULL, 1, 0),
(396, 23, 'Kedtrap', 'Kedtrap', 'Piège-pou', 'Dämonenfliegenfalle', 'ケッドトラップ', NULL, 9, 20.3, 20.7, 21, NULL, 0, NULL, 0, 0),
(397, 497, 'Leafbleed Ochu', 'Leafbleed Ochu', 'Otyugh Feuillesang', 'Blattblut-Ochu', 'リーフブリード・オチュー', NULL, 9, 24.3, 21.2, 19, NULL, 0, NULL, 0, 1),
(398, 566, 'Midland Condor', 'Midland Condor', 'Condor Des Plaines', 'Wiesland-Kondor', 'ミッドランド・コンドル', NULL, 9, 18.2, 25.3, 30, 4, 0, NULL, 1, 0),
(771, 878, 'Gossamer', 'Gossamer', 'Floche-de-soie', 'Seidenflausch', 'ゴッサマー', NULL, 13, 26.0, 21.0, 29, 1, 1, 11, 1, 0),
(402, 215, 'Overgrown Offering', 'Overgrown Offering', 'Otyugh Monstrueux', 'Grabranke', 'オーバーグロウン・オファリング', NULL, 9, 19.0, 18.9, 22, NULL, 0, NULL, 0, 0),
(403, 1667, 'Phaia', 'Phaia', 'Phaïa', 'Phaia', 'パイア', NULL, 9, 32.2, 25.6, 46, 1, 1, 347, 1, 0),
(404, 175, 'Poisonous Flytrap', 'Poisonous Flytrap', 'Piège-mouche Vénéneux', 'Giftig[a] Fliegenfalle', 'ポイズン・フライトラップ', NULL, 9, 25.9, 21.7, 26, NULL, 0, NULL, 0, 1),
(405, 219, 'Qiqirn Beater', 'Qiqirn Beater', 'Qiqirn Rabatteur', 'Qiqirn-Schläger', 'キキルン・ビーター', NULL, 9, 15.4, 17.5, 29, NULL, 0, NULL, 0, 1),
(406, 84, 'Redbelly Chanter', 'Redbelly Chanter', 'Psalmodieur Ventrerouge', 'Rotbauch-Singstimme', 'レッドベリー・チャンター', NULL, 9, 23.8, 18.3, 29, NULL, 1, NULL, 0, 0),
(407, 540, 'Redbelly Conspirator', 'Redbelly Conspirator', 'Conspirateur Ventrerouge', 'Rotbauch-Verschwörer', 'レッドベリー・コンスピレーター', NULL, 9, 15.6, 22.9, 21, NULL, 1, NULL, 0, 0),
(408, 80, 'Redbelly Gutter', 'Redbelly Gutter', 'étripeur Ventrerouge', 'Rotbauch-Wache', 'レッドベリー・ガッター', NULL, 9, 23.7, 18.1, 29, NULL, 1, NULL, 0, 0),
(409, 172, 'Redbelly Larcener', 'Redbelly Larcener', 'Vide-gousset Ventrerouge', 'Rotbauch-Strauchdieb', 'レッドベリー・ラーセナー', NULL, 9, 25.1, 18.6, 27, NULL, 0, NULL, 0, 0),
(410, 52, 'Redbelly Lookout', 'Redbelly Lookout', 'Guetteur Ventrerouge', 'Rotbauch-Späher', 'レッドベリー・ルックアウト', NULL, 9, 24.1, 19.3, 27, NULL, 0, NULL, 0, 0),
(411, 83, 'Redbelly Sharpeye', 'Redbelly Sharpeye', 'épieur Ventrerouge', 'Rotbauch-Blinzler', 'レッドベリー・シャープアイ', NULL, 9, 22.0, 16.5, 27, NULL, 0, NULL, 0, 0),
(412, 236, 'Revenant', 'Revenant', 'Revenant', 'Wiedergänger', 'レブナント', NULL, 9, 14.8, 30.1, 32, 4, 0, NULL, 1, 1),
(413, 226, 'River Yarzon', 'River Yarzon', 'Yarzon Des Rivières', 'Fluss-Yarzon', 'リバー・ヤーゾン', NULL, 9, 24.5, 21.7, 25, NULL, 0, NULL, 0, 0),
(414, 1992, 'Scarred Antelope', 'Scarred Antelope', 'Antilope Balafrée', 'Narbig[a] Antilope', 'スカード・アンテロープ', NULL, 9, 17.7, 23.7, 23, NULL, 0, NULL, 0, 0),
(415, 514, 'Sirocco', 'Sirocco', 'Sirocco', 'Sirocco', 'シロッコ', NULL, 9, 20.1, 22.9, 23, 1, 1, 28, 1, 0),
(416, 234, 'Smallmouth Orobon', 'Smallmouth Orobon', 'Orobon Petite Gueule', 'Schmalmaul-Orobon', 'スモールマウス・オロボン', NULL, 9, 19.6, 21.0, 10, NULL, 0, NULL, 0, 1),
(417, 450, 'Spenser Of The Bottomless Cup', 'Spenser Of The Bottomless Cup', 'Spenser Le Boit-sans-soif', 'Trunkenbold[p] Spenser', '酔客のスペンサー', NULL, 9, 17.9, 20.1, 22, NULL, 1, NULL, 0, 0),
(418, 238, 'Stroper', 'Stroper', 'Storoper', 'Todesweide', 'ストローパー', NULL, 9, 21.4, 28.2, 31, 4, 0, NULL, 1, 1),
(419, 2646, 'Surveillance Module', 'Surveillance Module', 'Module De Surveillance', 'Überwachungsmodul', '巡察システム', NULL, 9, 21.5, 19.8, 50, NULL, 0, NULL, 0, 0),
(420, 2973, 'Territorial Zu Cockerel', 'Territorial Zu Cockerel', 'Coquelet Zu Territorial', 'Hinterhältig[a] Montisaurus-Hahn', 'テリトリアル・クックル', NULL, 9, 17.9, 26.6, 50, NULL, 0, NULL, 0, 0),
(421, 2974, 'Territorial Zu Pullet', 'Territorial Zu Pullet', 'Poulette Zu Territoriale', 'Hinterhältig[a] Montisaurus-Henne', 'テリトリアル・プレット', NULL, 9, 18.2, 26.6, 50, NULL, 0, NULL, 0, 0),
(422, 1400, 'Topaz Carbuncle', 'Topaz Carbuncle', 'Carbuncle Topaze', 'Topas-Karfunkel', 'カーバンクル・トパーズ', NULL, 9, 15.8, 17.4, 26, NULL, 0, NULL, 0, 1),
(423, 500, 'Trancetoad', 'Trancetoad', 'Crapaud En Transe', 'Dämmerkröte', 'トランストード', NULL, 9, 26.4, 19.7, 27, NULL, 0, NULL, 0, 0),
(424, 24, 'Treant', 'Treant', 'Tréant', 'Baumschrat', 'トレント', NULL, 9, 24.4, 22.7, 38, 4, 0, NULL, 1, 0),
(425, 476, 'Wanted Goblin', 'Wanted Goblin', 'Gobelin Recherché', 'Gesucht[a] Goblin', '賞金首：ワンテッド・ゴブリン', NULL, 9, 26.5, 19.4, 26, NULL, 0, NULL, 0, 0),
(426, 45, 'Will-o\'-the-wisp', 'Will-o\'-the-wisp', 'Feu Follet', 'Irrlicht', 'ウィル・オ・ザ・ウィスプ', NULL, 9, 23.4, 24.5, 38, 4, 0, NULL, 1, 0),
(427, 526, 'Wood Wailer Lance', 'Wood Wailer Lance', 'Vigile Sombre', 'Klageregiment-Pikenier', '鬼哭隊の隊士', NULL, 9, 22.5, 17.3, 30, NULL, 1, NULL, 0, 1),
(428, 1860, 'Airstone', 'Airstone', 'Pierre De Vent', 'Windstein', '風生みの珠', NULL, 10, 20.9, 18.5, 44, NULL, 1, NULL, 0, 0),
(429, 17, 'Balloon', 'Balloon', 'Ballon', 'Brandballon', 'バルーン', NULL, 10, 16.1, 26.3, 25, NULL, 0, NULL, 0, 0),
(430, 11, 'Banemite', 'Banemite', 'Sarcopte', 'Terrormilbe', 'ベーンマイト', NULL, 10, 16.5, 25.5, 27, NULL, 0, NULL, 0, 0),
(431, 2189, 'Bright Balloon', 'Bright Balloon', 'Ballon Incandescent', 'Gleißer', 'ブライトバルーン', NULL, 10, 17.7, 27.3, 29, NULL, 0, NULL, 0, 0),
(432, 30, 'Clay Golem', 'Clay Golem', 'Golem D\'argile', 'Lehmgolem', 'クレイゴーレム', NULL, 10, 19.8, 28.6, 28, NULL, 0, NULL, 0, 0),
(433, 452, 'Curupira', 'Curupira', 'Curupira', 'Curupira', 'クルピラ', NULL, 10, 26.2, 21.9, 8, 1, 1, 8, 1, 0),
(434, 1668, 'Daedalus', 'Daedalus', 'Dédale', 'Daedalus', 'ダイダロス', NULL, 10, 21.9, 19.8, 48, 1, 1, 349, 1, 0),
(435, 191, 'Dewdrinker Ladybug', 'Dewdrinker Ladybug', 'Coccinelle Des Bois', 'Tau-Marienkäfer', 'デュードリンカー・レディバグ', NULL, 10, 25.5, 28.5, 7, NULL, 0, NULL, 0, 0),
(436, 25, 'Dryad', 'Dryad', 'Dryade', 'Dryade', 'ドライアド', NULL, 10, 23.7, 25.3, 37, 3, 0, NULL, 1, 0),
(437, 516, 'Dschubba', 'Dschubba', 'Dschubba', 'Dschubba', 'ジュバ', NULL, 10, 25.0, 28.4, 3, 1, 1, 39, 1, 0),
(439, 1669, 'Great Oak', 'Great Oak', 'Grand Chêne', 'Borkig[a] Baumschrat', 'グレートオーク', NULL, 10, 23.7, 25.0, 37, 1, 1, 12, 1, 0),
(440, 37, 'Ground Squirrel', 'Ground Squirrel', 'écureuil', 'Baumhörnchen', 'スクウィレル', NULL, 10, 30.0, 25.4, 2, NULL, 0, NULL, 0, 1),
(441, 521, 'Guild-issue Supplies', 'Guild-issue Supplies', 'Caisse De Provisions', 'Versorgungsgut', '鬼哭隊の補給物資', NULL, 10, 22.9, 26.6, 24, NULL, 1, NULL, 0, 0),
(442, 103, 'Ixali Boldwing', 'Ixali Boldwing', 'Ixal Aile-hardie', 'Ixal-Mutschwinge', 'イクサル・ボールドウィング', NULL, 10, 18.9, 19.6, 24, 3, 0, NULL, 1, 0),
(443, 662, 'Ixali Boundwing', 'Ixali Boundwing', 'Ixal Aile-garrottée', 'Ixal-Bannschwinge', 'イクサル・バウンドウィング', NULL, 10, 22.2, 22.2, 37, 1, 0, NULL, 1, 1),
(444, 209, 'Ixali Deftalon', 'Ixali Deftalon', 'Ixal Serres-vives', 'Ixal-Tollkralle', 'イクサル・デフタロン', NULL, 10, 23.2, 28.5, 27, NULL, 0, NULL, 0, 0),
(445, 192, 'Ixali Dulltalon', 'Ixali Dulltalon', 'Ixal Serres-usées', 'Ixal-Stumpfkralle', 'イクサル・ダルタロン', NULL, 10, 25.8, 26.6, 5, NULL, 0, NULL, 0, 0),
(446, 663, 'Ixali Fearcaller', 'Ixali Fearcaller', 'Terroriseur Ixal', 'Ixal-Furchtrufer', 'イクサル・フィアコーラー', NULL, 10, 22.4, 22.3, 34, NULL, 0, NULL, 0, 1),
(447, 208, 'Ixali Lightwing', 'Ixali Lightwing', 'Ixal Aile-légère', 'Ixal-Leichtschwinge', 'イクサル・ライトビーク', NULL, 10, 22.6, 28.2, 27, NULL, 0, NULL, 0, 0),
(448, 193, 'Ixali Lostwing', 'Ixali Lostwing', 'Ixal Aile-perdue', 'Ixal-Stutzschwinge', 'イクサル・ロストウィング', NULL, 10, 26.5, 25.9, 5, NULL, 0, NULL, 0, 0),
(449, 194, 'Ixali Slowbeak', 'Ixali Slowbeak', 'Ixal Bec-lent', 'Ixal-Lahmschnabel', 'イクサル・スロウビーク', NULL, 10, 25.9, 26.6, 5, NULL, 0, NULL, 0, 0),
(450, 210, 'Ixali Straightbeak', 'Ixali Straightbeak', 'Ixal Bec-droit', 'Ixal-Spitzschnabel', 'イクサル・ストレートビーク', NULL, 10, 22.9, 28.1, 27, NULL, 0, NULL, 0, 0),
(451, 104, 'Ixali Swiftbeak', 'Ixali Swiftbeak', 'Ixal Bec-vif', 'Ixal-Flinkschnabel', 'イクサル・スウィフトビーク', NULL, 10, 18.7, 20.1, 44, NULL, 1, NULL, 0, 0),
(452, 102, 'Ixali Swordfighter', 'Ixali Swordfighter', 'épéiste Ixal', 'Ixal-Schwertkämpfer', 'イクサル・ソードファイター', NULL, 10, 23.3, 25.5, 24, NULL, 1, NULL, 0, 0),
(453, 436, 'Ixali Windtalon', 'Ixali Windtalon', 'Ixal Serres-vent', 'Ixal-Windkralle', 'イクサル・ウィンドタロン', NULL, 10, 20.6, 18.5, 47, NULL, 1, NULL, 1, 0),
(985, 860, 'Old Six-arms', 'Old Six-arms', 'Six-pattes Ancien', 'Alter Sechsarm', 'オールドシックスアームズ', NULL, 4, 30.0, 29.0, 13, 1, 1, 153, 1, 0),
(456, 539, 'Lunar Golem', 'Lunar Golem', 'Golem Lunaire', 'Mondgolem', 'ルナゴーレム', NULL, 10, 15.8, 31.1, 25, NULL, 1, NULL, 0, 0),
(457, 32, 'Microchu', 'Microchu', 'Microtyugh', 'Mikrochu', 'コチュー', NULL, 10, 28.8, 21.8, 6, NULL, 0, NULL, 0, 1),
(458, 118, 'Midge Swarm', 'Midge Swarm', 'Nuée De Moucherons', 'Mückenschwarm', 'ミッヂ・スウォーム', NULL, 10, 28.2, 25.1, 8, NULL, 0, NULL, 0, 0),
(459, 9, 'Miteling', 'Miteling', 'Petit Acarus', 'Schattenmilbe', 'マイトリング', NULL, 10, 26.2, 26.9, 4, NULL, 0, NULL, 0, 1),
(460, 5, 'Opo-opo', 'Opo-opo', 'Opo-opo', 'Opo-Opo', 'オポオポ', NULL, 10, 27.7, 23.6, 7, NULL, 0, NULL, 0, 0),
(777, 856, '426th Order Pickman Bu Ga', '426th Order Pickman Bu Ga', 'Bu Ga Piocheur Du 426e Ordre', 'Bu Ga Vom 426. Orden', 'ピックマン426 ブ・ガ', NULL, 2, 31.8, 13.2, 10, 1, 1, 1, 1, 0),
(462, 2188, 'Pumice Golem', 'Pumice Golem', 'Golem De Pierre Ponce', 'Bimsgolem', 'パミスゴーレム', NULL, 10, 15.4, 30.8, 28, NULL, 0, NULL, 0, 0),
(463, 533, 'Shifty-eyed Prospector', 'Shifty-eyed Prospector', 'Prospecteur Suspect', 'Rastlos[a] Geologe', 'うさんくさい山師', NULL, 10, 16.5, 29.3, 30, NULL, 1, NULL, 0, 0),
(464, 40, 'Shroud Hare', 'Shroud Hare', 'Arion De Sombrelinceul', 'Glitscher', 'シュラウドアリオン', NULL, 10, 20.9, 30.5, 24, NULL, 0, NULL, 0, 0),
(465, 552, 'Stone Golem', 'Stone Golem', 'Golem De Pierre', 'Steingolem', 'ストーンゴーレム', NULL, 10, 17.4, 28.2, 25, NULL, 1, NULL, 0, 0),
(466, 174, 'Watchwolf', 'Watchwolf', 'Loup De Garde', 'Wachwolf', 'ウォッチウルフ', NULL, 10, 20.8, 19.1, 46, 3, 0, NULL, 1, 0),
(467, 453, 'Wood Wailer Sentry', 'Wood Wailer Sentry', 'Sentinelle Des Vigiles Sombres', 'Wache[p] Des Klageregiments', '鬼哭隊の衛士', NULL, 10, 19.3, 25.9, 35, NULL, 0, NULL, 0, 1),
(468, 224, 'Ziz', 'Ziz', 'Ziz', 'Ziz', 'ジズ', NULL, 10, 16.9, 27.2, 28, NULL, 0, NULL, 0, 0),
(469, 1817, '4th Cohort Eques', '4th Cohort Eques', 'Eques De La 4e Cohorte', 'Eques[p] Der IV. Kohorte', 'IVコホルス・エクエス', NULL, 11, 13.1, 7.2, 48, NULL, 0, NULL, 0, 0),
(470, 1815, '4th Cohort Hoplomachus', '4th Cohort Hoplomachus', 'Hoplomachus De La 4e Cohorte', 'Hoplomachus[p] Der IV. Kohorte', 'IVコホルス・ホプロマクス', NULL, 11, 12.4, 6.4, 48, 3, 0, NULL, 1, 0),
(471, 1365, '4th Cohort Imaginifer', '4th Cohort Imaginifer', 'Imaginifer De La 4e Cohorte', 'Imaginifer[p] Der IV. Kohorte', 'IVコホルス・イマギニファー', NULL, 11, 13.6, 7.1, 20, NULL, 1, NULL, 0, 0),
(472, 1816, '4th Cohort Laquearius', '4th Cohort Laquearius', 'Laquearius De La 4e Cohorte', 'Laquearius[p] Der IV. Kohorte', 'IVコホルス・ラクエリウス', NULL, 11, 10.1, 6.6, 48, NULL, 0, NULL, 0, 0),
(473, 1818, '4th Cohort Secutor', '4th Cohort Secutor', 'Secutor De La 4e Cohorte', 'Secutor[p] Der IV. Kohorte', 'IVコホルス・セクトール', NULL, 11, 10.0, 5.6, 48, 3, 0, NULL, 1, 0),
(474, 1819, '4th Cohort Signifer', '4th Cohort Signifer', 'Signifer De La 4e Cohorte', 'Signifer[p] Der IV. Kohorte', 'IVコホルス・シグニフェル', NULL, 11, 11.6, 7.4, 48, NULL, 0, NULL, 0, 0),
(475, 1364, '4th Cohort Triarius', '4th Cohort Triarius', 'Triarius De La 4e Cohorte', 'Triarius[p] Der IV. Kohorte', 'IVコホルス・トリアリウス', NULL, 11, 14.1, 7.3, 20, NULL, 1, NULL, 0, 0),
(476, 1820, '4th Cohort Vanguard', '4th Cohort Vanguard', 'Avant-garde De La 4e Cohorte', 'Frontbrecher[p] Der IV. Kohorte', 'IVコホルス・ヴァンガード', NULL, 11, 13.3, 6.2, 49, 3, 0, NULL, 1, 0),
(477, 1366, '4th Cohort War Hound', '4th Cohort War Hound', 'Chien De Guerre De La 4e Cohorte', 'Kriegshund[p] Der IV. Kohorte', 'IVコホルス・ウォーハウンド', NULL, 11, 13.6, 7.0, 20, NULL, 1, NULL, 0, 0),
(478, 13, 'Arbor Buzzard', 'Arbor Buzzard', 'Busard', 'Baumkronen-Bussard', 'バザード', NULL, 11, 16.3, 15.7, 13, NULL, 0, NULL, 0, 1),
(479, 309, 'Bloated Bogy', 'Bloated Bogy', 'épouvantôme Boursouflé', 'Aufgebläht[a] Spukgespenst', 'ブローテッド・ボギー', NULL, 11, 13.0, 11.9, 20, NULL, 1, NULL, 0, 0),
(480, 1039, 'Blood-eyed Buzzard', 'Blood-eyed Buzzard', 'Busard Aux Yeux Rouges', 'Blutaugen-Bussard', 'ブラッドアイ・バザード', NULL, 11, 23.9, 19.0, 12, NULL, 0, NULL, 0, 0),
(481, 316, 'Bomb', 'Bomb', 'Bombo', 'Bomber', 'ボム', NULL, 11, 27.7, 16.4, 11, NULL, 0, NULL, 0, 0),
(482, 867, 'Bubbly Bernie', 'Bubbly Bernie', 'Bernie Le Bulleux', 'Blubbernd[a] Bernie', 'バブリーバーニー', NULL, 11, 15.9, 16.1, 13, 1, 1, 181, 1, 0),
(483, 287, 'Cactuar', 'Cactuar', 'Cactuar', 'Kaktor', 'カクター', NULL, 11, 27.7, 24.0, 3, NULL, 0, NULL, 0, 0),
(484, 277, 'Copper Coblyn', 'Copper Coblyn', 'Coblyn De Cuivre', 'Kupfer-Kobalos', 'カッパーコブラン', NULL, 11, 27.4, 16.8, 11, NULL, 0, NULL, 0, 0),
(485, 869, 'Daddy Longlegs', 'Daddy Longlegs', 'Faucheux', 'Opa Langbein', 'ダディーロングレッグ', NULL, 11, 14.5, 6.7, 22, NULL, 1, NULL, 0, 0),
(486, 305, 'Desert Peiste', 'Desert Peiste', 'Peiste Du Désert', 'Wüsten-Peiste', 'ペイスト', NULL, 11, 24.7, 20.7, 10, NULL, 0, NULL, 0, 0),
(487, 1033, 'Dirty Mongrel', 'Dirty Mongrel', 'Houret Sale', 'Schmutzig[a] Mischling', 'ダーティ・モングレル', NULL, 11, 23.4, 19.1, 12, NULL, 0, NULL, 0, 0),
(488, 865, 'Doomed Gigantoad', 'Doomed Gigantoad', 'Crapaud Maudit', 'Verderbnis-Karpfenkröte', 'ドゥーム・ギガントード', NULL, 11, 24.3, 21.4, 9, 1, 1, 176, 1, 0),
(489, 896, 'Dune Bogy', 'Dune Bogy', 'épouvantôme Des Dunes', 'Dünen-Spukgespenst', 'デューンボギー', NULL, 11, 13.3, 12.0, 17, NULL, 1, NULL, 0, 0),
(490, 302, 'Dusty Mongrel', 'Dusty Mongrel', 'Houret Poussiéreux', 'Verwahrlost[a] Mischling', 'モングレル', NULL, 11, 25.4, 19.9, 10, NULL, 0, NULL, 0, 1),
(491, 1034, 'Fire Bomb', 'Fire Bomb', 'Bombo Incendiaire', 'Feuerbomber', 'ファイアボム', NULL, 11, 24.9, 18.2, 11, NULL, 0, NULL, 0, 0),
(492, 1324, 'Flustered Fisher', 'Flustered Fisher', 'Pêcheur Dans L\'embarras', 'Nervös[a] Fischer', '困り果てた漁師', NULL, 11, 15.9, 16.6, 1, NULL, 1, NULL, 0, 0),
(493, 283, 'Goblin Mugger', 'Goblin Mugger', 'Détrousseur Gobelin', 'Goblin-Räuber', 'ゴブリン・マガー', NULL, 11, 18.8, 25.9, 8, NULL, 0, NULL, 0, 0),
(494, 1036, 'Guillotine Beak', 'Guillotine Beak', 'Bec-couperet', 'Guillotinenschnabel', 'ギロチンビーク', NULL, 11, 16.8, 14.5, 12, NULL, 0, NULL, 0, 0),
(495, 282, 'Hammer Beak', 'Hammer Beak', 'Bec-marteau', 'Hammerschnabel', 'ハンマービーク', NULL, 11, 24.8, 22.9, 8, NULL, 0, NULL, 0, 1),
(496, 217, 'Laughing Toad', 'Laughing Toad', 'Crapaud Rieur', 'Lachkröte', 'ラフィングトード', NULL, 11, 14.7, 6.2, 23, NULL, 0, NULL, 0, 0),
(497, 278, 'Lead Coblyn', 'Lead Coblyn', 'Coblyn De Plomb', 'Blei-Kobalos', 'レッドコブラン', NULL, 11, 14.0, 10.8, 21, NULL, 0, NULL, 0, 0),
(498, 1032, 'Loamshell', 'Loamshell', 'Coqueterre', 'Lehmschale', 'ロームシェル', NULL, 11, 24.6, 17.7, 10, NULL, 0, NULL, 0, 0),
(499, 312, 'Moondrip Blastmaster', 'Moondrip Blastmaster', 'Pilonneur De Gouttelune', 'Mondtropfen-Sprengmeister', 'ムーン・ブラストマスター', NULL, 11, 17.8, 6.6, 24, NULL, 0, NULL, 0, 0),
(500, 314, 'Moondrip Piledriver', 'Moondrip Piledriver', 'Artificier De Gouttelune', 'Mondtropfen-Ramme', 'ムーン・パイルドライバー', NULL, 11, 18.3, 6.6, 24, NULL, 0, NULL, 0, 0),
(501, 310, 'Moondrip Stonehauler', 'Moondrip Stonehauler', 'Hercheur De Gouttelune', 'Mondtropfen-Steineschlepper', 'ムーン・ストーンハウラー', NULL, 11, 18.3, 6.8, 24, NULL, 0, NULL, 0, 0),
(502, 308, 'Orobon', 'Orobon', 'Orobon', 'Orobon', 'オロボン', NULL, 11, 19.4, 16.6, 5, NULL, 0, NULL, 0, 1),
(503, 503, 'Plump Orobon', 'Plump Orobon', 'Orobon Pansu', 'Fett[a] Orobon', 'プランプ・オロボン', NULL, 11, 16.7, 16.2, 9, NULL, 0, NULL, 0, 0),
(504, 1041, 'Pyrite Coblyn', 'Pyrite Coblyn', 'Coblyn De Pyrite', 'Pyrit-Kobalos', 'パイライトコブラン', NULL, 11, 25.4, 26.1, 7, NULL, 0, NULL, 0, 0),
(505, 276, 'Rusty Coblyn', 'Rusty Coblyn', 'Coblyn Rouillé', 'Rostig[a] Kobalos', 'ラスティコブラン', NULL, 11, 18.8, 29.5, 8, NULL, 0, NULL, 0, 0),
(506, 265, 'Sandtoad', 'Sandtoad', 'Crapaud Des Sables', 'Sandkröte', 'サンドトード', NULL, 11, 21.2, 23.6, 9, NULL, 0, NULL, 0, 0),
(507, 1011, 'Scale Eater', 'Scale Eater', 'Basilic Lépidophage', 'Schuppenfresser', '賞金首：スケールイーター', NULL, 11, 24.3, 18.6, 14, NULL, 0, NULL, 0, 0),
(508, 635, 'Scaphite', 'Scaphite', 'Scaphite', 'Scaphit', 'スカフィテ', NULL, 11, 17.3, 14.9, 14, NULL, 0, NULL, 0, 0),
(510, 902, 'Shipment Of Brass Cogs', 'Shipment Of Brass Cogs', 'Matériel Pour Le Marteau', 'Ladung[p] Bronzezahnräder', '杭打塔の資材', NULL, 11, 19.8, 27.0, 8, NULL, 1, NULL, 0, 0),
(511, 1037, 'Softskin Peiste', 'Softskin Peiste', 'Peiste à Peau Tendre', 'Samthaut-Peiste', 'ソフトスキン・ペイスト', NULL, 11, 18.7, 17.0, 12, NULL, 0, NULL, 0, 0),
(512, 1035, 'Soulless Chrisom', 'Soulless Chrisom', 'Chrémeau Sans âme', 'Seelenlos[a] Taufkleid', 'ソウルレス・クリソム', NULL, 11, 24.1, 18.9, 15, NULL, 0, NULL, 0, 0),
(513, 262, 'Star Marmot', 'Star Marmot', 'Marmotte', 'Stern-Murmelhörnchen', 'マーモット', NULL, 11, 20.3, 27.2, 2, NULL, 0, NULL, 0, 1),
(514, 298, 'Sun Midge Swarm', 'Sun Midge Swarm', 'Nuée De Moucherons Soleil', 'Sonnenmückenschwarm', 'サンミッヂ・スウォーム', NULL, 11, 16.6, 15.8, 12, NULL, 0, NULL, 0, 0),
(515, 636, 'Thickshell', 'Thickshell', 'Coquépaisse', 'Panzerschale', 'シックシェル', NULL, 11, 15.6, 17.0, 13, NULL, 0, NULL, 0, 0),
(516, 1038, 'Tomahawk Beak', 'Tomahawk Beak', 'Bec-tomahawk', 'Tomahawkschnabel', 'トマホークビーク', NULL, 11, 24.8, 25.5, 8, NULL, 0, NULL, 0, 0),
(517, 1322, 'Worried Worker', 'Worried Worker', 'Ouvrier Dans L\'embarras', 'Besorgt[a] Arbeiter', '困り果てた作業員', NULL, 11, 22.6, 27.8, 6, NULL, 1, NULL, 0, 0),
(518, 284, 'Yarzon Feeder', 'Yarzon Feeder', 'Yarzon Nourricier', 'Gefräßig[a] Yarzon', 'ヤーゾン・フィーダー', NULL, 11, 24.1, 27.4, 4, NULL, 0, NULL, 0, 0),
(519, 227, 'Yarzon Scavenger', 'Yarzon Scavenger', 'Yarzon Charognard', 'Aas-Yarzon', 'ヤーゾン・スカベンジャー', NULL, 11, 14.7, 7.2, 26, NULL, 0, NULL, 0, 1),
(520, 2425, 'Alpha Ziz', 'Alpha Ziz', 'Ziz Alpha', 'Alpha-Ziz', 'アルファ・ジズ', NULL, 12, 22.2, 33.9, 48, NULL, 0, NULL, 0, 0),
(521, 246, 'Amalj\'aa Impaler', 'Amalj\'aa Impaler', 'Empaleur Amalj\'aa', 'Amalj\'aa-Aufspießer', 'アマルジャ・インペイラー', NULL, 12, 22.4, 16.4, 6, NULL, 0, NULL, 0, 0),
(522, 254, 'Amalj\'aa Striker', 'Amalj\'aa Striker', 'Cogneur Amalj\'aa', 'Amalj\'aa-Schläger', 'アマルジャ・ストライカー', NULL, 12, 22.1, 16.9, 6, NULL, 0, NULL, 0, 0),
(523, 293, 'Antling Sentry', 'Antling Sentry', 'Fourmi Sentinelle', 'Treiberameisen-Wache', 'アントリング・セントリー', NULL, 12, 16.6, 14.2, 12, NULL, 0, NULL, 0, 0),
(524, 292, 'Antling Soldier', 'Antling Soldier', 'Fourmi Soldat', 'Treiberameisen-Soldat', 'アントリング・ソルジャー', NULL, 12, 22.4, 19.9, 10, NULL, 0, NULL, 0, 0),
(525, 294, 'Antling Worker', 'Antling Worker', 'Fourmi Ouvrière', 'Treiberameisen-Arbeiter', 'アントリング・ワーカー', NULL, 12, 23.3, 17.1, 5, NULL, 0, NULL, 0, 0),
(526, 872, 'Babaroon Halfshell', 'Babaroon Halfshell', 'Babaroon Mimollet', 'Babaroon Halbschale', '半熟のババルン', NULL, 12, 15.9, 19.2, 9, 1, 1, 191, 1, 0),
(527, 328, 'Baron Von Quiveron III Esquire', 'Baron Von Quiveron III Esquire', 'Baron Quiveron Troisième Du Nom', 'Baron[p] Von Quiveron III.', 'サー・キヴロン男爵III世', NULL, 12, 24.1, 21.2, 12, NULL, 0, NULL, 0, 0),
(528, 288, 'Cochineal Cactuar', 'Cochineal Cactuar', 'Cactuar Nopal', 'Koschenillen-Kaktor', 'コチニールカクター', NULL, 12, 24.4, 19.9, 11, NULL, 0, NULL, 0, 0),
(529, 289, 'Eft', 'Eft', 'Jeune Triton', 'Molch', 'エフト', NULL, 12, 23.2, 18.8, 10, NULL, 0, NULL, 0, 0),
(530, 244, 'Giant Tortoise', 'Giant Tortoise', 'Tortue Géante', 'Riesenschildkröte', 'ジャイアントトータス', NULL, 12, 19.5, 19.0, 12, NULL, 0, NULL, 0, 1),
(531, 870, 'Grishild The Ungood', 'Grishild The Ungood', 'Grishild La Terreur', 'Grausam[a] Grishild', '無頼のグリスヒルド', NULL, 12, 21.0, 25.8, 5, NULL, 1, NULL, 0, 0),
(532, 632, 'Huge Hornet', 'Huge Hornet', 'Frelon Géant', 'Riesenhornisse', 'ヒュージ・ホーネット', NULL, 12, 21.9, 26.7, 1, NULL, 0, NULL, 0, 0),
(533, 1348, 'Hungry Hobbledehoy', 'Hungry Hobbledehoy', 'Fille Affamée', 'Hungrig[a] Mädchen', '腹を減らした少女', NULL, 12, 23.1, 16.6, 10, NULL, 1, NULL, 0, 0),
(534, 1352, 'Kindly Father', 'Kindly Father', 'Pêcheur à La Fibre Paternelle', 'Rücksichtsvoll[a] Vater', '息子想いの漁師', NULL, 12, 20.5, 24.2, 1, NULL, 1, NULL, 0, 0),
(535, 875, 'Nest Commander', 'Nest Commander', 'Commandante Du Nid', 'Nestkommandant', 'ネストコマンダー', NULL, 12, 17.7, 14.5, 12, 1, 1, 197, 1, 0),
(776, 868, 'Crier Briareos', 'Crier Briareos', 'Briarée L\'inconsolable', 'Griesgram Briareos', '悲嘆のブリアレオス', NULL, 11, 13.7, 10.5, 21, 1, 1, 7, 1, 0),
(537, 266, 'Qiqirn Shellsweeper', 'Qiqirn Shellsweeper', 'Qiqirn Casse-coquille', 'Qiqirn-Panzerbrecher', 'キキルン・シェルスウィーパー', NULL, 12, 16.6, 19.5, 9, NULL, 0, NULL, 0, 0),
(538, 330, 'Quiveron Attendant', 'Quiveron Attendant', 'Domestique Des Quiveron', 'Quiveron-Handlanger', 'キヴロン家の使用人', NULL, 12, 24.5, 21.2, 11, NULL, 0, NULL, 0, 0),
(539, 326, 'Quiveron Guard', 'Quiveron Guard', 'Garde Des Quiveron', 'Quiveron-Wache', 'キヴロン家の侍衛', NULL, 12, 24.5, 21.2, 11, NULL, 0, NULL, 0, 0),
(775, 51, 'Alpha Anole', 'Alpha Anole', 'Anolis Alpha', 'Alpha-Anolis', 'アルファ・アノール', NULL, 7, 31.0, 21.0, 9, 1, 1, 4, 1, 0),
(541, 318, 'Snapping Shrew', 'Snapping Shrew', 'Musaraigne Agressive', 'Schnappspitzmull', 'スナッピング・シュルー', NULL, 12, 22.2, 25.8, 3, NULL, 0, NULL, 0, 0),
(542, 874, 'Spitfire', 'Spitfire', 'Crachefeu', 'Spitfire', 'スピットファイア', NULL, 12, 18.2, 23.5, 7, 1, 1, 29, 1, 0),
(543, 317, 'Spriggan Graverobber', 'Spriggan Graverobber', 'Spriggan Pilleur De Tombe', 'Grabräuber-Spriggan', 'スプリガン・グレイブラバー', NULL, 12, 17.9, 23.6, 7, NULL, 0, NULL, 0, 0),
(544, 1276, 'Stone Torch', 'Stone Torch', 'Torche D\'acier', 'Eisenschein-Soldat', '鉄灯団の衛兵', NULL, 12, 21.7, 17.9, 35, NULL, 0, NULL, 0, 0),
(545, 279, 'Sun Bat', 'Sun Bat', 'Chauve-souris Du Soleil', 'Sonnenfledermaus', 'サンバット', NULL, 12, 23.2, 19.5, 13, NULL, 0, NULL, 0, 0),
(546, 2426, 'Territorial Axe Beak', 'Territorial Axe Beak', 'Bec-pic Territorial', 'Hinterhältig[a] Pelisaurus', 'テリトリアル・アクスビーク', NULL, 12, 22.5, 33.7, 48, NULL, 0, NULL, 0, 0),
(547, 216, 'Toxic Toad', 'Toxic Toad', 'Crapaud Toxique', 'Giftkröte', 'トキシックトード', NULL, 12, 27.0, 19.2, 14, NULL, 0, NULL, 0, 0),
(548, 1250, 'Aldebrand', 'Aldebrand', 'Aldebrand', 'Aldebrand', 'アルデブランド', NULL, 13, 22.2, 21.6, 1, NULL, 1, NULL, 0, 0),
(549, 256, 'Amalj\'aa Bruiser', 'Amalj\'aa Bruiser', 'Tabasseur Amalj\'aa', 'Amalj\'aa-Kraftprotz', 'アマルジャ・ブルーザー', NULL, 13, 24.8, 20.5, 23, NULL, 0, NULL, 0, 1),
(550, 250, 'Amalj\'aa Hunter', 'Amalj\'aa Hunter', 'Chasseur Amalj\'aa', 'Amalj\'aa-Jäger', 'アマルジャ・ハンター', NULL, 13, 20.1, 27.5, 18, NULL, 1, NULL, 0, 0),
(551, 247, 'Amalj\'aa Javelinier', 'Amalj\'aa Javelinier', 'Javelinier Amalj\'aa', 'Amalj\'aa-Speerwerfer', 'アマルジャ・ジャベリナー', NULL, 13, 20.0, 27.3, 18, NULL, 1, NULL, 0, 0),
(552, 251, 'Amalj\'aa Ranger', 'Amalj\'aa Ranger', 'Ranger Amalj\'aa', 'Amalj\'aa-Waldläufer', 'アマルジャ・レンジャー', NULL, 13, 24.8, 21.6, 27, NULL, 1, NULL, 0, 0),
(553, 900, 'Amalj\'aa Supply Crate', 'Amalj\'aa Supply Crate', 'Caisse De Ravitaillement Amalj\'aa', 'Amalj\'aa-Vorratskiste', 'アマルジャ軍の軍需物資', NULL, 13, 20.4, 27.0, 18, NULL, 1, NULL, 0, 0),
(554, 281, 'Axe Beak', 'Axe Beak', 'Bec-pic', 'Pelisaurus', 'アクスビーク', NULL, 13, 24.2, 19.1, 26, NULL, 0, NULL, 0, 0),
(555, 1311, 'Bandit Archer', 'Bandit Archer', 'Bandit Archer', 'Räuberisch[a] Schütze', 'バンディット・アーチャー', NULL, 13, 26.7, 18.5, 28, NULL, 0, NULL, 0, 0),
(556, 1310, 'Bandit Mage', 'Bandit Mage', 'Bandit Mage', 'Räuberisch[a] Zauberer', 'バンディット・メイジ', NULL, 13, 26.6, 18.7, 28, NULL, 0, NULL, 0, 0),
(557, 1309, 'Bandit Trapper', 'Bandit Trapper', 'Bandit Trappeur', 'Räuberisch[a] Fallensteller', 'バンディット・トラッパー', NULL, 13, 26.8, 19.0, 28, NULL, 0, NULL, 0, 0),
(558, 1246, 'Bertram', 'Bertram', 'Bertram', 'Bertram', 'バートラム', NULL, 13, 22.4, 21.4, 1, NULL, 1, NULL, 0, 0),
(559, 1199, 'Blowfly Swarm', 'Blowfly Swarm', 'Nuée De Mouches Bleues', 'Aasfliegenschwarm', 'ブロウフライ・スウォーム', NULL, 13, 13.2, 22.4, 16, NULL, 0, NULL, 0, 0),
(560, 1255, 'Brass Blade', 'Brass Blade', 'Lame De Cuivre', 'Messingklinge', '銅刃団の衛兵', NULL, 13, 24.2, 22.8, 25, NULL, 1, NULL, 0, 0),
(561, 296, 'Bumble Beetle', 'Bumble Beetle', 'Scarabourdon', 'Brummkäfer', 'バンブルビートル', NULL, 13, 27.8, 17.0, 25, NULL, 0, NULL, 0, 1),
(562, 1245, 'Chachamun', 'Chachamun', 'Chachamun', 'Chachamun', '武具屋 チャチャムン', NULL, 13, 22.3, 21.4, 5, NULL, 1, NULL, 0, 0),
(563, 301, 'Chasm Buzzard', 'Chasm Buzzard', 'Busard Des Gouffres', 'Schlucht-Bussard', 'キャズム・バザード', NULL, 13, 21.8, 19.9, 25, NULL, 0, NULL, 0, 0),
(564, 1350, 'Dry Slug', 'Dry Slug', 'Limace Déshydratée', 'Trockenschnecke', 'ドライスラッグ', NULL, 13, 13.8, 20.8, 14, NULL, 1, NULL, 0, 0),
(565, 1047, 'Drybone Tuco-tuco', 'Drybone Tuco-tuco', 'Tuco-tuco Des Os Desséchés', 'Knochenbleich-Tukotuko', 'ドライボーン・ツコツコ', NULL, 13, 16.1, 24.1, 24, NULL, 0, NULL, 0, 0),
(566, 1371, 'Flame Private', 'Flame Private', 'Soldat 3e Classe Des Sables', 'Legionär[p] 3. Klasse', '不滅隊二等闘兵', NULL, 13, 25.1, 20.0, 22, NULL, 1, NULL, 0, 1),
(567, 1275, 'Flame Recruit', 'Flame Recruit', 'Soldat Des Immortels', 'Legionsrekrut', '不滅隊の兵卒', NULL, 13, 12.9, 25.0, 44, NULL, 0, NULL, 0, 1),
(774, 1666, 'Pulxio Of The Short Gale', 'Pulxio Of The Short Gale', 'Pulxio', 'Pulxio', '風狂のプルシオ', NULL, 8, 20.0, 10.0, 49, 1, 1, 25, 1, 0),
(569, 271, 'Golden Fleece', 'Golden Fleece', 'Toison D\'or', 'Goldvlies', 'ゴールデンフリース', NULL, 13, 26.0, 25.2, 40, 3, 0, NULL, 1, 0),
(570, 1249, 'Jajanzo', 'Jajanzo', 'Jajanzo', 'Jajanzo', 'ジャジャンゾ', NULL, 13, 24.1, 23.6, 1, NULL, 1, NULL, 0, 0),
(571, 1251, 'Ligart', 'Ligart', 'Ligart', 'Ligart', 'リガート', NULL, 13, 23.9, 24.4, 1, NULL, 1, NULL, 0, 0),
(572, 634, 'Mirrorknight', 'Mirrorknight', 'Chevalier Miroir', 'Speglidae', 'ミラーナイト', NULL, 13, 26.9, 26.5, 42, 3, 0, NULL, 1, 0),
(573, 273, 'Myotragus Billy', 'Myotragus Billy', 'Bouquetin Myotragus', 'Myotragus-Bock', 'ミオトラグス・ビリー', NULL, 13, 16.5, 28.6, 16, NULL, 0, NULL, 0, 0),
(574, 274, 'Myotragus Nanny', 'Myotragus Nanny', 'étagne Myotragus', 'Myotragus-Geiß', 'ミオトラグス・ナニー', NULL, 13, 18.4, 22.5, 18, NULL, 0, NULL, 0, 0),
(575, 1242, 'Nayokk Roh', 'Nayokk Roh', 'Nayokk Roh Le Trafiquant', 'Nayokk Roh', '人買のナヨク・ロー', NULL, 13, 23.5, 24.6, 26, NULL, 1, NULL, 0, 0),
(576, 272, 'Phurble', 'Phurble', 'Poiluche', 'Flausch', 'ファーブル', NULL, 13, 23.4, 21.6, 25, NULL, 0, NULL, 0, 0),
(577, 268, 'Qiqirn Roerunner', 'Qiqirn Roerunner', 'Qiqirn Gobe-oisillon', 'Qiqirn-Läufer', 'キキルン・ロウランナー', NULL, 13, 23.8, 23.3, 26, NULL, 0, NULL, 0, 0),
(578, 1244, 'Qiqirn Trafficker', 'Qiqirn Trafficker', 'Qiqirn Fricoteur', 'Qiqirn-Streuner', 'キキルン・トラフィッカー', NULL, 13, 23.8, 24.3, 26, NULL, 1, NULL, 0, 0),
(579, 1125, 'Ravenous Billygoat', 'Ravenous Billygoat', 'Bouquetin Insatiable', 'Gefräßig[a] Steinbock', 'ラヴェナス・ビリー', NULL, 13, 15.2, 23.5, 24, NULL, 0, NULL, 0, 0),
(580, 319, 'Rotting Corpse', 'Rotting Corpse', 'Cadavre Putrescent', 'Verrottend[a] Leiche', 'ロッティング・コープス', NULL, 13, 14.6, 16.4, 17, NULL, 0, NULL, 0, 0),
(581, 322, 'Rotting Noble', 'Rotting Noble', 'Noble Putrescent', 'Verrottend[a] Edelmann', 'ロッティング・ノーブル', NULL, 13, 14.6, 16.3, 17, NULL, 0, NULL, 0, 0),
(582, 1248, 'Rururaji', 'Rururaji', 'Rururaji', 'Rururaji', 'ルルラジ', NULL, 13, 22.1, 21.5, 1, NULL, 1, NULL, 0, 0),
(583, 1223, 'Steelquill Tuco-tuco', 'Steelquill Tuco-tuco', 'Tuco-tuco à Piquants Durs', 'Stahlfeder-Tukotuko', 'スチールクイル・ツコツコ', NULL, 13, 12.4, 26.5, 12, NULL, 1, NULL, 0, 0),
(584, 486, 'Stinging Syrphid Cloud', 'Stinging Syrphid Cloud', 'Nuage De Syrphes Piquants', 'Stechend[a] Mistfliegenwolke', 'スティンギング・サーフィド', NULL, 13, 15.7, 22.0, 24, NULL, 0, NULL, 0, 0),
(585, 1247, 'Tiny Aurochs', 'Tiny Aurochs', 'Tiny Aurochs', 'Winzig[a] Ochse', 'タイニー・オーロクス', NULL, 13, 21.8, 21.7, 1, NULL, 1, NULL, 0, 0),
(586, 306, 'Tuco-tuco', 'Tuco-tuco', 'Tuco-tuco', 'Tukotuko', 'ツコツコ', NULL, 13, 13.1, 18.7, 17, NULL, 0, NULL, 0, 0),
(587, 1198, 'Vandalous Imp', 'Vandalous Imp', 'Imp Vandale', 'Randale-Imp', 'ヴァンドロス・インプ', NULL, 13, 14.4, 18.7, 16, NULL, 0, NULL, 0, 0),
(588, 1711, 'Abducted Ala Mhigan', 'Abducted Ala Mhigan', 'Engagé De Force Mhigois', 'Entführt[a] Mhigit', '拐われたアラミゴ人', NULL, 14, 18.5, 19.6, 1, NULL, 1, NULL, 0, 0),
(589, 1984, 'Ala Mhigan Youth', 'Ala Mhigan Youth', 'Jeune Mhigois', 'Mhigisch[a] Jüngling', 'アラミゴ人の若者', NULL, 14, 17.7, 10.4, 27, NULL, 0, NULL, 0, 0),
(591, 249, 'Amalj\'aa Archer', 'Amalj\'aa Archer', 'Archer Amalj\'aa', 'Amalj\'aa-Bogenschütze', 'アマルジャ・アーチャー', NULL, 14, 20.9, 23.9, 47, 4, 0, NULL, 1, 1),
(592, 1388, 'Amalj\'aa Brigand', 'Amalj\'aa Brigand', 'Brigand Amalj\'aa', 'Amalj\'aa-Brigant', 'アマルジャ・ブリガンド', NULL, 14, 20.7, 21.7, 45, NULL, 0, NULL, 0, 0),
(593, 260, 'Amalj\'aa Divinator', 'Amalj\'aa Divinator', 'Divinateur Amalj\'aa', 'Amalj\'aa-Weissager', 'アマルジャ・ディヴィネーター', NULL, 14, 25.1, 34.5, 32, 3, 0, NULL, 1, 0),
(594, 2155, 'Amalj\'aa Halberdier', 'Amalj\'aa Halberdier', 'Hallebardier Amalj\'aa', 'Amalj\'aa-Hellebardier', 'アマルジャ・ハルバルディア', NULL, 14, 25.9, 35.1, 32, 3, 0, NULL, 1, 0),
(595, 245, 'Amalj\'aa Lancer', 'Amalj\'aa Lancer', 'Lancier Amalj\'aa', 'Amalj\'aa-Pikenier', 'アマルジャ・ランサー', NULL, 14, 18.6, 20.9, 15, 4, 0, NULL, 1, 1),
(596, 253, 'Amalj\'aa Pugilist', 'Amalj\'aa Pugilist', 'Pugiliste Amalj\'aa', 'Amalj\'aa-Faustkämpfer', 'アマルジャ・ピュージャリスト', NULL, 14, 19.2, 26.0, 47, 4, 0, NULL, 1, 1),
(597, 1389, 'Amalj\'aa Scavenger', 'Amalj\'aa Scavenger', 'Charognard Amalj\'aa', 'Amalj\'aa-Plünderer', 'アマルジャ・スカベンジャー', NULL, 14, 20.3, 21.7, 45, NULL, 0, NULL, 0, 0),
(598, 259, 'Amalj\'aa Seer', 'Amalj\'aa Seer', 'Voyant Amalj\'aa', 'Amalj\'aa-Seher', 'アマルジャ・シーア', NULL, 14, 21.4, 15.0, 26, NULL, 0, NULL, 0, 0),
(599, 252, 'Amalj\'aa Sniper', 'Amalj\'aa Sniper', 'Tireur Amalj\'aa', 'Amalj\'aa-Scharfschütze', 'アマルジャ・スナイパー', NULL, 14, 26.0, 34.8, 32, 4, 0, NULL, 1, 0),
(600, 258, 'Amalj\'aa Thaumaturge', 'Amalj\'aa Thaumaturge', 'Occultiste Amalj\'aa', 'Amalj\'aa-Thaumaturg', 'アマルジャ・サーマタージ', NULL, 14, 16.8, 25.5, 45, NULL, 0, NULL, 0, 0),
(601, 307, 'Angler', 'Angler', 'Lotte', 'Anglerfisch', 'アングラー', NULL, 14, 15.9, 20.4, 28, NULL, 0, NULL, 0, 0),
(602, 1505, 'Aspidochelone', 'Aspidochelone', 'Aspidochélon', 'Aspidochelone', 'アスピドケロン', NULL, 14, 20.3, 20.8, 46, 1, 1, 213, 1, 0),
(603, 1344, 'Augmented Battle Drake', 'Augmented Battle Drake', 'Draconide De Combat Amélioré', 'Gestärkt[a] Kampf-Drakon', '強化型バトルドレイク', NULL, 14, 16.7, 11.8, 25, NULL, 1, NULL, 0, 0),
(604, 1277, 'Brass Blade', 'Brass Blade', 'Lame De Cuivre', 'Messingklinge', '銅刃団の衛兵', NULL, 14, 16.5, 15.0, 35, NULL, 0, NULL, 0, 1),
(605, 2511, 'Bronze Tortoise', 'Bronze Tortoise', 'Tortue De Bronze', 'Bronzeschildkröte', 'ブロンズトータス', NULL, 14, 19.3, 21.0, 43, NULL, 0, NULL, 0, 0),
(606, 332, 'Corpse Brigade Firedancer', 'Corpse Brigade Firedancer', 'Sorcier De La Brigade Des Cadavres', 'Leichenbrigaden-Feuerteufel', '骸旅団の魔術兵', NULL, 14, 22.3, 9.6, 28, NULL, 0, NULL, 0, 0),
(607, 331, 'Corpse Brigade Knuckledancer', 'Corpse Brigade Knuckledancer', 'Lutteur De La Brigade Des Cadavres', 'Leichenbrigaden-Knöcheltänzer', '骸旅団の格闘兵', NULL, 14, 22.2, 9.6, 28, NULL, 0, NULL, 0, 0),
(608, 2332, 'Dapper Zombie', 'Dapper Zombie', 'Zombi Bien Mis', 'Galant[a] Zombie', 'ゾンビー・ジェントルマン', NULL, 14, 15.9, 26.0, 43, NULL, 1, NULL, 0, 0),
(609, 2191, 'Dune Angler', 'Dune Angler', 'Lotte Des Dunes', 'Dünen-Anglerfisch', 'デューン・アングラー', NULL, 14, 19.9, 31.1, 31, NULL, 0, NULL, 0, 0),
(610, 323, 'Fallen Mage', 'Fallen Mage', 'Mage Déchu', 'Gefallen[a] Magier', 'フォールン・メイジ', NULL, 14, 19.3, 16.6, 26, NULL, 0, NULL, 0, 0),
(611, 321, 'Fallen Pikeman', 'Fallen Pikeman', 'Lancier Déchu', 'Gefallen[a] Pikenier', 'フォールン・パイクマン', NULL, 14, 21.5, 38.8, 34, NULL, 0, NULL, 0, 0),
(612, 320, 'Fallen Soldier', 'Fallen Soldier', 'Soldat Déchu', 'Gefallen[a] Soldat', 'フォールン・ソルジャー', NULL, 14, 19.1, 16.7, 26, NULL, 0, NULL, 0, 0),
(613, 324, 'Fallen Wizard', 'Fallen Wizard', 'Magicien Déchu', 'Gefallen[a] Zauberer', 'フォールン・ウィザード', NULL, 14, 19.5, 38.7, 34, 4, 0, NULL, 1, 0),
(614, 1343, 'Flame Scout', 'Flame Scout', 'éclaireur Des Immortels', 'Legionskundschafter', '不滅隊の偵察兵', NULL, 14, 17.7, 17.9, 18, NULL, 1, NULL, 0, 1),
(615, 2354, 'Flamecrest Afajj Koh', 'Flamecrest Afajj Koh', 'Afajj Koh', 'Flammenkranz Afajj Koh', '火印のアファジ・コー', NULL, 14, 26.2, 21.4, 48, 1, 1, 304, 1, 0),
(616, 2368, 'Flamefang Commander', 'Flamefang Commander', 'Commandant Croc De Feu', 'Flammenfang-Kommandant', 'フレイム・コマンダー', NULL, 14, 32.3, 20.8, 49, NULL, 1, NULL, 0, 0),
(617, 2369, 'Flamefang Elite', 'Flamefang Elite', 'Combattant D\'élite Croc De Feu', 'Flammenfang-Elitekrieger', 'フレイム・エリート', NULL, 14, 32.3, 20.8, 49, NULL, 1, NULL, 0, 0),
(618, 1390, 'Flaming Beacon', 'Flaming Beacon', 'Brasière Enflammée', 'Flammenkessel', '燃える聖火台', NULL, 14, 16.0, 23.6, 43, NULL, 0, NULL, 0, 0),
(619, 882, 'Gisfrid The Grinder', 'Gisfrid The Grinder', 'Gisfrid Le Transgresseur', 'Gisfrid der Gnadenloser', '破戒のギスフリッド', NULL, 14, 23.6, 10.7, 28, 1, 1, 231, 1, 0),
(620, 2053, 'Hired Bow', 'Hired Bow', 'Archer Stipendié', 'Söldner-Bogenschützin', '雇われの弓術士', NULL, 14, 19.4, 14.4, 40, NULL, 0, NULL, 0, 0),
(621, 2052, 'Hired Fist', 'Hired Fist', 'Pugiliste Stipendié', 'Söldner-Faustkämpferin', '雇われの格闘士', NULL, 14, 19.6, 14.1, 40, NULL, 0, NULL, 0, 0),
(622, 1878, 'Ifrit\'s Beacon', 'Ifrit\'s Beacon', 'Pilier Du Feu Sacré', 'Ifrits Kessel', '焔神イフリートの聖火台', NULL, 14, 32.6, 20.2, 49, NULL, 0, NULL, 0, 0),
(623, 1877, 'Infernal Beacon', 'Infernal Beacon', 'Torchère Infernale', 'Infernokessel', '燃え盛る聖火台', NULL, 14, 23.7, 25.4, 46, NULL, 0, NULL, 0, 0),
(624, 243, 'Iron Tortoise', 'Iron Tortoise', 'Tortue De Fer', 'Eisenschildkröte', 'アイアントータス', NULL, 14, 16.1, 24.9, 46, 3, 0, NULL, 1, 0),
(625, 564, 'Potter Wasp Swarm', 'Potter Wasp Swarm', 'Nuée De Guêpes Maçonnes', 'Lehmfliegenschwarm', 'ポッターワスプ・スウォーム', NULL, 14, 15.0, 13.6, 25, NULL, 0, NULL, 0, 0),
(626, 1278, 'Ranger Of The Drake', 'Ranger Of The Drake', 'Chasseuse De La Tribu Des U', 'Drakon-Jägerin', 'ウ族の狩人', NULL, 14, 16.5, 29.8, 29, NULL, 0, NULL, 0, 0),
(627, 889, 'Ranger Of The Drake', 'Ranger Of The Drake', 'Chasseuse De La Tribu Des U', 'Drakon-Jägerin', 'ウ族の狩人', NULL, 14, 14.5, 32.0, 25, NULL, 1, NULL, 0, 0),
(628, 1993, 'Rockskin Peiste', 'Rockskin Peiste', 'Peiste à Peau Dure', 'Steinhaut-Peiste', 'ロックスキン・ペイスト', NULL, 14, 16.5, 12.8, 28, NULL, 0, NULL, 0, 0),
(629, 285, 'Russet Yarzon', 'Russet Yarzon', 'Yarzon Brun', 'Rotbraun[a] Yarzon', 'ラセット・ヤーゾン', NULL, 14, 12.7, 32.2, 31, 4, 0, NULL, 1, 0),
(630, 286, 'Sabotender', 'Sabotender', 'Pampa', 'Sabotender', 'サボテンダー', NULL, 14, 20.3, 7.9, 25, NULL, 0, NULL, 0, 0),
(631, 303, 'Sandskin Peiste', 'Sandskin Peiste', 'Peiste Sablon', 'Sandhaut-Peiste', 'サンドスキン・ペイスト', NULL, 14, 21.0, 9.6, 26, NULL, 0, NULL, 0, 0),
(632, 280, 'Sandstone Golem', 'Sandstone Golem', 'Golem De Grès', 'Sandstein-Golem', 'サンドストーン・ゴーレム', NULL, 14, 23.1, 12.1, 29, NULL, 0, NULL, 0, 0),
(633, 290, 'Sandworm', 'Sandworm', 'Ver Des Sables', 'Sandwurm', 'サンドウォーム', NULL, 14, 14.5, 31.8, 29, 4, 0, NULL, 1, 0),
(634, 132, 'Smoke Bomb', 'Smoke Bomb', 'Bombo Fumigène', 'Rauchbomber', 'スモークボム', NULL, 14, 19.0, 35.5, 32, 4, 0, NULL, 1, 0),
(635, 264, 'Sundrake', 'Sundrake', 'Draconide Du Soleil', 'Drakon', 'ドレイク', NULL, 14, 24.3, 36.7, 32, 3, 0, NULL, 1, 0),
(636, 1999, 'Tempered Brand', 'Tempered Brand', 'Mage Belahdien', 'Besessen[a] Magier', 'ベラフディアン・メイジ', NULL, 14, 19.6, 17.1, 26, NULL, 0, NULL, 0, 0),
(637, 338, 'Tempered Champion', 'Tempered Champion', 'Lutteur Subjugué', 'Abgeklärt[a] Faustkämpfer', 'テンパード・チャンピオン', NULL, 14, 18.1, 19.4, 42, NULL, 1, NULL, 0, 0),
(638, 337, 'Tempered Gladiator', 'Tempered Gladiator', 'Gladiateur Subjugué', 'Abgeklärt[a] Gladiator', 'テンパード・グラディエーター', NULL, 14, 21.2, 19.9, 46, NULL, 1, NULL, 0, 0),
(639, 2361, 'Tempered Huntress', 'Tempered Huntress', 'Chasseuse Subjuguée', 'Besessen[a] Jägerin', 'テンパード・ハンター', NULL, 14, 21.1, 21.9, 43, NULL, 0, NULL, 0, 0),
(640, 339, 'Tempered Orator', 'Tempered Orator', 'Psalmodieur Subjugué', 'Abgeklärt[a] Redner', 'テンパード・オラター', NULL, 14, 18.1, 19.3, 46, 3, 1, NULL, 1, 0),
(641, 1998, 'Tempered Sword', 'Tempered Sword', 'Soldat Belahdien', 'Besessen[a] Soldat', 'ベラフディアン・ソルジャー', NULL, 14, 19.5, 16.9, 26, NULL, 0, NULL, 0, 0),
(642, 918, 'U\'kahmuli', 'U\'kahmuli', 'U\'kahmuli', 'U\'kahmuli', 'ウ・カムリ', NULL, 14, 14.7, 30.3, 25, NULL, 1, NULL, 0, 0),
(643, 920, 'U\'konelua', 'U\'konelua', 'U\'konelua', 'U\'konelua', 'ウ・コネルア', NULL, 14, 14.6, 29.9, 25, NULL, 1, NULL, 0, 0),
(644, 922, 'U\'lolamo', 'U\'lolamo', 'U\'lolamo', 'U\'lolamo', 'ウ・ローラモ', NULL, 14, 15.3, 29.5, 25, NULL, 1, NULL, 0, 0),
(645, 921, 'U\'ndomii', 'U\'ndomii', 'U\'ndomii', 'U\'ndomii', 'ウ・ンドミィ', NULL, 14, 14.9, 29.8, 25, NULL, 1, NULL, 0, 0),
(646, 919, 'U\'ralka', 'U\'ralka', 'U\'ralka', 'U\'ralka', 'ウ・ラルカ', NULL, 14, 14.8, 30.1, 25, NULL, 1, NULL, 0, 0),
(647, 912, 'Wildfire Sprite', 'Wildfire Sprite', 'élémentaire Exergonique', 'Lauffeuer-Exergon', 'ワイルドファイアスプライト', NULL, 14, 24.3, 26.4, 48, NULL, 0, NULL, 0, 0),
(648, 1838, 'Zahar\'ak Archer', 'Zahar\'ak Archer', 'Archer De Zahar\'ak', 'Zahar\'ak-Bogenschütze', 'ザハラク・アーチャー', NULL, 14, 23.1, 22.0, 49, 3, 0, NULL, 1, 0),
(649, 1841, 'Zahar\'ak Battle Drake', 'Zahar\'ak Battle Drake', 'Draconide De Zahar\'ak', 'Zahar\'ak-Kampf-Drakon', 'ザハラク・バトルドレイク', NULL, 14, 30.3, 19.9, 48, 3, 0, NULL, 1, 0),
(650, 2303, 'Zahar\'ak Fortune-teller', 'Zahar\'ak Fortune-teller', 'Augure De Zahar\'ak', 'Zahar\'ak-Wahrsager', 'ザハラク・フォーチュンテラー', NULL, 14, 30.6, 18.8, 49, NULL, 0, NULL, 0, 0),
(651, 1837, 'Zahar\'ak Lancer', 'Zahar\'ak Lancer', 'Lancier De Zahar\'ak', 'Zahar\'ak-Pikenier', 'ザハラク・ランサー', NULL, 14, 24.8, 20.8, 49, NULL, 0, NULL, 0, 0),
(652, 1839, 'Zahar\'ak Pugilist', 'Zahar\'ak Pugilist', 'Pugiliste De Zahar\'ak', 'Zahar\'ak-Faustkämpfer', 'ザハラク・ピュージャリスト', NULL, 14, 32.2, 20.0, 49, 3, 0, NULL, 1, 0),
(653, 1840, 'Zahar\'ak Thaumaturge', 'Zahar\'ak Thaumaturge', 'Occultiste De Zahar\'ak', 'Zahar\'ak-Thaumaturg', 'ザハラク・サーマタージ', NULL, 14, 29.8, 18.9, 49, 3, 0, NULL, 1, 0),
(655, 2296, 'Zanr\'ak Archer', 'Zanr\'ak Archer', 'Archer De Zanr\'ak', 'Zanr\'ak-Bogenschütze', 'ザンラク・アーチャー', NULL, 14, 24.7, 26.5, 49, NULL, 1, NULL, 0, 0),
(656, 2297, 'Zanr\'ak Lancer', 'Zanr\'ak Lancer', 'Lancier De Zanr\'ak', 'Zanr\'ak-Pikenier', 'ザンラク・ランサー', NULL, 14, 24.0, 24.4, 48, NULL, 0, NULL, 0, 0),
(657, 1880, 'Zanr\'ak Pugilist', 'Zanr\'ak Pugilist', 'Pugiliste De Zanr\'ak', 'Zanr\'ak-Faustkämpfer', 'ザンラク・ピュージャリスト', NULL, 14, 24.4, 26.3, 49, NULL, 0, NULL, 0, 0),
(658, 1879, 'Zanr\'ak Thaumaturge', 'Zanr\'ak Thaumaturge', 'Occultiste De Zanr\'ak', 'Zanr\'ak-Thaumaturg', 'ザンラク・サーマタージ', NULL, 14, 25.0, 26.3, 48, NULL, 0, NULL, 0, 0),
(659, 53, '3rd Cohort Hoplomachus', '3rd Cohort Hoplomachus', 'Hoplomachus De La 3e Cohorte', 'Hoplomachus[p] Der III. Kohorte', 'IIIコホルス・ホプロマクス', NULL, 15, 16.8, 18.6, 49, 3, 0, NULL, 1, 1),
(660, 2120, '7th Cohort Eques', '7th Cohort Eques', 'Eques De La 7e Cohorte', 'Eques[p] Der VII. Kohorte', 'VIIコホルス・エクエス', NULL, 15, 12.2, 13.1, 50, NULL, 0, NULL, 0, 0),
(661, 242, 'Ahriman', 'Ahriman', 'Ahriman', 'Ahriman', 'アーリマン', NULL, 15, 22.2, 23.1, 46, 3, 0, NULL, 1, 0),
(662, 1508, 'Arimaspi', 'Arimaspi', 'Arimaspe', 'Arimaspi', 'アリマスピ', NULL, 15, 25.3, 20.4, 49, 1, 1, 223, 1, 0),
(663, 304, 'Basilisk', 'Basilisk', 'Basilic', 'Basilisk', 'バジリスク', NULL, 15, 23.1, 23.3, 49, 3, 0, NULL, 1, 0),
(773, 1515, 'Sekhmet', 'Sekhmet', 'Sekhmet', 'Sekhmet', 'セクメト', NULL, 3, 18.0, 28.0, 34, 1, 1, 27, 1, 0),
(665, 270, 'Grenade', 'Grenade', 'Grenado', 'Granate', 'グレネード', NULL, 15, 21.4, 14.4, 49, 3, 0, NULL, 1, 1),
(666, 269, 'Magitek Vanguard', 'Magitek Vanguard', 'Avant-garde Magitek', 'Magitek-Frontbrecher', '魔導ヴァンガード', NULL, 15, 16.6, 15.6, 49, NULL, 0, NULL, 0, 0),
(667, 275, 'Quartz Doblyn', 'Quartz Doblyn', 'Doblyn De Quartz', 'Quarz-Dobalos', 'クォーツドブラン', NULL, 15, 30.4, 26.1, 49, 3, 0, NULL, 1, 1),
(668, 1718, 'Wary Merchant', 'Wary Merchant', 'Marchand Circonspect', 'Erschöpft[a] Händler', '慎重な商人', NULL, 15, 22.7, 23.1, 46, NULL, 1, NULL, 0, 0),
(669, 59, '3rd Cohort Eques', '3rd Cohort Eques', 'Eques De La 3e Cohorte', 'Eques[p] Der III. Kohorte', 'IIIコホルス・エクエス', NULL, 16, 20.1, 20.9, 21, NULL, 0, NULL, 0, 1),
(670, 58, '3rd Cohort Laquearius', '3rd Cohort Laquearius', 'Laquearius De La 3e Cohorte', 'Laquearius[p] Der III. Kohorte', 'IIIコホルス・ラクエリウス', NULL, 16, 17.1, 16.0, 22, NULL, 0, NULL, 1, 1),
(671, 60, '3rd Cohort Secutor', '3rd Cohort Secutor', 'Secutor De La 3e Cohorte', 'Secutor[p] Der III. Kohorte', 'IIIコホルス・セクトール', NULL, 16, 19.5, 26.6, 49, NULL, 0, NULL, 0, 1),
(672, 61, '3rd Cohort Signifer', '3rd Cohort Signifer', 'Signifer De La 3e Cohorte', 'Signifer[p] Der III. Kohorte', 'IIIコホルス・シグニフェル', NULL, 16, 18.5, 15.7, 49, 4, 0, NULL, 1, 1),
(673, 1850, 'Baritine Croc', 'Baritine Croc', 'Croco Baryton', 'Baritogator', 'バリトンダイル', NULL, 16, 4.1, 22.0, 40, 3, 0, NULL, 1, 0),
(674, 1183, 'Bateleur', 'Bateleur', 'Bateleur Des Dunes', 'Gaukler', 'バテラー', NULL, 16, 17.5, 17.7, 39, NULL, 0, NULL, 0, 0),
(676, 788, 'Biast', 'Biast', 'Biast', 'Smei', 'ビアスト', NULL, 16, 17.7, 29.5, 45, 3, 0, NULL, 1, 0),
(677, 1761, 'Blizzard Biast', 'Blizzard Biast', 'Biast Des Blizzards', 'Schneesturm-Smei', 'ブリザード・ビアスト', NULL, 16, 12.8, 18.1, 44, NULL, 0, NULL, 0, 0),
(678, 2156, 'Chinchilla', 'Chinchilla', 'Chinchilla', 'Chinchilla', 'チンチラ', NULL, 16, 16.4, 20.2, 39, NULL, 0, NULL, 0, 0),
(679, 1712, 'Coerthan Porter', 'Coerthan Porter', 'Livreur Du Coerthas', 'Coerthisch[a] Träger', 'クルザスの荷運び人', NULL, 16, 25.9, 21.2, 1, NULL, 1, NULL, 0, 0),
(680, 1762, 'Downcast Hippocerf', 'Downcast Hippocerf', 'Hippocerf Rejeté', 'Niedergeschlagen[a] Hippocerf', 'ダウンキャスト・ヒッポセルフ', NULL, 16, 13.9, 18.5, 44, NULL, 0, NULL, 0, 0),
(681, 1849, 'Downy Aevis', 'Downy Aevis', 'Eibis Duveteux', 'Flaum-Avis', 'ダウニーエイビス', NULL, 16, 24.1, 8.1, 38, 4, 0, NULL, 1, 0),
(682, 637, 'Dragonfly', 'Dragonfly', 'Draguêpe', 'Drachycera', 'ドラゴンフライ', NULL, 16, 9.8, 12.8, 37, 3, 0, NULL, 1, 0),
(683, 784, 'Feral Croc', 'Feral Croc', 'Crocodile Sauvage', 'Domigator', 'ワイルドダイル', NULL, 16, 25.6, 24.5, 33, 3, 0, NULL, 1, 0),
(684, 1429, 'Gargamelle', 'Gargamelle', 'Gargamelle', 'Gargamelle', 'ガルガメル', NULL, 16, 34.2, 13.8, 39, 1, 1, 244, 1, 0),
(685, 785, 'Giant Logger', 'Giant Logger', 'Géant Bûcheron', 'Riesen-Henker', 'ジャイアント・ロガー', NULL, 16, 13.6, 25.3, 46, 3, 0, NULL, 1, 0),
(686, 786, 'Giant Lugger', 'Giant Lugger', 'Géant Jouteur', 'Riesen-Fäller', 'ジャイアント・ラガー', NULL, 16, 12.2, 26.7, 46, 3, 0, NULL, 1, 0),
(687, 787, 'Giant Reader', 'Giant Reader', 'Géant Devin', 'Riesen-Häuptling', 'ジャイアント・リーダー', NULL, 16, 15.8, 26.7, 46, 3, 0, NULL, 1, 0),
(688, 1612, 'Highland Goobbue', 'Highland Goobbue', 'Goobbue Des Hautes Terres', 'Hochland-Goobbue', 'ハイランド・グゥーブー', NULL, 16, 26.8, 19.6, 35, 4, 0, NULL, 1, 0),
(689, 790, 'Hippocerf', 'Hippocerf', 'Hippocerf', 'Hippocerf', 'ヒッポセルフ', NULL, 16, 8.5, 20.5, 40, 3, 0, NULL, 1, 0),
(690, 1581, 'House Durendaire Guard', 'House Durendaire Guard', 'Sentinelle Des Durendaire', 'Durendaire-Gardist', 'デュランデル家の衛兵', NULL, 16, 27.0, 28.2, 43, NULL, 0, NULL, 0, 0),
(691, 1862, 'House Fortemps Engineer', 'House Fortemps Engineer', 'Ingénieur Des Fortemps', 'Fortemps-Techniker', 'フォルタン家の工兵', NULL, 16, 26.4, 15.9, 34, NULL, 1, NULL, 0, 0),
(692, 1582, 'House Fortemps Guard', 'House Fortemps Guard', 'Sentinelle Des Fortemps', 'Fortemps-Gardist', 'フォルタン家の衛兵', NULL, 16, 26.6, 16.1, 31, NULL, 0, NULL, 0, 0),
(693, 1847, 'House Fortemps Herald', 'House Fortemps Herald', 'Héraut Des Fortemps', 'Fortemps-Herold', 'フォルタン家の伝令', NULL, 16, 25.9, 19.1, 36, NULL, 1, NULL, 0, 0),
(694, 1990, 'House Fortemps Knight', 'House Fortemps Knight', 'Chevalier Des Fortemps', 'Fortemps-Ritter', 'フォルタン家の騎兵', NULL, 16, 24.6, 16.1, 37, NULL, 0, NULL, 0, 0),
(695, 1716, 'Ishgardian Astrologian', 'Ishgardian Astrologian', 'Astrologue Ishgardais', 'Ishgarder Astrologe', 'イシュガルドの占星術士', NULL, 16, 26.0, 18.9, 33, NULL, 1, NULL, 0, 0),
(696, 1583, 'Ishgardian Sentry', 'Ishgardian Sentry', 'Sentinelle Ishgardaise', 'Ishgard-Gardist', '神殿騎士団の衛兵', NULL, 16, 18.8, 15.8, 41, NULL, 0, NULL, 0, 0),
(697, 661, 'Ixali Stillbeak', 'Ixali Stillbeak', 'Ixal Bec-serein', 'Ixal-Stillschnabel', 'イクサル・スチルビーク', NULL, 16, 32.3, 27.3, 37, NULL, 0, NULL, 0, 0),
(698, 660, 'Ixali Wildtalon', 'Ixali Wildtalon', 'Ixal Serres-folles', 'Ixal-Wildkralle', 'イクサル・ワイルドタロン', NULL, 16, 32.1, 27.5, 30, 3, 0, NULL, 1, 0),
(699, 2355, 'Kozol Nomotl The Turbulent', 'Kozol Nomotl The Turbulent', 'Kozol Nomotl', 'Sturmböe Kozol Nomotl', '風標のコゾル・ノモトル', NULL, 16, 34.1, 19.4, 49, 1, 1, 268, 1, 0),
(700, 1430, 'Lutin', 'Lutin', 'Follet De Glace', 'Lutin', 'リュタン', NULL, 16, 15.8, 20.7, 39, 1, 1, 18, 1, 0),
(701, 645, 'Mudpuppy', 'Mudpuppy', 'Protée', 'Olm', 'マッドパピー', NULL, 16, 18.2, 30.9, 44, 4, 0, NULL, 1, 1),
(702, 1843, 'Natalan Boldwing', 'Natalan Boldwing', 'Aile-hardie De Natalan', 'Natalan-Mutschwinge', 'ナタラン・ボールドウィング', NULL, 16, 33.5, 24.1, 49, 3, 0, NULL, 1, 0),
(703, 1845, 'Natalan Fogcaller', 'Natalan Fogcaller', 'Embrumeur De Natalan', 'Natalan-Nebelrufer', 'ナタラン・フォグコーラー', NULL, 16, 32.7, 18.2, 49, 3, 0, NULL, 1, 0),
(704, 1844, 'Natalan Swiftbeak', 'Natalan Swiftbeak', 'Bec-vif De Natalan', 'Natalan-Flinkschnabel', 'ナタラン・スウィフトビーク', NULL, 16, 34.6, 20.7, 49, 3, 0, NULL, 1, 0),
(705, 1846, 'Natalan Watchwolf', 'Natalan Watchwolf', 'Loup De Natalan', 'Natalan-Wachwolf', 'ナタラン・ウォッチウルフ', NULL, 16, 34.2, 20.2, 48, 4, 0, NULL, 1, 0),
(706, 1842, 'Natalan Windtalon', 'Natalan Windtalon', 'Serres-vent De Natalan', 'Natalan-Windkralle', 'ナタラン・ウィンドタロン', NULL, 16, 31.7, 17.4, 49, 4, 0, NULL, 1, 0),
(708, 795, 'Ornery Karakul', 'Ornery Karakul', 'Karakul Rageur', 'Karakul', 'カラクール', NULL, 16, 24.8, 19.6, 36, 3, 0, NULL, 1, 0),
(709, 794, 'Redhorn Ogre', 'Redhorn Ogre', 'Ogre Corne-rouge', 'Rothorn-Oger', 'レッドホーン・オーガ', NULL, 16, 29.7, 11.5, 35, 4, 0, NULL, 1, 0);
INSERT INTO `mobs_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `lvl`, `slain`, `is_fate`, `id_fate`, `is_visible`, `is_multiple`) VALUES
(710, 1434, 'Roc', 'Roc', 'Roc', 'Roc', 'ロック', NULL, 16, 21.4, 17.8, 39, 1, 1, 255, 1, 0),
(711, 1432, 'Rongeur', 'Rongeur', 'Rongeur D\'os', 'Rongeur', 'ロンジュール', NULL, 16, 12.5, 23.6, 45, 1, 1, 248, 1, 0),
(712, 1436, 'Sateli Hueloc Of The South Wind', 'Sateli Hueloc Of The South Wind', 'Sateli Hueloc Du Vent Du Sud', 'Sateli Heuloc Des Südwinds', '南風のサテリ・フェロック', NULL, 16, 35.3, 20.9, 49, NULL, 1, NULL, 0, 0),
(713, 1447, 'Second Eye', 'Second Eye', 'Deuxième œil', 'Zweit[a] Auge', 'ステロペスの弟子', NULL, 16, 15.5, 20.5, 39, NULL, 1, NULL, 0, 0),
(714, 1438, 'Sethuli Hueloc Of The West Wind', 'Sethuli Hueloc Of The West Wind', 'Sethuli Hueloc Du Vent De L\'Est', 'Sethuli Heuloc Des Südwinds', '西風のセトゥリ・フェロック', NULL, 16, 34.7, 21.9, 49, NULL, 1, NULL, 0, 0),
(715, 110, 'Skeleton Soldier', 'Skeleton Soldier', 'Soldat Squelette', 'Skelettkrieger', 'スケルトン・ソルジャー', NULL, 16, 7.0, 7.5, 16, NULL, 0, NULL, 0, 0),
(716, 653, 'Snow Wolf', 'Snow Wolf', 'Loup Des Neiges', 'Schneewolf', 'スノウウルフ', NULL, 16, 15.9, 31.6, 46, 3, 0, NULL, 1, 0),
(717, 659, 'Snow Wolf Pup', 'Snow Wolf Pup', 'Louveteau Des Neiges', 'Schneewolf', 'スノウウルフ・パッブ', NULL, 16, 28.3, 15.1, 37, 4, 0, NULL, 1, 0),
(718, 1611, 'Snowstorm Goobbue', 'Snowstorm Goobbue', 'Goobbue Des Neiges', 'Schneesturm-Goobbue', 'スノウストーム・グゥーブー', NULL, 16, 22.6, 17.1, 39, 3, 0, NULL, 1, 0),
(719, 1437, 'Sotoli Hueloc Of The East Wind', 'Sotoli Hueloc Of The East Wind', 'Sotoli Hueloc Du Vent De L\'Ouest', 'Sotoli Heuloc Des Ostwinds', '東風のソトリ・フェロック', NULL, 16, 35.4, 21.7, 49, NULL, 1, NULL, 0, 0),
(720, 1445, 'Steropes', 'Steropes', 'Steropes', 'Steropes', 'ステロペス', NULL, 16, 15.8, 20.3, 39, NULL, 1, NULL, 0, 0),
(721, 1435, 'Sutali Hueloc Of The North Wind', 'Sutali Hueloc Of The North Wind', 'Sutali Hueloc Du Vent Du Nord', 'Sutali Heuloc Des Nordwinds', '北風のスタリ・フェロック', NULL, 16, 34.5, 20.6, 49, NULL, 1, NULL, 0, 0),
(722, 1440, 'Svara', 'Svara', 'Svara', 'Svara', 'スヴァラ', NULL, 16, 26.9, 8.1, 38, NULL, 1, NULL, 0, 0),
(723, 1182, 'Taurus', 'Taurus', 'Taurus', 'Taurus', 'タウルス', NULL, 16, 32.8, 15.5, 39, 4, 0, NULL, 1, 0),
(724, 657, 'Thrustaevis', 'Thrustaevis', 'Eibis Azuré', 'Sturm-Avis', 'スラストエイビス', NULL, 16, 25.8, 8.5, 35, NULL, 1, NULL, 0, 0),
(725, 658, 'Vodoriga', 'Vodoriga', 'Vodoriga', 'Vodoriga', 'ヴォドリガ', NULL, 16, 27.4, 14.1, 38, 3, 0, NULL, 1, 0),
(726, 417, 'Wharf Rat', 'Wharf Rat', 'Rat', 'Dockratte', 'ラット', NULL, 16, 22.1, 24.6, 2, NULL, 0, NULL, 0, 1),
(727, 2918, 'Will-o\'-the-wyke', 'Will-o\'-the-wyke', 'Feu Fugace', 'Wirrlicht', 'ウィル・オ・ザ・ワイクス', NULL, 16, 35.2, 15.0, 38, NULL, 0, NULL, 0, 0),
(728, 1811, '5th Cohort Eques', '5th Cohort Eques', 'Eques De La 5e Cohorte', 'Eques[p] Der V. Kohorte', 'Vコホルス・エクエス', NULL, 17, 12.7, 16.0, 46, 3, 0, NULL, 1, 0),
(729, 1809, '5th Cohort Hoplomachus', '5th Cohort Hoplomachus', 'Hoplomachus De La 5e Cohorte', 'Hoplomachus[p] Der V. Kohorte', 'Vコホルス・ホプロマクス', NULL, 17, 12.2, 16.5, 46, 3, 0, NULL, 1, 0),
(730, 1810, '5th Cohort Laquearius', '5th Cohort Laquearius', 'Laquearius De La 5e Cohorte', 'Laquearius[p] Der V. Kohorte', 'Vコホルス・ラクエリウス', NULL, 17, 11.9, 11.9, 46, NULL, 0, NULL, 0, 0),
(731, 1812, '5th Cohort Secutor', '5th Cohort Secutor', 'Secutor De La 5e Cohorte', 'Secutor[p] Der V. Kohorte', 'Vコホルス・セクトール', NULL, 17, 10.2, 14.9, 46, NULL, 0, NULL, 0, 0),
(732, 1813, '5th Cohort Signifer', '5th Cohort Signifer', 'Signifer De La 5e Cohorte', 'Signifer[p] Der V. Kohorte', 'Vコホルス・シグニフェル', NULL, 17, 9.4, 14.0, 46, 3, 0, NULL, 1, 0),
(733, 1814, '5th Cohort Vanguard', '5th Cohort Vanguard', 'Avant-garde De La 5e Cohorte', 'Frontbrecher[p] Der V. Kohorte', 'Vコホルス・ヴァンガード', NULL, 17, 10.6, 15.2, 47, NULL, 0, NULL, 0, 0),
(734, 3179, '6th Cohort Vanguard', '6th Cohort Vanguard', 'Avant-garde De La 6e Cohorte', 'Frontbrecher[p] Der VI. Kohorte', 'VIコホルス・ヴァンガード', NULL, 17, 10.8, 15.8, 50, NULL, 0, NULL, 0, 0),
(735, 1766, 'Beggar Bonze', 'Beggar Bonze', 'Bonze Mendiant', 'Begas-Bonze', 'ベガー・ボンズ', NULL, 17, 24.2, 10.5, 50, NULL, 0, NULL, 0, 0),
(736, 1767, 'Beggar Shramana', 'Beggar Shramana', 'Shramana Mendiant', 'Begas-Shramana', 'ベガー・シャモン', NULL, 17, 23.8, 11.9, 50, NULL, 0, NULL, 0, 0),
(737, 1771, 'Beggar Sozu', 'Beggar Sozu', 'Sôzu Mendiant', 'Begas-Sozu', 'ベガー・ソーズ', NULL, 17, 23.2, 11.4, 49, NULL, 0, NULL, 0, 0),
(738, 1859, 'Box Of Documents', 'Box Of Documents', 'Liste De Découvertes', 'Kiste[p] Mit Fundstücken', '財団の調査資材', NULL, 17, 29.9, 13.3, 46, NULL, 1, NULL, 0, 0),
(739, 1607, 'Budding Morbol', 'Budding Morbol', 'Morbol Bourgeonnant', 'Keimend[a] Morbol', 'ブディング・モルボル', NULL, 17, 14.0, 12.7, 41, NULL, 1, NULL, 0, 0),
(740, 650, 'Daring Harrier', 'Daring Harrier', 'Harceleur Casse-cou', 'Waghalsig[a] Plünderer', 'デアリング・ハリアー', NULL, 17, 17.3, 15.7, 45, 3, 0, NULL, 1, 0),
(741, 1769, 'Denizen Of The Dark', 'Denizen Of The Dark', 'Dahaka Ténébreux', 'Dunkel-Lamantinaut', 'ダーク・ダハーカ', NULL, 17, 14.0, 0.2, 49, NULL, 0, NULL, 0, 0),
(742, 1770, 'Foul River Hapalit', 'Foul River Hapalit', 'Hapalit De Rufétide', 'Faulbach-Hapalit', 'ファウルリバー・ハパリット', NULL, 17, 24.1, 11.0, 49, NULL, 0, NULL, 0, 0),
(743, 649, 'Gigas Bhikkhu', 'Gigas Bhikkhu', 'Gigas Bhikkhu', 'Gigas-Bhikku', 'ギガース・ビク', NULL, 17, 33.2, 16.2, 49, 3, 0, NULL, 1, 0),
(744, 646, 'Gigas Bonze', 'Gigas Bonze', 'Gigas Bonze', 'Gigas-Bonze', 'ギガース・ボンズ', NULL, 17, 28.6, 12.3, 46, NULL, 0, NULL, 0, 0),
(745, 647, 'Gigas Shramana', 'Gigas Shramana', 'Gigas Shramana', 'Gigas-Shramana', 'ギガース・シャモン', NULL, 17, 30.0, 14.1, 46, NULL, 0, NULL, 0, 0),
(746, 648, 'Gigas Sozu', 'Gigas Sozu', 'Gigas Sôzu', 'Gigas-Sozu', 'ギガース・ソーズ', NULL, 17, 27.8, 10.2, 46, NULL, 0, NULL, 0, 0),
(747, 1776, 'Gorn The Garrgh', 'Gorn The Garrgh', 'Gorn Le Garrgh', 'Gorn Garrgh', '賞金首：ゴーン・ザ・ガー', NULL, 17, 25.4, 11.3, 49, NULL, 0, NULL, 0, 0),
(748, 793, 'Hapalit', 'Hapalit', 'Hapalit', 'Hapalit', 'ハパリット', NULL, 17, 31.3, 5.2, 48, 3, 0, NULL, 1, 0),
(749, 652, 'Hexing Harrier', 'Hexing Harrier', 'Harceleur Ensorceleur', 'Hexend[a] Plünderin', 'ヘキシング・ハリアー', NULL, 17, 16.3, 15.4, 45, NULL, 0, NULL, 0, 0),
(750, 789, 'Hippogryph', 'Hippogryph', 'Hippogriffe', 'Hippogryph', 'ヒッポグリフ', NULL, 17, 33.1, 11.2, 46, NULL, 0, NULL, 0, 0),
(751, 2234, 'Imperial Hoplomachus', 'Imperial Hoplomachus', 'Hoplomachus Impérial', 'Hoplomachus', 'インペリアル・ホプロマクス', NULL, 17, 13.1, 0.1, 46, NULL, 0, NULL, 0, 0),
(752, 2235, 'Imperial Secutor', 'Imperial Secutor', 'Secutor Impérial', 'Secutor', 'インペリアル・セクトール', NULL, 17, 13.1, 0.1, 46, NULL, 0, NULL, 0, 0),
(753, 2236, 'Imperial Signifer', 'Imperial Signifer', 'Signifer Impérial', 'Signifer', 'インペリアル・シグニフェル', NULL, 17, 13.0, 0.2, 46, NULL, 0, NULL, 0, 0),
(754, 1851, 'Lake Cobra', 'Lake Cobra', 'Cobra Des Lacs', 'Seekobra', 'レイクコブラ', NULL, 17, 26.7, 13.3, 45, 3, 0, NULL, 1, 0),
(772, 1526, 'Peryton', 'Peryton', 'Peryton', 'Peryton', 'ペリュトン', NULL, 6, 15.0, 18.0, 30, 1, 1, 24, 1, 0),
(756, 2237, 'Magitek Packer', 'Magitek Packer', 'Bardeur Magitek', 'Magitek-Stapler', '魔導パッカー', NULL, 17, 13.2, 0.1, 49, NULL, 0, NULL, 0, 0),
(757, 27, 'Nix', 'Nix', 'Nix', 'Nöck', 'ニクス', NULL, 17, 17.4, 9.8, 44, 3, 0, NULL, 1, 0),
(758, 2172, 'Porter', 'Porter', 'Transporteur', 'Sankt Coinach-Bote', '聖コイナク財団の荷運び人', NULL, 17, 29.9, 13.3, 1, NULL, 1, NULL, 0, 0),
(759, 1442, 'Porus', 'Porus', 'Porus', 'Porus', 'ポリュス', NULL, 17, 31.1, 5.4, 48, 1, 1, 274, 1, 0),
(760, 1774, 'Ragged Hippogryph', 'Ragged Hippogryph', 'Hippogriffe Pelé', 'Zerlumpt[a] Hippogryph', 'ラゲッド・ヒッポグリフ', NULL, 17, 23.7, 10.6, 47, NULL, 0, NULL, 0, 0),
(761, 651, 'Raging Harrier', 'Raging Harrier', 'Harceleur Enragé', 'Wütend[a] Plünderer', 'レイジング・ハリアー', NULL, 17, 16.8, 17.2, 45, 3, 0, NULL, 1, 0),
(762, 2673, 'Rampant Cobra', 'Rampant Cobra', 'Cobra Envahisseur', 'Wild[a] Kobra', 'ラムペット・コブラ', NULL, 17, 27.7, 12.4, 50, NULL, 0, NULL, 0, 0),
(763, 1707, 'Rugged Researcher', 'Rugged Researcher', 'Archéologue Préoccupé', 'Zäh[a] Forscher', '筋骨逞しい調査員', NULL, 17, 22.4, 7.3, 45, NULL, 1, NULL, 0, 0),
(764, 1584, 'Seasoned Adventurer', 'Seasoned Adventurer', 'Sentinelle Chevronnée', 'Erfahren[a] Abenteurer', '手練れの冒険者', NULL, 17, 33.1, 11.3, 40, NULL, 0, NULL, 0, 0),
(765, 1717, 'Son Of Saint Coinach', 'Son Of Saint Coinach', 'Archéologue De Saint-Coinach', 'Sankt Coinachs-Forscher[p]', '聖コイナク財団の調査員', NULL, 17, 30.2, 12.0, 1, NULL, 1, NULL, 0, 0),
(766, 1757, 'Winter Nix', 'Winter Nix', 'Nix Hivernal', 'Winter-Nöck', 'ウィンター・ニクス', NULL, 17, 23.4, 11.4, 44, NULL, 0, NULL, 0, 0),
(767, 873, 'Vodyanoi', 'Vodyanoi', 'Vodyanoi', 'Vodyanoi', 'ヴォジャノーイ', NULL, 12, 27.6, 19.6, 14, 1, 1, 31, 1, 0),
(782, 1507, 'Whitespark Hepugg Roh', 'Whitespark Hepugg Roh', 'Hepugg Roh L\'étincelant', 'Weißfunken Hepugg Roh', '火打のハプグ・ロー', NULL, 14, 32.0, 19.0, 50, 1, 1, 34, 1, 0),
(783, 29, 'Dullahan', 'Dullahan', 'Dullahan', 'Dullahan', 'デュラハン', NULL, 10, 21.0, 21.0, 47, 3, 0, NULL, 1, 0),
(784, 871, 'Guguroon Wetnose', 'Guguroon Wetnose', 'Guguroon Lèvecoude', 'Saufnase Guguroon', '飲んべえググルン', NULL, 12, 19.0, 20.0, 7, 1, 1, 13, 1, 0),
(785, 885, 'Ulhuadshi', 'Ulhuadshi', 'Ulhuadshi', 'Ulhuadshi', 'ウルハドシ', NULL, 14, 14.0, 30.0, 32, 1, 1, 30, 1, 0),
(786, 343, 'Aermswys The Stained', 'Aermswys The Stained', 'Aermswys La Marquée', 'Aermswys [t] Gezeichnet[a]', '刻印のエルムスイス', NULL, 4, 13.0, 16.0, 49, 1, 1, 3, 1, 0),
(787, 114, 'Ice Sprite', 'Ice Sprite', 'élémentaire De Glace', 'Eis-Exergon', 'アイススプライト', NULL, 16, 25.3, 20.1, 36, 4, 0, NULL, 1, 1),
(788, 512, 'Alux', 'Alux', 'Alux', 'Alux', 'アルシュ', NULL, 7, 25.0, 25.0, 9, 1, 1, 5, 1, 0),
(789, 1527, 'Number 128', 'Number 128', 'Numéro 128', 'Nummer 128', 'ナンバー128', NULL, 6, 14.0, 15.0, 34, 1, 1, 21, 1, 0),
(790, 1610, 'Voluptuous Vivian', 'Voluptuous Vivian', 'Viviane La Voluptueuse', 'Unersättlich[a] Vivian', 'ボラプチュア・ビビアン', NULL, 17, 13.0, 10.0, 44, 1, 1, 33, 1, 0),
(791, 563, 'Aurelia', 'Aurelia', 'Aurélie', 'Aurelia', 'オーレリア', NULL, 1, 19.6, 20.8, 5, NULL, 0, NULL, 0, 1),
(793, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 1, 24.9, 16.9, 8, NULL, 0, NULL, 0, 1),
(794, 49, 'Little Ladybug', 'Little Ladybug', 'Coccinelle', 'Marienkäfer', 'レディバグ', NULL, 1, 23.2, 25.1, 3, NULL, 0, NULL, 0, 1),
(795, 1604, 'Pack Chocobo', 'Pack Chocobo', 'Chocobo De Bât', 'Karawanen-Chocobo', '荷運びチョコボ', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(797, 1332, 'Storm Private', 'Storm Private', 'Soldat 3e Classe Des Tempêtes', 'Sturmmariner', '黒渦団二等甲兵', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(799, 1400, 'Topaz Carbuncle', 'Topaz Carbuncle', 'Carbuncle Topaze', 'Topas-Karfunkel', 'カーバンクル・トパーズ', NULL, 1, 17.9, 17.4, 60, NULL, 0, NULL, 0, 1),
(800, 56, 'Water Sprite', 'Water Sprite', 'élémentaire D\'eau', 'Wasser-Exergon', 'ウォータースプライト', NULL, 1, 13.0, 15.4, 13, NULL, 0, NULL, 0, 1),
(801, 417, 'Wharf Rat', 'Wharf Rat', 'Rat', 'Dockratte', 'ラット', NULL, 1, 23.5, 22.9, 2, NULL, 0, NULL, 0, 1),
(802, 399, 'Wild Jackal', 'Wild Jackal', 'Chacal Sauvage', 'Wild[a] Schakal', 'ジャッカル', NULL, 1, 14.4, 10.9, 12, NULL, 0, NULL, 0, 1),
(803, 981, 'Yellowjacket', 'Yellowjacket', 'Casaque Jaune', 'Gelbjacken-Seesoldat', 'イエロージャケット陸戦兵', NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(804, 1272, 'Yellowjacket Patrol', 'Yellowjacket Patrol', 'Casaque Jaune', 'Gelbjacken-Wache', 'イエロージャケット警備兵', NULL, 1, 21.3, 24.1, 35, NULL, 0, NULL, 0, 1),
(806, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 2, 21.3, 38.6, 15, NULL, 0, NULL, 0, 1),
(807, 129, 'Firefly', 'Firefly', 'Luciole', 'Leuchtkäfer', 'ファイアフライ', NULL, 2, 26.5, 36.8, 11, NULL, 0, NULL, 0, 1),
(808, 49, 'Little Ladybug', 'Little Ladybug', 'Coccinelle', 'Marienkäfer', 'レディバグ', NULL, 2, 22.1, 23.1, 1, NULL, 0, NULL, 0, 1),
(809, 561, 'Megalocrab', 'Megalocrab', 'Mégalocrabe', 'Megalokrabbe', 'メガロクラブ', NULL, 2, 21.2, 37.6, 11, NULL, 0, NULL, 0, 1),
(810, 354, 'Mossless Goobbue', 'Mossless Goobbue', 'Goobbue Dépouillé', 'Flechten-Goobbue', 'モスレスグゥーブー', NULL, 2, 25.5, 26.4, 12, NULL, 0, NULL, 0, 1),
(811, 1604, 'Pack Chocobo', 'Pack Chocobo', 'Chocobo De Bât', 'Karawanen-Chocobo', '荷運びチョコボ', NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(812, 1273, 'Storm Recruit', 'Storm Recruit', 'Soldat Du Maelstrom', 'Mahlstrom-Rekrut', '黒渦団の兵卒', NULL, 2, 33.5, 19.2, 35, NULL, 0, NULL, 0, 1),
(813, 405, 'Tiny Mandragora', 'Tiny Mandragora', 'Mini-mandragore', 'Winzig[a] Mandragora', 'タイニー・マンドラゴラ', NULL, 2, 33.7, 18.4, 8, NULL, 0, NULL, 0, 1),
(815, 417, 'Wharf Rat', 'Wharf Rat', 'Rat', 'Dockratte', 'ラット', NULL, 2, 22.1, 24.6, 1, NULL, 0, NULL, 0, 1),
(816, 393, 'Wild Dodo', 'Wild Dodo', 'Dodo', 'Dodo', 'ドードー', NULL, 2, 28.8, 20.4, 4, NULL, 0, NULL, 0, 1),
(817, 399, 'Wild Jackal', 'Wild Jackal', 'Chacal Sauvage', 'Wild[a] Schakal', 'ジャッカル', NULL, 2, 21.0, 32.7, 10, NULL, 0, NULL, 0, 1),
(818, 115, 'Wind Sprite', 'Wind Sprite', 'élémentaire De Vent', 'Wind-Exergon', 'ウィンドスプライト', NULL, 2, 34.7, 14.3, 9, NULL, 0, NULL, 0, 1),
(819, 981, 'Yellowjacket', 'Yellowjacket', 'Casaque Jaune', 'Gelbjacken-Seesoldat', 'イエロージャケット陸戦兵', NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(820, 1326, 'Aismurl Goldmember', 'Aismurl Goldmember', 'Aismurl Membre-d\'or', 'Aismurl Goldzahn', '金満のアイスムル', NULL, 3, 32.5, 23.3, NULL, NULL, 1, NULL, 0, 0),
(822, 270, 'Grenade', 'Grenade', 'Grenado', 'Granate', 'グレネード', NULL, 3, 29.1, 29.0, 31, 3, 0, NULL, 1, 1),
(824, 379, 'Kobold Patrolman', 'Kobold Patrolman', 'Patrouilleur Kobold', 'Kobold-Grenzsoldat', 'コボルド・パトロールマン', NULL, 3, 27.9, 26.2, 34, NULL, 0, NULL, 0, 1),
(825, 413, 'Mamool Ja Executioner', 'Mamool Ja Executioner', 'Exécuteur Mamool Ja', 'Mamool Ja-Henker', 'マムージャ・エクスキューショナー', NULL, 3, 24.3, 20.3, 29, 4, 0, NULL, 1, 1),
(826, 1273, 'Storm Recruit', 'Storm Recruit', 'Soldat Du Maelstrom', 'Mahlstrom-Rekrut', '黒渦団の兵卒', NULL, 3, 21.7, 22.5, 36, NULL, 0, NULL, 0, 1),
(827, 2964, 'The Garlok', 'The Garlok', 'Garlok', 'Garlok', 'ガーロック', NULL, 3, 31.7, 36.3, NULL, NULL, 0, NULL, 0, 0),
(828, 115, 'Wind Sprite', 'Wind Sprite', 'élémentaire De Vent', 'Wind-Exergon', 'ウィンドスプライト', NULL, 3, 28.8, 26.6, 31, NULL, 0, NULL, 0, 1),
(829, 13, 'Arbor Buzzard', 'Arbor Buzzard', 'Busard', 'Baumkronen-Bussard', 'バザード', NULL, 4, 30.9, 28.6, 13, NULL, 0, NULL, 0, 1),
(831, 117, 'Lightning Sprite', 'Lightning Sprite', 'élémentaire De Foudre', 'Blitz-Exergon', 'ライトニングスプライト', NULL, 4, 31.7, 28.6, 14, NULL, 0, NULL, 0, 1),
(833, 1399, 'Selene', 'Selene', 'Selene', 'Selene', 'フェアリー・セレネ', NULL, 4, 27.6, 26.4, NULL, NULL, 0, NULL, 0, 0),
(834, 344, 'Shallowclaw Reaver', 'Shallowclaw Reaver', 'Griffe Des Pillards Du Serpent', 'Flachkrallen-Plünderer', '海蛇の爪', NULL, 4, 5.0, 16.3, NULL, NULL, 0, NULL, 0, 0),
(835, 1273, 'Storm Recruit', 'Storm Recruit', 'Soldat Du Maelstrom', 'Mahlstrom-Rekrut', '黒渦団の兵卒', NULL, 4, 19.6, 22.6, 48, NULL, 0, NULL, 0, 1),
(836, 56, 'Water Sprite', 'Water Sprite', 'élémentaire D\'eau', 'Wasser-Exergon', 'ウォータースプライト', NULL, 4, 17.0, 19.7, 44, NULL, 0, NULL, 0, 1),
(837, 981, 'Yellowjacket', 'Yellowjacket', 'Casaque Jaune', 'Gelbjacken-Seesoldat', 'イエロージャケット陸戦兵', NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(838, 1272, 'Yellowjacket Patrol', 'Yellowjacket Patrol', 'Casaque Jaune', 'Gelbjacken-Wache', 'イエロージャケット警備兵', NULL, 4, 27.5, 25.8, 35, NULL, 0, NULL, 0, 1),
(839, 296, 'Bumble Beetle', 'Bumble Beetle', 'Scarabourdon', 'Brummkäfer', 'バンブルビートル', NULL, 5, 14.3, 25.0, 20, NULL, 0, NULL, 0, 1),
(840, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 5, 33.9, 24.6, 60, NULL, 0, NULL, 0, 1),
(841, 369, 'Kobold Pitman', 'Kobold Pitman', 'Mineur Kobold', 'Kobold-Steiger', 'コボルド・ピットマン', NULL, 5, 28.8, 18.7, 34, 4, 0, NULL, 1, 1),
(842, 414, 'Mamool Ja Breeder', 'Mamool Ja Breeder', 'éleveur Mamool Ja', 'Mamool Ja-Brüter', 'マムージャ・ブリーダー', NULL, 5, 33.4, 25.8, 31, 3, 0, NULL, 1, 1),
(843, 415, 'Mamool Ja Sophist', 'Mamool Ja Sophist', 'Sophiste Mamool Ja', 'Mamool Ja-Sophist', 'マムージャ・ソフィスト', NULL, 5, 35.6, 24.2, 31, NULL, 0, NULL, 0, 1),
(847, 1273, 'Storm Recruit', 'Storm Recruit', 'Soldat Du Maelstrom', 'Mahlstrom-Rekrut', '黒渦団の兵卒', NULL, 5, 28.9, 23.1, 36, NULL, 0, NULL, 0, 1),
(848, 56, 'Water Sprite', 'Water Sprite', 'élémentaire D\'eau', 'Wasser-Exergon', 'ウォータースプライト', NULL, 5, 29.3, 25.0, 31, NULL, 0, NULL, 0, 1),
(849, 2475, 'Alpha Basilisk', 'Alpha Basilisk', 'Basilic Alpha', 'Alpha-Basilisk', 'アルファ・バジリスク', NULL, 6, 22.8, 14.3, NULL, NULL, 0, NULL, 0, 0),
(850, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 6, 21.3, 15.4, 60, NULL, 0, NULL, 0, 1),
(851, 270, 'Grenade', 'Grenade', 'Grenado', 'Granate', 'グレネード', NULL, 6, 21.4, 14.4, 41, 3, 0, NULL, 1, 1),
(852, 117, 'Lightning Sprite', 'Lightning Sprite', 'élémentaire De Foudre', 'Blitz-Exergon', 'ライトニングスプライト', NULL, 6, 16.1, 17.0, 34, NULL, 0, NULL, 0, 1),
(853, 46, 'Plasmoid', 'Plasmoid', 'Plasmoïde', 'Plasmodium', 'プラズモイド', NULL, 6, 25.2, 18.5, 34, 4, 0, NULL, 1, 1),
(854, 1332, 'Storm Private', 'Storm Private', 'Soldat 3e Classe Des Tempêtes', 'Sturmmariner', '黒渦団二等甲兵', NULL, 6, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(855, 1400, 'Topaz Carbuncle', 'Topaz Carbuncle', 'Carbuncle Topaze', 'Topas-Karfunkel', 'カーバンクル・トパーズ', NULL, 6, 19.3, 17.3, 60, NULL, 0, NULL, 0, 1),
(857, 13, 'Arbor Buzzard', 'Arbor Buzzard', 'Busard', 'Baumkronen-Bussard', 'バザード', NULL, 7, 28.9, 29.8, 11, NULL, 0, NULL, 0, 1),
(858, 43, 'Chigoe', 'Chigoe', 'Chigoe', 'Stechmücke', 'チゴー', NULL, 7, 27.2, 18.1, 5, NULL, 0, NULL, 0, 1),
(859, 129, 'Firefly', 'Firefly', 'Luciole', 'Leuchtkäfer', 'ファイアフライ', NULL, 7, 19.9, 28.1, 12, NULL, 0, NULL, 0, 1),
(860, 37, 'Ground Squirrel', 'Ground Squirrel', 'écureuil', 'Baumhörnchen', 'スクウィレル', NULL, 7, 21.8, 17.9, 2, NULL, 0, NULL, 0, 1),
(861, 117, 'Lightning Sprite', 'Lightning Sprite', 'élémentaire De Foudre', 'Blitz-Exergon', 'ライトニングスプライト', NULL, 7, 17.7, 21.9, 34, NULL, 0, NULL, 0, 1),
(862, 32, 'Microchu', 'Microchu', 'Microtyugh', 'Mikrochu', 'コチュー', NULL, 7, 29.8, 20.7, 8, NULL, 0, NULL, 0, 1),
(863, 236, 'Revenant', 'Revenant', 'Revenant', 'Wiedergänger', 'レブナント', NULL, 7, 11.4, 19.8, 32, 4, 0, NULL, 1, 1),
(865, 238, 'Stroper', 'Stroper', 'Storoper', 'Todesweide', 'ストローパー', NULL, 7, 13.5, 21.6, 31, 4, 0, NULL, 1, 1),
(866, 128, 'Treant Sapling', 'Treant Sapling', 'Pousse De Tréant', 'Baumschrat-Ableger', 'トレント・サップリング', NULL, 7, 29.5, 23.2, 17, NULL, 0, NULL, 0, 1),
(867, 39, 'Tree Slug', 'Tree Slug', 'Limace Arboricole', 'Baumschnecke', 'ツリースラッグ', NULL, 7, 16.1, 23.3, 14, NULL, 0, NULL, 0, 1),
(868, 56, 'Water Sprite', 'Water Sprite', 'élémentaire D\'eau', 'Wasser-Exergon', 'ウォータースプライト', NULL, 7, 24.1, 24.2, 7, NULL, 0, NULL, 0, 1),
(870, 453, 'Wood Wailer Sentry', 'Wood Wailer Sentry', 'Sentinelle Des Vigiles Sombres', 'Wache[p] Des Klageregiments', '鬼哭隊の衛士', NULL, 7, 17.4, 19.0, 35, NULL, 0, NULL, 0, 1),
(871, 59, '3rd Cohort Eques', '3rd Cohort Eques', 'Eques De La 3e Cohorte', 'Eques[p] Der III. Kohorte', 'IIIコホルス・エクエス', NULL, 8, 29.1, 20.8, 42, NULL, 0, NULL, 0, 1),
(872, 53, '3rd Cohort Hoplomachus', '3rd Cohort Hoplomachus', 'Hoplomachus De La 3e Cohorte', 'Hoplomachus[p] Der III. Kohorte', 'IIIコホルス・ホプロマクス', NULL, 8, 32.7, 20.7, 44, 3, 0, NULL, 1, 1),
(873, 58, '3rd Cohort Laquearius', '3rd Cohort Laquearius', 'Laquearius De La 3e Cohorte', 'Laquearius[p] Der III. Kohorte', 'IIIコホルス・ラクエリウス', NULL, 8, 29.2, 20.8, 42, NULL, 0, NULL, 1, 1),
(874, 60, '3rd Cohort Secutor', '3rd Cohort Secutor', 'Secutor De La 3e Cohorte', 'Secutor[p] Der III. Kohorte', 'IIIコホルス・セクトール', NULL, 8, 19.5, 26.6, 21, NULL, 0, NULL, 0, 1),
(875, 61, '3rd Cohort Signifer', '3rd Cohort Signifer', 'Signifer De La 3e Cohorte', 'Signifer[p] Der III. Kohorte', 'IIIコホルス・シグニフェル', NULL, 8, 32.4, 20.6, 44, 4, 0, NULL, 1, 1),
(876, 225, 'Goblin Hunter', 'Goblin Hunter', 'Chasseur Gobelin', 'Goblin-Jäger', 'ゴブリン・ハンター', NULL, 8, 13.8, 27.9, 11, NULL, 0, NULL, 0, 1),
(877, 54, 'Hornet Swarm', 'Hornet Swarm', 'Nuée De Frelons', 'Hornissenschwarm', 'ホーネット・スウォーム', NULL, 8, 11.3, 23.9, 11, NULL, 0, NULL, 0, 1),
(878, 497, 'Leafbleed Ochu', 'Leafbleed Ochu', 'Otyugh Feuillesang', 'Blattblut-Ochu', 'リーフブリード・オチュー', NULL, 8, 18.4, 27.2, 22, NULL, 0, NULL, 0, 1),
(880, 175, 'Poisonous Flytrap', 'Poisonous Flytrap', 'Piège-mouche Vénéneux', 'Giftig[a] Fliegenfalle', 'ポイズン・フライトラップ', NULL, 8, 18.4, 27.3, 22, NULL, 0, NULL, 0, 1),
(882, 199, 'Stumbling Funguar', 'Stumbling Funguar', 'Fungus Trébuchant', 'Stolper-Fungus', 'スタンブリング・ファンガー', NULL, 8, 15.5, 26.9, 18, NULL, 0, NULL, 0, 1),
(884, 39, 'Tree Slug', 'Tree Slug', 'Limace Arboricole', 'Baumschnecke', 'ツリースラッグ', NULL, 8, 12.9, 26.1, 12, NULL, 0, NULL, 0, 1),
(885, 399, 'Wild Jackal', 'Wild Jackal', 'Chacal Sauvage', 'Wild[a] Schakal', 'ジャッカル', NULL, 8, 28.5, 21.1, 39, NULL, 0, NULL, 0, 1),
(886, 526, 'Wood Wailer Lance', 'Wood Wailer Lance', 'Vigile Sombre', 'Klageregiment-Pikenier', '鬼哭隊の隊士', NULL, 8, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(887, 453, 'Wood Wailer Sentry', 'Wood Wailer Sentry', 'Sentinelle Des Vigiles Sombres', 'Wache[p] Des Klageregiments', '鬼哭隊の衛士', NULL, 8, 17.6, 26.7, 35, NULL, 0, NULL, 0, 1),
(888, 59, '3rd Cohort Eques', '3rd Cohort Eques', 'Eques De La 3e Cohorte', 'Eques[p] Der III. Kohorte', 'IIIコホルス・エクエス', NULL, 9, 20.1, 20.9, 23, NULL, 0, NULL, 0, 1),
(889, 58, '3rd Cohort Laquearius', '3rd Cohort Laquearius', 'Laquearius De La 3e Cohorte', 'Laquearius[p] Der III. Kohorte', 'IIIコホルス・ラクエリウス', NULL, 9, 22.7, 20.9, 22, NULL, 0, NULL, 1, 1),
(890, 61, '3rd Cohort Signifer', '3rd Cohort Signifer', 'Signifer De La 3e Cohorte', 'Signifer[p] Der III. Kohorte', 'IIIコホルス・シグニフェル', NULL, 9, 22.8, 21.0, 21, 4, 0, NULL, 1, 1),
(891, 2972, 'Alpha Zu', 'Alpha Zu', 'Zu Alpha', 'Alpha-Montisaurus', 'アルファ・ズー', NULL, 9, 18.1, 26.6, NULL, NULL, 0, NULL, 0, 0),
(893, 180, 'Leafbleed Roseling', 'Leafbleed Roseling', 'Roselette Feuillesang', 'Blattblut-Rösling', 'リーフブリード・ローズレット', NULL, 9, 23.6, 21.0, 19, NULL, 0, NULL, 0, 1),
(895, 112, 'Lesser Kalong', 'Lesser Kalong', 'Kalong', 'Klein[a] Kalong', 'カロング', NULL, 9, 32.4, 25.5, 46, 3, 0, NULL, 1, 0),
(897, 9, 'Miteling', 'Miteling', 'Petit Acarus', 'Schattenmilbe', 'マイトリング', NULL, 9, 25.4, 18.3, 26, NULL, 0, NULL, 0, 1),
(900, 56, 'Water Sprite', 'Water Sprite', 'élémentaire D\'eau', 'Wasser-Exergon', 'ウォータースプライト', NULL, 9, 22.5, 22.8, 25, NULL, 0, NULL, 0, 1),
(901, 15, 'Wild Hog', 'Wild Hog', 'Verrat Sauvage', 'Wildschwein', 'ワイルドホッグ', NULL, 9, 29.1, 25.6, 45, 3, 0, NULL, 1, 0),
(902, 115, 'Wind Sprite', 'Wind Sprite', 'élémentaire De Vent', 'Wind-Exergon', 'ウィンドスプライト', NULL, 9, 18.6, 19.1, 22, NULL, 0, NULL, 0, 1),
(903, 453, 'Wood Wailer Sentry', 'Wood Wailer Sentry', 'Sentinelle Des Vigiles Sombres', 'Wache[p] Des Klageregiments', '鬼哭隊の衛士', NULL, 9, 18.5, 26.1, 35, NULL, 0, NULL, 0, 1),
(905, 49, 'Little Ladybug', 'Little Ladybug', 'Coccinelle', 'Marienkäfer', 'レディバグ', NULL, 10, 29.9, 27.1, 2, NULL, 0, NULL, 0, 1),
(907, 46, 'Plasmoid', 'Plasmoid', 'Plasmoïde', 'Plasmodium', 'プラズモイド', NULL, 10, 23.2, 24.9, 45, 4, 0, NULL, 1, 1),
(908, 219, 'Qiqirn Beater', 'Qiqirn Beater', 'Qiqirn Rabatteur', 'Qiqirn-Schläger', 'キキルン・ビーター', NULL, 10, 21.9, 30.4, 29, NULL, 0, NULL, 0, 1),
(909, 128, 'Treant Sapling', 'Treant Sapling', 'Pousse De Tréant', 'Baumschrat-Ableger', 'トレント・サップリング', NULL, 10, 27.1, 26.9, 12, NULL, 0, NULL, 0, 1),
(910, 526, 'Wood Wailer Lance', 'Wood Wailer Lance', 'Vigile Sombre', 'Klageregiment-Pikenier', '鬼哭隊の隊士', NULL, 10, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(911, 227, 'Yarzon Scavenger', 'Yarzon Scavenger', 'Yarzon Charognard', 'Aas-Yarzon', 'ヤーゾン・スカベンジャー', NULL, 10, 22.2, 31.1, 26, NULL, 0, NULL, 0, 1),
(912, 1277, 'Brass Blade', 'Brass Blade', 'Lame De Cuivre', 'Messingklinge', '銅刃団の衛兵', NULL, 11, 20.6, 27.0, 8, NULL, 0, NULL, 0, 1),
(913, 113, 'Earth Sprite', 'Earth Sprite', 'élémentaire De Terre', 'Erd-Exergon', 'アーススプライト', NULL, 11, 25.8, 21.6, 7, NULL, 0, NULL, 0, 1),
(914, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 11, 23.0, 17.1, 24, NULL, 0, NULL, 0, 1),
(915, 1275, 'Flame Recruit', 'Flame Recruit', 'Soldat Des Immortels', 'Legionsrekrut', '不滅隊の兵卒', NULL, 11, 27.9, 26.2, 35, NULL, 0, NULL, 0, 1),
(916, 244, 'Giant Tortoise', 'Giant Tortoise', 'Tortue Géante', 'Riesenschildkröte', 'ジャイアントトータス', NULL, 11, 26.6, 23.9, 12, NULL, 0, NULL, 0, 1),
(917, 49, 'Little Ladybug', 'Little Ladybug', 'Coccinelle', 'Marienkäfer', 'レディバグ', NULL, 11, 28.0, 24.4, 3, NULL, 0, NULL, 0, 1),
(918, 299, 'Nesting Buzzard', 'Nesting Buzzard', 'Jeune Busard', 'Nistend[a] Bussard', 'ネストリング・バザード', NULL, 11, 21.4, 25.5, 6, NULL, 0, NULL, 0, 1),
(920, 234, 'Smallmouth Orobon', 'Smallmouth Orobon', 'Orobon Petite Gueule', 'Schmalmaul-Orobon', 'スモールマウス・オロボン', NULL, 11, 16.1, 16.3, 10, NULL, 0, NULL, 0, 1),
(922, 1400, 'Topaz Carbuncle', 'Topaz Carbuncle', 'Carbuncle Topaze', 'Topas-Karfunkel', 'カーバンクル・トパーズ', NULL, 11, 16.2, 15.3, 21, NULL, 0, NULL, 0, 1),
(923, 1277, 'Brass Blade', 'Brass Blade', 'Lame De Cuivre', 'Messingklinge', '銅刃団の衛兵', NULL, 12, 22.1, 33.0, 35, NULL, 0, NULL, 0, 1),
(924, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 12, 21.5, 16.0, 25, NULL, 0, NULL, 0, 1),
(925, 282, 'Hammer Beak', 'Hammer Beak', 'Bec-marteau', 'Hammerschnabel', 'ハンマービーク', NULL, 12, 19.7, 19.5, 6, NULL, 0, NULL, 0, 1),
(926, 308, 'Orobon', 'Orobon', 'Orobon', 'Orobon', 'オロボン', NULL, 12, 19.7, 24.5, 5, NULL, 0, NULL, 0, 1),
(929, 262, 'Star Marmot', 'Star Marmot', 'Marmotte', 'Stern-Murmelhörnchen', 'マーモット', NULL, 12, 20.3, 27.2, 1, NULL, 0, NULL, 0, 1),
(930, 201, 'Syrphid Cloud', 'Syrphid Cloud', 'Nuage De Syrphes', 'Mistfliegenwolke', 'サーフィド・クラウド', NULL, 12, 20.2, 15.2, NULL, NULL, 0, NULL, 0, 1),
(931, 249, 'Amalj\'aa Archer', 'Amalj\'aa Archer', 'Archer Amalj\'aa', 'Amalj\'aa-Bogenschütze', 'アマルジャ・アーチャー', NULL, 13, 17.0, 26.7, 15, 4, 0, NULL, 1, 1),
(932, 245, 'Amalj\'aa Lancer', 'Amalj\'aa Lancer', 'Lancier Amalj\'aa', 'Amalj\'aa-Pikenier', 'アマルジャ・ランサー', NULL, 13, 11.0, 16.1, 15, 4, 0, NULL, 1, 1),
(933, 253, 'Amalj\'aa Pugilist', 'Amalj\'aa Pugilist', 'Pugiliste Amalj\'aa', 'Amalj\'aa-Faustkämpfer', 'アマルジャ・ピュージャリスト', NULL, 13, 10.5, 18.2, 15, 4, 0, NULL, 1, 1),
(934, 1277, 'Brass Blade', 'Brass Blade', 'Lame De Cuivre', 'Messingklinge', '銅刃団の衛兵', NULL, 13, 28.3, 22.5, 35, NULL, 0, NULL, 0, 1),
(935, 1188, 'Doctore', 'Doctore', 'Laniste', 'Doctore', 'ドクトル', NULL, 13, 14.2, 10.5, NULL, NULL, 0, NULL, 0, 0),
(936, 302, 'Dusty Mongrel', 'Dusty Mongrel', 'Houret Poussiéreux', 'Verwahrlost[a] Mischling', 'モングレル', NULL, 13, 16.4, 25.8, 15, NULL, 0, NULL, 0, 1),
(937, 113, 'Earth Sprite', 'Earth Sprite', 'élémentaire De Terre', 'Erd-Exergon', 'アーススプライト', NULL, 13, 15.2, 23.5, 24, NULL, 0, NULL, 0, 1),
(938, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 13, 13.8, 24.6, 21, NULL, 0, NULL, 0, 1),
(939, 129, 'Firefly', 'Firefly', 'Luciole', 'Leuchtkäfer', 'ファイアフライ', NULL, 13, 24.4, 29.8, 19, NULL, 0, NULL, 0, 1),
(940, 1343, 'Flame Scout', 'Flame Scout', 'éclaireur Des Immortels', 'Legionskundschafter', '不滅隊の偵察兵', NULL, 13, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(941, 2925, 'Gatling', 'Gatling', 'Acanthor', 'Gatling', 'ガトリングス', NULL, 13, 12.9, 15.9, NULL, NULL, 0, NULL, 0, 0),
(942, 275, 'Quartz Doblyn', 'Quartz Doblyn', 'Doblyn De Quartz', 'Quarz-Dobalos', 'クォーツドブラン', NULL, 13, 30.4, 26.1, 44, 3, 0, NULL, 1, 1),
(943, 1400, 'Topaz Carbuncle', 'Topaz Carbuncle', 'Carbuncle Topaze', 'Topas-Karfunkel', 'カーバンクル・トパーズ', NULL, 13, 13.7, 23.3, 22, NULL, 0, NULL, 0, 1),
(945, 256, 'Amalj\'aa Bruiser', 'Amalj\'aa Bruiser', 'Tabasseur Amalj\'aa', 'Amalj\'aa-Kraftprotz', 'アマルジャ・ブルーザー', NULL, 14, 18.7, 16.3, 23, NULL, 0, NULL, 0, 1),
(946, 1401, 'Emerald Carbuncle', 'Emerald Carbuncle', 'Carbuncle émeraude', 'Smaragd-Karfunkel', 'カーバンクル・エメラルド', NULL, 14, 19.3, 12.0, 60, NULL, 0, NULL, 0, 1),
(948, 1371, 'Flame Private', 'Flame Private', 'Soldat 3e Classe Des Sables', 'Legionär[p] 3. Klasse', '不滅隊二等闘兵', NULL, 14, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(949, 1275, 'Flame Recruit', 'Flame Recruit', 'Soldat Des Immortels', 'Legionsrekrut', '不滅隊の兵卒', NULL, 14, 17.7, 18.3, 41, NULL, 0, NULL, 0, 1),
(951, 59, '3rd Cohort Eques', '3rd Cohort Eques', 'Eques De La 3e Cohorte', 'Eques[p] Der III. Kohorte', 'IIIコホルス・エクエス', NULL, 15, 18.5, 16.9, 49, NULL, 0, NULL, 0, 1),
(952, 58, '3rd Cohort Laquearius', '3rd Cohort Laquearius', 'Laquearius De La 3e Cohorte', 'Laquearius[p] Der III. Kohorte', 'IIIコホルス・ラクエリウス', NULL, 15, 17.1, 16.0, 49, NULL, 0, NULL, 1, 1),
(953, 60, '3rd Cohort Secutor', '3rd Cohort Secutor', 'Secutor De La 3e Cohorte', 'Secutor[p] Der III. Kohorte', 'IIIコホルス・セクトール', NULL, 15, 18.7, 15.2, 49, NULL, 0, NULL, 0, 1),
(954, 61, '3rd Cohort Signifer', '3rd Cohort Signifer', 'Signifer De La 3e Cohorte', 'Signifer[p] Der III. Kohorte', 'IIIコホルス・シグニフェル', NULL, 15, 18.5, 15.7, 49, 4, 0, NULL, 1, 1),
(955, 113, 'Earth Sprite', 'Earth Sprite', 'élémentaire De Terre', 'Erd-Exergon', 'アーススプライト', NULL, 15, 24.6, 21.2, 49, NULL, 0, NULL, 0, 1),
(956, 1275, 'Flame Recruit', 'Flame Recruit', 'Soldat Des Immortels', 'Legionsrekrut', '不滅隊の兵卒', NULL, 15, 22.1, 29.2, 50, NULL, 0, NULL, 0, 1),
(957, 2927, 'Flame Sergeant Dalvag', 'Flame Sergeant Dalvag', 'Sergent-major Dalvag', 'Dalvag', '不滅のフェランド闘軍曹', NULL, 15, 23.5, 26.4, NULL, NULL, 0, NULL, 0, 0),
(958, 1681, 'Lunatic Follower', 'Lunatic Follower', 'Partisan Dément', 'Wahnsinnig[a] Adept', 'ルナティック・フォロワー', NULL, 15, 9.6, 11.3, NULL, NULL, 0, NULL, 0, 0),
(959, 1690, 'Lunatic Priest', 'Lunatic Priest', 'Prêtre Dément', 'Wahnsinnig[a] Priester', 'ルナティック・プリースト', NULL, 15, 10.6, 11.3, NULL, NULL, 0, NULL, 0, 0),
(961, 2168, 'Bertha', 'Bertha', 'Canon Anti-dragon', 'Drachenhaubitze', '四連装対竜カノン砲', NULL, 16, 11.5, 6.6, NULL, NULL, 0, NULL, 0, 0),
(962, 662, 'Ixali Boundwing', 'Ixali Boundwing', 'Ixal Aile-garrottée', 'Ixal-Bannschwinge', 'イクサル・バウンドウィング', NULL, 16, 32.5, 27.7, 30, 1, 0, NULL, 1, 1),
(963, 663, 'Ixali Fearcaller', 'Ixali Fearcaller', 'Terroriseur Ixal', 'Ixal-Furchtrufer', 'イクサル・フィアコーラー', NULL, 16, 33.1, 15.5, 37, NULL, 0, NULL, 0, 1),
(965, 1604, 'Pack Chocobo', 'Pack Chocobo', 'Chocobo De Bât', 'Karawanen-Chocobo', '荷運びチョコボ', NULL, 16, NULL, NULL, NULL, NULL, 1, NULL, 0, 1),
(966, 46, 'Plasmoid', 'Plasmoid', 'Plasmoïde', 'Plasmodium', 'プラズモイド', NULL, 16, 7.5, 31.5, 48, 4, 0, NULL, 1, 1),
(974, 852, 'Cuachac', 'Cuachac', 'Cuachag', 'Cuachac', 'クアハック', NULL, 2, 26.0, 25.0, 3, 1, 1, 37, 1, 0),
(968, 114, 'Ice Sprite', 'Ice Sprite', 'élémentaire De Glace', 'Eis-Exergon', 'アイススプライト', NULL, 17, 24.2, 12.4, 46, 4, 0, NULL, 1, 1),
(970, 117, 'Lightning Sprite', 'Lightning Sprite', 'élémentaire De Foudre', 'Blitz-Exergon', 'ライトニングスプライト', NULL, 17, 32.9, 9.0, 46, NULL, 0, NULL, 0, 1),
(971, 237, 'Morbol', 'Morbol', 'Morbol', 'Morbol', 'モルボル', NULL, 17, 13.9, 12.6, 44, 3, 0, NULL, 1, 1),
(972, 645, 'Mudpuppy', 'Mudpuppy', 'Protée', 'Olm', 'マッドパピー', NULL, 17, 13.1, 10.3, 44, 4, 0, NULL, 1, 1),
(973, 46, 'Plasmoid', 'Plasmoid', 'Plasmoïde', 'Plasmodium', 'プラズモイド', NULL, 17, 18.1, 8.5, 41, 4, 0, NULL, 1, 1),
(975, 1665, 'Volxia Of The Blade', 'Volxia Of The Blade', 'Volxia', 'Volxia', '葉刃のヴォルキシア', NULL, 8, 29.0, 13.0, 47, 1, 1, 38, 1, 0),
(976, 1431, 'Seps', 'Seps', 'Seps', 'Seps', 'セプス', NULL, 16, 8.0, 12.0, 40, 1, 1, 40, 1, 0),
(977, 1525, 'Brounger', 'Brounger', 'Brounger', 'Brounger', 'ブラウンガー', NULL, 6, 25.1, 18.0, 34, 1, 1, 41, 1, 0),
(978, 1530, 'Sebek', 'Sebek', 'Sebek', 'Sebek', 'セベク', NULL, 16, 5.0, 22.0, 40, 1, 1, 254, 1, 0),
(979, 851, 'Chupacabra', 'Chupacabra', 'Chupacabra', 'Chupacabra', 'チュパカブラ', NULL, 1, 17.0, 9.0, 14, 1, 1, 129, 1, 0),
(980, 1511, 'Bomb Baron', 'Bomb Baron', 'Bombo Baron', 'Bomber-Baron', 'ボムバロン', NULL, 15, 25.0, 23.0, 49, 1, 1, 351, 1, 0),
(981, 877, 'Undertaker', 'Undertaker', 'Croque-mort', 'Totengräber', 'アンダーテイカー', NULL, 13, 14.0, 17.0, 17, 1, 1, 203, 1, 0),
(982, 1504, 'Bagoly', 'Bagoly', 'Badouh', 'Badu', 'バドゥ', NULL, 13, 30.0, 25.0, 42, 1, 1, 292, 1, 0),
(983, 866, 'Cactuar Jack', 'Cactuar Jack', 'Cactuar Jack', 'Kaktor Jack', 'カクタージャック', NULL, 11, 22.0, 23.0, 9, 1, 1, 177, 1, 0),
(984, 884, 'Blackbile Maladd Chah', 'Blackbile Maladd Chah', 'Maladd Chah L\'ensorceleur', 'Schwarzgalle Maladd Chah', '呪言のマラド・チャー', NULL, 14, 25.0, 34.0, 32, 1, 1, 220, 1, 0),
(986, 1661, 'Spiteful', 'Spiteful', 'Revanchard', 'Schadenfröhling', 'スパイトフル', NULL, 7, 11.0, 18.0, 43, 1, 1, 333, 1, 0),
(987, 257, 'Diamondjaw Nezedd Gah', 'Diamondjaw Nezedd Gah', 'Nezedd Gah Mâchoire-de-diamant', 'Diamantmaul Nezedd Gah', '金剛のネゼド・ガー', NULL, 14, 17.0, 24.0, 50, 1, 1, 215, 1, 0),
(988, 1433, 'Klythios', 'Klythios', 'Clytios', 'Klythios', 'クリュティオス', NULL, 16, 12.0, 25.0, 46, 1, 1, 252, 1, 0),
(989, 1516, 'Jolly Green', 'Jolly Green', 'Géant Vert', 'Glüxi Grün', 'ジョリーグリーン', NULL, 3, 17.0, 31.0, 33, 1, 1, 307, 1, 0),
(990, 1444, 'Gwyllgi', 'Gwyllgi', 'Gwyllgi', 'Gwyllgi', 'グウィルギ', NULL, 17, 27.0, 6.7, 46, 1, 1, 280, 1, 0),
(991, 862, 'Tryptix Stumblemox', 'Tryptix Stumblemox', 'Tryptix Le Simplet', 'Tryptix Raffnix', '間抜のトリップティックス', NULL, 4, 26.0, 22.0, 18, 1, 1, 160, 1, 0),
(992, 849, 'Menuis', 'Menuis', 'Menuis', 'Menuis', 'メヌイス', NULL, 1, 18.0, 17.0, 8, 1, 1, 117, 1, 0),
(993, 2350, 'Proto Armor', 'Proto Armor', 'Protoarmure', 'Proto-Kampfmaschine', 'プロトアーマー', NULL, 8, 29.0, 21.0, 42, 1, 1, 400, 1, 0),
(994, 1523, 'Ose', 'Ose', 'Ose', 'Ose', 'オセ', NULL, 6, 16.0, 15.0, 35, 1, 1, 319, 1, 0),
(995, 446, 'Asipatra', 'Asipatra', 'Asipatra', 'Asipatra', 'アシパトラ', NULL, 7, 17.0, 22.0, 34, 1, 1, 47, 1, 0),
(996, 861, 'Barometz', 'Barometz', 'Barometz', 'Barometz', 'バロメッツ', NULL, 4, 36.0, 28.0, 10, 1, 1, 158, 1, 0),
(997, 1503, 'Aeetes', 'Aeetes', 'Éétès', 'Aeetes', 'アイエテス', NULL, 13, 27.0, 24.0, 42, 1, 1, 291, 1, 0),
(998, 886, 'Simurgh', 'Simurgh', 'Simurgh', 'Simurgh', 'シームルグ', NULL, 5, 8.0, 21.0, 23, 1, 1, 164, 1, 0),
(999, 1699, 'Bibireze Greysteel', 'Bibireze Greysteel', 'Bibireze Grisacier', 'Bibireze Graustahl', '純鉄のビビレゼ', NULL, 14, 21.0, 19.0, 46, 1, 1, 294, 1, 0),
(1000, 1439, 'Gozol Itzcan The Hatchet', 'Gozol Itzcan The Hatchet', 'Gozol Itzcan Le Tronçonneur', 'Gozol Itzcan [t] Hammer[p]', '工匠のゴゾル・イツカン', NULL, 16, 33.0, 23.0, 50, 1, 1, 260, 1, 0),
(1001, 1427, 'Downy Dunstan', 'Downy Dunstan', 'Dunstan Le Duveteux', 'Daunen-Dunstan', 'ダウニーダンスタン', NULL, 16, 27.0, 23.0, 36, 1, 1, 234, 1, 0),
(1002, 1441, 'Nburu', 'Nburu', 'Nburu', 'Nburu', 'ンブル', 'Nburu', 17, 16.0, 14.2, 45, 1, 1, 271, 1, 0);

--
-- Triggers `mobs_arr`
--
DELIMITER $$
CREATE TRIGGER `mob_arr_del` AFTER DELETE ON `mobs_arr` FOR EACH ROW BEGIN
	CALL update_etag('distances_arr');
	CALL update_etag('mobs_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_arr_ins` AFTER INSERT ON `mobs_arr` FOR EACH ROW BEGIN
	CALL update_etag('distances_arr');
	CALL update_etag('mobs_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_arr_upd` AFTER UPDATE ON `mobs_arr` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.id_zone <> OLD.is_visible OR NEW.is_visible <> OLD.id_zone THEN
		CALL update_etag('distances_arr');
    END IF;
	CALL update_etag('mobs_arr');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mobs_hw`
--

CREATE TABLE `mobs_hw` (
  `id` int(10) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `lvl` tinyint(3) DEFAULT NULL,
  `slain` tinyint(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobs_hw`
--

INSERT INTO `mobs_hw` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `lvl`, `slain`) VALUES
(1, 3481, 'Archaeornis', 'Archaeornis', 'Archéornis', 'Archaeornis', 'アルケオーニス', '古鸟', 1, 17.0, 12.0, 51, 3),
(2, 3472, 'Bergthurs', 'Bergthurs', 'Bergthurs', 'Berg-Jötunn', 'ベルグスルス', '山巨魔', 1, 32.0, 24.0, 50, 2),
(3, 3471, 'Deepeye', 'Deepeye', 'Oculus', 'Glotzauge', 'ディープアイ', '深瞳', 1, 30.0, 26.0, 50, 3),
(4, 3476, 'Frost Grenade', 'Frost Grenade', 'Grenado Du Gel', 'Frost-Granate', 'フロストグレネード', '寒霜榴弹怪', 1, 28.0, 13.0, 50, 2),
(5, 3480, 'Gelato', 'Gelato', 'Gelato', 'Gelato', 'ジェラート', '明胶怪', 1, 10.0, 17.0, 51, 2),
(6, 3484, 'Ice Commander', 'Ice Commander', 'Commandant Gelé', 'Eiskommandant', 'アイスコマンダー', '寒冰指挥官', 1, 10.0, 12.0, 51, 3),
(7, 3475, 'Icetrap', 'Icetrap', 'Piège-glace', 'Eisfalle', 'アイストラップ', '寒冰陷阱草', 1, 23.0, 15.0, 50, 3),
(8, 3487, 'Inland Tursus', 'Inland Tursus', 'Tursus Des Terres', 'Binnen-Tursus', 'インランド・トゥルスス', '内陆图苏斯水龙蜥', 1, 29.0, 7.0, 56, 2),
(9, 3483, 'Lone Yeti', 'Lone Yeti', 'Yéti Solitaire', 'Einsamer Yeti', 'ローン・イエティ', '孤独大脚雪人', 1, 21.0, 31.0, 51, 2),
(10, 3485, 'Polar Bear', 'Polar Bear', 'Ours Polaire', 'Eisbär', 'ポーラーベアー', '极地熊', 1, 23.0, 21.0, 51, 3),
(11, 3482, 'Rheum', 'Rheum', 'Chassie', 'Schlafsand', 'ルーム', '汁液怪', 1, 14.0, 19.0, 51, 3),
(12, 3473, 'Silver Wolf', 'Silver Wolf', 'Loup Argenté', 'Silberwolf', 'シルバーウルフ', '银狼', 1, 23.0, 25.0, 50, 3),
(13, 3490, 'Slate Yeti', 'Slate Yeti', 'Yéti Du Grésil', 'Schiefer-Yeti', 'スレート・イエティ', '大脚板岩雪人', 1, 25.0, 32.0, 56, NULL),
(14, 3478, 'Slush Zoblyn', 'Slush Zoblyn', 'Zoblyn De Névasse', 'Schlamm-Zobalos', 'スラッシュゾブラン', '融雪矿怪虫', 1, 25.0, 12.0, 50, NULL),
(15, 3470, 'Steinbock', 'Steinbock', 'Steinbock', 'Schneebock', 'スタインボック', '小羚羊', 1, 30.0, 32.0, 50, 3),
(16, 3474, 'Upland Mylodon', 'Upland Mylodon', 'Mylodon Des Plateaux', 'Hochland-Mylodon', 'アップランド・ミロドン', '山地磨齿兽', 1, 26.0, 20.0, 50, 3),
(17, 3493, 'Vindthurs', 'Vindthurs', 'Vindthurs', 'Vindthur', 'ヴィンドスルス', '风巨魔', 1, 9.0, 9.0, 56, NULL),
(18, 3479, 'Wooly Yak', 'Wooly Yak', 'Yak Laineux', 'Woll-Yak', 'ウーリーヤク', '多毛牦牛', 1, 16.0, 18.0, 51, 2),
(19, 3524, 'Anzu', 'Anzu', 'Anzu', 'Anzu', 'アンズー', '安祖', 2, 21.0, 7.0, 59, 2),
(20, 3498, 'Cloudworm', 'Cloudworm', 'Ver Des Nuages', 'Wolkenwurm', 'クラウドウォーム', '云层巨虫', 2, 29.0, 35.0, 50, 1),
(21, 3496, 'Conodont', 'Conodont', 'Conodonte', 'Conodont', 'コノドント', '雷牙', 2, 28.0, 35.0, 50, 1),
(22, 3505, 'Dhalmel', 'Dhalmel', 'Dhalmel', 'Dhalmel', 'ダルメル', '长颈驼', 2, 16.0, 30.0, 56, 3),
(23, 3511, 'Endymion', 'Endymion', 'Endymion', 'Endymion', 'エンディミオン', '恩底弥翁', 2, 14.0, 10.6, 57, 2),
(24, 3494, 'Gaelicat', 'Gaelicat', 'Gaélichat', 'Geira-Katze', 'ゲイラキャット', '风筝猫', 2, 11.0, 33.0, 50, 3),
(25, 3495, 'Gastornis', 'Gastornis', 'Gastornis', 'Gastornis', 'ガストルニス', '冠恐鸟', 2, 11.0, 33.0, 50, 2),
(26, 3512, 'Groundskeeper', 'Groundskeeper', 'Terragardien', 'Erdwächter', 'グランズキーパー', '坐镇巨像', 2, 17.0, 17.0, 57, 3),
(27, 3506, 'Korrigan', 'Korrigan', 'Korrigan', 'Korrigane', 'コリガン', '柯瑞甘', 2, 20.0, 30.0, 56, 3),
(28, 3501, 'Lan\'laii Gundu', 'Lan\'laii Gundu', 'Lan\'laii Des Gundu', 'Lan\'laii Gundo', 'ランライ・グンド', '衮杜兰腊义', 2, 36.0, 21.0, 51, 1),
(29, 3515, 'Lan\'laii Vundu', 'Lan\'laii Vundu', 'Lan\'laii Des Vundu', 'Lan\'laii Vundo', 'ランライ・ブンド', '温杜兰腊义', 2, 28.0, 10.0, 57, NULL),
(30, 3502, 'Nat\'laii Gundu', 'Nat\'laii Gundu', 'Nat\'laii Des Gundu', 'Nat\'laii Gundo', 'ナツライ・グンド', '衮杜那腊义', 2, 36.0, 20.0, 51, 1),
(31, 3516, 'Nat\'laii Vundu', 'Nat\'laii Vundu', 'Nat\'laii Des Vundu', 'Nat\'laii Vundo', 'ナツライ・ブンド', '温杜那腊义', 2, 28.0, 10.0, 57, NULL),
(32, 3497, 'Obdella', 'Obdella', 'Obdella', 'Obdella', 'オブデラ', '棘蛭', 2, 24.0, 34.0, 50, 2),
(33, 3499, 'Paissa', 'Paissa', 'Païssa', 'Paissa', 'パイッサ', '猴面雀', 2, 20.0, 35.0, 50, 3),
(34, 3500, 'Sanuwa', 'Sanuwa', 'Sanuwa', 'Sanuwa', 'サヌワ', '腾云蛇', 2, 36.0, 21.0, 51, 1),
(35, 3514, 'Sanuwa Vundu', 'Sanuwa Vundu', 'Sanuwa Des Vundu', 'Vundo-Sanuwa', 'サヌワ・ブンド', '腾云蛇温杜', 2, 30.0, 14.0, 57, NULL),
(36, 3525, 'Toco Toco', 'Toco Toco', 'Toco Toco', 'Tokotoko', 'トコトコ', '巨嘴鸟', 2, 21.0, 7.0, 59, 3),
(37, 3523, 'Tsanahale', 'Tsanahale', 'Tsanahale', 'Tsanahal', 'ツィナハレ', '奇纳哈尔鸟妖', 2, 15.4, 7.3, 59, 2),
(38, 3503, 'Vuk\'laii Gundu', 'Vuk\'laii Gundu', 'Vuk\'laii Des Gundu', 'Vuk\'laii Gundo', 'ヴクライ・グンド', '衮杜乌腊义', 2, 36.0, 25.0, 51, 1),
(39, 3509, 'Window Wamoura', 'Window Wamoura', 'Wamoura De La Fenêtre Bleue', 'Himmelblau-Wamoura', 'ウィンドウ・ワモーラ', '天窗瓦魔蛾', 2, 9.0, 16.0, 57, 1),
(40, 3510, 'Window Wamouracampa', 'Window Wamouracampa', 'Wamouracampa De La Fenêtre Bleue', 'Himmelblau-Wamouracampa', 'ウィンドウ・ワモーラカンパ', '天窗瓦魔蛾幼虫', 2, 6.0, 19.0, 57, 2),
(41, 3504, 'Wisent', 'Wisent', 'Wisent', 'Wisent', 'ウィセント', '文森野牛', 2, 20.0, 38.0, 56, 2),
(42, 3565, 'Bandersnatch', 'Bandersnatch', 'Bandersnatch', 'Bandersnatch', 'バンダースナッチ', '斑攫兽', 3, 34.0, 14.0, 52, 3),
(43, 3587, 'Bone Aevis', 'Bone Aevis', 'Ostéoneibis', 'Knochen-Avis', 'ボーンエイビス', '白骨龙鸟', 3, 11.0, 39.0, 57, NULL),
(44, 3566, 'Brown Bear', 'Brown Bear', 'Ours Brun', 'Braunbär', 'ブラウンベアー', '棕熊', 3, 30.0, 11.0, 52, 2),
(45, 3570, 'Clearwater Nanka', 'Clearwater Nanka', 'Nanka D\'eau Douce', 'Fluss-Nanka', 'リバー・ナンカ', '清水南加', 3, 28.0, 22.0, 52, NULL),
(46, 3569, 'Clearwater Ninki Nanka', 'Clearwater Ninki Nanka', 'Ninki Nanka D\'eau Douce', 'Fluss-Ninki Nanka', 'リバー・ニンキナンカ', '清水宁基南加', 3, 28.0, 22.0, 52, 2),
(47, 3572, 'Dragonfly Watcher', 'Dragonfly Watcher', 'Draguêpe Veilleur', 'Späher-Drachycera', 'ドラゴンフライ・ウォッチャー', '守望蜻蜓飞蜥', 3, 25.0, 33.0, 52, 2),
(48, 3567, 'Dravanian Aevis', 'Dravanian Aevis', 'Eibis Dravanien', 'Dravanischer Avis', 'ドラヴァニアン・エイビス', '龙堡龙鸟', 3, 25.0, 23.0, 52, 2),
(49, 3576, 'Dravanian Wyvern', 'Dravanian Wyvern', 'Wyverne Dravanienne', 'Dravanischer Wyvern', 'ドラヴァニアン・ワイバーン', '龙堡双足飞龙', 3, 17.0, 36.0, 53, 3),
(50, 3563, 'Feather Flea', 'Feather Flea', 'Puce à Plumes', 'Fiederfloh', 'フェザーフリー', '羽毛跳蚤', 3, 35.0, 24.0, 52, 3),
(51, 3578, 'Forelands Hippocerf', 'Forelands Hippocerf', 'Hippocerf De L\'avant-pays', 'Vorland-Hippocerf', 'フォーランド・ヒッポセルフ', '参天骏雕', 3, 21.0, 23.0, 53, 3),
(52, 3579, 'Gallimimus', 'Gallimimus', 'Gallimimus', 'Gallimimus', 'ガッリミムス', '似鸡龙', 3, 18.0, 15.0, 53, 3),
(53, 3573, 'Gnath Firedrone', 'Gnath Firedrone', 'Gnathe Myrmifeu', 'Gnath-Feuerdrohne', 'グナース・ファイアドローン', '骨颌火兵', 3, 27.0, 36.0, 52, NULL),
(54, 3588, 'Golden Bandersnatch', 'Golden Bandersnatch', 'Bandersnatch Doré', 'Goldener Bandersnatch', 'ゴールデン・バンダースナッチ', '金斑攫兽', 3, 26.0, 7.0, 57, NULL),
(55, 3571, 'Loaghtan', 'Loaghtan', 'Loaghtan', 'Loaghtan', 'ロフタン', '洛夫坦山羊', 3, 26.0, 30.0, 52, 3),
(56, 3568, 'Melia', 'Melia', 'Mélia', 'Meliade', 'メリアエ', '枯树精', 3, 24.0, 23.0, 52, 2),
(57, 3577, 'Miacid', 'Miacid', 'Miacis', 'Miacis', 'ミアキス', '细齿兽', 3, 19.0, 27.0, 53, 3),
(58, 3555, 'Syricta', 'Syricta', 'Syricta', 'Syricta', 'シリクタ', '希里科塔', 3, 13.0, 18.0, 53, 2),
(59, 3586, 'Thunder Dragon', 'Thunder Dragon', 'Dragon De Foudre', 'Blitzdrache', 'サンダードラゴン', '雷龙', 3, 31.0, 8.0, 57, 1),
(60, 3581, 'Vinegaroon', 'Vinegaroon', 'Vinaigrier', 'Geißelskorpion', 'ビネガロン', '醋蝎龙', 3, 13.0, 14.0, 53, 2),
(62, 3564, 'Wild Chocobo', 'Wild Chocobo', 'Chocobo Sauvage', 'Wild-Chocobo', 'ワイルドチョコボ', '野生陆行鸟', 3, 35.0, 21.0, 52, 3),
(63, 3619, 'Amphiptere', 'Amphiptere', 'Amphiptère', 'Amphitere', 'アンフィプテレ', '安菲瑟龙', 4, 17.0, 31.0, 54, 2),
(64, 3620, 'Archaeosaur', 'Archaeosaur', 'Archéosaure', 'Archaeosaurus', 'アルケオダイノス', '古恐龙', 4, 24.0, 26.0, 54, NULL),
(65, 3625, 'Bladed Vinegaroon', 'Bladed Vinegaroon', 'Vinaigrier à Lames', 'Klingen-Geißelskorpion', 'ブレード・ビネガロン', '利刃醋蝎龙', 4, 14.0, 22.0, 55, 2),
(66, 3630, 'Blood Dragon', 'Blood Dragon', 'Dragon De Sang', 'Blutdrache', 'ブラッドドラゴン', '血龙', 4, 28.3, 11.2, 56, 1),
(67, 3631, 'Cloud Aevis', 'Cloud Aevis', 'Nubeibis', 'Wolken-Avis', 'クラウドエイビス', '白云龙鸟', 4, 9.0, 36.0, 56, 1),
(68, 3629, 'Diresaur', 'Diresaur', 'Allosaure', 'Werdrache', 'ウェアドラゴン', '变种龙', 4, 7.0, 19.0, 56, 3),
(69, 3623, 'Dragonet', 'Dragonet', 'Dragonnet', 'Drachenjunges', 'ドラゴネット', '幼龙', 4, 17.0, 12.0, 55, 3),
(70, 3626, 'Elder Syricta', 'Elder Syricta', 'Syricta Antique', 'Höherer Syricta', 'エルダーシリクタ', '古老希里科塔', 4, 34.0, 22.0, 55, 2),
(71, 3628, 'Elder Wyvern', 'Elder Wyvern', 'Wyverne Ancienne', 'Höherer Wyvern', 'エルダーワイバーン', '古老双足飞龙', 4, 25.0, 30.0, 55, NULL),
(72, 3668, 'Gnarled Melia', 'Gnarled Melia', 'Mélia Noueuse', 'Knorrige Meliade', 'ナールド・メリアエ', '扭曲枯树精', 4, 10.0, 20.0, 55, NULL),
(73, 3614, 'Hropken', 'Hropken', 'Hropken', 'Hropken', 'ロプケン', '洛浦肯', 4, 36.0, 28.0, 54, 2),
(74, 3621, 'Limestone Golem', 'Limestone Golem', 'Golem De Calcaire', 'Kalkstein-Golem', 'ライムゴーレム', '石灰巨像', 4, 9.0, 12.0, 55, 2),
(75, 3618, 'Lower Skylord', 'Lower Skylord', 'Maître Aérien Mineur', 'Niederer Drache', 'レッサードラゴン', '小龙', 4, 20.0, 28.0, 54, 2),
(76, 3627, 'Mists Biast', 'Mists Biast', 'Biast Des Brumes', 'Nebel-Smei', 'ミスト・ビアスト', '浓雾雷蛟', 4, 34.0, 32.0, 55, 2),
(77, 3622, 'Mists Drake', 'Mists Drake', 'Dragon Des Brumes', 'Nebel-Drakon', 'ミスト・ドレイク', '浓雾火蛟', 4, 10.0, 18.0, 55, 3),
(78, 3617, 'Moss Dragon', 'Moss Dragon', 'Dragon Moussu', 'Moosdrache', 'モスドラゴン', '苔龙', 4, 23.0, 20.0, 54, 2),
(79, 3613, 'Sankchinni', 'Sankchinni', 'Sankchinni', 'Sankchinni', 'サンクチンニ', '山克芹尼', 4, 27.0, 31.0, 54, 3),
(80, 3615, 'Tulihand', 'Tulihand', 'Tulihänd', 'Tulihand', 'トゥリヘンド', '火尾飞蜥', 4, 33.0, 16.0, 54, 2),
(81, 3624, 'Vouivre', 'Vouivre', 'Vouivre', 'Vivel', 'ヴィーヴル', '薇薇尔飞龙', 4, 21.0, 20.0, 55, 2),
(82, 3612, 'Bifericeras', 'Bifericeras', 'Biféricéras', 'Bifericeras', 'ビフェリケラス', '对菊石', 5, 25.0, 27.0, 59, 3),
(83, 3609, 'Cockatrice', 'Cockatrice', 'Cocatrix', 'Cockatrice', 'コカトリス', '魔蛇鸟', 5, 18.0, 36.0, 59, 3),
(84, 3603, 'Crawler', 'Crawler', 'Chenille', 'Kriecher', 'クロウラー', '毛爬虫', 5, 12.0, 16.0, 58, 3),
(85, 3594, 'Damselfly', 'Damselfly', 'Demoiselle', 'Kleinlibelle', 'ダムゼルフライ', '灯芯蜻蛉', 5, 24.5, 19.9, 58, 2),
(86, 3598, 'Goblin Brandisher', 'Goblin Brandisher', 'Brandisseur Gobelin', 'Goblin-Schleuderer', 'ゴブリン・ブランディッシャー', '哥布林挥刀者', 5, 29.0, 21.0, 58, 1),
(87, 3600, 'Goblin Sharpshooter', 'Goblin Sharpshooter', 'Tireur Gobelin', 'Goblin-Scharfschütze', 'ゴブリン・シャープシューター', '哥布林狙击手', 5, 30.0, 21.0, 58, 2),
(88, 3599, 'Goblin Tinkerer', 'Goblin Tinkerer', 'Rétameur Gobelin', 'Goblin-Bastler', 'ゴブリン・ティンカラー', '哥布林修补匠', 5, 29.0, 22.0, 58, 2),
(89, 3605, 'Great Morbol', 'Great Morbol', 'Grand Morbol', 'Groß-Morbol', 'モルボルグレート', '大魔界花', 5, 10.0, 21.0, 58, 1),
(90, 3610, 'Okeanis', 'Okeanis', 'Océanide', 'Okeanis', 'オーケアニス', '俄刻阿尼斯', 5, 9.0, 30.0, 59, 2),
(91, 3604, 'Orn Kite', 'Orn Kite', 'Colibri D\'Orn', 'Orn-Kolibri', 'オーン・コリブリ', '奥恩飞鸢', 5, 11.0, 28.0, 58, 3),
(92, 3607, 'Poroggo', 'Poroggo', 'Poroggo', 'Poroggo', 'ポロッゴ', '智蛙', 5, 11.0, 33.0, 59, 2),
(93, 3595, 'Ratel', 'Ratel', 'Ratel', 'Ratel', 'ラーテル', '蜜獾', 5, 28.0, 25.0, 58, 2),
(94, 3611, 'Sun Leech', 'Sun Leech', 'Sangsue Solaire', 'Sonnen-Egel', 'サンリーチ', '太阳水蛭', 5, 9.0, 32.0, 59, 2),
(95, 3593, 'Tarantula Hawk', 'Tarantula Hawk', 'Guêpe Pepsis', 'Tarantulafalke', 'タランチュラホーク', '蛛蜂', 5, 26.8, 16.3, 58, 3),
(96, 3545, '6th Legion Vanguard', '6th Legion Vanguard', 'Avant-garde De La 6e Légion', 'Frontbrecher der VI. Legion', 'VIレギオン・ヴァンガード', '第六军团魔导先锋', 6, 35.0, 24.0, 59, NULL),
(97, 3552, 'Adamantite Claw', 'Adamantite Claw', 'Griffe D\'adamantium Magitek', 'Magitek-Adamantiumklaue', '魔導アダマンクロー', '魔导精金爪', 6, 31.0, 30.0, 59, NULL),
(98, 3540, 'Allagan Chimera', 'Allagan Chimera', 'Chimère Allagoise', 'Allagische Chimära', 'アラガン・キマイラ', '亚拉戈奇美拉', 6, 31.0, 5.0, 59, 1),
(99, 3534, 'Clockwork Engineer', 'Clockwork Engineer', 'Ingénieur Mécanique', 'Uhrwerk-Techniker', 'アラガンワーク・エンジニア', '亚拉戈发条工程师', 6, 15.0, 12.0, 59, 1),
(100, 3535, 'Clockwork Paladin', 'Clockwork Paladin', 'Paladin Mécanique', 'Uhrwerk-Paladin', 'アラガンワーク・パラディン', '亚拉戈发条圣骑士', 6, 15.0, 12.0, 59, 1),
(101, 3542, 'Corpse Flower', 'Corpse Flower', 'Fleur-dépouille', 'Titanenwurz', 'コープスフラワー', '尸生花', 6, 33.0, 10.0, 59, 2),
(102, 3541, 'Empuse', 'Empuse', 'Empousa', 'Empusa', 'エンプーサ', '疫虫', 6, 30.0, 15.0, 59, 2),
(103, 3537, 'Enforcement Droid', 'Enforcement Droid', 'Droïde D\'exécution', 'Vollzugsdroide', 'エンフォースドロイド', '执法机甲', 6, 13.0, 17.7, 59, 3),
(104, 3539, 'Lamia Cybrid', 'Lamia Cybrid', 'Lamia Cybride', 'Lamia-Zybrid', 'ラミア・サイブリッド', '胞质杂交拉米亚', 6, 27.0, 11.0, 59, 1),
(105, 3580, 'Lesser Hydra', 'Lesser Hydra', 'Hydre Mineure', 'Kleine Hydra', 'レッサーハイドラ', '小海德拉', 6, 13.0, 33.0, 59, 2),
(106, 3559, 'Meracydian Amphiptere', 'Meracydian Amphiptere', 'Amphiptère Méracydien', 'Meracydische Amphitere', 'メラシディアン・アンフィプテレ', '美拉西迪亚安菲瑟龙', 6, 18.0, 31.0, 59, NULL),
(107, 3557, 'Meracydian Brobinyak', 'Meracydian Brobinyak', 'Brobinyak Méracydien', 'Meracydischer Brobinyak', 'メラシディアン・ブロビニャク', '美拉西迪亚布罗宾雅克', 6, 7.0, 31.0, 59, 1),
(108, 3560, 'Meracydian Dragon', 'Meracydian Dragon', 'Dragon Méracydien', 'Meracydischer Drache', 'メラシディアン・ドラゴン', '美拉西迪亚巨龙', 6, 8.0, 27.0, 59, NULL),
(109, 3556, 'Meracydian Vouivre', 'Meracydian Vouivre', 'Vouivre Méracydienne', 'Meracydische Vivel', 'メラシディアン・ヴィーヴル', '美拉西迪亚薇薇尔飞龙', 6, 9.0, 37.0, 59, 1),
(110, 3543, 'Proto-naga', 'Proto-naga', 'Proto-naga', 'Proto-Naga', 'プロト・ナーガ', '原型那迦', 6, 35.0, 8.0, 59, 2),
(111, 3544, 'Reptoid', 'Reptoid', 'Reptoïde', 'Reptoid', 'レプトイド', '爬虫半人马', 6, 33.0, 12.0, 59, 2),
(112, 3532, 'Snapper-rook', 'Snapper-rook', 'Drone-drille', 'Schnappturm', 'ルークスナッパー', '响声堡', 6, 12.0, 13.0, 59, 2),
(113, 3489, 'Grand Archaeornis', 'Grand Archaeornis', 'Grand Archéornis', 'Großer Archaeornis', 'グランド・アルケオーニス', '大古鸟', 1, 35.0, 18.0, 56, NULL),
(114, 3616, 'Wadjet', 'Wadjet', 'Ouadjet', 'Wadjet', 'ウアジェット', '神蜥蜴瓦吉特', 4, 28.0, 19.0, 54, 2),
(115, 3608, 'Opken', 'Opken', 'Opken', 'Opken', 'オプケン', '欧浦肯', 5, 13.0, 33.0, 59, 3),
(120, 3533, 'Owlbear', 'Owlbear', 'Hibours', 'Strigidae', 'オウルベア', '枭熊', 6, 13.0, 12.0, 59, 3),
(122, 3477, 'Coldwind Bateleur', 'Coldwind Bateleur', 'Bateleur De Ventfroid', 'Kaltwind-Gaukler', 'コールドウィンド・バテラー', '寒风短尾雕', 1, 30.0, 13.0, 50, NULL),
(124, 3513, 'Vundu Totem', 'Vundu Totem', 'Totem Des Vundu', 'Vundo-Totem', 'ブンド・トーテム', '温杜图腾', 2, 17.0, 17.0, 57, 1),
(125, 3582, 'Tyrannosaur', 'Tyrannosaur', 'Tyrannosaure', 'Tyrannosaurus', 'ティラノサウルス', '暴龙', 3, 13.0, 18.0, 53, 2),
(127, 3596, 'Wildebeest', 'Wildebeest', 'Gnou', 'Gnu', 'ワイルドビースト', '牛羚', 5, 33.0, 19.0, 58, 3),
(128, 3554, 'Meracydian Falak', 'Meracydian Falak', 'Falak Méracydien', 'Meracydischer Falak', 'メラシディアン・ファラク', '美拉西迪亚法拉克', 6, 15.0, 28.0, 59, 1),
(129, 3602, 'Espertype Magitek Vangob G-III', 'Espertype Magitek Vangob G-III', 'Gobavant-garde Magitek G-III Écrabouilleuse', 'Magitek-Gobbrecher III-E', 'III号ゴブリガードE型', '3号哥布林装甲E型', 5, 31.0, 19.0, 58, NULL),
(130, 3597, 'Narbrooi', 'Narbrooi', 'Narbrooi', 'Narbrooi', 'ナルブルーイ', '纳布芮依', 5, 35.0, 21.0, 58, 3),
(131, 3606, 'Sun Bear', 'Sun Bear', 'Bruan', 'Sonnenbär', 'サンベアー', '太阳熊', 5, 8.0, 28.0, 58, NULL),
(132, 3574, 'Gnath Steeldrone', 'Gnath Steeldrone', 'Gnathe Myrmacier', 'Gnath-Stahldrohne', 'グナース・スチールドローン', '骨颌钢兵', 3, 27.0, 36.0, 52, NULL),
(133, 3575, 'Gnath Cultivator', 'Gnath Cultivator', 'Gnathe Cultivateur', 'Gnath-Kultivator', 'グナース・カルティベーター', '骨颌播种员', 3, 27.0, 36.0, 52, NULL),
(134, 3583, 'Gnath Haildrone', 'Gnath Haildrone', 'Gnathe Myrmigrêle', 'Gnath-Hageldrohne', 'グナース・ヘイルドローン', '骨颌冰兵', 3, 27.0, 36.0, 53, NULL),
(135, 3584, 'Gnath Irondrone', 'Gnath Irondrone', 'Gnathe Myrmifer', 'Gnath-Eisendrohne', 'グナース・アイアンドローン', '骨颌铁兵', 3, 27.0, 36.0, 53, NULL),
(136, 3585, 'Gnath Forager', 'Gnath Forager', 'Gnathe Glaneur', 'Gnath-Furier', 'グナース・フォリジャー', '骨颌觅食员', 3, 27.0, 36.0, 53, NULL),
(137, 3589, 'Dragonfly Tracer', 'Dragonfly Tracer', 'Draguêpe Fureteur', 'Sucher-Drachycera', 'ドラゴンフライ・トレーサー', '追踪蜻蜓飞蜥', 3, 31.0, 8.0, 57, NULL),
(138, 3536, 'Clockwork Harvestman', 'Clockwork Harvestman', 'Faucheux Mécanique', 'Uhrwerk-Ernter', 'アラガンワーク・ハーベストマン', '亚拉戈发条收割者', 6, 13.0, 8.0, 59, 3),
(139, 3551, 'Clockwork Bit', 'Clockwork Bit', 'Foret Mécanique', 'Uhrwerk-Drohne', 'アラガンワーク・ビット', '亚拉戈发条浮游炮', 6, 6.0, 15.0, 59, NULL),
(140, 3561, 'Warspite', 'Warspite', 'Cuirassé Warspite', 'Kriegsgroll', 'ウォースパイト', '战怨', 6, 25.0, 22.0, 60, NULL),
(141, 3562, 'Sphinx', 'Sphinx', 'Sphinx', 'Sphinx', 'スフィンクス', '斯芬克斯', 6, 25.0, 22.0, 60, NULL),
(142, 3549, '6th Legion Secutor', '6th Legion Secutor', 'Secutor De La 6e Légion', 'Secutor der VI. Legion', 'VIレギオン・セクトール', '第六军团剑斗士', 6, 38.0, 24.0, 59, NULL),
(143, 3546, '6th Legion Hoplomachus', '6th Legion Hoplomachus', 'Hoplomachus De La 6e Légion', 'Hoplomachus der VI. Legion', 'VIレギオン・ホプロマクス', '第六军团拳斗士', 6, 38.0, 24.0, 59, NULL),
(144, 3547, '6th Legion Laquearius', '6th Legion Laquearius', 'Laquearius De La 6e Légion', 'Laquearius der VI. Legion', 'VIレギオン・ラクエリウス', '第六军团绳斗士', 6, 38.0, 24.0, 59, NULL),
(145, 4399, '6th Legion Bit', '6th Legion Bit', 'Drone De La 6e Légion', 'Drohne der VI. Legion', 'VIレギオン・ビット', '第六军团浮游炮', 6, 33.0, 26.0, 59, NULL),
(146, 3553, 'Mark III Magitek Colossus', 'Mark III Magitek Colossus', 'Colosse Magitek III', 'Magitek-Stahlriese', '魔導コロッサスIII', '魔导巨兵三型', 6, 24.0, 30.0, 59, NULL),
(147, 3550, '6th Legion Signifer', '6th Legion Signifer', 'Signifer De La 6e Légion', 'Signifer der VI. Legion', 'VIレギオン・シグニフェル', '第六军团旗手', 6, 33.0, 37.0, 59, NULL),
(148, 3548, '6th Legion Eques', '6th Legion Eques', 'Eques De La 6e Légion', 'Eques der VI. Legion', 'VIレギオン・エクエス', '第六军团骑士', 6, 33.0, 37.0, 59, NULL),
(149, 3492, 'Ice Zoblyn', 'Ice Zoblyn', 'Zoblyn De Glace', 'Eis-Zobalos', 'アイスゾブラン', '寒冰矿怪虫', 1, 29.0, 36.0, 56, NULL),
(150, 3491, 'Sorbet', 'Sorbet', 'Sorbet', 'Sorbet', 'ソルベ', '冰糕怪', 1, 22.0, 28.0, 56, NULL),
(151, 3538, 'Lamia Thelytoke', 'Lamia Thelytoke', 'Lamia Thélitoque', 'Lamia-Thelytokie', 'ラミア・テリトーク', '单性繁殖拉米亚', 6, 27.0, 11.0, 59, 1),
(152, 3558, 'Meracydian Dragonet', 'Meracydian Dragonet', 'Dragonnet Méracydien', 'Meracydisches Drachenjunges', 'メラシディアン・ドラゴネット', '美拉西迪亚幼龙', 6, 7.0, 35.0, 59, 1),
(153, 3601, 'Goblin Glider', 'Goblin Glider', 'Voltigeur Gobelin', 'Goblin-Gleiter', 'ゴブリン・グライダー', '哥布林滑翔兵', 5, 32.0, 23.0, 58, 2),
(154, 3592, 'Loth Cultivator', 'Loth Cultivator', 'Cultivateur Du Loth', 'Loth-Kultivator', 'ロス・カルティベーター', '骨颌违心播种员', 3, 26.0, 36.0, 57, 1),
(156, 3590, 'Loth Firedrone', 'Loth Firedrone', 'Myrmifeu Du Loth', 'Loth-Feuerdrohne', 'ロス・ファイアドローン', '骨颌违心火兵', 3, 26.0, 36.0, 57, 1),
(155, 3591, 'Loth Steeldrone', 'Loth Steeldrone', 'Myrmacier Du Loth', 'Loth-Stahldrohne', 'ロス・スチールドローン', '骨颌违心钢兵', 3, 26.0, 36.0, 57, 1),
(157, 3486, 'Ice Dragon', 'Ice Dragon', 'Dragon De Glace', 'Frostdrache', 'フリーズドラゴン', '冰龙', 1, 14.0, 23.7, 56, NULL),
(158, 3488, 'Sleet Trap', 'Sleet Trap', 'Piège-grésil', 'Graupelfalle', 'スリートトラップ', '雨雪陷阱草', 1, 36.0, 7.0, 56, NULL),
(159, 3520, '6th Legion Bestiarius', '6th Legion Bestiarius', 'Bestiarius De La 6e Légion', 'Bestiarius der VI. Legion', 'VIレギオン・ベスティアリウス', '第六军团矛斗士', 2, 23.0, 23.0, 57, NULL),
(160, 3522, '6th Legion Imaginifer', '6th Legion Imaginifer', 'Imaginifer De La 6e Légion', 'Imaginifer der VI. Legion', 'VIレギオン・イマギニファー', '第六军团咒法士', 2, 23.0, 23.0, 57, NULL),
(161, 3519, '6th Legion Myrmillo', '6th Legion Myrmillo', 'Myrmillo De La 6e Légion', 'Myrmillo der VI. Legion', 'VIレギオン・ミュルミッロ', '第六军团鱼斗士', 2, 23.0, 23.0, 57, NULL),
(162, 3518, '6th Legion Triarius', '6th Legion Triarius', 'Triarius De 6e Légion', 'Triarius der VI. Legion', 'VIレギオン・トリアリウス', '第六军团角斗士', 2, 23.0, 23.0, 57, NULL),
(163, 3521, '6th Legion Veles', '6th Legion Veles', 'Veles De La 6e Légion', 'Veles der VI. Legion', 'VIレギオン・ヴェリス', '第六军团前卫', 2, 23.0, 23.0, 57, NULL),
(164, 3508, 'Abalathian Kite', 'Abalathian Kite', 'Milan D\'Abalathia', 'Abalathischer Milan', 'アバラシア・カイト', '阿拉巴提亚飞鸢', 2, 18.0, 29.0, 57, NULL),
(165, 3526, 'Griffin', 'Griffin', 'Griffon', 'Griffon', 'グリフィン', '狮鹫', 2, 37.0, 15.0, 59, NULL),
(166, 3527, 'Lan\'loii Vundu', 'Lan\'loii Vundu', 'Lan\'loii Des Vundu', 'Lan\'loii Vundo', 'ランロイ・ブンド', '温杜兰洛义', 2, 37.0, 15.0, 59, NULL),
(167, 3530, 'Mockingbird Totem', 'Mockingbird Totem', 'Totem De Moqueur', 'Spottdrossel-Totem', 'モッキンバード・トーテム', '仿声鸟图腾', 2, 37.0, 15.0, 59, NULL),
(168, 3528, 'Nat\'loii Vundu', 'Nat\'loii Vundu', 'Nat\'loii Des Vundu', 'Nat\'loii Vundo', 'ナツロイ・ブンド', '温杜那洛义', 2, 37.0, 15.0, 59, NULL),
(169, 3531, 'O\'sanuwa Vundu', 'O\'sanuwa Vundu', 'O\'sanuwa Des Vundu', 'Vundo-O\'sanuwa', 'オサヌワ・ブモラ', '温杜欧腾云蛇', 2, 37.0, 15.0, 59, NULL),
(170, 3517, 'Vuk\'laii Vundu', 'Vuk\'laii Vundu', 'Vuk\'laii Des Vundu', 'Vuk\'laii Vundo', 'ヴクライ・ブンド', '温杜乌腊义', 2, 23.0, 23.0, 57, NULL),
(171, 3529, 'Vuk\'loii Vundu', 'Vuk\'loii Vundu', 'Vuk\'loii Des Vundu', 'Vuk\'loii Vundo', 'ヴクロイ・ブンド', '温杜乌洛义', 2, 37.0, 15.0, 59, NULL),
(172, 3507, 'Wily Paissa', 'Wily Paissa', 'Païssa Rusé', 'Gerissener Paissa', 'ワイリー・パイッサ', '狡猾猴面雀', 2, 18.0, 29.0, 56, NULL);

--
-- Triggers `mobs_hw`
--
DELIMITER $$
CREATE TRIGGER `mob_hw_del` AFTER DELETE ON `mobs_hw` FOR EACH ROW BEGIN
	CALL update_etag('distances_hw');
	CALL update_etag('mobs_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_hw_ins` AFTER INSERT ON `mobs_hw` FOR EACH ROW BEGIN
	CALL update_etag('distances_hw');
	CALL update_etag('mobs_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_hw_upd` AFTER UPDATE ON `mobs_hw` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_hw');
    END IF;
	CALL update_etag('mobs_hw');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mobs_sb`
--

CREATE TABLE `mobs_sb` (
  `id` int(10) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED NOT NULL,
  `y` decimal(3,1) UNSIGNED NOT NULL,
  `lvl` tinyint(3) DEFAULT NULL,
  `slain` tinyint(2) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobs_sb`
--

INSERT INTO `mobs_sb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `lvl`, `slain`) VALUES
(1, 5682, 'Burrow Antlion', 'Burrow Antlion', 'Fourmilion Creuseur', 'Erdloch-Ameisenlöwe', 'ブロウ・アントリオン', '地洞蚁狮', 1, 16.0, 24.0, 61, NULL),
(2, 5685, 'Diakka', 'Diakka', 'Diakka', 'Diakka', 'ディアッカ', '狄亚卡', 1, 10.0, 27.0, 61, 2),
(3, 5673, 'Dust Dhara', 'Dust Dhara', 'Dhara De Poussière', 'Staub-Dhara', 'ダスト・ダラ', '尘驼罗', 1, 27.0, 13.0, 60, NULL),
(4, 5674, 'Foper', 'Foper', 'Fopar', 'Foper', 'フォーパー', '弗帕', 1, 22.8, 16.5, 60, 3),
(5, 5692, 'Gagana', 'Gagana', 'Gagana', 'Gagana', 'ガガナ', '迦迦纳怪鸟', 1, 28.0, 17.0, 67, NULL),
(6, 5697, 'Gazelle', 'Gazelle', 'Gazelle', 'Gazelle', 'ガゼル', '瞪羚', 1, 25.0, 30.0, 67, 2),
(7, 5676, 'Gazelle Hawk', 'Gazelle Hawk', 'Frelon Gazelle', 'Gazellenfalke', 'ガゼルホーク', '羚鹰蜂', 1, 11.0, 12.0, 60, 2),
(8, 5679, 'Gelid Bhoot', 'Gelid Bhoot', 'Bhut Glacial', 'Eisig[a] Bhut', 'ジェリド・ブフート', '极寒浮灵', 1, 25.0, 15.0, 60, 1),
(9, 5686, 'Goosefish', 'Goosefish', 'Saillot', 'Seeteufel', 'グース', '魔鮟鱇', 1, 9.0, 30.0, 61, 3),
(10, 5696, 'Highland Dhara', 'Highland Dhara', 'Dhara Des Hauteurs', 'Hochland-Dhara', 'ハイランド・ダラ', '高地驼罗', 1, 29.5, 29.1, 67, NULL),
(11, 5671, 'Leshy', 'Leshy', 'Liéchi', 'Leschij', 'レーシー', '莱西', 1, 11.0, 14.0, 60, 3),
(12, 5672, 'Lesser Gagana', 'Lesser Gagana', 'Gagana Mineur', 'Klein[a] Gagana', 'レッサー・ガガナ', '小迦迦纳怪鸟', 1, 20.0, 10.0, 60, NULL),
(13, 5687, 'Mossling', 'Mossling', 'Moussemousse', 'Moosling', 'モスモス', '苔小妖', 1, 11.0, 23.0, 61, 2),
(14, 5683, 'Mountain Grizzly', 'Mountain Grizzly', 'Grizzli De Montagne', 'Berggrizzly', 'マウンテン・グリズリー', '山地灰熊', 1, 11.0, 17.0, 61, 1),
(15, 5691, 'Qalyana Brahmin', 'Qalyana Brahmin', 'Qalyana Brahmin', 'Qalyana-Brahmin', 'カリヤナ・ブラフミン', '伽黎亚婆罗门', 1, 34.0, 21.0, 67, 1),
(16, 5689, 'Qalyana Kshatriya', 'Qalyana Kshatriya', 'Qalyana Kshatriya', 'Qalyana-Kshatriya', 'カリヤナ・クシャトリア', '伽黎亚刹帝利', 1, 34.0, 21.0, 67, 2),
(17, 5690, 'Qalyana Shudra', 'Qalyana Shudra', 'Qalyana Shudra', 'Qalyana-Shudra', 'カリヤナ・シュードラ', '伽黎亚首陀罗', 1, 34.0, 21.0, 67, 2),
(18, 5688, 'Sacred Marid', 'Sacred Marid', 'Marid Sacré', 'Heilig[a] Maride', 'セイクレッド・マーリド', '圣山魔象', 1, 34.0, 21.0, 67, 1),
(19, 5675, 'Sapria', 'Sapria', 'Sapria', 'Sapria', 'サプリア', '寄生花', 1, 10.0, 15.0, 60, 1),
(20, 5684, 'Skimmer', 'Skimmer', 'Cordulie', 'Schröpfer', 'スキマー', '蚂螂', 1, 11.0, 23.0, 61, NULL),
(21, 5677, 'Spinner', 'Spinner', 'Fileuse', 'Spinner', 'スピナー', '纺蛛', 1, 21.0, 8.0, 60, 3),
(22, 5693, 'Teleoceras', 'Teleoceras', 'Teleoceras', 'Teleoceras', 'テレオケラス', '远角犀', 1, 29.0, 25.0, 67, 2),
(23, 5681, 'Tracer Antlion', 'Tracer Antlion', 'Fourmilion Fureteur', 'Jagd-Ameisenlöwe', 'トレーサー・アントリオン', '追踪蚁狮', 1, 15.2, 23.0, 61, NULL),
(24, 5694, 'Tracker Antlion', 'Tracker Antlion', 'Fourmilion Traqueur', 'Fährtensucher-Ameisenlöwe', 'トラッカー・アントリオン', '跟踪蚁狮', 1, 29.9, 27.9, 67, NULL),
(25, 5695, 'Trench Antlion', 'Trench Antlion', 'Fourmilion Des Fossés', 'Graben-Ameisenlöwe', 'トレンチ・アントリオン', '地沟蚁狮', 1, 30.0, 28.0, 67, NULL),
(26, 5678, 'Velodyna Pugil', 'Velodyna Pugil', 'Pugil De La Velodyna', 'Velodyna-Pugil', 'ベロジナ・プギル', '威罗迪纳陆鱼', 1, 28.0, 16.0, 60, 2),
(27, 5680, 'Velodyna Sarcosuchus', 'Velodyna Sarcosuchus', 'Sarcosuchus De La Velodyna', 'Velodyna-Sarcosuchus', 'ベロジナ・サルコスクス', '威罗迪纳帝王鳄', 1, 18.0, 11.0, 60, 3),
(28, 5701, 'Bloodglider', 'Bloodglider', 'Lunigère Sanguine', 'Blutgleiter', 'ブラッドグライダー', '血飞蛾', 2, 13.0, 13.0, 60, 2),
(29, 5700, 'Chapuli', 'Chapuli', 'Chapuli', 'Chapuli', 'チャプリ', '洽普利蚱蜢', 2, 7.0, 13.0, 60, NULL),
(30, 5705, 'Crag Claw', 'Crag Claw', 'Griffe De Grès', 'Felsenklaue', 'クラッグクロウ', '峭壁巨钳虾', 2, 26.6, 7.8, 61, 2),
(31, 5698, 'Dust Anila', 'Dust Anila', 'Anila De Poussière', 'Staub-Anila', 'ダスト・アニラ', '尘阿尼罗', 2, 21.0, 10.0, 60, NULL),
(32, 5702, 'Fluturini', 'Fluturini', 'Fluturini', 'Fluturini', 'フルトゥリーニ', '浮蝶', 2, 15.0, 8.0, 60, 2),
(33, 5703, 'Gyr Abanian Hornbill', 'Gyr Abanian Hornbill', 'Bucorve Gyrabanien', 'Abanischer Hornrabe', 'ギラバニアン・ホーンビル', '基拉巴尼亚亚犀鸟', 2, 10.0, 7.0, 60, 2),
(34, 5713, 'Highland Eruca', 'Highland Eruca', 'Eruca Des Hauteurs', 'Hochland-Eruca', 'ハイランド・エルカ', '高地毛虫', 2, 26.0, 36.0, 68, 1),
(35, 5710, 'Highwing Chapuli', 'Highwing Chapuli', 'Chapuli Ailes-hautes', 'Hochschwingen-Chapuli', 'ハイウィング・チャプリ', '高翅蚱蜢', 2, 18.0, 35.0, 68, NULL),
(36, 5712, 'Jhammel', 'Jhammel', 'Jhammel', 'Jhammel', 'ジャムメル', '长颈骆', 2, 25.0, 30.0, 68, 1),
(37, 5714, 'Kongamato', 'Kongamato', 'Kongamato', 'Kongamato', 'コンガマトー', '恐甲蚂蜓', 2, 14.0, 26.0, 68, 2),
(38, 5707, 'Marble Urolith', 'Marble Urolith', 'Urolithe De Marbre', 'Marmor-Urolith', 'マーブル・ウロリス', '大理石乌洛里石', 2, 35.0, 9.0, 61, 1),
(39, 5709, 'Muud Suud', 'Muud Suud', 'Moudsoud', 'Muhtsu', 'ムードスード', '姆德斯德', 2, 15.0, 31.0, 68, NULL),
(40, 5715, 'Pantera', 'Pantera', 'Pantera', 'Pantera', 'パンテーラ', '斑豹', 2, 13.0, 29.0, 68, 2),
(41, 5706, 'Qiqirn Meatcutter', 'Qiqirn Meatcutter', 'Qiqirn Tranche-viande', 'Qiqirn-Fleischschneider', 'キキルン・ミートカッター', '卢恩人切肉者', 2, 25.0, 20.0, 61, NULL),
(42, 5699, 'Qiqirn Meateater', 'Qiqirn Meateater', 'Qiqirn Croque-viande', 'Qiqirn-Fleischfresser', 'キキルン・ミートイーター', '卢恩人食肉者', 2, 15.0, 14.0, 60, NULL),
(43, 5704, 'Ruud Suud', 'Ruud Suud', 'Roudsoud', 'Ruhtsu', 'ルードスード', '鲁德斯德', 2, 31.0, 9.0, 61, NULL),
(44, 5708, 'Scarab Beetle', 'Scarab Beetle', 'Scaraléoptère Gyrabanien', 'Abanischer Käfer', 'ギラバニアン・スカラベ', '基拉巴尼亚圣甲虫', 2, 25.0, 13.0, 61, 2),
(45, 5711, 'True Griffin', 'True Griffin', 'Vrai Griffon', 'Urgreif', 'トゥルーグリフィン', '真狮鹫', 2, 23.0, 25.0, 68, 1),
(46, 5747, 'Apa', 'Apa', 'Apa', 'Apa', 'アーパス', '阿帕斯', 3, 18.0, 34.0, 63, NULL),
(47, 5737, 'Bombfish', 'Bombfish', 'Poisson-bombo', 'Igelbomber', 'ハリセンボム', '刺球爆弹怪', 3, 32.0, 35.0, 62, 2),
(48, 5736, 'Coralshell', 'Coralshell', 'Coquorail', 'Korallenschale', 'サンゴセオイ', '珊瑚壳', 3, 33.0, 6.0, 62, 2),
(49, 5740, 'Flying Shark', 'Flying Shark', 'Requin Volant', 'Fliegender Hai', 'トビザメ', '飞鲨', 3, 26.0, 31.0, 62, 2),
(50, 5742, 'Gasame', 'Gasame', 'Gasame', 'Gasame', 'ガサメ', '拥剑蟹', 3, 26.0, 36.0, 62, 2),
(51, 5734, 'Gyuki', 'Gyuki', 'Gyuki', 'Gyuki', 'ギュウキ', '牛鬼', 3, 20.0, 10.0, 62, 1),
(52, 5741, 'Hellborn Anala', 'Hellborn Anala', 'Anala Infernal', 'Infernalisch[a] Anala', 'ゴクノ・アナラ', '地狱阿那罗', 3, 27.0, 35.0, 62, NULL),
(53, 5749, 'Island Gedan', 'Island Gedan', 'Gedan Des îles', 'Insel-Gedan', 'ガーダン', '獦狚', 3, 11.0, 8.0, 63, NULL),
(54, 5751, 'Naked Yumemi', 'Naked Yumemi', 'Yumemi Nu', 'Nackt-Yumemi', 'カラナシ・ユメミ', '无壳观梦螺', 3, 25.0, 26.0, 63, 1),
(55, 5743, 'Red Bukan', 'Red Bukan', 'Bukan Rouge', 'Rot[a] Bukan', 'ベニコウラ・ブカン', '红甲武官', 3, 7.0, 26.0, 63, 2),
(56, 5745, 'Red Honkan', 'Red Honkan', 'Honkan Rouge', 'Rot[a] Jonkan', 'ベニコウラ・ホンカン', '红甲正官', 3, 7.0, 26.0, 63, 2),
(57, 5744, 'Red Hyoe', 'Red Hyoe', 'Hyoe Rouge', 'Rot[a] Hyoe', 'ベニコウラ・ヒョウエ', '红甲兵卫', 3, 7.0, 26.0, 63, 2),
(58, 5748, 'Ruby Hornbill', 'Ruby Hornbill', 'Bucorve De Rubis', 'Rubin-Hornrabe', 'ベニツノ', '红角犀鸟', 3, 33.0, 19.0, 63, NULL),
(59, 5738, 'Sea Serpent', 'Sea Serpent', 'Serpent De Mer', 'Seeschlange', 'オオウミヘビ', '大海蛇', 3, 30.0, 8.0, 62, 2),
(60, 5739, 'Shiranui', 'Shiranui', 'Shiranui', 'Shiranui', 'シラヌイ', '不知火', 3, 25.0, 6.0, 62, 2),
(61, 5746, 'Striped Ray', 'Striped Ray', 'Raie Rayée', 'Gestreifter Rochen', 'シマエイ', '斑鳐', 3, 7.0, 26.0, 63, 2),
(62, 5733, 'Tatsunoko', 'Tatsunoko', 'Tatsunoko', 'Tatsunoko', 'タツノコ', '龙之子', 3, 28.0, 31.0, 62, 2),
(63, 5735, 'Unkiu', 'Unkiu', 'Unkiu', 'Unkiu', 'ウンキウ', '甲鲎', 3, 34.0, 16.0, 62, 3),
(64, 5750, 'Yumemi', 'Yumemi', 'Yumemi', 'Yumemi', 'ユメミガイ', '观梦螺', 3, 25.0, 26.0, 63, 1),
(65, 5761, 'Bi Fang', 'Bi Fang', 'Bibao', 'Bibao', 'ヒッポウ', '毕方', 4, 17.8, 30.5, 64, 2),
(66, 5758, 'Doman Weasel', 'Doman Weasel', 'Furet Domien', 'Doma-Wiesel', 'ドマイタチ', '多玛鼬', 4, 33.0, 29.0, 64, NULL),
(67, 5769, 'Ebisu Catfish', 'Ebisu Catfish', 'Namazu Ebisu', 'Ebisu Namazuo', 'エビス・ナマズオ', '惠比寿鲶鱼精', 4, 27.0, 8.0, 67, 3),
(68, 5766, 'Gensui Apa', 'Gensui Apa', 'Apa Du Gensui', 'Gensui-Apa', 'ゲンスイ・アーパス', '玄水阿帕斯', 4, 21.0, 34.0, 64, NULL),
(69, 5767, 'Gensui Dhara', 'Gensui Dhara', 'Dhara Du Gensui', 'Gensui-Dhara', 'ゲンスイ・ダラ', '玄水驼罗', 4, 38.0, 21.0, 64, NULL),
(70, 5756, 'Koja', 'Koja', 'Koja', 'Koja', 'コジャ', '高加颅', 4, 16.0, 27.0, 64, NULL),
(71, 5752, 'Lupin Bladehand', 'Lupin Bladehand', 'Lupin Bretteur', 'Wolfsleute-Schwertkämpfer', '人狼族の太刀使い', '狼人族刀手', 4, 24.0, 29.0, 64, 1),
(72, 5754, 'Lupin Bowhand', 'Lupin Bowhand', 'Lupin Archer', 'Wolfsleute-Bogenschütze', '人狼族の弓使い', '狼人族弓手', 4, 24.0, 29.0, 64, 1),
(73, 5753, 'Lupin Spearhand', 'Lupin Spearhand', 'Lupin Lancier', 'Wolfsleute-Pikenier', '人狼族の槍使い', '狼人族枪手', 4, 23.0, 29.0, 64, 1),
(74, 5770, 'Magatsu', 'Magatsu', 'Koja Magatsu', 'Magatsu Koja', 'マガツ・コジャ', '祸津高加颅', 4, 17.0, 13.0, 67, NULL),
(75, 5768, 'Magatsu Kiyofusa', 'Magatsu Kiyofusa', 'Kiyofusa Magatsu', 'Magatsu Kiyofusa', 'マガツ・キヨフサ', '祸津清房', 4, 16.0, 12.0, 67, 3),
(76, 5763, 'Minobi', 'Minobi', 'Minobi', 'Minobi', 'ミノビ', '蓑火', 4, 32.0, 20.0, 64, 3),
(77, 5772, 'Rainbow Tiger', 'Rainbow Tiger', 'Tigre De La Vallée', 'Regenbogen-Tiger', 'シチサイトラ', '七彩虎', 4, 28.0, 12.0, 67, NULL),
(78, 5757, 'Rhino Beetle', 'Rhino Beetle', 'Rhinoscarabée', 'Nashornkäfer', 'サイカブト', '犀甲虫', 4, 32.0, 22.0, 64, 3),
(79, 5759, 'River Hornbill', 'River Hornbill', 'Bucorve De Rivière', 'Fluss-Hornrabe', 'ムニ・ベニツノ', '无二红角犀鸟', 4, 29.0, 25.0, 64, NULL),
(80, 5765, 'Taoquan', 'Taoquan', 'Taoquan', 'Taoquan', 'タオチュアン', '蜪犬', 4, 30.0, 35.0, 64, 2),
(81, 5755, 'Tenaga', 'Tenaga', 'Tenaga', 'Tenaga', 'テナガ', '长手精', 4, 28.0, 32.0, 64, 2),
(82, 5764, 'Vanara', 'Vanara', 'Vanara', 'Vanara', 'ヴァナラ', '婆那罗', 4, 25.0, 29.0, 64, 2),
(83, 5762, 'Water Serpent', 'Water Serpent', 'Serpent D\'eau', 'Wasserschlange', 'ミズヘビ', '水蛇', 4, 25.0, 28.0, 64, 2),
(84, 5771, 'Whitewing Hornbill', 'Whitewing Hornbill', 'Bucorve Ailes-blanches', 'Weißschwingen-Hornrabe', 'サキジロ・ベニツノ', '白翼红角犀鸟', 4, 21.0, 13.0, 67, NULL),
(85, 5760, 'Yanxian Tiger', 'Yanxian Tiger', 'Tigre Yanxien', 'Yanxia-Tiger', 'ヤンサトラ', '延夏虎', 4, 36.0, 17.0, 64, NULL),
(86, 5785, 'Baras', 'Baras', 'Baras', 'Baras', 'ベルス', '伯尔斯虎', 5, 16.0, 19.0, 66, 3),
(87, 5787, 'Buzzfly', 'Buzzfly', 'Vombrellule', 'Brummfliege', 'バズフライ', '噪蜻蜓', 5, 21.0, 29.0, 66, NULL),
(88, 5788, 'Chaochu', 'Chaochu', 'Chaotyugh', 'Chaochu', 'カオチュー', '庞口花', 5, 20.0, 26.0, 66, 2),
(89, 5786, 'Gulo Gulo', 'Gulo Gulo', 'Gulo Gulo', 'Gulo Gulo', 'グログロ', '狼獾', 5, 16.0, 26.0, 66, NULL),
(90, 5777, 'Halgai', 'Halgai', 'Halgai', 'Halgai', 'ハルガイ', '刺草球', 5, 21.0, 19.0, 65, 3),
(91, 5778, 'Khun Chuluu', 'Khun Chuluu', 'Khun Chuluu', 'Khun Chuluu', 'フン・チョロー', '石人浑朝鲁', 5, 17.0, 11.0, 65, 3),
(92, 5781, 'Mammoth', 'Mammoth', 'Mammouth', 'Mammut', 'マンモス', '长毛象', 5, 28.0, 18.0, 65, 2),
(93, 5783, 'Manzasiri', 'Manzasiri', 'Manzasiri', 'Manzasiri', 'マンザシリ', '曼殊师里', 5, 12.0, 30.0, 66, 3),
(94, 5775, 'Matamata', 'Matamata', 'Matamata', 'Matamata', 'マタマタ', '玛塔蛇颈龟', 5, 27.0, 15.0, 65, 2),
(95, 5782, 'Matanga', 'Matanga', 'Matanga', 'Matanga', 'マタンガ', '象魔', 5, 10.0, 21.0, 66, 2),
(96, 5779, 'Muu Shuwuu', 'Muu Shuwuu', 'Muu Shuwuu', 'Muu Shuwuu', 'モー・ショボー', '邪鸟木绍布', 5, 29.0, 11.0, 65, 2),
(97, 5780, 'Purbol', 'Purbol', 'Purbol', 'Purbol', 'プルボル', '紫魔花', 5, 34.0, 21.0, 65, 3),
(98, 5784, 'Steppe Anala', 'Steppe Anala', 'Anala De La Steppe', 'Steppen-Anala', 'ステップ・アナラ', '草原阿那罗', 5, 15.0, 32.0, 66, NULL),
(99, 5776, 'Steppe Dhole', 'Steppe Dhole', 'Dhole De La Steppe', 'Steppen-Dhole', 'ステップドール', '草原朵尔', 5, 28.0, 29.0, 65, 3),
(100, 5773, 'Steppe Dzo', 'Steppe Dzo', 'Hainag', 'Steppen-Dzo', 'ケナガウシ', '犏牛', 5, 30.0, 31.0, 65, 3),
(101, 5774, 'Steppe Gedan', 'Steppe Gedan', 'Gedan De La Steppe', 'Steppen-Gedan', 'ステップ・ガーダン', '草原獦狚', 5, 31.0, 25.0, 65, NULL),
(102, 5723, 'Abaddon', 'Abaddon', 'Abaddon', 'Abaddon', 'アバドン', '狱蟾蜍', 6, 25.0, 33.0, 69, 3),
(103, 5725, 'Abalathian Minotaur', 'Abalathian Minotaur', 'Minotaure D\'Abalathia', 'Abalathischer Minotaurus', 'アバラシアン・ミノタウロス', '阿拉巴提亚弥诺陶洛斯', 6, 28.0, 11.0, 69, 2),
(104, 5720, 'Chelone', 'Chelone', 'Chélone', 'Chelone', 'ケローネ', '海石龟', 6, 26.0, 14.0, 69, 2),
(105, 5727, 'Creeping Edila', 'Creeping Edila', 'Edila Rampante', 'Kriechend[a] Edila', 'クリーピング・エディラ', '爬行埃迪拉', 6, 30.0, 27.0, 69, 3),
(106, 5729, 'Dark Clay Beast', 'Dark Clay Beast', 'Bête D\'argile Des Montagnes', 'Berg-Lehmbestie', 'マウンテン・クレイビースト', '高山泥岩巨兽', 6, 5.0, 26.0, 69, 2),
(107, 5732, 'Guard Bhoot', 'Guard Bhoot', 'Bhut Gardien', 'Wächter-Bhut', 'ガード・ブフート', '浮灵守卫', 6, 24.0, 9.0, 69, 3),
(108, 5716, 'Kaluk', 'Kaluk', 'Kaluk', 'Kaluk', 'カルク', '卡栌克', 6, 12.0, 20.0, 69, 3),
(109, 5724, 'Loch Leech', 'Loch Leech', 'Sangsue Des Lacs', 'Seldsee-Egel', 'ロッホ・リーチ', '湖区水蛭', 6, 16.0, 15.0, 69, 2),
(110, 5730, 'Loch Nanka', 'Loch Nanka', 'Nanka Des Lacs', 'Seldsee-Nanka', 'ロッホ・ナンカ', '湖区南加', 6, 16.0, 20.0, 69, 1),
(111, 5717, 'Phoebad', 'Phoebad', 'Phoebad', 'Phoebad', 'フォーバッド', '弗巴德', 6, 23.0, 21.0, 69, 3),
(112, 5731, 'Salt Anila', 'Salt Anila', 'Anila De Sel', 'Salz-Anila', 'ソルト・アニラ', '盐湖阿尼罗', 6, 5.0, 15.0, 69, NULL),
(113, 5718, 'Salt Dhara', 'Salt Dhara', 'Dhara De Sel', 'Salz-Dhara', 'ソルト・ダラ', '盐湖驼罗', 6, 10.0, 25.0, 69, NULL),
(114, 5722, 'Salt Dhruva', 'Salt Dhruva', 'Dhruva De Sel', 'Salz-Dhruva', 'ドルヴァ', '陀鲁婆', 6, 29.0, 23.0, 69, 3),
(115, 5721, 'Soblyn', 'Soblyn', 'Soblyn', 'Sobalos', 'ソブラン', '盐爬虫', 6, 13.0, 23.0, 69, 2),
(116, 5728, 'Specter', 'Specter', 'Spector', 'Schemen', 'スペクター', '妖影', 6, 18.0, 8.0, 69, 3),
(117, 5726, 'Vepar', 'Vepar', 'Vepar', 'Vepar', 'ヴェパル', '魔陆鱼', 6, 24.0, 30.0, 69, 2),
(118, 5719, 'Yabby', 'Yabby', 'Thalassina', 'Yabby', 'タラシナ', '虾蛄', 6, 19.0, 25.0, 69, 1);

--
-- Triggers `mobs_sb`
--
DELIMITER $$
CREATE TRIGGER `mob_sb_del` AFTER DELETE ON `mobs_sb` FOR EACH ROW BEGIN
	CALL update_etag('distances_sb');
	CALL update_etag('mobs_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_sb_ins` AFTER INSERT ON `mobs_sb` FOR EACH ROW BEGIN
	CALL update_etag('distances_sb');
	CALL update_etag('mobs_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_sb_upd` AFTER UPDATE ON `mobs_sb` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_sb');
    END IF;
	CALL update_etag('mobs_sb');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mobs_shb`
--

CREATE TABLE `mobs_shb` (
  `id` int(10) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `id_zone` tinyint(4) NOT NULL,
  `x` decimal(3,1) UNSIGNED DEFAULT NULL,
  `y` decimal(3,1) UNSIGNED DEFAULT NULL,
  `z` decimal(3,1) DEFAULT NULL,
  `lvl` tinyint(3) DEFAULT NULL,
  `slain` tinyint(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mobs_shb`
--

INSERT INTO `mobs_shb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `id_zone`, `x`, `y`, `z`, `lvl`, `slain`) VALUES
(1, 8507, 'Hoptrap', 'Hoptrap', 'saute-piège', 'Sprungfalle', 'ホップトラップ', '阱蛇麻', 1, 35.6, 24.1, 0.1, 71, 3),
(2, 8502, 'Violet Triffid', 'Violet Triffid', 'triffide violet', 'violett[a] Triffid', 'ヴァイオレット・トリフィド', '紫罗兰三尖树', 1, 35.3, 25.4, 0.1, 71, NULL),
(3, 8500, 'Giant Iguana', 'Giant Iguana', 'iguane géant', 'Riesenleguan', 'ジャイアント・イグアナ', '巨型鬣蜥', 1, 27.0, 28.6, 0.0, 71, NULL),
(4, 8407, 'Wolverine', 'Wolverine', 'wolvérène féroce', 'wild[a] Vielfraß', 'ウルヴァリン', '貂熊', 1, 27.8, 36.8, 0.1, 71, 2),
(5, 8514, 'Ya-te-veo', 'Ya-te-veo', 'yateveo', 'Yateveo', 'ヤテベオ', '食人花', 1, 32.9, 19.2, 0.1, 71, 3),
(6, 8499, 'Grey Draco', 'Grey Draco', 'draco gris', 'grau[a] Draco', 'グレイ・ドラコ', '灰蜥龙', 1, 37.1, 16.6, 0.4, 71, NULL),
(7, 8505, 'White Gremlin', 'White Gremlin', 'gremlin blanc', 'weiß[a] Gremlin', 'ホワイト・グレムリン', '白色格雷姆林', 1, 33.6, 12.3, 0.5, 71, 2),
(8, 8515, 'Proterosuchus', 'Proterosuchus', 'proterosuchus', 'Proterosuchus', 'プロテロスクス', '古鳄', 1, 28.4, 17.8, 1.1, 71, 1),
(9, 8516, 'Elven Knight', 'Elven Knight', 'chevalier elfe', 'Elfenritter', 'エルヴンナイト', '菁灵骑士', 1, 26.2, 17.5, 1.5, 71, NULL),
(10, 8513, 'Irrlicht', 'Irrlicht', 'Irrlicht', 'Irrwisch', 'イルリヒト', '迷光', 1, 25.6, 17.2, 1.5, 71, NULL),
(11, 8512, 'Coelurosaur', 'Coelurosaur', 'coelurosaure', 'Coelurosaurus', 'コエルロサウルス', '虚骨龙', 1, 22.7, 11.7, 1.0, 71, NULL),
(12, 8504, 'Wetland Warg', 'Wetland Warg', 'warg des plaines humides', 'Sumpfwarg', 'ウェットランド・ワーグ', '湿地座狼', 1, 22.4, 21.0, 0.0, 71, 2),
(13, 8506, 'Silkmoth', 'Silkmoth', 'bombyx', 'Seidenmotte', 'シルクモス', '丝蛾', 1, 10.4, 15.5, 0.2, 71, NULL),
(14, 8786, 'Lake Viper', 'Lake Viper', 'vipère lacustre', 'Seeviper', 'レイクバイパー', '湖畔蝰蛇', 1, 15.6, 22.1, 0.0, 71, 2),
(15, 8498, 'Chiliad Cama', 'Chiliad Cama', 'chama des mille Lacis', 'Chiliad Cama', 'チリアド・キャマ', '千年卡玛', 1, 17.8, 9.5, 0.9, 71, 2),
(16, 8439, 'Smilodon', 'Smilodon', 'smilodon affamé', 'ausgehungert[a] Smilodon', 'スミロドン', '斯剑虎', 1, 10.5, 12.3, 0.6, 71, 2),
(17, 8509, 'Zonure', 'Zonure', 'zonure', 'Zonure', 'ゾヌール', '缠尾蛟', 1, 11.5, 16.9, 0.1, 71, NULL),
(18, 8501, 'Lake Anemone', 'Lake Anemone', 'anémone lacustre', 'Seeanemone', 'レイク・アネモネ', '湖畔风花', 1, 10.2, 20.3, 0.0, 71, NULL),
(19, 8518, 'Hobgoblin', 'Hobgoblin', 'hobgobelin', 'Hobgoblin', 'ホブゴブリン', '大哥布林', 2, 34.1, 30.5, 0.0, 70, 3),
(20, 8523, 'Maultasche', 'Maultasche', 'maultasche', 'Maultasch', 'マウルタッシュ', '饭袋猩猩', 2, 36.0, 29.3, 0.0, 70, 2),
(21, 8536, 'Whiptail', 'Whiptail', 'fouette-queue', 'Peitschenschwanz', 'ウィップテール', '鞭尾跳蜥', 2, 35.5, 24.7, 0.3, 70, 3),
(22, 8521, 'Kholusian Iguana', 'Kholusian Iguana', 'iguane de Kholusia', 'Kholusia-Leguan', 'コルシアイグアナ', '珂露西亚鬣蜥', 2, 29.4, 28.8, 0.1, 70, NULL),
(23, 8539, 'Tragopan', 'Tragopan', 'tragopan', 'Tragopan', 'トラゴパン', '角雉', 2, 26.2, 29.4, 0.1, 70, NULL),
(24, 8542, 'Germinant', 'Germinant', 'germinateur', 'Germinant', 'ジェルミナンツ', '发芽大口花', 2, 26.9, 32.8, 0.2, 70, 2),
(25, 8531, 'Toucalibri', 'Toucalibri', 'toucanlibri', 'Tukalibri', 'トゥカリブリ', '巨喙蜂鸟', 2, 15.9, 31.4, 0.1, 70, NULL),
(26, 8532, 'Wood Eyes', 'Wood Eyes', 'œil des bois', 'Waldwandler', 'ウッドアイズ', '林眼树精', 2, 15.4, 32.5, 0.1, 70, 2),
(27, 8787, 'Big Claw', 'Big Claw', 'grosse pince', 'Mörderkrabbe', 'ビッグクロウ', '大螯陆蟹', 2, 7.4, 33.1, 0.0, 70, NULL),
(28, 8534, 'Kholusian Bison', 'Kholusian Bison', 'bison de Kholusia', 'Kholusia-Büffel', 'コルシア・バイソン', '珂露西亚野牛', 2, 10.7, 29.8, 0.2, 70, 2),
(29, 8537, 'Lowland Hyssop', 'Lowland Hyssop', 'hyssop des basses terres', 'Tiefland-Ysop', 'ロウランド・ヒソプ', '低地海索草', 2, 14.1, 28.2, 0.1, 70, NULL),
(30, 8525, 'Island Rail', 'Island Rail', 'râle insulaire', 'Inselralle', 'アイランド・レイル', '岛屿秧鸡', 2, 18.1, 28.4, 0.1, 70, 3),
(31, 8533, 'Island Wolf', 'Island Wolf', 'loup insulaire', 'Inselwolf', 'アイランド・ウルフ', '岛屿黑狼', 2, 28.1, 23.2, 0.3, 70, 3),
(32, 8529, 'Scree Gnome', 'Scree Gnome', 'gnome des plateaux', 'Schreignom', 'スクリー・ノーム', '碎石诺姆', 2, 8.3, 16.8, 3.6, 78, 1),
(33, 8526, 'Hobgoblin Guard', 'Hobgoblin Guard', 'garde hobgobelin', 'Hobgoblin-Wache', 'ホブゴブリン・ガード', '大哥布林守卫', 2, 25.2, 8.8, 3.4, 78, NULL),
(34, 8527, 'Cliffkite', 'Cliffkite', 'milan des falaises', 'Gratgleiter', 'クリフカイト', '壁崖鼹鼠', 2, 17.4, 9.1, 4.3, 78, 2),
(35, 8528, 'Cliffmole', 'Cliffmole', 'taupe des falaises', 'Klippenmull', 'クリフモール', '壁崖飞鸢', 2, 27.2, 11.6, 3.1, 78, 2),
(36, 8519, 'Calx', 'Calx', 'calx', 'Calx', 'カルックス', '石灰灵', 2, 18.1, 8.0, 4.4, 78, NULL),
(37, 8541, 'Gulgnu', 'Gulgnu', 'goulgnou', 'Gulgnu', 'グルグヌー', '格鲁格角马', 2, 19.1, 7.6, 4.4, 78, 3),
(38, 8245, 'Huldu', 'Huldu', 'huldu du puits', 'Brunnen-Huldu', 'ウェル・フルドゥ', '爆岩怪', 2, 12.7, 11.1, 4.0, 78, 3),
(39, 8517, 'Ironbeard', 'Ironbeard', 'automate nain', 'Eisenbart', 'ドワーヴン・オートマトン', '矮人自走人偶', 2, 29.8, 16.9, 2.9, 78, 1),
(40, 8540, 'Saichania', 'Saichania', 'saichania', 'Saichania', 'サイカニア', '美甲兽', 2, 12.5, 13.5, 3.7, 78, NULL),
(41, 8520, 'Defective Talos', 'Defective Talos', 'talos défectueux', 'fehlerhaft[a] Talos', 'デフェクティブ・タロース', '次品塔罗斯', 2, 13.8, 18.8, 3.3, 78, 2),
(42, 8535, 'Gulg Knocker', 'Gulg Knocker', 'frappeur du mont Gulg', 'Gulg-Klopfer', 'グルグ・ノッカー', '格鲁格敲石虫', 2, 28.9, 13.8, 3.1, 78, NULL),
(43, 8522, 'Sulfur Byrgen', 'Sulfur Byrgen', 'byrgen de sulfure', 'Schwefelspross', 'サルファー・ビルゲン', '硫磺坟灵', 2, 34.2, 10.8, 2.8, 78, 1),
(44, 8543, 'Desert Armadillo', 'Desert Armadillo', 'tatou du désert', 'Wüsten-Gürteltier', 'デザート・アルマジロ', '荒漠犰狳', 3, 32.9, 9.8, 0.6, 70, NULL),
(45, 8547, 'Gigantender', 'Gigantender', 'gigapampa', 'Riesenkaktor', 'ギガテンダー', '巨人掌', 3, 31.7, 10.9, 0.5, 70, 1),
(46, 8405, 'Sibilus', 'Sibilus', 'sibilus sablon', 'Sandhaut-Sibilus', 'サンドスキン・シビルス', '蛇蜥蜴', 3, 29.8, 13.3, 0.8, 70, NULL),
(47, 8551, 'Tolba', 'Tolba', 'tolba', 'Tolba', 'トルバ', '托儿巴龟', 3, 29.7, 20.2, 0.9, 70, NULL),
(48, 8556, 'Sand Mole', 'Sand Mole', 'taupe des sables', 'Sandmull', 'サンドモール', '沙鼹鼠', 3, 29.7, 20.2, 0.9, 70, 3),
(49, 8549, 'Amber Iguana', 'Amber Iguana', 'iguane d\'ambre', 'Bernsteinleguan', 'アンバーイグアナ', '琥珀鬣蜥', 3, 13.3, 13.6, 1.1, 76, NULL),
(50, 8552, 'Ovim Billy', 'Ovim Billy', 'bouquetin ovim', 'Ovim-Bock', 'オヴィム・ビリー', '公力山羊', 3, 14.7, 13.7, 1.2, 76, NULL),
(51, 8565, 'Phorusrhacos', 'Phorusrhacos', 'phorusrhacos', 'Phorusrhacos', 'フォルスラコス', '恐鹤', 3, 14.7, 13.8, 1.2, 76, 2),
(52, 8369, 'Gnome', 'Gnome', 'gnome des mines', 'Minengnom', 'ノーム', '诺姆', 3, 20.3, 10.2, 1.6, 76, 2),
(53, 8566, 'Desert Coyote', 'Desert Coyote', 'coyote', 'Kojote', 'コヨーテ', '郊狼', 3, 20.8, 10.0, 1.6, 76, 1),
(54, 8561, 'Debitage', 'Debitage', 'débitage', 'Geröllhauser', 'デビタージュ', '废片', 3, 13.7, 17.4, 1.4, 76, 1),
(55, 8557, 'Thistle Mole', 'Thistle Mole', 'taupépine', 'Dornenmull', 'スパイクモール', '棘刺鼹鼠 ', 3, 11.9, 19.2, 1.4, 76, 2),
(56, 8790, 'Dryspine Gigantender', 'Dryspine Gigantender', 'gigapampa à épines sèches', 'ausgedörrt[a] Riesenkaktor', 'ドライスパイン・ギガテンダー', '干刺巨人掌', 3, 17.3, 20.7, 1.1, 76, NULL),
(57, 8545, 'Evil Weapon', 'Evil Weapon', 'arme maligne', 'Bös[a] Waffe', 'イビルウェポン', '恶魔并', 3, 18.3, 21.2, 1.0, 76, 2),
(58, 8564, 'Harvester', 'Harvester', 'récolteur', 'Ernter', 'ハーベスター', '收割蟹', 3, 17.9, 22.8, 0.9, 76, NULL),
(59, 8568, 'Megalobat', 'Megalobat', 'chauve-souris mégalo', 'Megalomaus', 'メガロバット', '大型蝙蝠', 3, 13.3, 22.1, 1.3, 76, NULL),
(60, 8567, 'Molamander', 'Molamander', 'salataupe', 'Molamander', 'モラマンダー', '摩拉曼达', 3, 23.5, 31.6, 0.1, 77, 3),
(61, 8563, 'Flame Zonure', 'Flame Zonure', 'zonure des flammes', 'lohend[a] Zonure', 'フレイム・ゾヌール', '火焰缠尾蛟', 3, 24.2, 34.5, 0.4, 77, 2),
(62, 8546, 'Long-tailed Armadillo', 'Long-tailed Armadillo', 'tatou longue-queue', 'Panzerschwanz-Gürteltier', 'ロングテール・アルマジロ', '长尾犰狳', 3, 17.6, 29.9, 0.5, 77, NULL),
(63, 8544, 'Masterless Talos', 'Masterless Talos', 'talos sans maître', 'herrenlos[a] Talos', 'マスターレス・タロース', '无主塔罗斯', 3, 12.3, 30.6, 0.3, 77, NULL),
(64, 8151, 'Echevore', 'Echevore', 'échevore de Dohn Mheg', 'Dohn-Echevore', 'エケボア', '石莲猬', 4, 14.8, 34.7, 0.7, 72, 3),
(65, 8585, 'Rosebear', 'Rosebear', 'ours-rose', 'Rosenbär', 'ローズベアー', '玫瑰熊', 4, 19.9, 32.8, 0.2, 72, 1),
(66, 8153, 'Undine', 'Undine', 'ondine de Dohn Mheg', 'Dohn-Undine', 'ドォーヌ・ウンディーネ', '温蒂尼', 4, 21.1, 30.7, 0.1, 72, NULL),
(67, 8589, 'Psammead', 'Psammead', 'psammead', 'Samiad', 'サミアド', '赛米德', 4, 11.3, 36.6, 1.2, 72, NULL),
(68, 8155, 'Flower Basket', 'Flower Basket', 'panier fleuri', 'Blumenkorb', 'フラワーバスケット', '花束篮筐', 4, 9.5, 31.0, 0.7, 72, 2),
(69, 8156, 'Etainmoth', 'Etainmoth', 'noctuétain de Dohn Mheg', 'Dohn-Edianmotte', 'エーディンモス', '爱蒂恩蛾', 4, 14.0, 26.5, 0.2, 72, 1),
(70, 8571, 'Garden Anemone', 'Garden Anemone', 'anémone des jardins', 'Garten-Anemone', 'ガーデン・アネモネ', '庭园风花', 4, 15.1, 25.3, 0.0, 72, NULL),
(71, 8788, 'Blood Morpho', 'Blood Morpho', 'morpho sang', 'Blut-Morpho', 'ブラッドモルフォ', '血闪蝶', 4, 10.2, 23.1, 0.3, 72, NULL),
(72, 5891, 'Purple Morpho', 'Purple Morpho', 'morpho violet', 'Purpur-Morpho', 'パープルモルフォ', '紫闪蝶', 4, 10.2, 23.1, 0.3, 72, NULL),
(73, 8581, 'Hawker', 'Hawker', 'æschne', 'Mosaikjungfer', 'ホーカー', '鹰蜓', 4, 9.7, 20.1, 0.1, 72, 1),
(74, 8590, 'Killer Bee', 'Killer Bee', 'abeille tueuse', 'Killerbiene', 'キラービー', '杀人蜂', 4, 11.0, 16.6, 0.2, 72, 1),
(75, 8588, 'Witchweed', 'Witchweed', 'herbe des sorcières', 'Hexenkraut', 'ウィッチウィード', '独脚金', 4, 14.2, 11.5, 0.8, 73, NULL),
(76, 8152, 'Moss Fungus', 'Moss Fungus', 'mycose moisie de Dohn Mheg', 'Dohn-Moosfungus', 'モスフングス', '苔菇', 4, 19.4, 8.8, 0.5, 73, 2),
(77, 8582, 'Rainbow Lorikeet', 'Rainbow Lorikeet', 'loriquet arc-en-ciel', 'Regenbogen-Lorikeet', 'レインボー・ロリキート', '彩虹鹦鹉', 4, 24.4, 7.8, 0.7, 73, 1),
(78, 8586, 'Garden Crocota', 'Garden Crocota', 'crocotta des jardins', 'Garten-Crocuta', 'ガーデン・コロコッタ', '庭园犬狮', 4, 27.2, 6.2, 0.8, 73, 2),
(79, 8587, 'Werewood', 'Werewood', 'arbre-garou', 'lebend[a] Ebenhöh', 'ウェアウッド', '变种树', 4, 30.1, 4.8, 0.9, 73, 2),
(80, 8584, 'Rabbit\'s Tail', 'Rabbit\'s Tail', 'queue-de-lièvre', 'Hasenbommel', 'ラビットテール', '兔尾', 4, 32.0, 10.4, 0.9, 73, 1),
(81, 8583, 'Tot Aevis', 'Tot Aevis', 'toteibis', 'Schillermähnen-Avis', 'トートエイビス', '幼体龙鸟', 4, 31.3, 11.2, 0.8, 73, 1),
(82, 8577, 'Green Glider', 'Green Glider', 'planeur vert', 'grün[a] Gleiter', 'グリーングライダー', '绿飘龙', 4, 28.9, 12.6, 0.6, 73, 2),
(83, 8574, 'Garden Porxie', 'Garden Porxie', 'porxie des jardins', 'Garten-Quiexie', 'ガーデン・ポークシー', '庭园仙子猪', 4, 31.0, 14.7, 0.9, 73, 1),
(84, 8573, 'Nu Mou Potter', 'Nu Mou Potter', 'potier nu mou', 'Bücherwurm[p] der Nu Mou', 'ン・モゥ・ポッター', '恩莫闲人', 4, 31.8, 16.5, 0.9, 73, NULL),
(85, 8572, 'Nu Mou Fungimancer', 'Nu Mou Fungimancer', 'fongimancien nu mou', 'Fungimant[p] der Nu Mou', 'ン・モゥ・フンギマンサー', '恩莫菌菇术士', 4, 31.3, 16.7, 0.9, 73, NULL),
(86, 8575, 'Phooka', 'Phooka', 'phooka', 'Phookah', 'プーカ', '普卡精', 4, 20.1, 17.1, 1.0, 73, 1),
(87, 8457, 'Tomatl', 'Tomatl', 'tomatl tueur', 'Killertomatl', 'キラートマトル', '酸浆果', 5, 10.1, 19.6, 0.1, 74, 2),
(88, 8609, 'Helm Beetle', 'Helm Beetle', 'coccinelle casquée', 'Helmkäfer', 'ヘルムビートル', '盔甲虫', 5, 15.6, 28.5, 0.0, 74, 2),
(89, 8600, 'Vampire Vine', 'Vampire Vine', 'vigne vampire', 'Vampirranke', 'ヴァンパイアヴァイン', '吸血藤树', 5, 15.2, 28.4, 0.0, 74, 2),
(90, 8456, 'Atrociraptor', 'Atrociraptor', 'atrociraptor décharné', 'ausgemergelt[a] Atrociraptor', 'アトロシラプトル', '野蛮盗龙', 5, 12.6, 35.5, -0.1, 74, NULL),
(91, 8591, 'Djinn', 'Djinn', 'djinn', 'Dschinn', 'ジン', '镇尼', 5, 14.8, 25.1, 0.1, 74, NULL),
(92, 8615, 'Forest Flamingo', 'Forest Flamingo', 'flamant rose des forêts', 'Waldflamingo', 'フォレスト・フラミンゴ', '丛林红鹳', 5, 17.7, 20.6, 0.1, 74, NULL),
(93, 8611, 'Wild Swine', 'Wild Swine', 'cochon sauvage', 'rasend[a] Wildschwein', 'ワイルドスワイン', '狂野豚猪', 5, 16.9, 19.7, 0.2, 74, 2),
(94, 8605, 'Hoarmite', 'Hoarmite', 'foamite', 'Hoarmit', 'ホーマイト', '霜蛛蝎', 5, 12.7, 22.3, 0.1, 74, NULL),
(95, 8613, 'Vampire Cup', 'Vampire Cup', 'coupe du vampire', 'Vampirkelch', 'ヴァンパイアカップ', '吸血草杯', 5, 9.6, 21.3, -0.1, 74, NULL),
(96, 8614, 'Woodbat', 'Woodbat', 'chauve-souris des bois', 'Waldfledermaus', 'ウッドバット', '森林蝙蝠', 5, 8.2, 15.9, 0.3, 74, 2),
(97, 8594, 'Dreamer of the Everlasting Dark', 'Dreamer of the Everlasting Dark', 'endormeur des Ténèbres éternelles', 'Traummagier[p] der Ewigen Dunkelheit', '常闇の夢使い', '永暗梦术师', 5, 6.1, 16.4, 0.3, 74, NULL),
(98, 8593, 'Doomsayer of the Everlasting Dark', 'Doomsayer of the Everlasting Dark', 'ensorceleur des Ténèbres éternelles', 'Fluchmagier[p] der Ewigen Dunkelheit', '常闇の呪使い', '永暗咒术师', 5, 6.1, 16.4, 0.3, 74, NULL),
(99, 8595, 'Dart of the Everlasting Dark', 'Dart of the Everlasting Dark', 'maître d\'hast des Ténèbres éternelles', 'Lanzenkämpfer[p] der Ewigen Dunkelheit', '常闇の槍使い', '永暗枪术师', 5, 5.2, 17.0, 0.3, 74, NULL),
(100, 8459, 'Gizamaluk', 'Gizamaluk', 'jeune gisamark', 'brütend[a] Gizamaluk', 'ギザマルーク', '基札玛路克', 5, 26.6, 29.5, 0.2, 75, 1),
(101, 8612, 'Caracal', 'Caracal', 'caracal', 'Calacal', 'カラカル', '狞猫', 5, 25.0, 29.2, -0.2, 75, 1),
(102, 8597, 'Forest Echo', 'Forest Echo', 'écho', 'Wald-Echo', 'エコー', '回声', 5, 25.3, 28.0, -0.1, 75, 2),
(103, 8287, 'Snapweed', 'Snapweed', 'balsamine artificielle', 'erzeugt[a] Springkraut', 'スナップウィード', '捕捉草', 5, 32.1, 24.2, 0.2, 75, 1),
(104, 8607, 'Blue Deer Stag', 'Blue Deer Stag', 'daim bleu', 'Blauantilopenbock', 'ブルーディアー・スタッグ', '雄蓝鹿', 5, 32.4, 20.7, 0.1, 75, NULL),
(105, 8608, 'Blue Deer Doe', 'Blue Deer Doe', 'daine bleue', 'Blauantilopenkuh', 'ブルーディアー・ドゥ', '雌蓝鹿', 5, 32.5, 21.1, 0.2, 75, NULL),
(106, 8789, 'Cracked Ronkan Vessel', 'Cracked Ronkan Vessel', 'réceptacle ronka fissuré', 'kaputt[a] Ruinenquader', 'クラックド・ロンカヴェッセル', '破裂的隆卡器皿', 5, 28.4, 14.3, -0.1, 75, 1),
(107, 8598, 'Cracked Ronkan Doll', 'Cracked Ronkan Doll', 'poupée ronka fissurée', 'kaputt[a] Ronka-Totem', 'クラックド・ロンカドール', '破裂的隆卡人偶', 5, 27.6, 13.6, -0.1, 75, 1),
(108, 8599, 'Cracked Ronkan Thorn', 'Cracked Ronkan Thorn', 'épine ronka fissurée', 'kaputt[a] Ruinenquadroquader', 'クラックド・ロンカソーン', '破裂的隆卡石蒺藜', 5, 27.2, 12.8, -0.2, 75, 1),
(109, 8610, 'Floor Mandrill', 'Floor Mandrill', 'mandrill métayer', 'Erd-Mandrill', 'フロア・マンドリル', '地山魈', 5, 33.7, 16.4, -0.5, 75, 1),
(110, 8466, 'Tarichuk', 'Tarichuk', 'tarichuk déplumé', 'gehäutet[a] Tarichuk', 'タリチャック', '塔里丘魔鸟', 5, 25.2, 21.7, 0.2, 75, 1),
(111, 8601, 'Greatwood Rail', 'Greatwood Rail', 'râle de forêt', 'Waldralle', 'グレートウッドレイル', '大森林秧鸡', 5, 22.6, 7.1, -0.2, 75, NULL),
(112, 8631, 'Blue Swimmer', 'Blue Swimmer', 'crabe nageur', 'Schwimmkrabbe', 'スイミングクラブ', '泳蟹', 6, 36.7, 7.8, -1.0, 79, 1),
(113, 8277, 'Clionid', 'Clionid', 'clionide artificielle', 'erzeugt[a] Clionid', 'クリオニッド', '冰海天使', 6, 26.7, 7.3, -1.7, 79, NULL),
(114, 8630, 'Tempest Swallow', 'Tempest Swallow', 'hirondelle de La Tempête', 'Sturmschwalbe', 'テンペストスワロー', '黑风海燕', 6, 29.2, 16.6, -2.0, 79, 1),
(115, 8314, 'Dagon', 'Dagon', 'dagon fétide', 'faulig[a] Dagon', 'ダゴン', '大衮', 6, 28.6, 14.0, -1.9, 79, 1),
(117, 8626, 'Trilobite', 'Trilobite', 'trilobite', 'Trilobit', 'トリロバイト', '三叶虫', 6, 36.0, 14.6, -1.6, 79, 2),
(118, 8633, 'Mnyiri', 'Mnyiri', 'mnyiri', 'Myniri', 'ムニリ', '触手鮟', 6, 31.3, 7.9, -1.5, 79, NULL),
(119, 5139, 'Morgawr', 'Morgawr', 'Morgawr', 'Aquapolis-Morgawr', 'モーゴウル', '莫高海怪', 6, 31.1, 21.1, -1.9, 79, 1),
(120, 8315, 'Nauplius', 'Nauplius', 'nauplius purpurin', 'Purpur-Nauplius', 'プルプラ・ナウプリウス', '无节幼体', 6, 30.8, 15.6, -2.4, 79, NULL),
(121, 8629, 'Sea Gelatin', 'Sea Gelatin', 'gélatine de mer', 'Meeresgelatine', 'シーゼラチン', '海胶螺', 6, 27.5, 8.4, -1.8, 79, 1),
(122, 8319, 'Hydrozoan', 'Hydrozoan', 'hydrozoaire furibond', 'erzürnt[a] Hydrozoa', 'ロス・ヒドロゾア', '水螅虫', 6, 19.5, 11.8, -1.6, 79, NULL),
(123, 8333, 'Mantis Shrimp', 'Mantis Shrimp', 'squille pondeuse', 'laichend[a] Mantis-Garnele', 'スポーニング・マンティスシュリンプ', '螳螂虾', 6, 18.8, 14.5, -2.0, 79, NULL),
(124, 8329, 'Sea Anemone', 'Sea Anemone', 'anémone des profondeurs', 'Tiefsee-Anemone', 'ディープシーアネモネ', '海风花', 6, 24.5, 17.7, -3.5, 79, NULL),
(125, 8627, 'Stingray', 'Stingray', 'raie', 'Stachelrochen', 'スティングレイ', '刺魟', 6, 15.5, 17.7, -4.3, 79, NULL),
(126, 8624, 'Urchinfish', 'Urchinfish', 'hérisson de mer', 'Igelfisch', 'アーチンフィッシュ', '海胆', 6, 9.8, 16.4, -4.3, 79, NULL),
(127, 8279, 'Danbania', 'Danbania', 'dambanha artificiel', 'erzeugt[a] Danbania', 'ダンバニア', '刺枪鱼', 6, 6.3, 13.5, -4.7, 79, NULL),
(128, 8621, 'Cubus', 'Cubus', 'oléofuror', 'Kubus', 'カブス', '卡部斯', 6, 21.9, 36.3, -8.2, 79, 1),
(129, 8555, 'Shorttail Sibilus', 'Shorttail Sibilus', 'sibilus courte-queue', 'Kurzschwanz-Sibilus', 'ショートテイル・シビルス', '短尾蛇蜥蜴', 3, 30.4, 15.9, 0.8, 70, NULL),
(130, 8558, 'Scissorjaws', 'Scissorjaws', 'mandicisaille', 'Scherenmaul', 'シザージョウ', '铰颌蚁', 3, 31.4, 26.1, 0.7, 70, 1),
(131, 8548, 'Ngozi', 'Ngozi', 'ngozi', 'Ngozi', 'ンゴツィ', '恩戈齐', 3, 31.8, 25.5, 0.6, 70, NULL),
(132, 8550, 'Ancient Lizard', 'Ancient Lizard', 'lézard ancestral', 'uralt[a] Eidechse', 'エンシェント・リザード', '古代蜥蜴', 3, 31.9, 27.2, 0.6, 70, 3),
(133, 8562, 'Ghilman', 'Ghilman', 'ghilman', 'Ghulam', 'グラーム', '古拉姆', 3, 27.2, 30.3, 0.4, 70, 1),
(134, 8560, 'Sandsucker', 'Sandsucker', 'mange-sable', 'Sandschlucker', 'サンドイーター', '噬沙蠕虫', 3, 27.9, 25.4, 0.7, 70, NULL),
(135, 8503, 'Gnole', 'Gnole', 'gnole', 'Gnoll', 'ノール', '异豺', 1, 14.2, 16.5, 0.2, 71, 1),
(136, 8538, 'Highland Hyssop', 'Highland Hyssop', 'hyssop des hautes terres', 'Hochland-Ysop', 'ハイランド・ヒソプ', '高地海索草', 2, 23.9, 10.4, 3.6, 78, 3),
(116, 8328, 'Amphisbaena', 'Amphisbaena', 'amphisbène perlé', 'alt[a] Amphisbaena', 'アンフィスバエナ', '双向海龙', 6, 36.6, 12.9, -1.5, 79, 1);

--
-- Triggers `mobs_shb`
--
DELIMITER $$
CREATE TRIGGER `mob_shb_del` AFTER DELETE ON `mobs_shb` FOR EACH ROW BEGIN
	CALL update_etag('distances_shb');
	CALL update_etag('mobs_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_shb_ins` AFTER INSERT ON `mobs_shb` FOR EACH ROW BEGIN
	CALL update_etag('distances_shb');
	CALL update_etag('mobs_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `mob_shb_upd` AFTER UPDATE ON `mobs_shb` FOR EACH ROW BEGIN
	IF NEW.x <> OLD.x OR NEW.y <> OLD.y OR NEW.id_zone <> OLD.id_zone THEN
		CALL update_etag('distances_shb');
    END IF;
	CALL update_etag('mobs_shb');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `region_arr`
--

CREATE TABLE `region_arr` (
  `id` tinyint(4) UNSIGNED NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region_arr`
--

INSERT INTO `region_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`) VALUES
(1, 22, 'La Noscea', 'La Noscea', 'Noscea', 'La Noscea', 'ラノシア', NULL),
(2, 23, 'The Black Shroud', 'The Black Shroud', 'Forêt De Sombrelinceul', 'Finsterwald', '黒衣森', NULL),
(3, 24, 'Thanalan', 'Thanalan', 'Thanalan', 'Thanalan', 'ザナラーン', NULL),
(4, 25, 'Coerthas', 'Coerthas', 'Coerthas', 'Coerthas', 'クルザス', NULL),
(5, 26, 'Mor Dhona', 'Mor Dhona', 'Mor Dhona', 'Mor Dhona', 'モードゥナ', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zones_arr`
--

CREATE TABLE `zones_arr` (
  `id` tinyint(4) NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `size_x` decimal(3,1) UNSIGNED NOT NULL DEFAULT '41.9',
  `size_y` decimal(3,1) UNSIGNED NOT NULL DEFAULT '41.9',
  `id_region` tinyint(4) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_arr`
--

INSERT INTO `zones_arr` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `size_x`, `size_y`, `id_region`) VALUES
(1, 30, 'Middle La Noscea', 'Middle La Noscea', 'Noscea Centrale', 'Zentrales La Noscea', '中央ラノシア', NULL, 41.9, 41.9, 1),
(2, 31, 'Lower La Noscea', 'Lower La Noscea', 'Basse-Noscea', 'Unteres La Noscea', '低地ラノシア', NULL, 41.9, 41.9, 1),
(3, 32, 'Eastern La Noscea', 'Eastern La Noscea', 'Noscea Orientale', 'Östliches La Noscea', '東ラノシア', NULL, 41.9, 41.9, 1),
(4, 33, 'Western La Noscea', 'Western La Noscea', 'Noscea Occidentale', 'Westliches La Noscea', '西ラノシア', NULL, 41.9, 41.9, 1),
(5, 34, 'Upper La Noscea', 'Upper La Noscea', 'Haute-Noscea', 'Oberes La Noscea', '高地ラノシア', NULL, 41.9, 41.9, 1),
(6, 350, 'Outer La Noscea', 'Outer La Noscea', 'Noscea Extérieure', 'Äußeres La Noscea', '外地ラノシア', NULL, 41.9, 41.9, 1),
(7, 54, 'Central Shroud', 'Central Shroud', 'Forêt Centrale', 'Tiefer Wald', '黒衣森：中央森林', NULL, 41.9, 41.9, 2),
(8, 55, 'East Shroud', 'East Shroud', 'Forêt De L\'est', 'Ostwald', '黒衣森：東部森林', NULL, 41.9, 41.9, 2),
(9, 56, 'South Shroud', 'South Shroud', 'Forêt Du Sud', 'Südwald', '黒衣森：南部森林', NULL, 41.9, 41.9, 2),
(10, 57, 'North Shroud', 'North Shroud', 'Forêt Du Nord', 'Nordwald', '黒衣森：北部森林', NULL, 41.9, 41.9, 2),
(11, 42, 'Western Thanalan', 'Western Thanalan', 'Thanalan Occidental', 'Westliches Thanalan', '西ザナラーン', NULL, 41.9, 41.9, 3),
(12, 43, 'Central Thanalan', 'Central Thanalan', 'Thanalan Central', 'Zentrales Thanalan', '中央ザナラーン', NULL, 41.9, 41.9, 3),
(13, 44, 'Eastern Thanalan', 'Eastern Thanalan', 'Thanalan Oriental', 'Östliches Thanalan', '東ザナラーン', NULL, 41.9, 41.9, 3),
(14, 45, 'Southern Thanalan', 'Southern Thanalan', 'Thanalan Méridional', 'Südliches Thanalan', '南ザナラーン', NULL, 41.9, 41.9, 3),
(15, 46, 'Northern Thanalan', 'Northern Thanalan', 'Thanalan Septentrional', 'Nördliches Thanalan', '北ザナラーン', NULL, 41.9, 41.9, 3),
(16, 63, 'Coerthas Central Highlands', 'Coerthas Central Highlands', 'Hautes Terres Du Coerthas Central', 'Zentrales Hochland Von Coerthas', 'クルザス中央高地', NULL, 41.9, 41.9, 4),
(17, 67, 'Mor Dhona', 'Mor Dhona', 'Mor Dhona', 'Mor Dhona', 'モードゥナ', NULL, 41.9, 41.9, 5);

--
-- Triggers `zones_arr`
--
DELIMITER $$
CREATE TRIGGER `zones_arr_del` AFTER DELETE ON `zones_arr` FOR EACH ROW BEGIN
	CALL update_etag('zones_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_arr_ins` AFTER INSERT ON `zones_arr` FOR EACH ROW BEGIN
	CALL update_etag('zones_arr');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_arr_upd` AFTER UPDATE ON `zones_arr` FOR EACH ROW BEGIN
	CALL update_etag('zones_arr');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `zones_hw`
--

CREATE TABLE `zones_hw` (
  `id` tinyint(4) NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `size_x` decimal(3,1) UNSIGNED NOT NULL,
  `size_y` decimal(3,1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_hw`
--

INSERT INTO `zones_hw` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `size_x`, `size_y`) VALUES
(1, 2200, 'Coerthas Western Highlands', 'Coerthas Western Highlands', 'Hautes Terres Du Coerthas Occidental', 'Westliches Hochland Von Coerthas', 'クルザス西部高地', '库尔札斯西部高地', 44.0, 44.0),
(2, 2100, 'Sea of Clouds', 'Sea of Clouds', 'L\'Écume Des Cieux D\'Abalathia', 'Abalathisches Wolkenmeer', 'アバラシア雲海', '阿巴拉提亚云海', 44.0, 44.0),
(3, 2000, 'Dravanian Forelands', 'Dravanian Forelands', 'Avant-pays Dravanien', 'Dravanisches Vorland', '高地ドラヴァニア', '龙堡参天高地', 44.0, 44.0),
(4, 2002, 'Churning Mists', 'Churning Mists', 'L\'Écume Des Cieux De Dravania', 'Wallende Nebel', 'ドラヴァニア雲海', '翻云雾海', 44.0, 44.0),
(5, 2001, 'Dravanian Hinterlands', 'Dravanian Hinterlands', 'Arrière-pays Dravanien', 'Dravanisches Hinterland', '低地ドラヴァニア', '龙堡内陆低地', 44.0, 44.0),
(6, 2101, 'Azys Lla', 'Azys Lla', 'Azys Lla', 'Azys Lla', 'アジス・ラー', '魔大陆阿济兹拉', 44.0, 44.0);

--
-- Triggers `zones_hw`
--
DELIMITER $$
CREATE TRIGGER `zones_hw_del` AFTER DELETE ON `zones_hw` FOR EACH ROW BEGIN
	CALL update_etag('zones_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_hw_ins` AFTER INSERT ON `zones_hw` FOR EACH ROW BEGIN
	CALL update_etag('zones_hw');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_hw_upd` AFTER UPDATE ON `zones_hw` FOR EACH ROW BEGIN
	CALL update_etag('zones_hw');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `zones_sb`
--

CREATE TABLE `zones_sb` (
  `id` tinyint(4) NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `size_x` decimal(3,1) UNSIGNED NOT NULL,
  `size_y` decimal(3,1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_sb`
--

INSERT INTO `zones_sb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `size_x`, `size_y`) VALUES
(1, 2406, 'The Fringes', 'The Fringes', 'Les Marges', 'Abanisches Grenzland', 'ギラバニア辺境地帯', '基拉巴尼亚边区', 41.9, 41.9),
(2, 2407, 'The Peaks', 'The Peaks', 'Les Pics', 'Die Zinnen', 'ギラバニア山岳地帯', '基拉巴尼亚山区', 41.9, 41.9),
(6, 2408, 'The Lochs', 'The Lochs', 'Les Lacs', 'Das Fenn', 'ギラバニア湖畔地帯', '基拉巴尼亚湖区', 41.9, 41.9),
(3, 2409, 'The Ruby Sea', 'The Ruby Sea', 'Mer de Rubis', 'Rubinsee', '紅玉海', '红玉海', 41.9, 41.9),
(4, 2410, 'Yanxia', 'Yanxia', 'Yanxia', 'Yanxia', 'ヤンサ', '延夏', 41.9, 41.9),
(5, 2411, 'The Azim Steppe', 'The Azim Steppe', 'Steppe d\'Azim', 'Azim-Steppe', 'アジムステップ', '太阳神草原', 41.9, 41.9);

--
-- Triggers `zones_sb`
--
DELIMITER $$
CREATE TRIGGER `zones_sb_del` AFTER DELETE ON `zones_sb` FOR EACH ROW BEGIN
	CALL update_etag('zones_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_sb_ins` AFTER INSERT ON `zones_sb` FOR EACH ROW BEGIN
	CALL update_etag('zones_sb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_sb_upd` AFTER UPDATE ON `zones_sb` FOR EACH ROW BEGIN
	CALL update_etag('zones_sb');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `zones_shb`
--

CREATE TABLE `zones_shb` (
  `id` tinyint(4) NOT NULL,
  `xivdb_id` int(10) DEFAULT NULL,
  `name` text,
  `name_en` text,
  `name_fr` text,
  `name_de` text,
  `name_jp` text,
  `name_ch` text,
  `size_x` decimal(3,1) UNSIGNED NOT NULL DEFAULT '41.0',
  `size_y` decimal(3,1) UNSIGNED NOT NULL DEFAULT '41.0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zones_shb`
--

INSERT INTO `zones_shb` (`id`, `xivdb_id`, `name`, `name_en`, `name_fr`, `name_de`, `name_jp`, `name_ch`, `size_x`, `size_y`) VALUES
(1, 2953, 'Lakeland', 'Lakeland', 'Grand-Lac', 'Seenland', 'レイクランド', '雷克兰德', 41.9, 41.9),
(2, 2954, 'Kholusia', 'Kholusia', 'Kholusia', 'Kholusia', 'コルシア島', '珂露西亚岛', 41.9, 41.9),
(3, 2955, 'Amh Araeng', 'Amh Araeng', 'Amh Araeng', 'Amh Araeng', 'アム・アレーン', '安穆·艾兰', 41.9, 41.9),
(4, 2956, 'Il Mheg', 'Il Mheg', 'Il Mheg', 'Il Mheg', 'イル・メグ', '伊尔美格', 41.9, 41.9),
(5, 2957, 'The Rak\'tika Greatwood', 'The Rak\'tika Greatwood', 'Rak\'tika', 'Der Große Wald Rak\'tika', 'ラケティカ大森林', '拉凯提卡大森林', 41.9, 41.9),
(6, 2958, 'The Tempest', 'The Tempest', 'La Tempête', 'Tempest', 'テンペスト', '黑风海', 41.9, 41.9);

--
-- Triggers `zones_shb`
--
DELIMITER $$
CREATE TRIGGER `zones_shb_del` AFTER DELETE ON `zones_shb` FOR EACH ROW BEGIN
	CALL update_etag('zones_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_shb_ins` AFTER INSERT ON `zones_shb` FOR EACH ROW BEGIN
	CALL update_etag('zones_shb');
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `zones_shb_upd` AFTER UPDATE ON `zones_shb` FOR EACH ROW BEGIN
	CALL update_etag('zones_shb');
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aetherytes_arr`
--
ALTER TABLE `aetherytes_arr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Indexes for table `aetherytes_hw`
--
ALTER TABLE `aetherytes_hw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PK_ID_AETH` (`id`),
  ADD KEY `FK_ZONE_AETH` (`id_zone`);

--
-- Indexes for table `aetherytes_sb`
--
ALTER TABLE `aetherytes_sb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PK_ID_AETH` (`id`),
  ADD KEY `FK_ZONE_AETH` (`id_zone`);

--
-- Indexes for table `aetherytes_shb`
--
ALTER TABLE `aetherytes_shb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Indexes for table `etags`
--
ALTER TABLE `etags`
  ADD PRIMARY KEY (`item`);

--
-- Indexes for table `fates_arr`
--
ALTER TABLE `fates_arr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobs_arr`
--
ALTER TABLE `mobs_arr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Indexes for table `mobs_hw`
--
ALTER TABLE `mobs_hw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PK_ID` (`id`),
  ADD KEY `FK_ZONE` (`id_zone`);

--
-- Indexes for table `mobs_sb`
--
ALTER TABLE `mobs_sb`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `PK_ID` (`id`),
  ADD KEY `FK_ZONE` (`id_zone`);

--
-- Indexes for table `mobs_shb`
--
ALTER TABLE `mobs_shb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_zone` (`id_zone`);

--
-- Indexes for table `region_arr`
--
ALTER TABLE `region_arr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones_arr`
--
ALTER TABLE `zones_arr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_region` (`id_region`);

--
-- Indexes for table `zones_hw`
--
ALTER TABLE `zones_hw`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `PK_ID` (`id`);

--
-- Indexes for table `zones_sb`
--
ALTER TABLE `zones_sb`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `PK_ID` (`id`);

--
-- Indexes for table `zones_shb`
--
ALTER TABLE `zones_shb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aetherytes_arr`
--
ALTER TABLE `aetherytes_arr`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `aetherytes_hw`
--
ALTER TABLE `aetherytes_hw`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `aetherytes_sb`
--
ALTER TABLE `aetherytes_sb`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `aetherytes_shb`
--
ALTER TABLE `aetherytes_shb`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `fates_arr`
--
ALTER TABLE `fates_arr`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=959;

--
-- AUTO_INCREMENT for table `mobs_arr`
--
ALTER TABLE `mobs_arr`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `mobs_hw`
--
ALTER TABLE `mobs_hw`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `mobs_sb`
--
ALTER TABLE `mobs_sb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `mobs_shb`
--
ALTER TABLE `mobs_shb`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `region_arr`
--
ALTER TABLE `region_arr`
  MODIFY `id` tinyint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `zones_arr`
--
ALTER TABLE `zones_arr`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `zones_hw`
--
ALTER TABLE `zones_hw`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `zones_sb`
--
ALTER TABLE `zones_sb`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `zones_shb`
--
ALTER TABLE `zones_shb`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
