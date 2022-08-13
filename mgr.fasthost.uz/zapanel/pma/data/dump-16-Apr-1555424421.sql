-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-04-16 17:20
-- MySQL Server Version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38

-- Database: `beruniy_uz`


-- --------------------------------------------------------
-- 
-- Table structure for table `r_bilet`
-- 

CREATE TABLE `r_bilet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `id_cup` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `union_team` int(2) NOT NULL,
  `name_team` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `r_bilet`
-- 

INSERT INTO `r_bilet` VALUES ('1','1555171935','1','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('2','1555171937','1','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('3','1555172020','1','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('4','1555172310','1','41','0','Real Madrid CF');
INSERT INTO `r_bilet` VALUES ('5','1555172764','1','22','0','FC Inter');
INSERT INTO `r_bilet` VALUES ('6','1555173697','1','64','0','Paris Saint-Germain');
INSERT INTO `r_bilet` VALUES ('7','1555173862','1','3','0','Manchester City');
INSERT INTO `r_bilet` VALUES ('8','1555174937','1','5','0','Tottenham Hotspur');
INSERT INTO `r_bilet` VALUES ('9','1555175116','2','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('10','1555175196','2','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('11','1555175221','2','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('12','1555176081','2','22','0','FC Inter');
INSERT INTO `r_bilet` VALUES ('13','1555176495','2','47','0','Atletico Madrid');
INSERT INTO `r_bilet` VALUES ('14','1555177112','2','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('15','1555212526','2','8','0','Leicester City');
INSERT INTO `r_bilet` VALUES ('16','1555215389','2','81','0','BVB Borussia Dortmund');
INSERT INTO `r_bilet` VALUES ('17','1555215760','3','21','0','AC Milan');
INSERT INTO `r_bilet` VALUES ('18','1555216159','3','81','0','BVB Borussia Dortmund');
INSERT INTO `r_bilet` VALUES ('19','1555216222','3','47','0','Atletico Madrid');
INSERT INTO `r_bilet` VALUES ('20','1555220686','3','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('21','1555228160','3','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('22','1555230142','3','41','0','Real Madrid CF');
INSERT INTO `r_bilet` VALUES ('23','1555232266','3','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('24','1555234181','3','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('25','1555250646','4','8','0','Leicester City');
INSERT INTO `r_bilet` VALUES ('26','1555251277','4','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('27','1555251747','4','81','0','BVB Borussia Dortmund');
INSERT INTO `r_bilet` VALUES ('28','1555251818','4','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('29','1555252189','4','2','0','FC Chelsea');
INSERT INTO `r_bilet` VALUES ('30','1555255748','4','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('31','1555256499','4','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('32','1555256700','4','64','0','Paris Saint-Germain');
INSERT INTO `r_bilet` VALUES ('33','1555258293','5','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('34','1555259205','5','5','0','Tottenham Hotspur');
INSERT INTO `r_bilet` VALUES ('35','1555259311','5','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('36','1555260831','5','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('37','1555260959','5','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('38','1555261745','5','41','0','Real Madrid CF');
INSERT INTO `r_bilet` VALUES ('39','1555262636','5','47','0','Atletico Madrid');
INSERT INTO `r_bilet` VALUES ('40','1555264676','5','23','0','SSC Napoli');
INSERT INTO `r_bilet` VALUES ('41','1555268836','6','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('42','1555270227','6','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('43','1555280500','6','47','0','Atletico Madrid');
INSERT INTO `r_bilet` VALUES ('44','1555293621','6','41','0','Real Madrid CF');
INSERT INTO `r_bilet` VALUES ('45','1555294589','6','81','0','BVB Borussia Dortmund');
INSERT INTO `r_bilet` VALUES ('46','1555295243','6','21','0','AC Milan');
INSERT INTO `r_bilet` VALUES ('47','1555296209','6','2','0','FC Chelsea');
INSERT INTO `r_bilet` VALUES ('48','1555299095','6','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('49','1555304296','7','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('50','1555305569','7','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('51','1555306247','7','2','0','FC Chelsea');
INSERT INTO `r_bilet` VALUES ('52','1555307856','7','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('53','1555313098','7','21','0','AC Milan');
INSERT INTO `r_bilet` VALUES ('54','1555328711','7','5','0','Tottenham Hotspur');
INSERT INTO `r_bilet` VALUES ('55','1555331057','7','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('56','1555338138','7','7','0','FC Everton');
INSERT INTO `r_bilet` VALUES ('57','1555338173','8','21','0','AC Milan');
INSERT INTO `r_bilet` VALUES ('58','1555338666','8','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('59','1555339582','8','42','0','FC Barcelona');
INSERT INTO `r_bilet` VALUES ('60','1555339845','8','7','0','FC Everton');
INSERT INTO `r_bilet` VALUES ('61','1555346244','8','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('62','1555348042','8','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('63','1555358024','8','50','0','FC Celta Vigo');
INSERT INTO `r_bilet` VALUES ('64','1555377800','8','41','0','Real Madrid CF');
INSERT INTO `r_bilet` VALUES ('65','1555384233','9','21','0','AC Milan');
INSERT INTO `r_bilet` VALUES ('66','1555384401','9','1','0','Manchester United');
INSERT INTO `r_bilet` VALUES ('67','1555385769','9','4','0','FC Arsenal');
INSERT INTO `r_bilet` VALUES ('68','1555391524','9','6','0','FC Liverpool');
INSERT INTO `r_bilet` VALUES ('69','1555406989','9','41','0','Real Madrid CF');

-- --------------------------------------------------------
-- 
-- Table structure for table `r_cup`
-- 

CREATE TABLE `r_cup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cup` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `ot` int(2) NOT NULL,
  `do` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `priz` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `r_cup`
-- 

INSERT INTO `r_cup` VALUES ('3','3','1555215754','0','0','Lider kubogi','4000000','42','yes');
INSERT INTO `r_cup` VALUES ('2','2','1555175109','0','0','Ishbilarmon kubogi','4500000','6','yes');
INSERT INTO `r_cup` VALUES ('4','4','1555250637','0','0','Kitobxonlar kubogi','3500000','42','yes');
INSERT INTO `r_cup` VALUES ('5','5','1555258266','0','0','FMeNeJeR kubogi','5000000','42','yes');
INSERT INTO `r_cup` VALUES ('6','6','1555268830','0','0','Do`stlar kubogi','3500000','1','yes');
INSERT INTO `r_cup` VALUES ('7','7','1555304278','0','0','Burunduq kubogi','4000000','6','yes');
INSERT INTO `r_cup` VALUES ('8','8','1555338165','0','0','Gladiator kubogi','3500000','0','');
INSERT INTO `r_cup` VALUES ('9','9','1555384227','0','0','Jentlmen kubogi','5000000','0','');

