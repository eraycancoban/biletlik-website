-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: biletlik2
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `user_id` int NOT NULL,
  `seat_number` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (10,33,13,21),(11,33,13,20);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'komedi'),(2,'aksiyon'),(3,'aile'),(4,'korku');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `moviebanners`
--

DROP TABLE IF EXISTS `moviebanners`;
/*!50001 DROP VIEW IF EXISTS `moviebanners`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `moviebanners` AS SELECT 
 1 AS `movie_id`,
 1 AS `image_banner`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `movieposter`
--

DROP TABLE IF EXISTS `movieposter`;
/*!50001 DROP VIEW IF EXISTS `movieposter`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movieposter` AS SELECT 
 1 AS `movie_id`,
 1 AS `title`,
 1 AS `image`,
 1 AS `category_id`,
 1 AS `category_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `cast` varchar(255) NOT NULL,
  `duration` int NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_banner` varchar(255) NOT NULL,
  `category` int NOT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `category` (`category`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Avengers','Joss Whedon','Robert Downey Jr. Chris Evans Mark Ruffalo Chris Hemsworth Scarlett Johansson Jeremy Renner Tom Hiddleston Stellan Skarsgård Samuel L. Jackson',143,'Yenilmezler, Marvel’in en çok iz bırakan kahramanlarını bünyesinde topluyor: Demir Adam, Hulk, Thor, Kaptan Amerika, Hawkeye ve Black Widow. Beklenmedik bir düşman su yüzüne çıkıp dünyanın güvenliğini tehdit etmeye başlıyor','https://static.displate.com/857x1200/displate/2021-01-28/50c288197a62a2386ee9ee41f315f352_982fad6a978f26b986ed8f3f733dd843.jpg','https://collider.com/wp-content/uploads/avengers-character-poster-banner.jpeg',2),(2,'Yüzüklerin Efendisi: Kralın Dönüşü','Peter Jackson','Elijah Woo,Ian McKellen,Viggo Mortensen,Liv Tyler,Sean Astin,Orlando Bloom',251,'Aragorn, kendi ırkının çağrısına cevap vererek, Orta Dünya’nın bütün kaderi onun elindeyken doğumuyla birlikte ona verilen gücünü kullanabilecek midir? ','https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UX1000_.jpg','https://wallpaperaccess.com/full/5326802.jpg',2),(3,'Kill Bill vol 1','Quentin Tarantino','Uma Thurman,Lucy Liu,Vivica A. Fox,Michael Madsen',111,'\'Gelin\' (The Bride) takma adıyla bilinen kiralık katil, düğünü sırasında saldırıya uğrar. Kilisedeki herkes öldürülür. O da karnındaki bebeğini düşürür ama hayatta kalmayı başarır. 5 yıl boyunca komada kalan Gelin, bir mucize eseri hayata geri döner. Artık tek amacı vardır: Ona pusu kuran eski patronu Bill ve adamlarını teker teker öldürmek. Bill\'i en son öldürecektir. Gelin intikamını almak için yola koyulur.','https://m.media-amazon.com/images/I/61Dbe0qBy9L._AC_UF1000,1000_QL80_.jpg','https://cdn.shopify.com/s/files/1/0275/5287/4580/collections/KILL_BILL_PLP_BANNER_UK_1200x.jpg?v=1606985009',2),(4,'Inception','Christopher Nolan','Leonardo DiCaprio Ken Watanabe Joseph Gordon-Levitt Marion Cotillard Elliot Page Tom Hardy Cillian Murphy Tom Berenger Michael Caine',148,'Dom Cobb (Leonardo DiCaprio) çok yetenekli bir hırsızdır. Uzmanlık alanı, zihnin en savunmasız olduğu rüya görme anında, bilinçaltının derinliklerindeki değerli sırları çekip çıkarmak ve onları çalmaktır.Ancak, aynı zamanda bu durum onu uluslararası bir kaçak yapmış ve sevdiği herşeye malolmuştur. Cobb’a içinde bulunduğu durumdan kurtulmasını sağlayacak bir fırsat sunulur. Ona hayatını geri verebilecek son bir iş; tabi eğer imkansız başlangıçı tamamlayabilirse... ','https://image.tmdb.org/t/p/original/xlaY2zyzMfkhk0HSC5VUwzoZPU1.jpg','https://farm5.static.flickr.com/4026/4687381287_1b1b15c3e6_o.jpg',2),(5,'Hangover  Part 2','Todd Phillips','Bradley Cooper Ed Helms Zach Galifianakis Ken Jeong Jeffrey Tambor Justin Bartha Paul Giamatti',101,'Stu, Phil, Alan ve Doug Stu\'nun düğünü için Tayland\'a gider. Las Vegas\'taki unutulmaz bekarlığa veda partisinden sonra Stu işini şansa bırakmayıp sakin bir düğün öncesi kahvaltısı yapmayı tercih eder. Ancak ertesi sabah başka bir şehirde, yüzünde bir dövme, bardakta kesik bir parmak ve bir maymun ile uyandığında hiçbir şeyin planladığı gibi gitmediğini fark edecektir, üstelik karısının kardeşi de kayıptır. ... Vegas\'ta olan Vegas\'ta kalabilir ama Bangkok\'ta olanlar hayal bile edilemez.','https://m.media-amazon.com/images/I/710aT3+oGIL._AC_UF894,1000_QL80_.jpg','https://collider.com/wp-content/uploads/the-hangover-part-2-banner-image.jpg',1),(6,'The Truman Show','Peter Weir','Jim Carrey Laura Linney Noah Emmerich Natascha McElhone Holland Taylor Ed Harris',103,'Truman çok güzel bir adada yaşamaktadır... Fakat bu ada, Truman dışında her şeyin sahte olduğu bir ortamdır ve doğduğu günden itibaren devamlı olarak seyirciler tarafından izlenmiştir. Truman, bunun hiç farkında olmaz,  ta ki öldüğünü sandığı babasını görene dek.','https://www.arthipo.com/image/cache/catalog/poster/movie/1-758/pfilm465-the-truman-show_a04d6482-movie-film-poster-turuman-sov-1000x1000.jpg','https://images5.alphacoders.com/342/thumb-1920-342593.jpg',1),(7,'Ice Age 2','Carlos Saldanha','Ray Romano John Leguizamo Denis Leary Seann William Scott Queen Latifah',91,'Mamut Manny bir aile kurmak istemektedir. Fakat uzun süredir ortalıklarda Manny\'den başka bir mamuta rastlanılmadığı için kimse bunun mümkün olduğuna inanmamaktadır. Ta ki bir gün Manny\'nin karşısına Ellie isimli bir mamut çıkana kadar. Manny ve Ellie pek iyi anlaşamamaktadırlar çünkü Ellie kendisini bir opossum sanmaktadır. Bu arada ısınan hava, vadiyi okyanus sularından ayıran devasa barajı eritmeye başlamıştır. Bunu farkeden kahramanlarımız Manny, Sid ve Diego tek kurtuluşun vadinin diğer tarafına geçmek olduğu bilirler. Üçü Ellie ve iki opossum kardeşini alarak macera dolu bir yolculuğa adım atarlar.','https://galeri7.uludagsozluk.com/216/ice-age-2-the-meltdown_318670.jpg','https://i3-img.sat1.de/pis/ezone/7abaqgELB38wdEB-ZftIYFPQSp-HxjRVj8ghGONpO6WKv8KwcMRqvEFZouGtwEX89gMFFEUYHvucgORYqmiOrHFRQNZCy00uO_pWxokt4A/profile:mag-max-1280x722?source',1),(8,'Yahşi Batı','Ömer Faruk Sorak','Cem Yılmaz Ozan Güven Demet Evgar Özkan Uğur Zafer Algöz',115,'19. Yüzyıl\'da özel bir görev kapsamında padişah tarafından Amerika\'ya gönderilen iki Osmanlı yetkilisi Aziz Bey ve Lemi Bey trenle yaptıkları yolculuk esnasında yanlarında taşıdıkları değerli elması, treni durduran haydutlara kaptırırlar. Sonrasında hem elması bulmak hem de çalınan paralarını toparlamak için para kazanmanın yollarını arayan ikili dönemin revaçta olan işlerinden birine atılırlar. Kasabalarda aranan azılı suçluluların peşine düşüp ödül avcısı olan ikilinin maceralı yolculuğu sadece bunlarla sınırlı kalmaz. Yaşadıkları kasabada başlarına türlü dertler açan ikiliyi fazlasıyla eğlenceli maceralar beklemektedir.','https://tr.web.img4.acsta.net/pictures/bzp/01/176919.jpg','https://iasbh.tmgrup.com.tr/98d687/1200/627/0/0/1280/668?u=https://isbh.tmgrup.com.tr/sbh/2020/04/06/yahsi-bati-filmi-kac-yilinda-cekildi-yahsi-bati-konusu-ve-oyuncu-kadrosu-1586193608493.jpg',1),(9,'Home Alone','Chris Columbus','Macaulay Culkin Joe Pesci Daniel Stern John Heard Tim Curry Brenda Fricker Catherine O\'Hara',103,'Ailesinden nefret eden Kevin aldığı ceza üzerine geceyi çatıkatında geçirir yalnız ertesi gün uyandığında ailesinin evde olmadığını, tatile giderken onu unuttuklarını farkeder. Başta panikleyen Kevin bunun fırsat olduğunu çok geçmeden anlar ve yalnızlığın tadını çıkarmaya başlar. Eve gözlerini dikmiş olan 2 hırsızı evden uzaklaştırmak artık Kevin\'a düşmüştür...','https://image.tmdb.org/t/p/original/9ZYBqQUCEzEnbbtbKrFNukvU4bC.jpg','https://lumiere-a.akamaihd.net/v1/images/image_86dd5e23.jpeg?region=0,0,1800,776',3),(10,'Wall-E',' Andrew Stanton','Ben Burtt Elissa Knight Sigourney Weaver Jeff Garlin Fred Willard John Ratzenberger Kathy Najimy',98,'Dünya gezegenini terk eden insanlar tarafından unutulduktan sonra, uzun yıllar boyunca yapayalnız yaşayan ve bu süre içinde programlandığı işle (çöp tasnifiyle) uğraşan robot WALL-E, günün birinde EVE adlı çok güzel bir arama robotuyla karşılaşır ve hayatı aniden yepyeni bir anlam kazanır. WALL-E’nin elinde gezegenin geleceğinin anahtarının olduğunu keşfeden EVE, artık başka bir gezegende yaşayan ve dünyaya güvenlik içinde geri dönüş haberini heyecanla beklemekte olan insanlara bu bilgiyi rapor etmek için müthiş bir uzay yolculuğuna çıkar. Ancak WALL-E’ de boş durmamış, çok beğendiği EVE’in peşine takılarak onunla birlikte galaksiye açılmıştır.','https://www.arthipo.com/image/cache/catalog/poster/movie/759-1554/pfilm1429-wall-e-poster-film-movie-posters-cinema-kanvas-tablo-canvas-1000x1000.jpg','https://image.tmdb.org/t/p/original/ai2FicMUxLCurVkjtYdSvVDWRmS.jpg',3),(11,'Night At The Museum 2','Shawn Levy','Ben Stiller Robin Williams Owen Wilson Dick Van Dyke Mickey Rooney Bill Cobbs Matthew McConaughey Amy Adams',105,'Doğal Tarih Müzesi yenilenmek için kapatılır. Müze içindeki eserler ise meşhur Washington müzesinde devlet tarafından koruma altına alınır. 136 milyon eser ve koleksiyonlar dünyanın en büyük müzesi olan Smithsonian kurumunda sergileniyor. Filme bu sefer yeni kahramanlar yani yeni eserler ekleniyor, ve bunlardan biri de tek başına Atlantik\'i geçen efsanevi kadın pilot Amelia Earhart.','https://i.etsystatic.com/12729518/r/il/ee77e7/2000117198/il_fullxfull.2000117198_oykq.jpg','https://wallpapercave.com/wp/wp6971700.jpg',3),(12,'Cars','John Lasseter , Joe Ranft','Owen Wilson Paul Newman Bonnie Hunt Larry the Cable Guy',116,'Lightning McQueen başarıya koşullanmış bir yarış arabasıdır. Beklenmedik bir anda kendisini Route 66 otoyolu üzerindeki sessiz sakin Radiator Springs kasabasında bulduğunda hayatın sadece bir finiş çizgisinden ibaret olmadığını, hayatın kendisinin başlıbaşına bir yolculuk olduğunu keşfeder. Piston Kupası Şampiyonası için ülkeyi baştanbaşa geçen Lightning McQueen, Radiator Springs kasabasının sıradışı karakterlerini yakından tanıma fırsatını bulur.','https://upload.wikimedia.org/wikipedia/tr/thumb/0/00/Cars_Poster.jpg/800px-Cars_Poster.jpg','https://www.wallpaperflare.com/static/666/534/546/car-cars-movie-disney-pixars-wallpaper.jpg',3),(13,'Dark Knight','Christopher Nolan','Christian Bale Michael Caine Heath Ledger Gary Oldman Aaron Eckhart Maggie Gyllenhaal Morgan Freeman',152,'The Dark Knight\'da, Batman suça karşı savaşını daha da ileriye götürüyor: Teğmen Jim Gordon ve Bölge Savcısı Harvey Dent’in yardımlarıyla, Batman, şehir sokaklarını sarmış olan suç örgütlerinden geriye kalanları temizlemeye girişir. Bu ortaklığın etkili olduğu açıktır, ama ekip kısa süre sonra kendilerini, Joker olarak bilinen ve Gotham şehri sakinlerini daha önce de dehşete boğmuş olan suç dehasının yarattığı karmaşanın ortasında bulurlar.','https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg','https://i0.wp.com/batman-news.com/wp-content/uploads/2012/05/ANKFr.jpg?fit=2366%2C1088&quality=80&strip=info&ssl=1',4),(14,'Inglourious Basterds','Quentin Tarantino','Brad Pitt Til Schweiger Christoph Waltz Eli Roth Diane Kruger Mélanie Laurent Samuel L. Jackson',153,'Aynı günlerda Avrupa’nın başka bir köşesinde Teğmen Aldo Raine (Brad Pitt), Yahudi askerler tarafından kurulan bir grubu düşmana karşı misilleme yapma amacıyla organize etmektedir. Düşmanları tarafından “Piçler” yakıştırmasıyla bilinen Raine’ın grubu, Nazi Almanyasının önde gidenlerine zarar verme misyonunu üstlenmiştir. Bu amaçla, Alman sinema oyuncusu ve gizli ajan Bridget Von Hammersmark (Diane Kruger) ile işbirliği yaparlar.Shasoanna’nın kendi intikamını alma planlarını yaptığı bir sinema salonunun çatısı altında hepsinin kaderleri kesişecektir.','https://m.media-amazon.com/images/I/61PXdxTJGPL.jpg','https://www.sosyalelestiri.com/wp-content/uploads/2017/08/inglourious_basterds-1024x570.jpg',4),(15,'Forrest Gump','Robert Zemeckis','Tom Hanks Robin Wright Penn Gary Sinise Mykelti Williamson Sally Field',151,'Forrest Gump, zeka seviyesi 75 olan bir erkeğin hayatını ele alıyor. Zeka seviyesi nedeni ile devlet okullarına girmekte bile zorlanan Forrest Gump  zamanla akla mantığa uymayan başarılara imza atıyor. Her ne kadar zeka seviyesi düşük olsa da fiziksel olarak son derece sağlam olan Forrest Gump, zamanla gelişen olaylar zincirinde bizi hayal edemeyeceğimiz bir dünyaya götürüyor.','https://image.tmdb.org/t/p/original/yu26pJwGFUyqTJWMWo1mMgBFJ0N.jpg','https://wallpapers.com/images/featured/t7fimpldrjxqk3ns.jpg',4),(16,'Interstellar','Christopher Nolan','Matthew McConaughey Anne Hathaway Jessica Chastain Michael Caine Bill Irwin Ellen Burstyn',169,'Yakın gelecekte yeryüzünde yaşam, artan kuraklık ve iklim değişiklikleri nedeniyle tehlikeye girmiştir. İnsan ırkı yok olma tehlikesiyle yüzyüzedir. Derken yeni keşfedilmiş bir solucandeliği, tüm insanlık için umut olur. Buradan geçip boyut değiştirerek daha önce hiçbir insanoğlunun erişemediği yerlere ulaşmak ve insanoğlunun yeni yaşam alanlarını araştırmak ise bir grup astronot-kaşife kalır. Bu kaşifler, geçen 1 saatin dünyadaki 7 yıla bedel olduğu ortamda hem hızlı ve cesur olmak zorunda kalacaklardır.','https://www.arthipo.com/image/cache/catalog/poster/movie/1-758/pfilm716-interstellar_a074ce1f-movie-film-posteri-1000x1000.jpg','https://external-preview.redd.it/KyGjptvL22o3gtOip8JlAvgi1e5g7uzVyDTHzHbJeBQ.jpg?auto=webp&s=27bc01051ac7a56cc29de770fcddd2eb344edbf8',4);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `movietitle`
--

DROP TABLE IF EXISTS `movietitle`;
/*!50001 DROP VIEW IF EXISTS `movietitle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `movietitle` AS SELECT 
 1 AS `movie_id`,
 1 AS `title`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `myticket`
--

DROP TABLE IF EXISTS `myticket`;
/*!50001 DROP VIEW IF EXISTS `myticket`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `myticket` AS SELECT 
 1 AS `title`,
 1 AS `name`,
 1 AS `start`,
 1 AS `seat_number`,
 1 AS `user_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `screen_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (1,'salon 1',32),(2,'salon 2',32),(3,'salon 3',32),(4,'salon 4',32),(5,'salon 5',32),(6,'salon 6',32),(7,'salon 7',32),(8,'salon 8',32),(9,'salon 9',32),(10,'salon 10',32);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `screen_id` int NOT NULL,
  `start` varchar(5) NOT NULL,
  `end_` varchar(5) NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `movie_id` (`movie_id`),
  KEY `screen_id` (`screen_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,1,'13:45','1'),(2,1,1,'16:20','1'),(3,1,1,'20:30','1'),(4,1,1,'22:15','1'),(5,2,2,'12:15','2'),(6,2,2,'14:55','2'),(7,2,2,'17:35','2'),(8,2,2,'20:45','2'),(9,3,3,'16:45','3'),(10,3,3,'12:10','3'),(11,3,3,'20:30','3'),(12,3,3,'22:15','3'),(13,4,4,'12:30','4'),(14,4,4,'15:45','4'),(15,4,4,'18:15','4'),(16,4,4,'21:45','4'),(17,5,5,'12:30','6'),(18,5,5,'15:45','6'),(19,6,5,'18:15','6'),(20,6,5,'21:45','6'),(21,7,6,'12:30','6'),(22,7,6,'15:45','6'),(23,8,6,'18:15','6'),(24,8,6,'21:45','6'),(25,9,7,'12:30','7'),(26,9,7,'15:45','7'),(27,10,7,'18:15','7'),(28,10,7,'21:45','7'),(29,11,8,'12:30','8'),(30,11,8,'15:45','8'),(31,12,8,'18:15','8'),(32,12,8,'21:45','8'),(33,13,9,'12:30','9'),(34,13,9,'15:45','9'),(35,14,9,'18:15','9'),(36,14,9,'21:45','9'),(37,15,10,'12:30','10'),(38,15,10,'15:45','10'),(39,16,10,'18:15','10'),(40,16,10,'21:45','10');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,'dsfsd','sdfdsfdsf','$2a$10$vRp79SbrdwNX4HGpS8o/6enIFPvRL9jJlR3aZ/0pjXCnLE.IAPjFS'),(6,'q','asda','$2a$10$5rxl.FXTtYViwkivUtLWW.fO6qCB4DhMqdPkWCRp7qtQi6FOktm8u'),(7,'ghfd','dghd','$2a$10$o971opGyd/1oNZbUNmFZwObkBOF9Uk8V9xQXj.aFbWSKrzbj37AQ6'),(8,'qdsfdsf','dsfafdgfa','$2a$10$mLtkjteW1LGIKKrpOydoZeQcPC1GlhrCQ7EfMnKFPzHjY78p92RjO'),(9,'q','q@q','$2a$10$O1IKs2cr0Q2lOSTMxHiFK.B5L7VlO6jJJvcUmRpxQlCTl973OMopq'),(10,'e','ee','$2a$10$1ZdEc0Zr918PshJYMG6vleTqr.2asLs3Uk4QkyyxvFopwdsysg0Ja'),(11,'qw','qw','$2a$10$BviyBSXsiFHQ2x7WgSXoGuI3IosK.NJLkzU7ooZtAJ2Nyu2/lWXU6'),(13,'z','z','$2a$10$CyJ2G3thAJL.A.gMwrd8LORhDMxomM3zW4vR/R10wvmY.dO4rdEvm'),(14,'g','g','$2a$10$0Xe71QAkG5vAaVLJod3eeOuNte7gMVvysr6sXX2xdqzYb6bj9iwdq'),(15,'k','k','$2a$10$50c3zr2hdKRvKOmO6TS7ieP5/jiZC7qQqQgzg/EONjVNbHQQpE8ma'),(16,'admin','admin','$2a$10$grwZ9l.0HYHjBNO3iZ11T.E2beDK1oRNjcr29jFTNNjkqKhgEeJS6'),(17,'fedo','de@d','$2a$10$tRvN/1tQfpslIGwAXE8RzOTv9pO1JubW/nE4BGcf0sQdxHRZFwtmy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `moviebanners`
--

/*!50001 DROP VIEW IF EXISTS `moviebanners`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `moviebanners` AS select `movies`.`movie_id` AS `movie_id`,`movies`.`image_banner` AS `image_banner` from `movies` limit 6 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movieposter`
--

/*!50001 DROP VIEW IF EXISTS `movieposter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movieposter` AS select `m`.`movie_id` AS `movie_id`,`m`.`title` AS `title`,`m`.`image` AS `image`,`c`.`category_id` AS `category_id`,`c`.`category_name` AS `category_name` from (`movies` `m` join `categories` `c` on((`m`.`category` = `c`.`category_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `movietitle`
--

/*!50001 DROP VIEW IF EXISTS `movietitle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `movietitle` AS select `movies`.`movie_id` AS `movie_id`,`movies`.`title` AS `title` from `movies` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `myticket`
--

/*!50001 DROP VIEW IF EXISTS `myticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `myticket` AS select `m`.`title` AS `title`,`scr`.`name` AS `name`,`s`.`start` AS `start`,`b`.`seat_number` AS `seat_number`,`b`.`user_id` AS `user_id` from (((`sessions` `s` join `movies` `m` on((`m`.`movie_id` = `s`.`movie_id`))) join `bookings` `b` on((`s`.`session_id` = `b`.`session_id`))) join `screens` `scr` on((`s`.`screen_id` = `scr`.`screen_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15  8:07:58
