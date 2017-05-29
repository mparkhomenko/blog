-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: blog
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id_article` smallint(6) NOT NULL AUTO_INCREMENT,
  `article` text,
  `id_user` smallint(6) DEFAULT NULL,
  `id_theme` smallint(6) DEFAULT NULL,
  `header` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  KEY `articles_users_fk` (`id_user`),
  KEY `articles_themes_fk` (`id_theme`),
  CONSTRAINT `articles_themes_fk` FOREIGN KEY (`id_theme`) REFERENCES `themes` (`id_theme`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `articles_users_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (205,'фыав',2,25,'qwe'),(206,'awrd',2,27,'qwer'),(207,'dasgadrgargerg',2,18,'sadf'),(208,'При ',2,16,'xzv'),(209,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',2,26,'hgj'),(210,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',2,10,'ytujr'),(212,'Статья о чём-то',3,17,'Заголовок моей статьи'),(213,'asdasfdas',3,21,'Женя'),(214,'sadfsadfsadfsadfsadfsd',3,27,'State'),(215,'fghjlkl;',3,17,'xcvgbjkl;\''),(217,'Первым поселенцем на территории нынешнего города был скотовод и торговец из Форт-Маккаветта Чарльз Адамс, переехавший туда в 1885 году. В 1887 году он назвал место в честь семейного слуги из мексиканского региона Сонора. Адамс предлагал бесплатные лоты в городе, который в 1890 году был выбран административном центром округа Саттон[3].\nВ 1890 году начался выпуск еженедельной газеты «Devil\'s River News». Строительные материалы для города поставлялись телегами из Форт-Маккаветта и Сан-Анджело, время в пути составляло от 6 до 15 дней. В 1908 году был заключён контракт с железной дорогой Kansas City, Mexico and Orient Railway о постройке линии из Сан-Анджело в Дель-Рио. Строительство началось в 1909 году, однако компания столкнулась с финансовыми проблемами и не смогла завершить проект. В 1928 году участок линии купила железнодорожная компания Atchison, Topeka and Santa Fe и 13 мая 1930 года открылось железнодорожное сообщение между Сонорой и Сан-Анджело[3].\nВ 1916 году город совместно с Техасским университетом A&M организовал сельскохозяйственную экспериментальную площадку. В 1917 году Сонора получила устав и органы местного управления. Когда во время Великой депрессии стоимость овечьей и козьей шерсти упала в два раза, местные овцеводы организовали ассоциацию по продаже шерсти, которая помогала реализовывать товар и смогла стабилизировать цены[3].',1,18,'цкцуйкцукцукйцукцукцйукцйукцукцукйцукйцукйцк'),(218,'В своём интервью Bloomberg один из основателей компании Илон Маск рассказал о планах по расширению производства автомобилей Tesla в Европе. В настоящее время компания проводит крупноузловую сборку Tesla Model S в Нидерландах. Разворачивание серийного производства в Европе планируется начать с запуска «бюджетной» версии Tesla Model 3, которая должна появиться в течение 3—4 лет[43][44].\nВ 2014 году Tesla и штат Невада заключили соглашение о предоставлении налоговых льгот для планируемого к постройке завода аккумуляторов Gigafactory 1 — самого большого в мире. Завод будет с 2020 года производить для электромобилей 500 тыс. батарей. Инвестиции в производство составят около $5 млрд[45]. На февраль 2015 года активно идёт сооружение основного корпуса[46].\nКомпания Tesla Motors сообщила через твиттер о том, что острова Американское Самоа почти на 100% обеспечены солнечной энергией благодаря эксплуатации свыше 5300 солнечных панелей[47][48].\nВ мае 2017 года Илон Маск представил план развития компании, предусматривающий добавление в линейку электромобилей грузовика и автобуса[49].',1,14,'Tesla Inc.'),(219,'KDE был основан 14 октября 1996 Маттиасом Эттрихом, который в то время был студентом Тюбингенского университета. Его беспокоили проблемы UNIX-десктопа, одной из которых было отсутствие приложений, которые выглядели бы и вели себя одинаково. Он предложил не просто создание набора программ, а скорее среды для рабочего стола, в которой пользователь мог ожидать однородного поведения программ. Кроме того, он хотел сделать эту среду простой и понятной в эксплуатации.\nВ качестве инструментария разработки пользовательского интерфейса был выбран Qt. Инициатива получила распространение и стараниями разработчиков к началу 1997 года среда насчитывала уже достаточное количество приложений. На тот момент Qt не использовал свободную лицензию, и участники проекта GNU были обеспокоены тем фактом, что свободная среда и программы, входящие в её состав, создаются с использованием несвободных инструментов. Это послужило причиной создания двух проектов: «Harmony» и GNOME. Имея одинаковые цели (создание свободной среды свободными средствами), два проекта выбрали совершенно разные пути реализации задуманного. Проект Harmony ставил своей задачей переписать библиотеки Qt, выпустив их под свободной лицензией, проект GNOME — отказался полностью от использования Qt.\nВ ноябре 1998 года инструментарий Qt стал использовать свободную лицензию — open source Q Public License. Организациями Trolltech и специально созданной для этого KDE e.V. была основана KDE Free Qt Foundation, между которой и Trolltech было подписано соглашение, позволяющее KDE Free Qt Foundation в экстренном случае (прекращение разработки Qt Free Edition) выпустить Qt под лицензией типа BSD[3].\nВ сентябре 2000 года Trolltech выпускает UNIX-версию Qt под лицензией GNU General Public License, после чего споры, касающиеся лицензирования Qt, сошли на нет. Qt 4.0 доступна под лицензией GNU GPL для платформ *nix, Mac и Windows, что позволяет приложениям и библиотекам KDE 4 иметь полную официальную поддержку на всех перечисленных платформах.',1,18,'KDE'),(222,'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',1,14,'Моя статья'),(223,'sdfg',3,1,'sdfg'),(224,'dfsgdfsgdsfg',3,16,'dsfgdfsg'),(229,'dhyhy',1,27,'hdth'),(230,'d',5,25,'d'),(231,'111',5,11,'111'),(232,'222',5,11,'222');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id_comments` smallint(6) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `id_user` smallint(6) DEFAULT NULL,
  `id_article` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_comments`),
  KEY `comments_users_fk` (`id_user`),
  KEY `comments_articles_fk` (`id_article`),
  CONSTRAINT `comments_articles_fk` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_users_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'asfasdfadsf',2,209),(2,'asdfadsfsadfeqrgqergerg',2,210),(3,'PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',2,210),(4,'dfhdkjshkjdhgkjdghdjkfhgkjdfhgljkdrghjrdnhklerhjnjrtkhnkjrthnlrgekrgjkrt;gr',2,205),(5,'I am lera!',3,209),(6,'adsfadsfasdf',3,205),(8,'123',3,213),(9,'hjfgjgdjdgj',3,205),(10,'sdfa',3,206),(11,'zextghjkml.',3,215),(12,'321',3,213),(13,'kjelag',1,215),(14,'йцу',1,212),(15,'aefs',1,215),(16,'tesla',1,218);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `id_favourites` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_article` smallint(6) DEFAULT NULL,
  `id_user` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_favourites`),
  KEY `favourites_articles_fk` (`id_article`),
  KEY `favourites_users_fk` (`id_user`),
  CONSTRAINT `favourites_articles_fk` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favourites_users_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (3,218,1),(5,218,3),(6,219,3),(7,222,3),(10,224,1),(11,223,1),(12,230,5);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id_like` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_user` smallint(6) DEFAULT NULL,
  `id_article` smallint(6) DEFAULT NULL,
  `uLike` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_like`),
  KEY `likes_users_fk` (`id_user`),
  KEY `likes_articles_fk` (`id_article`),
  CONSTRAINT `likes_articles_fk` FOREIGN KEY (`id_article`) REFERENCES `articles` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_users_fk` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (614,1,210,1),(615,1,215,1),(616,1,212,1),(617,1,213,1),(618,1,214,1),(621,1,219,1),(622,1,207,1),(623,3,222,1),(624,3,224,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id_section` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_section`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'Железо'),(2,'Дистрибутивы'),(3,'Загрузчики системы'),(4,'Графические оболочки'),(5,'Shell, Bash');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `id_theme` smallint(6) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) DEFAULT NULL,
  `id_section` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_theme`),
  KEY `themes_sections_fk` (`id_section`),
  CONSTRAINT `themes_sections_fk` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id_section`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Процессоры',1),(2,'Видеокарты',1),(3,'Клавиатуры',1),(4,'Ubuntu',2),(5,'Debian',2),(6,'Mint',2),(7,'Arch',2),(8,'Gentoo',2),(9,'Elementary',2),(10,'RedHat',2),(11,'Fedora',2),(12,'CentOS',2),(13,'Open SUSE',2),(14,'Другие дистрибутивы ',2),(15,'Grub',3),(16,'Grub2',3),(17,'LiLo',3),(18,'KDE',4),(19,'GNOME',4),(20,'Xfce',4),(21,'MATE',4),(22,'CINNAMON',4),(23,'Unity',4),(24,'LXDE',4),(25,'Enlightenment',4),(26,'IceWM',4),(27,'Shell, Bash',5),(28,'C, C++',5);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'maks','maks@maks.maks','202cb962ac59075b964b07152d234b70'),(2,'alex','alex@alex.alex','202cb962ac59075b964b07152d234b70'),(3,'Lera','lera@lera.lera','202cb962ac59075b964b07152d234b70'),(5,'igor','igor@igor.igor','202cb962ac59075b964b07152d234b70');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-29 23:58:51
