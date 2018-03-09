# FanRenBookShop
online books shop
这是一个网上电子书店的前台，如需数据库数据，请在MySQL中运行如下语句，数据库的用户名和密码请根据自己的情况在applicationContext.xml中修改
CREATE DATABASE  IF NOT EXISTS `bookshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookshop`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: bookshop
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) DEFAULT NULL,
  `USERPASSWORD` varchar(255) DEFAULT NULL,
  `SEX` varchar(255) DEFAULT NULL,
  `PHONE` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `BALANCE` float DEFAULT NULL,
  `PAYPASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `BOOKID` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(255) NOT NULL,
  `BOOKNAME` varchar(255) NOT NULL,
  `AUTHORNAME` varchar(255) NOT NULL,
  `PRICE` float NOT NULL,
  `PUBLISHER` varchar(255) NOT NULL,
  `LIKENUM` int(11) unsigned zerofill NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `BOOKPATH` varchar(255) NOT NULL,
  `COVER` varchar(255) DEFAULT NULL,
  `RECOMMENDFLAG` int(10) unsigned zerofill DEFAULT NULL,
  `PUBLISHDATE` date NOT NULL,
  `VARIETYID` int(11) NOT NULL,
  `SELLNUM` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`BOOKID`),
  KEY `FKn9bcg1m3axcx77dlt3o087ngu` (`VARIETYID`),
  CONSTRAINT `FKn9bcg1m3axcx77dlt3o087ngu` FOREIGN KEY (`VARIETYID`) REFERENCES `bookvariety` (`VARIETYID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'9787530214336','渴望生活','米达',15.8,'北京十月文艺出版社',00000000102,'八十余种文字全球发行，感动亿万读者。周国平，濮存昕，安妮宝贝鼎力推荐。','/Users/apple/Desktop/test1.txt','image/1.png',0000000001,'2014-12-01',1,0000000100),(2,'9787208146082','梁漱溟往来书信集','梁培宽',25.9,'上海人民出版社',00000000020,'精神有所归，生活有重心，一根脊梁竖立起来，两脚踏在地上。','D:/book','image/2.png',0000000001,'2014-12-01',2,0000000202),(3,'9787550025769','单向迁徙','鲁迅',63,'上海人民出版社',00000000050,'晋江现象级男作者张饮修，突围黑暗过往的自我救赎之作。','D:/book','image/3.png',0000000001,'2014-12-01',3,0000000301),(4,'9787559612755','妖猫传','梦枕貘',58,'北京联合出版有限公司',00000000040,'当当读者专享陈凯歌签章，王蕙玲（李安御用编剧），黄轩、张雨绮、刘昊然等众多中日明星共同打造的同名电影即将上映。 梦枕貘：我还想再说一次。这故事，真的是至今为止没人写过的杰作。','D:/book','image/4.jpg',0000000001,'2014-12-01',4,0000000402),(5,'9787511041081','呼兰河传','萧红生',45,'海豚出版社',00000000056,'著名作家萧红作品，教育部新课标必读书目，几代人背诵过的文学名著，中国孩子躲不过的美文名篇，自然与世界、自由与成长的永恒主题。3-6、7-12岁适读（歪歪兔童书馆出品）','D:/book','image/5.jpg',0000000001,'2014-12-01',5,0000000500),(6,'9787511041082','丰子恺的艺术与人生','丰子恺',65,'北京日报出版社',00000000020,'一套有人情味的艺术启蒙之书！根据开明书店经典版本重新编辑。看一代民国大家以返璞归真之心，讲述四种融汇中西的艺术故事。','D:/book','image/6.jpg',0000000001,'2014-12-01',6,0000000601),(7,'9787511041083','生命 : 万物不可思议','冯骥才',25,'上海人民出版社',00000000089,'内含神奇种子书签。复旦大学知名中文系教授、果壳网副总编、中科院明星科学家跨界联合推荐，海外社交平台盛赞，144页全手绘画展级美图，探索生命万物，融合艺术、哲学、科普的殿堂巨作。','D:/book','image/7.jpg',0000000001,'2014-12-01',7,0000000702),(8,'9787511041084','人虎','冯骥才',43,'北京十月文艺出版社',00000000076,'一个结合了谋杀和欲望的超自然故事，一本迷人的颠覆传统的犯罪小说。布克国际奖入围作品，印尼魔幻现实主义文学代表作。每个人心里都关着一头老虎。','D:/book','image/8.jpg',0000000001,'2014-12-01',8,0000000801),(9,'9787511041085','人间失格','鲁迅',64,'北京日报出版社',00000000029,'超燃！“丧文化”流行，《人间失格》成了现象级畅销书，创当当3天销售50000+册的奇迹！收录作者绝笔之作《Good bye》。','D:/book','image/9.jpg',0000000001,'2014-12-01',1,0000000901),(10,'9787511041086','汉字树','梁培宽',49,'北京十月文艺出版社',00000000058,'“中国汉字听写大会”唤起人们对书写的重视，汉字树根深叶茂，生生不息，是中华文明的传承！','D:/book','image/10.jpg',0000000001,'2014-12-01',2,0000001002);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookvariety`
--

DROP TABLE IF EXISTS `bookvariety`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookvariety` (
  `VARIETYID` int(11) NOT NULL AUTO_INCREMENT,
  `VARIETYNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`VARIETYID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookvariety`
--

LOCK TABLES `bookvariety` WRITE;
/*!40000 ALTER TABLE `bookvariety` DISABLE KEYS */;
INSERT INTO `bookvariety` VALUES (1,'小说'),(2,'文艺'),(3,'童书'),(4,'教育'),(5,'人文社科'),(6,'经管'),(7,'成功'),(8,'科技');
/*!40000 ALTER TABLE `bookvariety` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boss`
--

DROP TABLE IF EXISTS `boss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boss` (
  `BOSSID` int(11) NOT NULL AUTO_INCREMENT,
  `BOSSNAME` varchar(255) NOT NULL,
  `BOSSPASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`BOSSID`),
  UNIQUE KEY `BOSSNAME_UNIQUE` (`BOSSNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boss`
--

LOCK TABLES `boss` WRITE;
/*!40000 ALTER TABLE `boss` DISABLE KEYS */;
INSERT INTO `boss` VALUES (1,'马云','123456');
/*!40000 ALTER TABLE `boss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentrecord`
--

DROP TABLE IF EXISTS `commentrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentrecord` (
  `COMMENTID` int(11) NOT NULL AUTO_INCREMENT,
  `BOOKCOMMENT` varchar(255) DEFAULT NULL,
  `COMMENTDATE` datetime DEFAULT NULL,
  `USERID` int(11) NOT NULL,
  `BOOKID` int(11) NOT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COMMENTID`),
  KEY `FK2ch5nfqryag8ak0mpnnoxk954` (`BOOKID`),
  KEY `FKe6v2llgjk0p8bmuoaebyrulfg` (`USERID`),
  CONSTRAINT `BOOKID` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK2ch5nfqryag8ak0mpnnoxk954` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`),
  CONSTRAINT `FK67dvtlkagctrdkh9v35w3afx7` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `FKe6v2llgjk0p8bmuoaebyrulfg` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `USERIDinct` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentrecord`
--

LOCK TABLES `commentrecord` WRITE;
/*!40000 ALTER TABLE `commentrecord` DISABLE KEYS */;
INSERT INTO `commentrecord` VALUES (1,'您好','2017-12-31 23:59:59',1,1,NULL),(2,'不好','2018-01-17 19:57:18',1,1,NULL),(3,'好饿','2018-01-17 20:08:49',1,1,NULL),(4,'是不是傻','2018-01-17 20:19:23',1,1,NULL),(5,'这书不错啊','2018-01-17 20:21:24',1,1,NULL),(6,'推荐','2018-01-17 20:22:41',1,1,NULL),(7,'你看看啊','2018-01-17 22:34:30',1,1,NULL),(8,'哈哈哈','2018-01-17 23:22:36',1,1,NULL),(9,'TEST','2018-01-18 00:08:01',1,1,NULL),(10,'test2','2018-01-18 00:10:50',1,1,NULL),(11,'hhh','2018-01-18 00:12:01',1,1,NULL),(12,'test3','2018-01-18 00:18:27',1,1,NULL),(13,'teathahah','2018-01-18 00:21:03',1,1,NULL),(14,'白龙和杨贵妃的Cp真的感人','2018-01-18 13:56:23',1,4,NULL),(15,NULL,'2018-01-18 13:59:57',1,4,NULL),(16,NULL,'2018-01-18 14:13:31',1,4,NULL),(17,NULL,'2018-01-18 14:19:29',1,4,NULL),(18,NULL,'2018-01-18 14:20:05',1,4,NULL);
/*!40000 ALTER TABLE `commentrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likerecord`
--

DROP TABLE IF EXISTS `likerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likerecord` (
  `LIKEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  `BOOKID` int(11) NOT NULL,
  PRIMARY KEY (`LIKEID`),
  KEY `FKgvm4yoiqstvh6lj1gik56sojc` (`BOOKID`),
  KEY `FKegg8ob66fn2ydivfahib3wrbn` (`USERID`),
  CONSTRAINT `BOOKIDinlr` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FKegg8ob66fn2ydivfahib3wrbn` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `FKgvm4yoiqstvh6lj1gik56sojc` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`),
  CONSTRAINT `FKjtwh068tb73udqjj8t4n6vnji` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `USERIDinlr` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likerecord`
--

LOCK TABLES `likerecord` WRITE;
/*!40000 ALTER TABLE `likerecord` DISABLE KEYS */;
INSERT INTO `likerecord` VALUES (1,1,1),(11,1,4),(12,2,7);
/*!40000 ALTER TABLE `likerecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateLikeNum` AFTER INSERT ON `likerecord` 
    FOR EACH ROW BEGIN
        update `book` set LIKENUM=LIKENUM+1 where BOOKID=NEW.BOOKID;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `NOTICEID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTICE` varchar(255) DEFAULT NULL,
  `NOTICEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`NOTICEID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,'凡人修仙传上线了','2018-01-01 23:59:59'),(2,'郑佳颖最漂亮，女神快点脱单！',NULL);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetail` (
  `ORDERDETAILNUM` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERID` int(11) NOT NULL,
  `BOOKID` int(11) NOT NULL,
  PRIMARY KEY (`ORDERDETAILNUM`),
  KEY `FKgoaxu6r9yui5ff93d2g2tt8q0` (`ORDERID`),
  KEY `FKdgjq6fh6ltsu3x4qcaner7xr8` (`BOOKID`),
  CONSTRAINT `BOOKIDinod` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FKdgjq6fh6ltsu3x4qcaner7xr8` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`),
  CONSTRAINT `FKgoaxu6r9yui5ff93d2g2tt8q0` FOREIGN KEY (`ORDERID`) REFERENCES `userorder` (`ORDERID`),
  CONSTRAINT `ORDERIDinod` FOREIGN KEY (`ORDERID`) REFERENCES `userorder` (`ORDERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1),(2,2,4),(3,2,7),(4,4,2),(5,5,10),(6,6,8),(7,7,3),(8,8,4),(9,9,9),(10,10,10),(11,11,7),(12,12,6),(13,13,2);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orderdetail_insert` AFTER INSERT ON `orderdetail` 
    FOR EACH ROW BEGIN
    
    
   /* 更改图书销量*/
	UPDATE `book` SET `SELLNUM`=`SELLNUM`+1
	WHERE `BOOKID`= new.`BOOKID`;
	
   /*减去用户余额*/
	SET @bookprice = (SELECT PRICE FROM `book` WHERE BOOKID = new.`BOOKID`);
	SET @userid=(SELECT USERID FROM `userorder` WHERE ORDERID = new.`ORDERID`);
	
	UPDATE `userc` SET BALANCE=BALANCE-@bookprice
	WHERE USERID=@userid;
	
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateUserBook` AFTER INSERT ON `orderdetail` 
    FOR EACH ROW BEGIN
		INSERT INTO `user_book` SET USERID = (select USERID from userorder where ORDERID=NEW.ORDERID), BOOKID=NEW.BOOKID;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `SHOPPINGCARTID` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` int(11) NOT NULL,
  PRIMARY KEY (`SHOPPINGCARTID`),
  KEY `FKxwjtfk0j7w6wqedjb0m4ngvp` (`USERID`),
  CONSTRAINT `FKj4nlebwlkgpkhs6nudat8evk0` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `FKxwjtfk0j7w6wqedjb0m4ngvp` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
INSERT INTO `shoppingcart` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcartdetail`
--

