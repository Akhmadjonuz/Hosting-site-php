-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-02-25 15:43
-- MySQL Server Version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38

-- Database: `silawar_gar`


-- --------------------------------------------------------
-- 
-- Table structure for table `amunition`
-- 

DROP TABLE IF EXISTS `amunition`;
CREATE TABLE `amunition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT 'название',
  `type` enum('rekomolekt','aptechka','ognetushitel','toplivo','snaryadBB','snaryadOF','snaryadKS','pitanie','allparam') NOT NULL COMMENT 'тип',
  `xp` int(11) NOT NULL COMMENT 'кол-во единиц выбранного типа',
  `img` varchar(300) NOT NULL COMMENT 'картинка',
  `info` text NOT NULL COMMENT 'инфа',
  `silver` int(11) NOT NULL COMMENT 'стоимость в серебре',
  `gold` int(11) NOT NULL COMMENT 'стоимость в золоте',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Снаряды,Снаряжение';

-- --------------------------------------------------------
-- 
-- Dumping data for table `amunition`
-- 

INSERT INTO `amunition` VALUES ('1','Форсаж','allparam','50','/instalscript/images/amunition/forsag.png','Действие: Повышает все параметры на 50%. Используется за один бой.','11000','19');
INSERT INTO `amunition` VALUES ('2','Малая аптечка','aptechka','30','/instalscript/images/amunition/maptecka.png','Лечит весь экипаж на +30%. Если не используется в текущем бою, то сохраняется до следующего применения.','3000','0');
INSERT INTO `amunition` VALUES ('3','Ручной огнетушитель','ognetushitel','30','/instalscript/images/amunition/ruchnoiognetush.png','Тушение 30% пожара. Если не используется в текущем бою, то сохраняется до следующего применения.','3000','0');
INSERT INTO `amunition` VALUES ('4','Ленд-лизное масло','toplivo','5','/instalscript/images/amunition/lendliznoemaslo.png','Добавляет 5% к мощности двигателя. Полностью потребляется за один бой. Для следующего боя нужно покупать новое.','5000','0');
INSERT INTO `amunition` VALUES ('5','Качественное масло','toplivo','5','/instalscript/images/amunition/kachestvennoemaslo.png','Добавляет 5% к мощности двигателя. Полностью потребляется за один бой. Для следующего боя нужно покупать новое.','5000','0');
INSERT INTO `amunition` VALUES ('6','100-октановый бензин','toplivo','5','/instalscript/images/amunition/stopyatioktanbenz.png','Добавляет 5% к мощности двигателя и скорости вращения башни. Полностью потребляется за один бой. Для следующего боя нужно покупать новый.','5000','0');
INSERT INTO `amunition` VALUES ('7','Подкрученный регулятор оборотов','toplivo','10','/instalscript/images/amunition/odkregskorosti.png','Действие: Повышает мощность двигателя на 10 %, но повреждает его. При превышении максимальной мощности двигателя начинает снимать с него проценты прочности. Соответственно, увеличивается стоимость ремонта и возникает препятствие получению медали Неуязвимый. Если на протяжении определенного промежутка времени будет идти превышение максимальной мощности, то движок через какое то время будет поврежден, т.к. работает на износ. Расходуется после одной битвы.','3000','0');
INSERT INTO `amunition` VALUES ('8','Форсаж','toplivo','15','/instalscript/images/amunition/forsag.png','+15% к мощности двигателя на одну битву.','5000','0');
INSERT INTO `amunition` VALUES ('9','Большой ремкомплект','rekomolekt','50','/instalscript/images/amunition/bolshrekomplekt.png','Восстановление прочность +50%. Если не используется в текущем бою, то сохраняется до следующего применения.\n','0','50');
INSERT INTO `amunition` VALUES ('10','Большая аптечка','aptechka','50','/instalscript/images/amunition/bolshaptecka.png','Лечит весь экипаж на +50%. Если не используется в текущем бою, то сохраняется до следующего применения.','0','50');
INSERT INTO `amunition` VALUES ('11','Большой огнетушитель','ognetushitel','50','/instalscript/images/amunition/bolshrekomplekt.png','Тушение 50% пожара. Если не используется в текущем бою, то сохраняется до следующего применения.','0','50');
INSERT INTO `amunition` VALUES ('12','Доппаёк','pitanie','5','/instalscript/images/amunition/doppaek.png','+10 % ко всем навыкам всего экипажа до конца боя.','0','25');
INSERT INTO `amunition` VALUES ('13','Шоколад','pitanie','10','/instalscript/images/amunition/shokolad.png','+10 % ко всем навыкам всего экипажа до конца боя.','0','50');
INSERT INTO `amunition` VALUES ('14','Ящик Колы','pitanie','15','/instalscript/images/amunition/yashcola.png','+15 % ко всем навыкам всего экипажа до конца боя.','0','75');
INSERT INTO `amunition` VALUES ('15','Улучшенный рацион','pitanie','20','/instalscript/images/amunition/uluchsracion.png','+20 % ко всем навыкам всего экипажа до конца боя.','0','100');
INSERT INTO `amunition` VALUES ('16','Крепкий кофе','pitanie','25','/instalscript/images/amunition/krepkofe.png','+25 % ко всем навыкам всего экипажа до конца боя.','0','125');
INSERT INTO `amunition` VALUES ('17','Пудинг с чаем','pitanie','30','/instalscript/images/amunition/pudischaem.png','+30 % ко всем навыкам всего экипажа до конца боя.','0','150');
INSERT INTO `amunition` VALUES ('18','Онигири','pitanie','35','/instalscript/images/amunition/onigiri.png','+35 % ко всем навыкам всего экипажа до конца боя.','0','175');
INSERT INTO `amunition` VALUES ('19','Бронебойные (ББ) снаряды','snaryadBB','40','/instalscript/images/amunition/snaryadBB.png','Наносит дополнительный урон +40%','500','5');
INSERT INTO `amunition` VALUES ('20','Осколочно-фугасные (ОФ) снаряды','snaryadOF','35','/instalscript/images/amunition/snaryadOF.png','Наносит дополнительный урон +35%','0','4');
INSERT INTO `amunition` VALUES ('21','Кумулятивные (КС) снаряды','snaryadKS','30','/instalscript/images/amunition/snaryadKS.png','Наносит дополнительный урон +30%','300','3');
