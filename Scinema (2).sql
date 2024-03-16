-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 15, 2024 at 11:03 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Scinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `Actors`
--

CREATE TABLE `Actors` (
  `ActorsID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `NameActor` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Actors`
--

INSERT INTO `Actors` (`ActorsID`, `NameActor`, `ImageURL`) VALUES
(0000001, 'Robert Downey Jr.', 'https://www.tnnthailand.com/static/details/-rqJc_PYdU-600.jpeg'),
(0000002, 'Cillian Murphy', 'https://s359.kapook.com/pagebuilder/0b51273e-0e57-4ef4-9658-12efcc82b485.jpg'),
(0000003, 'Ekkachai Srivichai', 'https://www.thebangkokinsight.com/wp-content/uploads/2020/08/9-%E0%B9%80%E0%B8%AD%E0%B8%81%E0%B8%8A%E0%B8%B1%E0%B8%A2-%E0%B8%A8%E0%B8%A3%E0%B8%B5%E0%B8%A7%E0%B8%B4%E0%B8%8A%E0%B8%B1%E0%B8%A2-2.jpg'),
(0000004, 'Sonthaya Chitmanee', 'https://upload.wikimedia.org/wikipedia/commons/3/34/Sonthaya_Chitmanee_at_Star_Entertainment_Awards_2007.jpg'),
(0000005, 'Latkamon Pinrojkirati ', 'https://www.mixmagazine.in.th/img/thumbnail/931e75176412baa472f5d67837751eb61473063904.jpg?v=01.48'),
(0000006, 'Anchalee Saisoontorn', 'https://www.nangdee.com/photoThumbnail/persons/p10025_Vld3FvMTue25053.jpg'),
(0000007, 'Margot Robbie', 'https://www.nangdee.com/photoThumbnail/persons/p12142_ZFULXo4Wed94202.jpg                        '),
(0000008, 'Ryan Gosling', 'https://www.nangdee.com/photoThumbnail/persons/p5522_k7rt6wkMon115608.jpg'),
(0000009, 'Teeradetch Metawarayut', 'https://f.ptcdn.info/335/021/000/1405595751-a04-o.jpg'),
(0000010, 'Ranchrawee Uakoolwarawat', 'https://s359.kapook.com/pagebuilder/2aed8d01-a68d-4fd4-8849-9e0be5982f5b.jpg'),
(0000011, 'Chutimon Chuengcharoensukying', 'https://static.thairath.co.th/media/Dtbezn3nNUxytg04aoZ98cZhr4gjMU0KZBhBZOPIooEIUy.webp'),
(0000012, 'Pachara Chirathivat', 'https://f.ptcdn.info/647/068/000/q7moij8p1WaznI29wq7-o.jpg'),
(0000013, 'Glen Powell', 'https://m.media-amazon.com/images/M/MV5BMGEzMTIwM2UtYjc5MC00ZGI4LWJiOTAtYzAwZmU0OTYzYWIxXkEyXkFqcGdeQXVyNDg0MzQyNA@@._V1_.jpg'),
(0000014, 'Sydney Sweeney', 'https://files.gqthailand.com/uploads/sydney-sweeney-breast-reduction-1.jpg'),
(0000015, 'Henry Cavill', 'https://www.khaosod.co.th/wpapp/uploads/2018/09/ENANew500.jpg'),
(0000016, 'Samuel L. Jackson', 'https://s359.kapook.com/r/600/auto/pagebuilder/03883131-07e7-4609-8f18-9d0ff7c79403.jpg'),
(0000017, 'Koji Yakusho', 'https://blog.asianwiki.com/wp-content/uploads/2016/12/Rikuo.jpg'),
(0000018, 'Emoto Tokio', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZhFNujs6VhgqmC4VXV2BdH7yD_MTZUxyxo8bFaVGu4XlOndV0Y3XkEr6n_t5lMCZmEZQ&usqp=CAU'),
(0000019, 'Eva Green', 'https://upload.wikimedia.org/wikipedia/commons/e/e2/EvaGreenByTFL2009TIFF.jpg'),
(0000020, 'Vincent Cassel', 'https://static1.purepeople.com/articles/4/25/08/64/@/3524374-vincent-cassel-lors-de-l-avant-premiere-580x0-3.jpg'),
(0000021, 'Deepika Padukone', 'https://static.thairath.co.th/media/Dtbezn3nNUxytg04OS38xe0z8t9zPDpJPpYaOVqbB0E85o.jpg'),
(0000022, 'Anil Kapoor', 'https://wikiimg.tojsiabtv.com/wikipedia/commons/thumb/c/c3/Aditya_Roy_Kapur_at_Samsung_S4_launch.jpg/440px-Aditya_Roy_Kapur_at_Samsung_S4_launch.jpg'),
(0000023, 'Jason Statham', 'https://i.pinimg.com/474x/92/b4/25/92b425ba88722949d338d00f2568f17a.jpg'),
(0000024, 'Joshua Ryan Hutcherson', 'https://i.pinimg.com/474x/29/75/92/2975921d35a6246a60f0062abc672ac1.jpg'),
(0000025, 'Yuki Yamada', 'https://www.xeen.co/wp-content/uploads/2023/08/ginger_7211_t1.jpg'),
(0000026, 'Shôtarô Mamiya', 'https://pbs.twimg.com/media/FY6iKV5aMAAuLuc.jpg'),
(0000027, 'Martin Freeman', 'https://upload.wikimedia.org/wikipedia/commons/4/4e/Martin_Freeman_in_2018_%281%29.jpg'),
(0000028, 'Jenna Ortega', 'https://www.tvpoolonline.com/wp-content/uploads/2023/03/24f6545fc821cff2a63b8a2c73324a1a.jpg'),
(0000029, 'Cristina Vee', 'https://upload.wikimedia.org/wikipedia/commons/3/35/Cristina_Vee_by_Gage_Skidmore.jpg'),
(0000030, 'Bryce Papenbrook', 'https://abtc.ng/wp-content/uploads/2023/11/Bryce-Papenbrook1.webp'),
(0000031, 'Inori Minase', 'https://e1.pxfuel.com/desktop-wallpaper/296/575/desktop-wallpaper-%E6%B0%B4%E7%80%AC%E3%81%84%E3%81%AE%E3%82%8A-inori-minase-thumbnail.jpg'),
(0000032, 'Kaito Ishikawa', 'https://f.ptcdn.info/218/018/000/1398439417-ishikakait-o.jpg'),
(0000033, 'Elizabeth Banks', 'https://m.media-amazon.com/images/M/MV5BMTI3ODI3ODkzNF5BMl5BanBnXkFtZTcwNDc3Mzc1MQ@@._V1_.jpg'),
(0000034, 'Awkwafina', 'https://www.themoviedb.org/t/p/w500/l5AKkg3H1QhMuXmTTmq1EyjyiRb.jpg'),
(0000035, 'Jason Momoa', 'https://static.amarintv.com/app/uploads/2019/08/03fae3c0f3b730ac864a71e4965348f4-758x1024.jpg'),
(0000036, 'Willem Dafoe', 'https://img.kapook.com/u/2016/surauch/movie1/willemdafoe2.jpg'),
(0000037, 'Oscar-Isaac', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGWCJkgSvw6qieGNKiVI2ke08O37UoA8nr4GdOuuQQn3SWalnAnF1Al_JB8aU9hqlWRJA&usqp=CAU'),
(0000038, 'Josh Brolin', 'https://static.sweet.tv/images/cache/person_profiles/BDNX2EQCMVXDACY=/16091-dzhosh-brolin.jpg'),
(0000039, 'Nadech Kugimiya', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/NadechKugimiya2014.jpg/640px-NadechKugimiya2014.jpg'),
(0000040, 'Denise Jelilcha Kapaun', 'https://f.ptcdn.info/215/082/000/s3lj15e7sO9uTJGT566-o.jpg'),
(0000041, 'Kanna hashimoto', 'https://pbs.twimg.com/media/E9cmmIOUYAIRtl5.jpg'),
(0000042, 'Kanta izuka', 'https://assets.mycast.io/actor_images/actor-kenta-izuka-98086_large.jpeg?1591334341'),
(0000043, 'Brie Larson', 'https://hips.hearstapps.com/hmg-prod/images/brie-larson-cm-1551695773.jpg'),
(0000044, 'Teyonah Parris', 'https://cdn01.justjared.com/wp-content/uploads/2021/01/parris-feraldine/teyonah-parris-in-wandavision-07.jpg'),
(0000045, 'Bradley Cooper', 'https://www.hollywoodreporter.com/wp-content/uploads/2011/08/bradley_cooper_a_p.jpg?w=2000&h=1126&crop=1'),
(0000046, 'Chris Pratt', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Chris_Pratt_2018.jpg/1200px-Chris_Pratt_2018.jpg'),
(0000047, 'Paul Rudd', 'https://cdn.britannica.com/74/220474-050-087FF31B/Paul-Rudd-2018.jpg'),
(0000048, 'Evangeline Lilly', 'https://www.usmagazine.com/wp-content/uploads/2022/01/Marvel-Star-Evangeline-Lilly-Attends-Anti-Vax-Protest-Read-Her-Statement.jpg?w=800&h=1421&crop=1&quality=55&strip=all'),
(0000051, 'Letitia Wright', 'https://upload.wikimedia.org/wikipedia/commons/3/39/Actress_Letitia_Wright_-_Red_Carpet_Hollywood_%2852471829089%29.jpg'),
(0000052, 'Lupita Nyong\'o', 'https://m.media-amazon.com/images/M/MV5BMTY0NTQ4MDY2Nl5BMl5BanBnXkFtZTgwNDk1MTEyMDE@._V1_.jpg'),
(0000053, 'Chris Hemsworth', 'https://upload.wikimedia.org/wikipedia/commons/e/e8/Chris_Hemsworth_by_Gage_Skidmore_2_%28cropped%29.jpg'),
(0000054, 'Christian Bale', 'https://www.usmagazine.com/wp-content/uploads/2022/05/Thors-Christian-Bale-Plays-One-Best-Marvel-Villains-Director-Says-001.jpg?w=800&h=1421&crop=1&quality=86&strip=all'),
(0000055, 'Benedict Cumberbatch', 'https://www.usmagazine.com/wp-content/uploads/1425324551_benedict-cumberbatch-402.jpg?w=800&h=1421&crop=1&quality=86&strip=all'),
(0000056, 'Elizabeth Olsen', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Elizabeth-olsen-1632123202.jpg/1200px-Elizabeth-olsen-1632123202.jpg'),
(0000057, 'Tom Holland', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg'),
(0000058, 'Zendaya', 'https://static.wikia.nocookie.net/disney-material/images/d/d2/Zendaya.webp/revision/latest?cb=20220708163931'),
(0000059, 'Gemma Chan', 'https://static.wikia.nocookie.net/transformers/images/e/e0/Gemma_Chan.jpg/revision/latest?cb=20171212125200'),
(0000060, 'Richard Madden', 'https://static1.purepeople.com/articles/1/41/32/91/@/5943623-richard-madden-soiree-du-film-rocketm-580x0-2.jpg'),
(0000061, 'Simu Liu', 'https://m.media-amazon.com/images/M/MV5BODU4NTJhMDItMmEwOC00NjkyLTlkMWMtZGEwNjg4ZTY4ZTgyXkEyXkFqcGdeQXVyMzI2MzYyNzI@._V1_.jpg'),
(0000062, 'Tony Leung Chiu-wai', 'https://lh3.googleusercontent.com/proxy/BSgTqJ6_5YGJJTXTojoFvpVJyKUHtu2gfyXZsiFOSTinOv1xOCzKSXzxknTUJNr0lnJfmr7UidmSj6qhfeuTDFzVbm8lvkpu7hezU0ukVa8P2f3cDysZuv9gx0nLSQ86-vc0OvSDyCSWYgA'),
(0000063, 'Scarlett Johansson', 'https://nypost.com/wp-content/uploads/sites/2/2023/05/GettyImages-1205154708.jpg'),
(0000064, 'Florence Pugh', 'https://static.wikia.nocookie.net/disney/images/4/48/Florence_Pugh.jpeg/revision/latest?cb=20221220235821'),
(0000065, 'Zoe Saldana', 'https://media.allure.com/photos/64adb09075e2656d85f1cdfd/master/w_1600%2Cc_limit/zoe%2520saldan%25CC%2583a%2520lob%2520.jpg'),
(0000066, 'Chiwetel Ejiofor', 'https://m.media-amazon.com/images/M/MV5BNzg1MTUyNDYxOF5BMl5BanBnXkFtZTgwNTQ4MTE2MjE@._V1_.jpg'),
(0000067, 'Chris Evans', 'https://media1.popsugar-assets.com/files/thumbor/FCEVWPTPJocbiRrqJF1oaJ6aCOw=/fit-in/792x1192/filters:format_auto():upscale()/2015/09/25/894/n/1922398/b44858debaa9960e_GettyImages-464178416_master.jpg'),
(0000068, 'Chadwick Boseman', 'https://m.media-amazon.com/images/M/MV5BMTk2OTY5MzcwMV5BMl5BanBnXkFtZTgwODM4MDI5MjI@._V1_.jpg'),
(0000069, 'Michael B. Jordan', 'https://cdn.britannica.com/74/219774-050-E0858F86/Michael-B-Jordan-2019.jpg'),
(0000070, 'Tom Hiddleston', 'https://ew.com/thmb/lnZtqSEyEhJkohC-r7iVUID3wWM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/dkfslfsdafs-d99ea06390ee43f59cf7374dfe4998e5.jpg'),
(0000071, '', ''),
(0000072, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Administrator`
--

CREATE TABLE `Administrator` (
  `AdministratorID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Bookings`
--

CREATE TABLE `Bookings` (
  `BookingID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `UsersID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `MovieID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `RoomID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Namemovie` varchar(255) NOT NULL,
  `SelectedSeats` text,
  `ShowtimeDate` date DEFAULT NULL,
  `Showtimetime` time NOT NULL,
  `TotalPrice` int(4) DEFAULT NULL,
  `BookingDate` date NOT NULL,
  `Quantity` int(7) NOT NULL,
  `Point` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Bookings`
--

INSERT INTO `Bookings` (`BookingID`, `UsersID`, `MovieID`, `RoomID`, `Namemovie`, `SelectedSeats`, `ShowtimeDate`, `Showtimetime`, `TotalPrice`, `BookingDate`, `Quantity`, `Point`) VALUES
(0000001, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A04,B04', '2024-02-13', '13:00:00', 220, '2024-02-10', 2, 0),
(0000002, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A05,B05', '2024-02-13', '13:00:00', 220, '2024-02-10', 2, 0),
(0000003, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A07', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000004, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A03,B03', '2024-02-13', '13:00:00', 220, '2024-02-10', 2, 0),
(0000005, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A03,B03', '2024-02-13', '13:00:00', 220, '2024-02-10', 2, 0),
(0000006, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E07', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000007, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'D08', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000008, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E08', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000009, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E08', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000010, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E08', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000011, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'D08', '2024-02-13', '13:00:00', 110, '2024-02-10', 1, 0),
(0000012, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A02', '2024-02-14', '10:00:00', 110, '2024-02-11', 1, 0),
(0000013, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A04', '2024-02-12', '10:00:00', 110, '2024-02-11', 1, 0),
(0000014, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'D01', '2024-02-14', '13:00:00', 110, '2024-02-11', 1, 0),
(0000015, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E02', '2024-02-14', '13:00:00', 110, '2024-02-11', 1, 0),
(0000016, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'A06', '2024-02-14', '13:00:00', 110, '2024-02-11', 1, 0),
(0000017, 0000001, 0000006, 0000001, 'E Sarn Zombie (อีสานซอมบี้)', 'C05,C06', '2024-02-11', '10:00:00', 220, '2024-02-11', 2, 0),
(0000018, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'C04,D04', '2024-02-15', '13:00:00', 0, '2024-02-15', 2, NULL),
(0000019, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'C08', '2024-02-15', '13:00:00', 0, '2024-02-15', 1, NULL),
(0000020, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'E08', '2024-02-15', '13:00:00', 0, '2024-02-15', 1, NULL),
(0000021, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'C03,D03,D04,D06', '2024-02-15', '10:00:00', 0, '2024-02-15', 4, NULL),
(0000022, 0000001, 0000006, 0000001, 'E Sarn Zombie (อีสานซอมบี้)', 'A04,B04,B07,C07,D08', '2024-02-15', '10:00:00', 0, '2024-02-15', 5, NULL),
(0000023, 0000001, 0000007, 0000002, 'Anyone But You (เกลียดนักรักซะเลย)', 'B03,C04', '2024-02-15', '10:00:00', 320, '2024-02-15', 2, 6),
(0000024, 0000001, 0000004, 0000004, 'Barbie (บาร์บี้)', 'A03,A04,B03,B04', '2024-02-15', '10:00:00', 800, '2024-02-15', 4, 16),
(0000025, 0000001, 0000019, 0000004, 'Dune Part Two (ดูน)', 'A03,B03,B04', '2024-02-15', '10:00:00', 720, '2024-02-15', 3, 14),
(0000026, 0000001, 0000020, 0000005, 'Death Whisperer (ธี่หยด)', 'A01,A02,B02', '2024-02-15', '10:00:00', 600, '2024-02-15', 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `CEO`
--

CREATE TABLE `CEO` (
  `CeoID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CEO`
--

INSERT INTO `CEO` (`CeoID`, `Username`, `Password`) VALUES
(0000001, 'Sasom', '01042545k'),
(0000002, 'Sapom', '01042545k');

-- --------------------------------------------------------

--
-- Table structure for table `Director`
--

CREATE TABLE `Director` (
  `DirectorID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `NameDirector` varchar(255) DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Director`
--

INSERT INTO `Director` (`DirectorID`, `NameDirector`, `ImageURL`) VALUES
(0000001, 'Christopher Nolan', 'https://www.sadaos.com/wp-content/uploads/2022/03/christopher_nolan-00.jpg'),
(0000002, 'Ekkachai Srivichai', 'https://us-fbcloud.net/wb/data/1497/1497912-img.w98l0k.11ch1.jpg'),
(0000003, 'Artistaya Arriyawongsa', 'https://www.thheadline.com/wp-content/uploads/2023/12/2-163-1024x1024.jpg'),
(0000004, 'Greta Gerwig', 'https://www.khaosod.co.th/wpapp/uploads/2021/07/ent14p1-5.jpg'),
(0000005, 'Jaturong Mokjok', 'https://media.komchadluek.net/uploads/images/contents/w1024/2022/08/NCwVwFBGam52EutgMDJ2.webp?x-image-process=style/LG-webp'),
(0000006, 'Thanawat Eiamjinda', 'https://i.mydramalist.com/kORdrc.jpg'),
(0000007, 'Will Gluck', 'https://www.nangdee.com/photoThumbnail/persons/p10774_HO6XOD1Tue121539.jpg'),
(0000008, 'Matthew Vaughn', 'https://ew.com/thmb/H7l2l-eamLdSQurEpSad5vh8eks=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/matthew-vaughn-afa60c095f2a48a980a7c21112d7f4cd.jpg'),
(0000009, 'Wim Wenders', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/MJK30764_Wim_Wenders_%28Berlinale_2017%29.jpg/220px-MJK30764_Wim_Wenders_%28Berlinale_2017%29.jpg'),
(0000010, 'Martin Bourboulon', 'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/884556_v9_aa.jpg'),
(0000011, 'Siddharth Anand', 'https://www.yashrajfilms.com/images/default-source/Alumni/siddharth-anandf500a8a026f56f7f9f64ff0b00090313.jpg?sfvrsn=0'),
(0000012, 'David Ayer', 'https://m.media-amazon.com/images/M/MV5BZjBmMTY4M2ItMmEwNC00NTUyLWIyZDEtYWNhNjViNjRiOGVlXkEyXkFqcGdeQXVyMTY2MzU0MjA@._V1_.jpg'),
(0000013, 'Yuzuru Tachikawa', 'https://www.nangdee.com/photoThumbnail/persons/p17537_6uOHNgKMon42622.jpg'),
(0000014, 'Jade Halley Bartlett', 'https://www.nangdee.com/photoThumbnail/persons/p20726_6bNOHZBFri115139.jpg'),
(0000015, 'Jeremy Zag', 'https://static.kinoafisha.info/k/persons/1080x1920/upload/persons/443284178485.jpg'),
(0000016, 'Soichi Masui', 'https://image.tmdb.org/t/p/original/eRCRldZdRnflFnzRJbSs6QNEmwm.jpg'),
(0000017, 'Benjamin Renner', 'https://images.fandango.com/ImageRenderer/300/0/redesign/static/img/default_poster.png/0/images/masterrepository/performer%20images/562277/benjaminrenner-1.jpg'),
(0000018, 'James Wan', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/James_Wan_by_Gage_Skidmore_2.jpg/1200px-James_Wan_by_Gage_Skidmore_2.jpg'),
(0000019, 'Denis Villeneuve', 'https://globalnews.ca/wp-content/uploads/2016/07/cpt103352157_high4.jpg?quality=85&strip=all'),
(0000020, 'Taweewat Wantha', 'https://www.matichon.co.th/wp-content/uploads/2023/11/7ADAAF35-BAED-4978-8F56-D299C2C75142-683x1024.jpeg'),
(0000021, 'Hideo nakata', 'https://www.hollywoodreporter.com/wp-content/uploads/2013/03/hideo_nakata_the_comples_oimf.jpg?w=1024'),
(0000022, 'Kevin Feige', 'https://www.shutterstock.com/image-photo/kevin-feige-30th-annual-producers-260nw-1291066093.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `GenreID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Genre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`GenreID`, `Genre`) VALUES
(0000001, 'Animation'),
(0000002, 'Fantasy'),
(0000003, 'Cartoon'),
(0000004, 'Action movie'),
(0000005, 'Documentary'),
(0000006, 'Comedy'),
(0000007, 'Drama'),
(0000008, 'Entertainment'),
(0000009, 'Horror movie'),
(0000010, 'Family movie'),
(0000011, 'Sci-fi'),
(0000012, 'Remake'),
(0000013, 'Romance'),
(0000014, 'Silent movie');

-- --------------------------------------------------------

--
-- Table structure for table `Movie`
--

CREATE TABLE `Movie` (
  `MovieID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `NameMovie` varchar(255) DEFAULT NULL,
  `GenreID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `Movie_ActorsID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `DirectorID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `RoomID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Duration` varchar(10) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `LeavingDate` date DEFAULT NULL,
  `Poster` varchar(255) DEFAULT NULL,
  `LinkVDO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Movie`
--

INSERT INTO `Movie` (`MovieID`, `NameMovie`, `GenreID`, `Movie_ActorsID`, `DirectorID`, `RoomID`, `Duration`, `price`, `ReleaseDate`, `LeavingDate`, `Poster`, `LinkVDO`) VALUES
(0000001, 'Oppenheimer (ออปเพนไฮเมอร์)', 0000011, NULL, 0000001, 0000001, '180 mins', '200', '2023-12-01', '2023-12-31', 'https://pbs.twimg.com/media/FvUVt3hXgAAxP1H?format=jpg&name=900x900', 'https://www.youtube.com/watch?v=dRTD5UKcQgQ'),
(0000002, 'The Cursed (เหมรย)', 0000009, NULL, 0000002, 0000002, '94 mins', '180', '2023-12-01', '2023-12-31', 'https://media.komchadluek.net/uploads/images/contents/w1024/2024/01/WK6mwdZyM0mcCV7H28lV.webp?x-image-process=style/LG-webp', 'https://www.youtube.com/watch?v=l5_JwheL8cI&t=2s'),
(0000003, 'Elite Of Devils (หม่อม)', 0000009, NULL, 0000003, 0000003, '108 mins', '210', '2023-12-01', '2023-12-31', 'https://cdni-hw.bugaboo.tv/dm/sz-md/i/images/2023/07/05/357522986_813896610735996_2144429995280047982_n_1688550469_1397.jpg', 'https://www.youtube.com/watch?v=MKBg-MnCNzU'),
(0000004, 'Barbie (บาร์บี้)', 0000002, NULL, 0000004, 0000004, '114 mins', '200', '2023-12-01', '2023-12-31', 'https://s359.kapook.com/r/600/auto/pagebuilder/80673f5a-c244-4028-975b-6a46479f0b06.jpg', 'https://www.youtube.com/watch?v=DexGF69tqGo'),
(0000005, 'Chinatown Cha Cha (ไชน่าทาวน์ ชะช่า)', 0000006, NULL, 0000005, 0000005, '105 Mins', '180', '2023-12-01', '2023-12-31', 'https://cdni-hw.bugaboo.tv/dm/sz-md/i/images/2023/11/22/f_yaj_lbaaawyes_1700627136_1094.jpg', 'https://www.youtube.com/watch?v=dwCpgRrz1kk'),
(0000006, 'E Sarn Zombie (อีสานซอมบี้)', 0000006, NULL, 0000006, 0000001, '101 mins', '160', '2024-01-01', '2024-01-31', 'https://lh3.googleusercontent.com/HrR41DoJvJ1VRXDpk-UERZFxJ58Bqe95aAs9IQ7V8CQiuO-BrVH5WNa6pGStaD5O_EjahijQs8Zdq2SaEj1TzjOk9ad5ZEryzr8=w280', 'https://www.youtube.com/watch?v=5pvhDHbzsOc'),
(0000007, 'Anyone But You (เกลียดนักรักซะเลย)', 0000013, NULL, 0000007, 0000002, '103 mins', '160', '2024-01-01', '2024-01-31', 'https://cms.dmpcdn.com/dara/2023/12/14/64561a60-9a36-11ee-a694-8507b2460137_webp_original.webp', 'https://www.youtube.com/watch?v=cerMw7WS51I'),
(0000008, 'Argylle (อาร์ไกล์ ยอดสายลับ)', 0000004, NULL, 0000008, 0000003, '135 mins', '180', '2024-01-01', '2024-01-31', 'https://media.themoviedb.org/t/p/w500/rsk1I49HCiS1T6oemVLRJ8ZhFr4.jpg', 'https://www.youtube.com/watch?v=Y4wggcJC0LI'),
(0000009, 'Perfect Days (หยุดโลกเหงาไว้ตรงนี้)\r\n', 0000007, NULL, 0000009, 0000004, '123 mins', '180', '2024-01-01', '2024-01-31', 'https://www.online-station.net/wp-content/uploads/2024/01/1440x2132_2.jpg', 'https://www.youtube.com/watch?v=sWIOvoNdx7Q'),
(0000010, 'The Three Musketeers (สามทหารเสือ มิลาดี้สตรีสีเลือด)', 0000004, NULL, 0000010, 0000005, '115 mins', '200', '2024-01-01', '2024-01-31', 'https://lh3.googleusercontent.com/GuVJWiS7vAzZI-DsGAkLd0MfOXmK_IWKfP6Y_05vj6jyYjrNaqZMbdLmw1VpKk-Ke5PT77mIfw6ARxfteXC-IhWxZhtJ5FAWicU=w260', 'https://www.youtube.com/watch?v=57EwR6kNH6w'),
(0000011, 'Fighter', 0000004, NULL, 0000011, 0000001, '160 mins', '200', '2024-02-01', '2024-02-29', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTrC8oy6LL2v_Gpfq6oFMcPvTusxqHeH39vWJsqEFGPAnb8rDVY', 'https://www.youtube.com/watch?v=6amIq_mP4xM'),
(0000012, 'The Beekeeper (นรกเรียกพ่อ)\r\n', 0000004, NULL, 0000012, 0000002, '105 mins', '180', '2024-02-01', '2024-02-29', 'https://cdni-hw.bugaboo.tv/dm/sz-md/i/images/2023/12/07/the_beekeeper_th_poster_resize_1701929915_4640.jpg', 'https://www.youtube.com/watch?v=MAA69fS4eYY'),
(0000013, 'Blue Giant (บลูไจแอนต์)', 0000001, NULL, 0000013, 0000003, '120 mins', '180', '2024-02-01', '2024-02-29', 'https://lh3.googleusercontent.com/2hodH88bdpbcRAeZWokFWxgE9U2DO96Oo76-Sas1Qpzzq9hptyLiryweP_FatAh4FnZE-bsHXb-I2dYevIHInoit-LEWf0xBsw=w260', 'https://www.youtube.com/watch?v=83F3tnL49Mk'),
(0000014, 'Miller\'s Girl (หลักสูตรร้อนซ่อนรัก)', 0000009, NULL, 0000014, 0000004, '94 mins', '200', '2024-02-01', '2024-02-29', 'https://lh3.googleusercontent.com/u-Xr6mnPeZuBB92oio5Rs31JgehbDE_rKImJq4yO4JRrUm8PXFczwaituyLpOGkchOXvl_mmPz5SPOiqlKP0c0zTrmBhXflL=s0', 'https://www.youtube.com/watch?v=fHN6Rud_f58'),
(0000015, 'Ladybug and Cat Noir (ฮีโร่มหัศจรรย์ เลดี้บัค และ แคทนัวร์)', 0000001, NULL, 0000015, 0000005, '105 Mins', '200', '2024-02-01', '2024-02-29', 'https://lh3.googleusercontent.com/dXZpbeNiSv5N11mtVm12FKvweL1ng33SzR6nTXaG6pfHkknm8c1wxNCNw2SZ9LFnCe-yBLBh_PFGW6xBN57NcuVi1KzRXuPt=s0', 'https://www.youtube.com/watch?v=10sfF2box94'),
(0000016, 'Rascal Does Not Dream of a Knapsack Kid', 0000002, NULL, 0000016, 0000001, '76 mins', '200', '2024-03-01', '2024-03-31', 'https://upload.wikimedia.org/wikipedia/en/thumb/1/10/Rascal_Does_Not_Dream_of_a_Knapsack_Kid_poster.jpg/220px-Rascal_Does_Not_Dream_of_a_Knapsack_Kid_poster.jpg', 'https://www.youtube.com/watch?v=o288JZI2dis'),
(0000017, 'Migration (ครอบครัวเป็ดผจญภัย)', 0000001, NULL, 0000017, 0000002, '92 mins', '180', '2024-03-01', '2024-03-31', 'https://s359.kapook.com/pagebuilder/f791996f-a377-4e94-b32b-54949222d08a.jpg', 'https://www.youtube.com/watch?v=2OeNMhseOW0'),
(0000018, 'Aquaman and the Lost Kingdom (อควาแมน กับอาณาจักรสาบสูญ)', 0000002, NULL, 0000018, 0000003, '124 mins', '260', '2024-03-01', '2024-03-31', 'https://www.xeen.co/wp-content/uploads/2023/11/401513169_723534699804338_8316691893253874326_n.jpg', 'https://www.youtube.com/watch?v=5bS7D9rQnL4'),
(0000019, 'Dune Part Two (ดูน)', 0000004, NULL, 0000019, 0000004, '166 mins', '240', '2024-03-01', '2024-03-31', 'https://lh3.googleusercontent.com/At7-P67j4DaB3OmtnAKyh4CPu3x-GuDonJ80Z3ypCfrWEZEwzO9-nBWf-f8F3KINrHVrBLmUltEXjmgY2RLbLoCFNDRNb7XdXw=s0', 'https://www.youtube.com/watch?v=EJXzB_n2nhs'),
(0000020, 'Death Whisperer (ธี่หยด)', 0000009, NULL, 0000020, 0000005, '121 mins', '200', '2024-03-01', '2024-03-31', 'https://lfesot8819.expandcart.com/ecdata/stores/LFESOT8819/image/data/products/1706967341_1.jpg', 'https://www.youtube.com/watch?v=4MFA-ZhsK0c'),
(0000021, 'The Forbidden Play (หลุมหลอนซ่อนคำสาป)', 0000009, NULL, 0000021, 0000001, '110 mins', '200', '2024-04-01', '2024-04-30', 'https://asianwiki.com/images/e/e0/Kinjirareta_Asobi-p1.jpg', 'https://www.youtube.com/watch?v=bHMYpoMMoM0');

-- --------------------------------------------------------

--
-- Table structure for table `Movie_Actors`
--

CREATE TABLE `Movie_Actors` (
  `Movie_ActorsID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `MovieID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `ActorsID` int(7) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Movie_Actors`
--

INSERT INTO `Movie_Actors` (`Movie_ActorsID`, `MovieID`, `ActorsID`) VALUES
(0000001, 0000001, 0000001),
(0000002, 0000001, 0000002),
(0000003, 0000002, 0000003),
(0000004, 0000002, 0000004),
(0000005, 0000003, 0000005),
(0000006, 0000003, 0000006),
(0000007, 0000004, 0000007),
(0000008, 0000004, 0000008),
(0000009, 0000005, 0000009),
(0000010, 0000005, 0000010),
(0000011, 0000006, 0000011),
(0000012, 0000006, 0000012),
(0000013, 0000007, 0000013),
(0000014, 0000007, 0000014),
(0000015, 0000008, 0000015),
(0000016, 0000008, 0000016),
(0000017, 0000009, 0000017),
(0000018, 0000009, 0000018),
(0000019, 0000010, 0000019),
(0000020, 0000010, 0000020),
(0000021, 0000011, 0000021),
(0000022, 0000011, 0000022),
(0000023, 0000012, 0000023),
(0000024, 0000012, 0000024),
(0000025, 0000013, 0000025),
(0000026, 0000013, 0000026),
(0000027, 0000014, 0000027),
(0000028, 0000014, 0000028),
(0000029, 0000015, 0000029),
(0000030, 0000015, 0000030),
(0000031, 0000016, 0000031),
(0000032, 0000016, 0000032),
(0000033, 0000017, 0000033),
(0000034, 0000017, 0000034),
(0000035, 0000018, 0000035),
(0000036, 0000018, 0000036),
(0000037, 0000019, 0000037),
(0000038, 0000019, 0000038),
(0000039, 0000020, 0000039),
(0000040, 0000020, 0000040),
(0000041, 0000021, 0000041),
(0000042, 0000021, 0000042);

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `PaymentID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `QR` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`PaymentID`, `QR`) VALUES
(0000001, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Poster_Promotion`
--

CREATE TABLE `Poster_Promotion` (
  `PosterID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Poster` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Poster_Promotion`
--

INSERT INTO `Poster_Promotion` (`PosterID`, `Poster`) VALUES
(0000001, NULL),
(0000002, NULL),
(0000003, NULL),
(0000004, ''),
(0000005, ''),
(0000006, ''),
(0000007, ''),
(0000008, ''),
(0000009, ''),
(0000010, ''),
(0000011, ''),
(0000012, '');

-- --------------------------------------------------------

--
-- Table structure for table `Promotion`
--

CREATE TABLE `Promotion` (
  `PromotionID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `PromotionName` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `DiscountAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Promotion`
--

INSERT INTO `Promotion` (`PromotionID`, `PromotionName`, `StartDate`, `EndDate`, `DiscountAmount`) VALUES
(0000001, 'Valentine\'s Day', '2024-02-01', '2024-02-14', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `RoomID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Roomname` varchar(255) DEFAULT NULL,
  `TypeScreen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`RoomID`, `Roomname`, `TypeScreen`) VALUES
(0000001, 'Theater 1', 'IMAX'),
(0000002, 'Theater 2', '4DX'),
(0000003, 'Theater 3', 'IMAX'),
(0000004, 'Theater 4', '4DX'),
(0000005, 'Theater 5', 'IMAX');

-- --------------------------------------------------------

--
-- Table structure for table `Seats`
--

CREATE TABLE `Seats` (
  `SeatID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `RoomID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `SeatNumber` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Seats`
--

INSERT INTO `Seats` (`SeatID`, `RoomID`, `SeatNumber`) VALUES
(0000001, 0000001, 'A01'),
(0000002, 0000001, 'A02'),
(0000003, 0000001, 'A03'),
(0000004, 0000001, 'A04'),
(0000005, 0000001, 'A05'),
(0000006, 0000001, 'A06'),
(0000007, 0000001, 'A07'),
(0000008, 0000001, 'A08'),
(0000009, 0000001, 'B01'),
(0000010, 0000001, 'B02'),
(0000011, 0000001, 'B03'),
(0000012, 0000001, 'B04'),
(0000013, 0000001, 'B05'),
(0000014, 0000001, 'B06'),
(0000015, 0000001, 'B07'),
(0000016, 0000001, 'B08'),
(0000017, 0000001, 'C01'),
(0000018, 0000001, 'C02'),
(0000019, 0000001, 'C03'),
(0000020, 0000001, 'C04'),
(0000021, 0000001, 'C05'),
(0000022, 0000001, 'C06'),
(0000023, 0000001, 'D07'),
(0000024, 0000001, 'C08'),
(0000025, 0000001, 'D01'),
(0000026, 0000001, 'D02'),
(0000027, 0000001, 'D03'),
(0000028, 0000001, 'D04'),
(0000029, 0000001, 'D05'),
(0000030, 0000001, 'D06'),
(0000031, 0000001, 'D07'),
(0000032, 0000001, 'D08'),
(0000033, 0000001, 'E01'),
(0000034, 0000001, 'E02'),
(0000035, 0000001, 'E03'),
(0000036, 0000001, 'E04'),
(0000037, 0000001, 'E05'),
(0000038, 0000001, 'E06'),
(0000039, 0000001, 'E07'),
(0000040, 0000001, 'E08'),
(0000041, 0000002, 'A01'),
(0000042, 0000002, 'A02'),
(0000043, 0000002, 'A03'),
(0000044, 0000002, 'A04'),
(0000045, 0000002, 'A05'),
(0000046, 0000002, 'A06'),
(0000047, 0000002, 'A07'),
(0000048, 0000002, 'A08'),
(0000049, 0000002, 'B01'),
(0000050, 0000002, 'B02'),
(0000051, 0000002, 'B03'),
(0000052, 0000002, 'B04'),
(0000053, 0000002, 'B05'),
(0000054, 0000002, 'B06'),
(0000055, 0000002, 'B07'),
(0000056, 0000002, 'B08'),
(0000057, 0000002, 'C01'),
(0000058, 0000002, 'C02'),
(0000059, 0000002, 'C03'),
(0000060, 0000002, 'C04'),
(0000061, 0000002, 'C05'),
(0000062, 0000002, 'C06'),
(0000063, 0000002, 'D07'),
(0000064, 0000002, 'C08'),
(0000065, 0000002, 'D01'),
(0000066, 0000002, 'D02'),
(0000067, 0000002, 'D03'),
(0000068, 0000002, 'D04'),
(0000069, 0000002, 'D05'),
(0000070, 0000002, 'D06'),
(0000071, 0000002, 'D07'),
(0000072, 0000002, 'D08'),
(0000073, 0000002, 'E01'),
(0000074, 0000002, 'E02'),
(0000075, 0000002, 'E03'),
(0000076, 0000002, 'E04'),
(0000077, 0000002, 'E05'),
(0000078, 0000002, 'E06'),
(0000079, 0000002, 'E07'),
(0000080, 0000002, 'E08'),
(0000081, 0000003, 'A01'),
(0000082, 0000003, 'A02'),
(0000083, 0000003, 'A03'),
(0000084, 0000003, 'A04'),
(0000085, 0000003, 'A05'),
(0000086, 0000003, 'A06'),
(0000087, 0000003, 'A07'),
(0000088, 0000003, 'A08'),
(0000089, 0000003, 'B01'),
(0000090, 0000003, 'B02'),
(0000091, 0000003, 'B03'),
(0000092, 0000003, 'B04'),
(0000093, 0000003, 'B05'),
(0000094, 0000003, 'B06'),
(0000095, 0000003, 'B07'),
(0000096, 0000003, 'B08'),
(0000097, 0000003, 'C01'),
(0000098, 0000003, 'C02'),
(0000099, 0000003, 'C03'),
(0000100, 0000003, 'C04'),
(0000101, 0000003, 'C05'),
(0000102, 0000003, 'C06'),
(0000103, 0000003, 'C07'),
(0000104, 0000003, 'C08'),
(0000105, 0000003, 'D01'),
(0000106, 0000003, 'D02'),
(0000107, 0000003, 'D03'),
(0000108, 0000003, 'D04'),
(0000109, 0000003, 'D05'),
(0000110, 0000003, 'D06'),
(0000111, 0000003, 'D07'),
(0000112, 0000003, 'D08'),
(0000113, 0000003, 'E01'),
(0000114, 0000003, 'E02'),
(0000115, 0000003, 'E03'),
(0000116, 0000003, 'E04'),
(0000117, 0000003, 'E05'),
(0000118, 0000003, 'E06'),
(0000119, 0000003, 'E07'),
(0000120, 0000003, 'E08'),
(0000121, 0000004, 'A01'),
(0000122, 0000004, 'A02'),
(0000123, 0000004, 'A03'),
(0000124, 0000004, 'A04'),
(0000125, 0000004, 'A05'),
(0000126, 0000004, 'A06'),
(0000127, 0000004, 'A07'),
(0000128, 0000004, 'A08'),
(0000129, 0000004, 'B01'),
(0000130, 0000004, 'B02'),
(0000131, 0000004, 'B03'),
(0000132, 0000004, 'B04'),
(0000133, 0000004, 'B05'),
(0000134, 0000004, 'B06'),
(0000135, 0000004, 'B07'),
(0000136, 0000004, 'B08'),
(0000137, 0000004, 'C01'),
(0000138, 0000004, 'C02'),
(0000139, 0000004, 'C03'),
(0000140, 0000004, 'C04'),
(0000141, 0000004, 'C05'),
(0000142, 0000004, 'C06'),
(0000143, 0000004, 'C07'),
(0000144, 0000004, 'C08'),
(0000145, 0000004, 'D01'),
(0000146, 0000004, 'D02'),
(0000147, 0000004, 'D03'),
(0000148, 0000004, 'D04'),
(0000149, 0000004, 'D05'),
(0000150, 0000004, 'D06'),
(0000151, 0000004, 'D07'),
(0000152, 0000004, 'D08'),
(0000153, 0000004, 'E01'),
(0000154, 0000004, 'E02'),
(0000155, 0000004, 'E03'),
(0000156, 0000004, 'E04'),
(0000157, 0000004, 'E05'),
(0000158, 0000004, 'E06'),
(0000159, 0000004, 'E07'),
(0000160, 0000004, 'E08'),
(0000161, 0000005, 'A01'),
(0000162, 0000005, 'A02'),
(0000163, 0000005, 'A03'),
(0000164, 0000005, 'A04'),
(0000165, 0000005, 'A05'),
(0000166, 0000005, 'A06'),
(0000167, 0000005, 'A07'),
(0000168, 0000005, 'A08'),
(0000169, 0000005, 'B01'),
(0000170, 0000005, 'B02'),
(0000171, 0000005, 'B03'),
(0000172, 0000005, 'B04'),
(0000173, 0000005, 'B05'),
(0000174, 0000005, 'B06'),
(0000175, 0000005, 'B07'),
(0000176, 0000005, 'B08'),
(0000177, 0000005, 'C01'),
(0000178, 0000005, 'C02'),
(0000179, 0000005, 'C03'),
(0000180, 0000005, 'C04'),
(0000181, 0000005, 'C05'),
(0000182, 0000005, 'C06'),
(0000183, 0000005, 'C07'),
(0000184, 0000005, 'C08'),
(0000185, 0000005, 'D01'),
(0000186, 0000005, 'D02'),
(0000187, 0000005, 'D03'),
(0000188, 0000005, 'D04'),
(0000189, 0000005, 'D05'),
(0000190, 0000005, 'D06'),
(0000191, 0000005, 'D07'),
(0000192, 0000005, 'D08'),
(0000193, 0000005, 'E01'),
(0000194, 0000005, 'E02'),
(0000195, 0000005, 'E03'),
(0000196, 0000005, 'E04'),
(0000197, 0000005, 'E05'),
(0000198, 0000005, 'E06'),
(0000199, 0000005, 'E07'),
(0000200, 0000005, 'E08');

-- --------------------------------------------------------

--
-- Table structure for table `Showtimes`
--

CREATE TABLE `Showtimes` (
  `ShowtimeID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `MovieID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `RoomID` int(7) UNSIGNED ZEROFILL DEFAULT NULL,
  `ShowTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Showtimes`
--

INSERT INTO `Showtimes` (`ShowtimeID`, `MovieID`, `RoomID`, `ShowTime`) VALUES
(0000001, 0000001, 0000001, '10:00:00'),
(0000002, 0000001, 0000001, '13:00:00'),
(0000003, 0000001, 0000001, '16:00:00'),
(0000004, 0000002, 0000002, '10:00:00'),
(0000005, 0000002, 0000002, '13:00:00'),
(0000006, 0000002, 0000002, '16:00:00'),
(0000007, 0000003, 0000003, '10:00:00'),
(0000008, 0000003, 0000003, '13:00:00'),
(0000009, 0000003, 0000003, '16:00:00'),
(0000010, 0000004, 0000004, '10:00:00'),
(0000011, 0000004, 0000004, '13:00:00'),
(0000012, 0000004, 0000004, '16:00:00'),
(0000013, 0000005, 0000005, '10:00:00'),
(0000014, 0000005, 0000005, '13:00:00'),
(0000015, 0000005, 0000005, '16:00:00'),
(0000016, 0000006, 0000001, '10:00:00'),
(0000017, 0000006, 0000001, '13:00:00'),
(0000018, 0000006, 0000001, '16:00:00'),
(0000019, 0000007, 0000002, '10:00:00'),
(0000020, 0000007, 0000002, '13:00:00'),
(0000021, 0000007, 0000002, '16:00:00'),
(0000022, 0000008, 0000003, '10:00:00'),
(0000023, 0000008, 0000003, '13:00:00'),
(0000024, 0000008, 0000003, '16:00:00'),
(0000025, 0000009, 0000004, '10:00:00'),
(0000026, 0000009, 0000004, '13:00:00'),
(0000027, 0000009, 0000004, '16:00:00'),
(0000028, 0000010, 0000005, '10:00:00'),
(0000029, 0000010, 0000005, '13:00:00'),
(0000030, 0000010, 0000005, '16:00:00'),
(0000031, 0000011, 0000001, '10:00:00'),
(0000032, 0000011, 0000001, '13:00:00'),
(0000033, 0000011, 0000001, '16:00:00'),
(0000034, 0000012, 0000002, '10:00:00'),
(0000035, 0000012, 0000002, '13:00:00'),
(0000036, 0000012, 0000002, '16:00:00'),
(0000037, 0000013, 0000003, '10:00:00'),
(0000038, 0000013, 0000003, '13:00:00'),
(0000039, 0000013, 0000003, '16:00:00'),
(0000040, 0000014, 0000004, '10:00:00'),
(0000041, 0000014, 0000004, '13:00:00'),
(0000042, 0000014, 0000004, '16:00:00'),
(0000043, 0000015, 0000005, '10:00:00'),
(0000044, 0000015, 0000005, '13:00:00'),
(0000045, 0000015, 0000005, '16:00:00'),
(0000046, 0000016, 0000001, '10:00:00'),
(0000047, 0000016, 0000001, '13:00:00'),
(0000048, 0000016, 0000001, '16:00:00'),
(0000049, 0000017, 0000002, '10:00:00'),
(0000050, 0000017, 0000002, '13:00:00'),
(0000051, 0000017, 0000002, '16:00:00'),
(0000052, 0000018, 0000003, '10:00:00'),
(0000053, 0000018, 0000003, '13:00:00'),
(0000054, 0000018, 0000003, '16:00:00'),
(0000055, 0000019, 0000004, '10:00:00'),
(0000056, 0000019, 0000004, '13:00:00'),
(0000057, 0000019, 0000004, '16:00:00'),
(0000058, 0000020, 0000005, '10:00:00'),
(0000059, 0000020, 0000005, '13:00:00'),
(0000060, 0000020, 0000005, '16:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UsersID` int(7) UNSIGNED ZEROFILL NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `ID_Card_Number` varchar(13) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UsersID`, `Name`, `Gender`, `ID_Card_Number`, `Email`, `Phone_Number`, `Age`, `Date`, `Password`) VALUES
(0000001, 'kamonrat', 'Female', '1658700004510', 'amonrat@gmail.com', 0985648875, 21, NULL, '$2y$10$PQCPu950Z4HkkzTemtSowOlCSh1GUg21xXibEZialF7XYdSDrmiHy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Actors`
--
ALTER TABLE `Actors`
  ADD PRIMARY KEY (`ActorsID`);

--
-- Indexes for table `Administrator`
--
ALTER TABLE `Administrator`
  ADD PRIMARY KEY (`AdministratorID`);

--
-- Indexes for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD PRIMARY KEY (`BookingID`),
  ADD KEY `foreign kayUsers` (`UsersID`),
  ADD KEY `foreign kayMovie` (`MovieID`),
  ADD KEY `foreign kayRoom` (`RoomID`);

--
-- Indexes for table `CEO`
--
ALTER TABLE `CEO`
  ADD PRIMARY KEY (`CeoID`);

--
-- Indexes for table `Director`
--
ALTER TABLE `Director`
  ADD PRIMARY KEY (`DirectorID`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`GenreID`);

--
-- Indexes for table `Movie`
--
ALTER TABLE `Movie`
  ADD PRIMARY KEY (`MovieID`),
  ADD KEY `foreign kayGenre` (`GenreID`),
  ADD KEY `foreign kayDirector` (`DirectorID`),
  ADD KEY `foreign kayMovie_Actors` (`Movie_ActorsID`),
  ADD KEY `foreign kayRoom11` (`RoomID`);

--
-- Indexes for table `Movie_Actors`
--
ALTER TABLE `Movie_Actors`
  ADD PRIMARY KEY (`Movie_ActorsID`),
  ADD KEY `foreign kayActorsID` (`ActorsID`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `Poster_Promotion`
--
ALTER TABLE `Poster_Promotion`
  ADD PRIMARY KEY (`PosterID`);

--
-- Indexes for table `Promotion`
--
ALTER TABLE `Promotion`
  ADD PRIMARY KEY (`PromotionID`);

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`RoomID`);

--
-- Indexes for table `Seats`
--
ALTER TABLE `Seats`
  ADD PRIMARY KEY (`SeatID`),
  ADD KEY `foreign_kayRoom` (`RoomID`);

--
-- Indexes for table `Showtimes`
--
ALTER TABLE `Showtimes`
  ADD PRIMARY KEY (`ShowtimeID`),
  ADD KEY `foreign_kayMovie` (`MovieID`),
  ADD KEY `foreign__kayRoom` (`RoomID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UsersID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Actors`
--
ALTER TABLE `Actors`
  MODIFY `ActorsID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `Administrator`
--
ALTER TABLE `Administrator`
  MODIFY `AdministratorID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bookings`
--
ALTER TABLE `Bookings`
  MODIFY `BookingID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `CEO`
--
ALTER TABLE `CEO`
  MODIFY `CeoID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Director`
--
ALTER TABLE `Director`
  MODIFY `DirectorID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `GenreID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Movie`
--
ALTER TABLE `Movie`
  MODIFY `MovieID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `Movie_Actors`
--
ALTER TABLE `Movie_Actors`
  MODIFY `Movie_ActorsID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `Payment`
--
ALTER TABLE `Payment`
  MODIFY `PaymentID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Poster_Promotion`
--
ALTER TABLE `Poster_Promotion`
  MODIFY `PosterID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `Promotion`
--
ALTER TABLE `Promotion`
  MODIFY `PromotionID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Room`
--
ALTER TABLE `Room`
  MODIFY `RoomID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Seats`
--
ALTER TABLE `Seats`
  MODIFY `SeatID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `Showtimes`
--
ALTER TABLE `Showtimes`
  MODIFY `ShowtimeID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UsersID` int(7) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Bookings`
--
ALTER TABLE `Bookings`
  ADD CONSTRAINT `foreign kayMovie` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign kayRoom` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign kayUsers` FOREIGN KEY (`UsersID`) REFERENCES `Users` (`UsersID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Movie`
--
ALTER TABLE `Movie`
  ADD CONSTRAINT `foreign kayDirector` FOREIGN KEY (`DirectorID`) REFERENCES `Director` (`DirectorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign kayGenre` FOREIGN KEY (`GenreID`) REFERENCES `Genre` (`GenreID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign kayMovie_Actors` FOREIGN KEY (`Movie_ActorsID`) REFERENCES `Movie_Actors` (`Movie_ActorsID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign kayRoom11` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Movie_Actors`
--
ALTER TABLE `Movie_Actors`
  ADD CONSTRAINT `foreign kayActorsID` FOREIGN KEY (`ActorsID`) REFERENCES `Actors` (`ActorsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Seats`
--
ALTER TABLE `Seats`
  ADD CONSTRAINT `foreign_kayRoom` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Showtimes`
--
ALTER TABLE `Showtimes`
  ADD CONSTRAINT `foreign__kayRoom` FOREIGN KEY (`RoomID`) REFERENCES `Room` (`RoomID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `foreign_kayMovie` FOREIGN KEY (`MovieID`) REFERENCES `Movie` (`MovieID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