DROP TABLE IF EXISTS `shoppingcartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcartdetail` (
  `SCDETAILID` int(11) NOT NULL AUTO_INCREMENT,
  `SHOPPINGCARTID` int(11) NOT NULL,
  `BOOKID` int(11) NOT NULL,
  PRIMARY KEY (`SCDETAILID`),
  KEY `FKd5egdpbcm089eu5d3s1diuniw` (`SHOPPINGCARTID`),
  KEY `FKfjafvnvdlu7lfakr6bjcx1g61` (`BOOKID`),
  CONSTRAINT `FKd5egdpbcm089eu5d3s1diuniw` FOREIGN KEY (`SHOPPINGCARTID`) REFERENCES `shoppingcart` (`SHOPPINGCARTID`),
  CONSTRAINT `FKfjafvnvdlu7lfakr6bjcx1g61` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcartdetail`
--

LOCK TABLES `shoppingcartdetail` WRITE;
/*!40000 ALTER TABLE `shoppingcartdetail` DISABLE KEYS */;
INSERT INTO `shoppingcartdetail` VALUES (11,2,9),(12,2,7);
/*!40000 ALTER TABLE `shoppingcartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book`
--

DROP TABLE IF EXISTS `user_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_book` (
  `USERID` int(11) NOT NULL,
  `BOOKID` int(11) NOT NULL,
  PRIMARY KEY (`USERID`,`BOOKID`),
  KEY `FKjpm8w42q3dme4531t1ipy5697` (`BOOKID`),
  CONSTRAINT `BOOKIDinub` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK69q6l6afkpxit3snij9gd1v2n` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `FKjpm8w42q3dme4531t1ipy5697` FOREIGN KEY (`BOOKID`) REFERENCES `book` (`BOOKID`),
  CONSTRAINT `FKtab66j1itr35jshyiui55ep5p` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `USERIDinub` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book`
--

LOCK TABLES `user_book` WRITE;
/*!40000 ALTER TABLE `user_book` DISABLE KEYS */;
INSERT INTO `user_book` VALUES (1,1),(1,2),(2,2),(1,3),(1,4),(2,4),(2,6),(1,7),(2,7),(1,8),(2,9),(1,10),(2,10);
/*!40000 ALTER TABLE `user_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userc`
--

DROP TABLE IF EXISTS `userc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userc` (
  `USERID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL,
  `USERPASSWORD` varchar(255) NOT NULL,
  `SEX` varchar(255) NOT NULL DEFAULT '男',
  `PHONE` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `BALANCE` float unsigned zerofill DEFAULT '000000000000',
  `PAYPASSWORD` varchar(255) NOT NULL,
  PRIMARY KEY (`USERID`),
  UNIQUE KEY `USERNAME_UNIQUE` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userc`
--

LOCK TABLES `userc` WRITE;
/*!40000 ALTER TABLE `userc` DISABLE KEYS */;
INSERT INTO `userc` VALUES (1,'lkt','123456','男','123','598087448@qq.com',0000000378.1,'123456'),(2,'zjy','123456','女','11100','123123',0000000157.1,'123456');
/*!40000 ALTER TABLE `userc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `userc_insert` AFTER INSERT ON `userc` 
    FOR EACH ROW BEGIN
	SET @id = (SELECT USERID FROM `userc` WHERE USERID = new.USERID);
	INSERT INTO shoppingcart(USERID) VALUES(@id);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `userorder`
--

DROP TABLE IF EXISTS `userorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userorder` (
  `ORDERID` int(11) NOT NULL AUTO_INCREMENT,
  `DEALDATE` datetime NOT NULL,
  `ORDERTOTALPRICE` float NOT NULL,
  `USERID` int(11) NOT NULL,
  PRIMARY KEY (`ORDERID`),
  KEY `FKb0xjqhqbdm3859b3ye73gi3cp` (`USERID`),
  CONSTRAINT `FKb0xjqhqbdm3859b3ye73gi3cp` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `FKp9oa0wp5agasb8mbv8d5laftk` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`),
  CONSTRAINT `USERIDinuo` FOREIGN KEY (`USERID`) REFERENCES `userc` (`USERID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userorder`
--

LOCK TABLES `userorder` WRITE;
/*!40000 ALTER TABLE `userorder` DISABLE KEYS */;
INSERT INTO `userorder` VALUES (1,'2018-01-02 23:59:59',15.8,1),(2,'2018-01-18 00:59:06',58,1),(4,'2018-01-18 12:29:24',25.9,1),(5,'2018-01-18 12:30:06',49,1),(6,'2018-01-18 14:11:56',43,1),(7,'2018-01-18 14:23:40',63,1),(8,'2018-01-18 15:00:49',58,2),(9,'2018-01-20 14:40:11',64,2),(10,'2018-01-20 16:52:43',49,2),(11,'2018-01-20 20:15:02',25,2),(12,'2018-01-20 20:33:40',65,2),(13,'2018-01-20 21:11:03',25.9,2),(14,'2018-01-20 21:25:18',0,2),(15,'2018-01-20 21:25:41',0,2),(16,'2018-01-20 21:28:45',0,2);
/*!40000 ALTER TABLE `userorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bookshop'
--

--
-- Dumping routines for database 'bookshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-21  2:19:07