-- --------------------------------------------------------
-- 
-- Table structure for table `r_cupgame`
-- 

CREATE TABLE `r_cupgame` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chemp` varchar(15) NOT NULL,
  `s_chemp` varchar(15) NOT NULL,
  `p_chemp` varchar(15) NOT NULL,
  `time` int(11) NOT NULL,
  `id_team1` int(11) NOT NULL,
  `id_team2` int(11) NOT NULL,
  `name_team1` varchar(50) NOT NULL,
  `name_team2` varchar(50) NOT NULL,
  `rez1` varchar(2) NOT NULL,
  `rez2` varchar(2) NOT NULL,
  `pen1` varchar(2) NOT NULL,
  `pen2` varchar(2) NOT NULL,
  `id_report` varchar(11) NOT NULL,
  `win` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `r_cupgame`
-- 

INSERT INTO `r_cupgame` VALUES ('1','1','1/4','1','1555174937','1','42','Manchester United','FC Barcelona','','','','','','');
INSERT INTO `r_cupgame` VALUES ('2','1','1/4','2','1555174937','22','5','FC Inter','Tottenham Hotspur','','','','','','');
INSERT INTO `r_cupgame` VALUES ('3','1','1/4','3','1555174937','3','41','Manchester City','Real Madrid CF','','','','','','');
INSERT INTO `r_cupgame` VALUES ('4','1','1/4','4','1555174937','4','64','FC Arsenal','Paris Saint-Germain','','','','','','');
INSERT INTO `r_cupgame` VALUES ('5','2','1/4','1','1555215389','8','81','Leicester City','BVB Borussia Dortmund','3','2','0','0','2048','');
INSERT INTO `r_cupgame` VALUES ('6','2','1/4','2','1555215389','42','22','FC Barcelona','FC Inter','4','3','0','0','2049','');
INSERT INTO `r_cupgame` VALUES ('7','2','1/4','3','1555215389','47','4','Atletico Madrid','FC Arsenal','3','0','0','0','2050','');
INSERT INTO `r_cupgame` VALUES ('8','2','1/4','4','1555215389','6','1','FC Liverpool','Manchester United','3','0','0','0','2051','');
INSERT INTO `r_cupgame` VALUES ('9','2','1/2','2','1555231233','8','42','Leicester City','FC Barcelona','3','4','','','2060','');
INSERT INTO `r_cupgame` VALUES ('10','2','1/2','1','1555231233','47','6','Atletico Madrid','FC Liverpool','1','3','','','2061','');
INSERT INTO `r_cupgame` VALUES ('11','3','1/4','1','1555234182','81','21','BVB Borussia Dortmund','AC Milan','2','3','0','0','2103','');
INSERT INTO `r_cupgame` VALUES ('12','3','1/4','2','1555234182','6','42','FC Liverpool','FC Barcelona','1','1','0','0','2104','');
INSERT INTO `r_cupgame` VALUES ('13','3','1/4','3','1555234182','1','4','Manchester United','FC Arsenal','9','0','0','0','2105','');
INSERT INTO `r_cupgame` VALUES ('14','3','1/4','4','1555234182','47','41','Atletico Madrid','Real Madrid CF','3','1','0','0','2106','');
INSERT INTO `r_cupgame` VALUES ('15','3','1/2','2','1555251844','21','42','AC Milan','FC Barcelona','0','8','','','2122','');
INSERT INTO `r_cupgame` VALUES ('16','3','1/2','1','1555251844','1','47','Manchester United','Atletico Madrid','2','0','','','2123','');
INSERT INTO `r_cupgame` VALUES ('17','3','1/1','1','1555253812','1','42','Manchester United','FC Barcelona','1','4','','','2126','');
INSERT INTO `r_cupgame` VALUES ('18','2','1/1','1','1555256486','6','42','FC Liverpool','FC Barcelona','1','0','','','2128','');
INSERT INTO `r_cupgame` VALUES ('19','4','1/4','1','1555256700','2','1','FC Chelsea','Manchester United','0','2','0','0','2129','');
INSERT INTO `r_cupgame` VALUES ('20','4','1/4','2','1555256700','42','64','FC Barcelona','Paris Saint-Germain','4','0','0','0','2130','');
INSERT INTO `r_cupgame` VALUES ('21','4','1/4','3','1555256700','81','8','BVB Borussia Dortmund','Leicester City','2','4','0','0','2131','');
INSERT INTO `r_cupgame` VALUES ('22','4','1/4','4','1555256700','4','6','FC Arsenal','FC Liverpool','0','7','0','0','2132','');
INSERT INTO `r_cupgame` VALUES ('23','4','1/2','2','1555260851','1','42','Manchester United','FC Barcelona','0','1','','','2139','');
INSERT INTO `r_cupgame` VALUES ('24','4','1/2','1','1555260851','8','6','Leicester City','FC Liverpool','0','8','','','2140','');
INSERT INTO `r_cupgame` VALUES ('25','4','1/1','1','1555263569','6','42','FC Liverpool','FC Barcelona','1','2','','','2302','');
INSERT INTO `r_cupgame` VALUES ('26','5','1/4','1','1555264677','42','1','FC Barcelona','Manchester United','2','0','0','0','2458','');
INSERT INTO `r_cupgame` VALUES ('27','5','1/4','2','1555264677','47','5','Atletico Madrid','Tottenham Hotspur','5','0','0','0','2459','');
INSERT INTO `r_cupgame` VALUES ('28','5','1/4','3','1555264677','41','4','Real Madrid CF','FC Arsenal','6','0','0','0','2460','');
INSERT INTO `r_cupgame` VALUES ('29','5','1/4','4','1555264677','23','6','SSC Napoli','FC Liverpool','0','3','0','0','2461','');
INSERT INTO `r_cupgame` VALUES ('30','5','1/2','2','1555267269','42','47','FC Barcelona','Atletico Madrid','4','0','','','2535','');
INSERT INTO `r_cupgame` VALUES ('31','5','1/2','1','1555267269','41','6','Real Madrid CF','FC Liverpool','3','4','','','2536','');
INSERT INTO `r_cupgame` VALUES ('32','5','1/1','1','1555271626','6','42','FC Liverpool','FC Barcelona','0','2','','','2537','');
INSERT INTO `r_cupgame` VALUES ('33','6','1/4','1','1555299102','1','81','Manchester United','BVB Borussia Dortmund','8','0','0','0','2640','');
INSERT INTO `r_cupgame` VALUES ('34','6','1/4','2','1555299102','21','4','AC Milan','FC Arsenal','9','0','0','0','2641','');
INSERT INTO `r_cupgame` VALUES ('35','6','1/4','3','1555299102','41','6','Real Madrid CF','FC Liverpool','0','5','0','0','2642','');
INSERT INTO `r_cupgame` VALUES ('36','6','1/4','4','1555299102','47','2','Atletico Madrid','FC Chelsea','3','1','0','0','2643','');
INSERT INTO `r_cupgame` VALUES ('37','6','1/2','2','1555303902','1','21','Manchester United','AC Milan','6','0','','','2648','');
INSERT INTO `r_cupgame` VALUES ('38','6','1/2','1','1555303902','6','47','FC Liverpool','Atletico Madrid','1','2','','','2649','');
INSERT INTO `r_cupgame` VALUES ('39','6','1/1','1','1555313125','47','1','Atletico Madrid','Manchester United','2','3','','','2659','');
INSERT INTO `r_cupgame` VALUES ('40','7','1/4','1','1555338138','1','2','Manchester United','FC Chelsea','4','0','0','0','2677','');
INSERT INTO `r_cupgame` VALUES ('41','7','1/4','2','1555338138','6','4','FC Liverpool','FC Arsenal','9','0','0','0','2678','');
INSERT INTO `r_cupgame` VALUES ('42','7','1/4','3','1555338138','5','42','Tottenham Hotspur','FC Barcelona','0','9','0','0','2679','');
INSERT INTO `r_cupgame` VALUES ('43','7','1/4','4','1555338138','7','21','FC Everton','AC Milan','0','4','0','0','2680','');
INSERT INTO `r_cupgame` VALUES ('44','7','1/2','2','1555350101','1','6','Manchester United','FC Liverpool','1','2','','','2694','');
INSERT INTO `r_cupgame` VALUES ('45','7','1/2','1','1555350101','42','21','FC Barcelona','AC Milan','4','0','','','2695','');
INSERT INTO `r_cupgame` VALUES ('46','7','1/1','1','1555352686','42','6','FC Barcelona','FC Liverpool','0','2','','','2696','');
INSERT INTO `r_cupgame` VALUES ('47','8','1/4','1','1555377800','7','50','FC Everton','FC Celta Vigo','3','1','0','0','2698','');
INSERT INTO `r_cupgame` VALUES ('48','8','1/4','2','1555377800','41','21','Real Madrid CF','AC Milan','3','0','0','0','2699','');
INSERT INTO `r_cupgame` VALUES ('49','8','1/4','3','1555377800','42','4','FC Barcelona','FC Arsenal','9','0','0','0','2700','');
INSERT INTO `r_cupgame` VALUES ('50','8','1/4','4','1555377800','1','6','Manchester United','FC Liverpool','1','0','0','0','2701','');
INSERT INTO `r_cupgame` VALUES ('51','8','1/2','2','1555395654','7','41','FC Everton','Real Madrid CF','0','7','','','2709','');
INSERT INTO `r_cupgame` VALUES ('52','8','1/2','1','1555395654','42','1','FC Barcelona','Manchester United','1','0','','','2710','');
INSERT INTO `r_cupgame` VALUES ('53','8','1/1','1','1555417444','42','41','FC Barcelona','Real Madrid CF','','','','','','');

-- --------------------------------------------------------
-- 
-- Table structure for table `r_priz`
-- 

CREATE TABLE `r_priz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cup` varchar(11) NOT NULL,
  `id_union` int(50) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `priz` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `r_priz`
-- 

INSERT INTO `r_priz` VALUES ('1','3','0','1555215754','Lider kubogi','4000000','42','/tournament/cup.php?id=3');
INSERT INTO `r_priz` VALUES ('2','2','0','1555175109','Ishbilarmon kubogi','4500000','6','/tournament/cup.php?id=2');
INSERT INTO `r_priz` VALUES ('3','5','0','1555258266','FMeNeJeR kubogi','5000000','42','/tournament/cup.php?id=5');
INSERT INTO `r_priz` VALUES ('4','6','0','1555268830','Do`stlar kubogi','3500000','1','/tournament/cup.php?id=6');
INSERT INTO `r_priz` VALUES ('5','4','0','1555250637','Kitobxonlar kubogi','3500000','42','/tournament/cup.php?id=4');
INSERT INTO `r_priz` VALUES ('6','7','0','1555304278','Burunduq kubogi','4000000','6','/tournament/cup.php?id=7');
