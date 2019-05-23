-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: task
-- ------------------------------------------------------
-- Server version	5.7.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department_school`
--

DROP TABLE IF EXISTS `department_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department_school` (
  `title` varchar(200) NOT NULL,
  `content` varchar(600) NOT NULL,
  `sendpeople` varchar(30) NOT NULL,
  `acceptpeople` varchar(30) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_school`
--

LOCK TABLES `department_school` WRITE;
/*!40000 ALTER TABLE `department_school` DISABLE KEYS */;
INSERT INTO `department_school` VALUES ('4321','4231','数学与大数据','校方','20190102_014920_42.pdf-20190105_164426_560.pdf'),('312','321','校方','数学与大数据','org.json-20190105_172049_503.jar'),('754','5346','数学与大数据','校方','20190102_014920_42-20190106_215016_818.pdf'),('4563','523','数学与大数据','校方','20190102_014920_42-20190106_215040_65.pdf'),('关于蓝桥杯','31231硕大的撒','校方','数学与大数据','20190102_014920_42-20190106_215916_123.pdf'),('4123','4321','校方','数学与大数据','fengjing-20190106233553_678.jpg'),('点击下面的下载数据库连接文件','点下载向春宇','数学与大数据','校方','mysql-connector-java-5.1.38-20190107130808_859.jar'),('ppppp','pppppppppp','数学与大数据','校方','d-20190108202837_560.jpg'),('加好友通过飞机返回给','功夫大使馆丰盛的','校方','外国语','new-20190108203019_678.jpg'),('关于举办c语言程序设计','这是数学与大数据学院举办的c语言程序设计的回复','校方','数学与大数据','fj-20190305225554_890.jpg'),('c语言程序设计','这是数学与大数据学院举办的','数学与大数据','校方','Slice 2-20190305225658_542.png'),('drfgtrf、','②5银行tr','校方','数学与大数据','d-20190305234932_667.jpg'),('地方如果','地铁繁荣提供','数学与大数据','校方','d-20190306003247_405.jpg'),('反对任何一个','冬天容易过热的费用好人挺好','数学与大数据','校方','20181222_143033_288-20190306004124_696.pdf'),('个女孩呢','答复用户提供','校方','外国语','20181222_143033_288-20190306004303_449.pdf');
/*!40000 ALTER TABLE `department_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `name` varchar(10) NOT NULL,
  `passward` varchar(20) NOT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('2','2','外国语'),('22','22','数学与大数据');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectone`
--

DROP TABLE IF EXISTS `projectone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `projectone` (
  `pid` varchar(20) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `grade` varchar(15) NOT NULL,
  `category` varchar(20) NOT NULL,
  `xdepartment` varchar(50) DEFAULT NULL,
  `publishtime` varchar(30) NOT NULL,
  `competitionplace` varchar(50) NOT NULL,
  `score` int(2) NOT NULL,
  `content` longtext NOT NULL,
  `publishimg` varchar(50) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectone`
--

LOCK TABLES `projectone` WRITE;
/*!40000 ALTER TABLE `projectone` DISABLE KEYS */;
INSERT INTO `projectone` VALUES ('2314','计算机','A类','学科竞赛','数学与大数据','2018/12/26','安徽',3,'发到网上的哇哇哇分为非按我','20190106_232902_791.jpg'),('456','工具包','B类','学科竞赛','计算机院','2016','单个',5,'的任何用途广泛时你回复床头柜&nbsp;','20190306_004614_357.jpg'),('4785','环境科目','B类','学科竞赛','的若干条回复','反弹还有','富滇银行',5,'电热毯刚好有人放烟花吗保护家庭一个','20190306_003526_53.jpg'),('6452','跑步比赛','A类','学科竞赛','数学与大数据','2018/12/26','苏州',3,'规范工程处成功拆除工程','20190112_222951_235.jpg'),('64654','拔河比赛','A类','学科竞赛','数学与大数据','2018/1/15','苏州',5,'这是拔河比赛','20190115_220333_912.jpg'),('654','科学比赛','A类','学科竞赛','数学与大数据','2018/10/24','北京',5,'发的苏维埃发未发放撒地方撒地方撒旦士大夫','20190107_125308_505.jpg'),('68523','c语言','A类','学科竞赛','数学与大数据','2018/1/16','苏州',5,'规定规范购房合法化换个换个换个换个房间','20190116_005605_319.jpg'),('7658976','物理比赛','A类','学科竞赛','数学与大数据','2018/10/24','安徽',8,'如发生违法三位','20190107_125422_189.jpg'),('8765865','蓝桥','A类','学科竞赛','数学与大数据','2018/1/18','安徽',3,'方法二手房撒打发士大夫士大夫的撒发士大夫撒','20190108_203522_847.jpg'),('987654','c语言程序设计','B类','学科竞赛','数学与大数据','2019/3/5','安徽',4,'这是数学与大数据学院举办的关于c语言程序设计的','20190305_225145_108.jpg');
/*!40000 ALTER TABLE `projectone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu`
--

DROP TABLE IF EXISTS `stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stu` (
  `sno` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `passward` varchar(20) NOT NULL,
  `sclass` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu`
--

LOCK TABLES `stu` WRITE;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
INSERT INTO `stu` VALUES ('123','李冉','123','信计一班','数学与大数据',52),('124','张三','124','信计一班','数学与大数据',0),('125','李四','125','信计一班','数学与大数据',0),('126','王五','126','信计一班','数学与大数据',6),('127','赵六','127','外国语一班','外国语',2);
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_info`
--

DROP TABLE IF EXISTS `student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_info` (
  `sno` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `age` varchar(30) NOT NULL,
  `score` varchar(30) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_info`
--

LOCK TABLES `student_info` WRITE;
/*!40000 ALTER TABLE `student_info` DISABLE KEYS */;
INSERT INTO `student_info` VALUES ('123','张三','123','20','80'),('3452','赵六','000000','33','60'),('423','李四','000000','22','70'),('999','任春龙','000000','29','79');
/*!40000 ALTER TABLE `student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stujoin`
--

DROP TABLE IF EXISTS `stujoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stujoin` (
  `pid` varchar(20) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `name` varchar(15) NOT NULL,
  `stuclass` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `guider` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stujoin`
--

LOCK TABLES `stujoin` WRITE;
/*!40000 ALTER TABLE `stujoin` DISABLE KEYS */;
INSERT INTO `stujoin` VALUES ('867','123','李冉','信计一班','数学与大数据','未分配'),('2314','123','李冉','信计一班','数学与大数据','王五'),('2314','124','123','信计一班','数学与大数据','张三'),('654','124','李冉','信计一班','数学与大数据','未分配'),('7658976','124','123','信计一班','数学与大数据','未分配'),('7658976','123','123','信计一班','数学与大数据','未分配'),('8765865','123','123','信计一班','数学与大数据','未分配'),('64654','123','李冉','信计一班','数学与大数据','未分配'),('68523','123','李冉','信计一班','数学与大数据','未分配'),('6452','123','123','信计一班','数学与大数据','未分配'),('987654','123','李冉','信计一班','数学与大数据','李四'),('4785','123','关于环境','信计一班','数学与大数据','未分配');
/*!40000 ALTER TABLE `stujoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermanager`
--

DROP TABLE IF EXISTS `supermanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supermanager` (
  `name` varchar(10) NOT NULL,
  `passward` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermanager`
--

LOCK TABLES `supermanager` WRITE;
/*!40000 ALTER TABLE `supermanager` DISABLE KEYS */;
INSERT INTO `supermanager` VALUES ('11','11');
/*!40000 ALTER TABLE `supermanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `tno` varchar(20) NOT NULL,
  `tname` varchar(20) NOT NULL,
  `department` varchar(30) NOT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('985','王五','数学与大数据'),('986','李四','数学与大数据'),('987','张三','数学与大数据');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_info`
--

DROP TABLE IF EXISTS `teacher_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher_info` (
  `tno` varchar(30) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  PRIMARY KEY (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_info`
--

LOCK TABLES `teacher_info` WRITE;
/*!40000 ALTER TABLE `teacher_info` DISABLE KEYS */;
INSERT INTO `teacher_info` VALUES ('11','11');
/*!40000 ALTER TABLE `teacher_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadpaper`
--

DROP TABLE IF EXISTS `uploadpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uploadpaper` (
  `paperid` varchar(30) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `summary` varchar(1000) NOT NULL,
  `author` varchar(30) NOT NULL,
  `department` varchar(60) NOT NULL,
  `articlename` varchar(60) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `paperimg` varchar(30) NOT NULL,
  `bankcard` varchar(30) NOT NULL,
  `checksign` varchar(10) NOT NULL,
  `historysign` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadpaper`
--

LOCK TABLES `uploadpaper` WRITE;
/*!40000 ALTER TABLE `uploadpaper` DISABLE KEYS */;
INSERT INTO `uploadpaper` VALUES ('6786876','123','123','123','123','123','数学与大数据','423','132','20190105_213113_669.pdf','数学与大数据','5','1'),('4324432','123','让4124321','412412','4231412','李冉','数学与大数据','4231','4312','20190108_202438_393.pdf','43212','5','1'),('9412','123','c语言','c语言','这是c语言','李冉','数学与大数据','编程语言','13155482706','20190305_230609_302.pdf','684423541454121','4','1'),('516384','123','吧回娘家','光华逸家','第二天购房人冯小刚','夫人也挺好','数学与大数据','法规和加内特','46387498','20190306_002346_84.pdf','684423541454121','4','1'),('5468','123','反弹过后吧','反对韩国同步','地热田规划与大润发天屿湖','的任何一个','数学与大数据','的认同感','4768','20190306_002530_772.pdf','78638543','3','1'),('46385','123','4564','发给他回复','地方如通股份','地产股法人','数学与大数据','规划局','46387498','20190306_002714_220.pdf','8594','3','1'),('54688','123','河北经贸','好','打扰他故意','非要和他','数学与大数据','发给他也会','465','20190306_003029_636.pdf','48638','3','1'),('54638','123','犯桃花','发的认同感','店小二拖个地热血英豪','当然要退还给','数学与大数据','地方有任何','58889','20190306_003944_17.pdf','4638896','3','1');
/*!40000 ALTER TABLE `uploadpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadpatent`
--

DROP TABLE IF EXISTS `uploadpatent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uploadpatent` (
  `patentid` varchar(30) NOT NULL,
  `sno` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  `summary` varchar(1000) NOT NULL,
  `author` varchar(30) NOT NULL,
  `sclass` varchar(60) NOT NULL,
  `department` varchar(60) NOT NULL,
  `grade` varchar(30) NOT NULL,
  `bankcard` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `patentfile` varchar(60) NOT NULL,
  `checksign` varchar(10) NOT NULL,
  `historysign` varchar(10) NOT NULL,
  PRIMARY KEY (`patentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadpatent`
--

LOCK TABLES `uploadpatent` WRITE;
/*!40000 ALTER TABLE `uploadpatent` DISABLE KEYS */;
INSERT INTO `uploadpatent` VALUES ('312','123','312','312','123','123','信计一班','数学与大数据','123','123312','132','20190106_161616_113.pdf','5','1'),('333','123','132','132','312','312','信计一班','数学与大数据','312312','312','312','20190105_234657_562.pdf','3','0');
/*!40000 ALTER TABLE `uploadpatent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadprize`
--

DROP TABLE IF EXISTS `uploadprize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uploadprize` (
  `sno` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sclass` varchar(30) NOT NULL,
  `department` varchar(30) NOT NULL,
  `pid` varchar(20) NOT NULL,
  `comname` varchar(30) NOT NULL,
  `grade` varchar(30) NOT NULL,
  `category` varchar(30) NOT NULL,
  `score` int(2) NOT NULL,
  `imagename` varchar(30) NOT NULL,
  `sign` varchar(2) NOT NULL,
  `bankcard` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadprize`
--

LOCK TABLES `uploadprize` WRITE;
/*!40000 ALTER TABLE `uploadprize` DISABLE KEYS */;
INSERT INTO `uploadprize` VALUES ('123','李冉','信计一班','数学与大数据','867','蓝桥','学科竞赛','A类',3,'20190105185416_206.txt','5','7658767563476543'),('123','312','信计一班','数学与大数据','867','蓝桥','学科竞赛','A类',3,'20190105190025_889.txt','5','321'),('123','312','信计一班','数学与大数据','867','蓝桥','学科竞赛','A类',3,'20190105190232_506.txt','5','312'),('123','李冉','信计一班','数学与大数据','867','蓝桥','学科竞赛','A类',3,'20190105202114_7.txt','5','7658767563476543'),('123','李冉','信计一班','数学与大数据','2314','计算机','学科竞赛','一等奖',3,'20190107003219_121.jpg','4','354653546845645'),('123','李冉','信计一班','数学与大数据','2314','学科金赛','学科','一等奖',3,'20190108201338_517.png','4','7658767563476543'),('123','李冉','信计一班','数学与大数据','2314','学科金赛','学科','一等奖',3,'20190108201342_129.png','4','7658767563476543'),('123','李冉','信计一班','数学与大数据','2314','自然比赛','学科','一等奖',3,'20190108201638_799.png','4','7658767563476543'),('123','李冉','信计一班','数学与大数据','2314','拔河比赛','学科','一等奖',3,'20190108202000_577.jpg','4','345235'),('126','李冉','信计一班','数学与大数据','2314','11','一等奖','学科竞赛',3,'20190123172401_982.jpg','3','4655415452'),('123','李冉','信计一班','数学与大数据','654','科学比赛','一等奖','学科竞赛',5,'20190127173825_796.jpg','4','354653546845645'),('123','李冉','信计一班','数学与大数据','987654','c语言程序设计','一等奖','学科竞赛',4,'20190305225847_930.jpg','5','35435435432354354'),('123','规划建议他','信计一班','数学与大数据','987654','c语言程序设计','1','学科竞赛',4,'20190306003151_747.jpg','5','526385'),('123','规划局','信计一班','数学与大数据','987654','c语言程序设计','4','学科竞赛',4,'20190306004051_830.jpg','5','596963');
/*!40000 ALTER TABLE `uploadprize` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 14:29:24
