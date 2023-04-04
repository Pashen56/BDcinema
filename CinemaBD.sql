SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



/*Создание таблиц*/

CREATE TABLE `Cinemas` (
  `id_Cinemas` serial COLLATE utf8_unicode_ci NOT NULL,
  `CinemaName` text COLLATE utf8_unicode_ci NOT NULL,
  `CinemaLocation` text COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfHalls` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `CinemaHalls` (
  `id_CinemaHalls` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Cinemas` serial COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfHalls` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfRows` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfPlaces` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `HallCategory` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Sessions` (
  `id_Sessions` serial COLLATE utf8_unicode_ci NOT NULL,
  `SessionDate` date NOT NULL,
  `SessionTime` time NOT NULL,
  `id_CinemaHalls` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Movies` (
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL,
  `MovieName` text COLLATE utf8_unicode_ci NOT NULL,
  `MovieLength` time NOT NULL,
  `MovieReleaseYear` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Tickets` (
  `id_Tickets` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_CinemaHalls` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Sessions` serial NOT NULL,
  `id_Places` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Places` (
  `id_Places` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_CinemaHalls` serial COLLATE utf8_unicode_ci NOT NULL,
  `Row` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `Places` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `PlacesCategory` text COLLATE utf8_unicode_ci NOT NULL,
  `PlacesPrice` decimal(6,2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Genres` (
  `id_Genres` serial COLLATE utf8_unicode_ci NOT NULL,
  `GenreName` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Actors` (
  `id_Actors` serial COLLATE utf8_unicode_ci NOT NULL,
  `ActorName` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `ProducersCountry` (
  `id_ProducersCountry` serial COLLATE utf8_unicode_ci NOT NULL,
  `Country` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieGenre` (
  `id_MovieGenre` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Genres` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieActor` (
  `id_MovieActor` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Actors` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieProducersCountry` (
  `id_MovieProducersCountry` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_ProducersCountry` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Sale` (
  `id_Sale` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Client` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Client` (
  `id_Client` serial COLLATE utf8_unicode_ci NOT NULL,
  `ClientName` text COLLATE utf8_unicode_ci NOT NULL,
  `id_Tickets` serial COLLATE utf8_unicode_ci NOT NULL,
  `Booking` boolean COLLATE utf8_unicode_ci NOT NULL,
  `Sold` boolean COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuyMovie` (
  `id_BuyMovie` serial COLLATE utf8_unicode_ci NOT NULL,
  `BuyMovieClientName` text COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuySessions` (
  `id_BuySessions` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Sessions` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuyPlace` (
  `id_BuyPlace` serial COLLATE utf8_unicode_ci NOT NULL,
  `id_Places` serial COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





/*Добавление ключей*/

ALTER TABLE `Cinemas`
  ADD PRIMARY KEY (`id_Cinemas`);
  
  
ALTER TABLE `CinemaHalls`
  ADD PRIMARY KEY (`id_CinemaHalls`),
  ADD KEY `id_Cinemas` (`id_Cinemas`);
  
  
ALTER TABLE `Sessions`
  ADD PRIMARY KEY (`id_Sessions`),
  ADD KEY `id_CinemaHalls` (`id_CinemaHalls`),
  ADD KEY `id_Movies` (`id_Movies`);
  
  
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`id_Movies`);
  
  
ALTER TABLE `Tickets`
  ADD PRIMARY KEY (`id_Tickets`),
  ADD KEY `id_CinemaHalls` (`id_CinemaHalls`),
  ADD KEY `id_Sessions` (`id_Sessions`),
  ADD KEY `id_Places` (`id_Places`),
  ADD KEY `id_Movies` (`id_Movies`);
  
  
ALTER TABLE `Places`
  ADD PRIMARY KEY (`id_Places`),
  ADD KEY `id_CinemaHalls` (`id_CinemaHalls`);
  
  
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`id_Genres`);
  
  
ALTER TABLE `Actors`
  ADD PRIMARY KEY (`id_Actors`);
  
  
ALTER TABLE `ProducersCountry`
  ADD PRIMARY KEY (`id_ProducersCountry`);
  
  
ALTER TABLE `MovieGenre`
  ADD PRIMARY KEY (`id_MovieGenre`),
  ADD KEY `id_Movies` (`id_Movies`),
  ADD KEY `id_Genres` (`id_Genres`);
  
  
ALTER TABLE `MovieActor`
  ADD PRIMARY KEY (`id_MovieActor`),
  ADD KEY `id_Movies` (`id_Movies`),
  ADD KEY `id_Actors` (`id_Actors`);
  
  
ALTER TABLE `MovieProducersCountry`
  ADD PRIMARY KEY (`id_MovieProducersCountry`),
  ADD KEY `id_Movies` (`id_Movies`),
  ADD KEY `id_ProducersCountry` (`id_ProducersCountry`);
  
  
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`id_Sale`),
  ADD KEY `id_Movies` (`id_Movies`),
  ADD KEY `id_Client` (`id_Client`);
  
  
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_Client`),
  ADD KEY `id_Tickets` (`id_Tickets`);
  
  
ALTER TABLE `BuyMovie`
  ADD PRIMARY KEY (`id_BuyMovie`);
  
  
ALTER TABLE `BuySessions`
  ADD PRIMARY KEY (`id_BuySessions`);
  
  
ALTER TABLE `BuyPlace`
  ADD PRIMARY KEY (`id_BuyPlace`);




ALTER TABLE `CinemaHalls`
  ADD CONSTRAINT `CinemaHalls_ibfk_1` FOREIGN KEY (`id_Cinemas`) REFERENCES `Cinemas` (`id_Cinemas`);
  
  
ALTER TABLE `Sessions`
  ADD CONSTRAINT `Sessions_ibfk_1` FOREIGN KEY (`id_CinemaHalls`) REFERENCES `CinemaHalls` (`id_CinemaHalls`),
  ADD CONSTRAINT `Sessions_ibfc_2` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`);
  

ALTER TABLE `Tickets`
  ADD CONSTRAINT `Tickets_ibfc_1` FOREIGN KEY (`id_CinemaHalls`) REFERENCES `CinemaHalls` (`id_CinemaHalls`),
  ADD CONSTRAINT `Tickets_ibfk_2` FOREIGN KEY (`id_Sessions`) REFERENCES `Sessions` (`id_Sessions`),
  ADD CONSTRAINT `Tickets_ibfc_3` FOREIGN KEY (`id_Places`) REFERENCES `Places` (`id_Places`),
  ADD CONSTRAINT `Tickets_ibfk_4` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`);
  
  
ALTER TABLE `Places`
  ADD CONSTRAINT `Places_ibfk_1` FOREIGN KEY (`id_CinemaHalls`) REFERENCES `CinemaHalls` (`id_CinemaHalls`);


ALTER TABLE `MovieGenre`
  ADD CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`),
  ADD CONSTRAINT `MovieGenre_ibfk_2` FOREIGN KEY (`id_Genres`) REFERENCES `Genres` (`id_Genres`);
  
  
ALTER TABLE `MovieActor`
  ADD CONSTRAINT `MovieActor_ibfk_1` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`),
  ADD CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`id_Actors`) REFERENCES `Actors` (`id_Actors`);
  
  
ALTER TABLE `MovieProducersCountry`
  ADD CONSTRAINT `MovieProducersCountry_ibfk_1` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`),
  ADD CONSTRAINT `MovieProducersCountry_ibfk_2` FOREIGN KEY (`id_ProducersCountry`) REFERENCES `ProducersCountry` (`id_ProducersCountry`);


ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`id_Movies`) REFERENCES `Movies` (`id_Movies`),
  ADD CONSTRAINT `Sale_ibfk_2` FOREIGN KEY (`id_Client`) REFERENCES `Client` (`id_Client`);


ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`id_Tickets`) REFERENCES `Tickets` (`id_Tickets`);






/*Занесение данных*/

INSERT INTO `Actors` (`id_Actors`, `ActorName`) VALUES
(701, 'Pashen'),
(702, 'Shesterio'),
(703, 'Ритик Рошан'),
(704, 'Тайгер Шрофф'),
(705, 'Шахрух Хан'),
(706, 'Аамир Хан'),
(707, 'Арас Будут Ийнемли'),
(708, 'primer');

INSERT INTO `CinemaHalls` (`id_CinemaHalls`, `id_Cinemas`, `NumberOfHalls`, `NumberOfRows`, `NumberOfPlaces`, `HallCategory`) VALUES
(201, 101, 'A1', 3, 3, 'Business'),
(202, 101, 'A2', 3, 3, 'Business'),
(203, 101, 'A3', 2, 2, 'Economy'),
(204, 102, 'M1', 5, 1, 'Business'),
(205, 102, 'M2', 2, 2, 'Business'),
(206, 102, 'M3', 2, 2, 'Economy'),
(207, 103, 'V1', 3, 3, 'Economy'),
(208, 103, 'V2', 2, 2, 'Business'),
(209, 104, 'S1', 1, 1, 'Business'),
(210, 101, 'd3', 1, 1, 'Economy'),
(211, 101, 'd3', 1, 1, 'Economy'),
(212, 101, 'd3', 1, 1, 'Economy'),
(213, 106, 'w2', 2, 2, 'Business');

INSERT INTO `Cinemas` (`id_Cinemas`, `CinemaName`, `CinemaLocation`, `NumberOfHalls`) VALUES
(101, 'Avrora', 'Pashenskaya', '3'),
(102, 'Moscow', 'Ohota and Ryad', '3'),
(103, 'Victory', 'AbeliMAN', '2'),
(104, 'Special', 'Space', '1'),
(105, 'Primer', 'Primer', '1'),
(106, 'Tree', 'Net', '6'),
(107, 'ABC', 'Where', '2');

INSERT INTO `Client` (`id_Client`, `ClientName`, `id_Tickets`, `Booking`, `Sold`) VALUES
(1, 'Пака', 3, 1, 1),
(2, 'Паша', 21, 1, 1),
(3, 'Паша', 22, 1, 1),
(4, 'Паша', 23, 1, 1),
(5, 'Паша', 24, 1, 1),
(6, 'Паша', 26, 1, 1),
(7, 'Паша', 27, 0, 0),
(8, 'Паша', 28, 1, 1),
(9, 'Паша', 29, 1, 1),
(10, 'Паша', 30, 0, 0),
(11, 'Паша', 31, 1, 1),
(12, 'Паша', 32, 1, 1),
(13, 'Паша', 33, 1, 1),
(14, 'Паша', 34, 1, 1),
(15, 'Паша', 38, 0, 0),
(16, 'Паша', 40, 0, 0),
(17, 'Паша', 41, 0, 1),
(18, 'Паша', 42, 0, 1),
(19, 'Паша', 43, 0, 1),
(20, 'Rttt', 44, 0, 1),
(21, 'Rttt', 45, 0, 1),
(22, 'Tyyy', 46, 0, 1),
(23, 'Murad', 47, 0, 1),
(24, 'Murad1', 48, 1, 1),
(25, 'Gy', 49, 0, 1),
(26, 'g', 50, 0, 1),
(27, 'ht', 51, 0, 1),
(28, 'Murad56', 52, 0, 1),
(29, 'ррр', 53, 0, 1),
(30, 'ккк', 54, 0, 1),
(31, 'rty', 55, 0, 1),
(32, 'Try', 56, 0, 1),
(33, 'tt', 57, 0, 1),
(34, 'Пан', 58, 0, 1),
(35, 'Gren', 59, 1, 1),
(36, 'retry', 60, 1, 1),
(37, 'Uy', 61, 1, 1);

INSERT INTO `Genres` (`id_Genres`, `GenreName`) VALUES
(601, 'Heros'),
(602, 'Боевик'),
(603, 'Детектив'),
(604, 'Драма'),
(605, 'Исторический фильм'),
(606, 'Комедия'),
(607, 'Мелодрама'),
(608, 'primer');

INSERT INTO `MovieActor` (`id_MovieActor`, `id_Movies`, `id_Actors`) VALUES
(900, 401, 701);

INSERT INTO `MovieGenre` (`id_MovieGenre`, `id_Movies`, `id_Genres`) VALUES
(1100, 401, 607),
(1101, 401, 601);

INSERT INTO `MovieProducersCountry` (`id_MovieProducersCountry`, `id_Movies`, `id_ProducersCountry`) VALUES
(1000, 401, 801);

INSERT INTO `Movies` (`id_Movies`, `MovieName`, `MovieLength`, `MovieReleaseYear`) VALUES
(401, 'История о герое Пашене', '01:56:00', '1956'),
(402, 'Шестерио и его история', '02:46:00', '2006'),
(403, 'Меня зовут Кхан', '02:35:00', '2010'),
(404, 'Танцор Диско', '02:30:00', '1982'),
(405, 'Дангал', '02:41:00', '2016'),
(406, 'И в печали, и в радости...', '03:30:00', '2001'),
(407, 'Непохищенная невеста', '03:09:00', '1995'),
(408, 'Бахубали: Рождение легенды', '02:47:00', '2017'),
(409, 'Бунтарь 2', '02:24:00', '2018'),
(410, 'Бунтарь', '02:15:00', '2016'),
(411, 'Влюблённые', '02:38:00', '2015'),
(412, 'Гаджини', '03:03:00', '2008'),
(413, 'Крриш', '03:05:00', '2006'),
(414, 'Крриш', '02:51:00', '2013'),
(415, 'Байкеры', '02:09:00', '2004'),
(416, 'Байкеры 2:Настоящие чувства', '02:32:00', '2006'),
(417, 'Байкеры 3', '02:52:00', '2013'),
(418, 'Бой', '02:36:00', '2019'),
(419, 'Пиф-паф', '02:34:00', '2014'),
(420, 'Чудо в камере №7', '02:12:00', '2019'),
(421, 'Зкшьук', '03:44:00', '2022');

INSERT INTO `Places` (`id_Places`, `id_CinemaHalls`, `Row`, `Places`, `PlacesCategory`, `PlacesPrice`) VALUES
(501, 201, 3, 1, 'From the side', '1200.00'),
(502, 201, 3, 2, 'Center', '1230.00'),
(503, 201, 3, 3, 'From the side', '1200.00'),
(504, 201, 2, 1, 'From the side', '1100.00'),
(505, 201, 2, 2, 'Center', '1150.00'),
(506, 201, 2, 3, 'From the side', '1100.00'),
(507, 201, 1, 1, 'From the side', '1000.00'),
(508, 201, 1, 2, 'Center', '1050.00'),
(509, 201, 1, 3, 'From the side', '1000.00'),
(510, 202, 3, 1, 'From the side', '1200.00'),
(511, 202, 3, 2, 'Center', '1230.00'),
(512, 202, 3, 3, 'From the side', '1200.00'),
(513, 202, 2, 1, 'From the side', '1100.00'),
(514, 202, 2, 2, 'Center', '1150.00'),
(515, 202, 2, 3, 'From the side', '1100.00'),
(516, 202, 1, 1, 'From the side', '1000.00'),
(517, 202, 1, 2, 'Center', '1050.00'),
(518, 202, 1, 3, 'From the side', '1000.00'),
(519, 203, 2, 1, 'Center', '500.00'),
(520, 203, 2, 2, 'Center', '500.00'),
(521, 203, 1, 1, 'Center', '500.00'),
(522, 203, 1, 2, 'Center', '500.00'),
(523, 204, 5, 1, 'Center', '1500.00'),
(524, 204, 4, 1, 'Center', '1490.00'),
(525, 204, 3, 1, 'Center', '1480.00'),
(526, 204, 2, 1, 'Center', '1470.00'),
(527, 204, 1, 1, 'Center', '1460.00'),
(529, 205, 2, 1, 'Center', '1600.00'),
(530, 205, 2, 2, 'Center', '1600.00'),
(531, 205, 1, 1, 'Center', '1600.00'),
(532, 205, 1, 2, 'Center', '1600.00'),
(533, 206, 2, 1, 'Center', '400.00'),
(534, 206, 2, 2, 'Center', '400.00'),
(535, 206, 1, 1, 'Center', '400.00'),
(536, 206, 1, 2, 'Center', '400.00'),
(537, 207, 3, 1, 'From the side', '700.00'),
(538, 207, 3, 2, 'Center', '750.00'),
(539, 207, 3, 3, 'From the side', '700.00'),
(540, 207, 2, 1, 'From the side', '600.00'),
(541, 207, 2, 3, 'From the side', '600.00'),
(542, 207, 1, 1, 'From the side', '500.00'),
(543, 207, 1, 2, 'Center', '550.00'),
(544, 207, 1, 3, 'From the side', '500.00'),
(545, 208, 2, 1, 'Center', '2000.00'),
(546, 208, 2, 2, 'Center', '2000.00'),
(547, 208, 1, 1, 'Center', '2000.00'),
(548, 208, 1, 2, 'Center', '2000.00'),
(549, 209, 1, 1, 'Center', '5600.00'),
(550, 202, 2, 2, 'Center', '56.00');

INSERT INTO `ProducersCountry` (`id_ProducersCountry`, `Country`) VALUES
(801, 'Россия'),
(802, 'Индия'),
(803, 'Турция'),
(804, 'США'),
(805, 'primer');

INSERT INTO `Sale` (`id_Sale`, `id_Movies`, `id_Client`) VALUES
(1, 412, 12),
(2, 412, 13),
(3, 412, 14),
(4, 412, 15),
(5, 412, 16),
(6, 412, 17),
(7, 412, 18),
(8, 412, 19),
(9, 414, 20),
(10, 414, 21),
(11, 401, 22),
(12, 409, 23),
(13, 401, 24),
(14, 403, 25),
(15, 402, 26),
(16, 401, 27),
(17, 414, 28),
(18, 403, 29),
(19, 402, 30),
(20, 402, 31),
(21, 414, 32),
(22, 402, 33),
(23, 416, 34),
(24, 404, 35),
(25, 402, 36),
(26, 405, 37);

INSERT INTO `Sessions` (`id_Sessions`, `SessionDate`, `SessionTime`, `id_CinemaHalls`, `id_Movies`) VALUES
(301, '2023-01-10', '10:00:00', 201, 402),
(302, '2023-01-10', '15:00:00', 201, 412),
(303, '2023-01-10', '19:10:00', 201, 420),
(304, '2023-10-01', '11:00:00', 202, 408),
(305, '2023-10-01', '14:30:00', 202, 417),
(306, '2023-10-01', '19:55:00', 202, 404),
(307, '2023-10-02', '09:40:00', 203, 411),
(308, '2023-10-02', '13:00:00', 203, 414),
(309, '2023-10-02', '17:00:00', 203, 412),
(310, '2023-10-01', '09:00:00', 204, 415),
(311, '2023-10-01', '14:00:00', 204, 408),
(312, '2023-10-01', '18:00:00', 204, 406),
(313, '2023-10-02', '10:00:00', 205, 401),
(314, '2023-10-02', '15:00:00', 205, 420),
(315, '2023-10-02', '20:00:00', 205, 415),
(316, '2023-10-01', '11:00:00', 206, 403),
(317, '2023-10-01', '14:00:00', 206, 404),
(318, '2023-10-01', '18:00:00', 206, 410),
(319, '2023-10-02', '09:30:00', 207, 405),
(320, '2023-10-02', '13:00:00', 207, 407),
(321, '2023-10-02', '17:30:00', 207, 408),
(322, '2023-10-01', '10:00:00', 208, 409),
(323, '2023-10-01', '14:00:00', 208, 410),
(324, '2023-10-01', '18:00:00', 208, 413),
(325, '2023-10-02', '11:00:00', 209, 414),
(326, '2023-10-02', '15:00:00', 209, 416),
(327, '2023-10-02', '19:00:00', 209, 418),
(328, '2022-10-13', '09:56:00', 201, 420);

INSERT INTO `Tickets` (`id_Tickets`, `id_CinemaHalls`, `id_Sessions`, `id_Places`, `id_Movies`) VALUES
(3, 201, 301, 501, 401),
(4, 201, 302, 502, 412),
(5, 201, 302, 502, 412),
(6, 201, 302, 502, 412),
(7, 201, 302, 502, 412),
(8, 201, 302, 502, 412),
(9, 201, 302, 502, 412),
(10, 201, 302, 502, 412),
(11, 201, 302, 502, 412),
(12, 201, 302, 502, 412),
(13, 201, 302, 502, 412),
(14, 201, 302, 502, 412),
(15, 201, 302, 502, 412),
(16, 201, 302, 502, 412),
(17, 201, 302, 502, 412),
(18, 201, 302, 502, 412),
(19, 201, 302, 502, 412),
(20, 201, 302, 502, 412),
(21, 201, 302, 502, 412),
(22, 201, 302, 502, 412),
(23, 201, 302, 502, 412),
(24, 201, 302, 502, 412),
(25, 201, 302, 502, 412),
(26, 201, 302, 502, 412),
(27, 201, 302, 502, 412),
(28, 201, 302, 502, 412),
(29, 201, 302, 502, 412),
(30, 201, 302, 502, 412),
(31, 201, 302, 502, 412),
(32, 201, 302, 502, 412),
(33, 201, 302, 502, 412),
(34, 201, 302, 502, 412),
(35, 201, 302, 502, 412),
(36, 201, 302, 502, 412),
(37, 201, 302, 502, 412),
(38, 201, 302, 502, 412),
(39, 201, 302, 502, 412),
(40, 201, 302, 502, 412),
(41, 201, 302, 502, 412),
(42, 201, 302, 502, 412),
(43, 201, 302, 502, 412),
(44, 203, 308, 519, 414),
(45, 203, 308, 519, 414),
(46, 205, 313, 530, 401),
(47, 208, 322, 545, 409),
(48, 205, 313, 530, 401),
(49, 205, 316, 530, 403),
(50, 201, 301, 508, 402),
(51, 205, 313, 530, 401),
(52, 209, 325, 549, 414),
(53, 206, 316, 534, 403),
(54, 201, 301, 503, 402),
(55, 201, 301, 504, 402),
(56, 203, 308, 521, 414),
(57, 201, 301, 504, 402),
(58, 209, 326, 549, 416),
(59, 206, 317, 536, 404),
(60, 209, 327, 549, 402),
(61, 207, 319, 543, 405);







/*Триггер на каскадное удаление данных*/

CREATE OR REPLACE FUNCTION delete_cinema_function()
RETURNS TRIGGER AS $$
BEGIN
DELETE FROM CinemaHalls WHERE id_Cinemas = OLD.id;
DELETE FROM Sessions WHERE id_CinemaHalls = OLD.id;
DELETE FROM Tickets WHERE id_CinemaHalls = OLD.id;
DELETE FROM Places WHERE id_CinemaHalls = OLD.id;
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_cinema
AFTER DELETE ON cinema
FOR EACH ROW
EXECUTE FUNCTION delete_cinema_function();



/*Триггер на проверку данных*/

CREATE OR REPLACE FUNCTION check_data()
RETURNS TRIGGER AS $$
BEGIN
IF NEW.column_name IS NULL THEN
RAISE EXCEPTION 'column_name cannot be null';
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_data_Cinemas
BEFORE INSERT ON Cinemas
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_CinemaHalls
BEFORE INSERT ON CinemaHalls
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Sessions
BEFORE INSERT ON Sessions
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Movies
BEFORE INSERT ON Movies
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Tickets
BEFORE INSERT ON Tickets
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Places
BEFORE INSERT ON Places
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Genres
BEFORE INSERT ON Genres
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Actors
BEFORE INSERT ON Actors
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_ProducersCountry
BEFORE INSERT ON ProducersCountry
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_MovieGenre
BEFORE INSERT ON MovieGenre
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_MovieActor
BEFORE INSERT ON MovieActor
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_MovieProducersCountry
BEFORE INSERT ON MovieProducersCountry
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Sale
BEFORE INSERT ON Sale
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_Client
BEFORE INSERT ON Client
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_BuyMovie
BEFORE INSERT ON BuyMovie
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_BuySessions
BEFORE INSERT ON BuySessions
FOR EACH ROW
EXECUTE FUNCTION check_data();

CREATE TRIGGER check_data_BuyPlace
BEFORE INSERT ON BuyPlace
FOR EACH ROW
EXECUTE FUNCTION check_data();



/*Применение VIEW*/

CREATE VIEW cinema_data AS
SELECT Cinemas.id_Cinemas, Cinemas.CinemaName, CinemaHalls.id_CinemaHalls, CinemaHalls.HallCategory, Tickets.id_Movies, Movies.MovieName
FROM Cinemas
JOIN CinemaHalls ON Cinemas.id_Cinemas = CinemaHalls.id_Cinemas
JOIN Tickets ON CinemaHalls.id_CinemaHalls = Tickets.id_CinemaHalls
JOIN Movies ON Tickets.id_Movies = Movies.id_Movies;



/*Запрос 1. Получить список всех фильмов, которые были показаны в кинотеатре за последний месяц:*/

/*
SELECT Movies.MovieName, Sessions.SessionTime
FROM Movies
JOIN Sessions ON Movies.id_Movies = Sessions.id_Movies
WHERE Sessions.SessionTime >= NOW() - INTERVAL '1 MONTH';
*/



/*Запрос 2. Получить список всех кинотеатров и количество фильмов, которые были показаны в каждом кинотеатре за последний месяц:*/

/*
SELECT Cinemas.CinemaName, COUNT(DISTINCT Movies.id_Movies) AS number_of_movies
FROM Cinemas
JOIN CinemaHalls ON Cinemas.id_Cinemas = CinemaHalls.id_Cinemas
JOIN Sessions ON CinemaHalls.id_CinemaHalls = Sessions.id_CinemaHalls
JOIN Movies ON Sessions.id_Movies = Movies.id_Movies
WHERE Sessions.SessionTime >= NOW() - INTERVAL '1 MONTH'
GROUP BY Cinemas.CinemaName;
*/







/*Хранимая процедура для добавления нового фильма:*/

CREATE OR REPLACE PROCEDURE add_movie(
  p_MovieName text,
  p_MovieLength time,
  p_MovieReleaseYear text
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Movies (MovieName, MovieLength, MovieReleaseYear)
    VALUES (p_MovieName, p_MovieLength, p_MovieReleaseYear);
END;
$$;



/*Хранимая процедура для удаления фильма по его id:*/

CREATE OR REPLACE PROCEDURE delete_movie(
    p_id_Movies serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Movies WHERE id_Movies = p_id_Movies;
END;
$$;



/*Хранимая процедура для добавления нового актера:*/

CREATE OR REPLACE PROCEDURE add_actor(
    p_ActorName text
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Actors (ActorName)
    VALUES (p_ActorName);
END;
$$;



/*Хранимая процедура для удаления актера по его id:*/

CREATE OR REPLACE PROCEDURE delete_actor(
    p_id_Actors serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Actors WHERE id_Actors = p_id_Actors;
END;
$$;



/*Хранимая процедура для добавления нового билета:*/

CREATE OR REPLACE PROCEDURE add_ticket(
  p_id_CinemaHalls serial,
  p_id_Sessions serial,
  p_id_Places serial,
  p_id_Movies serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Tickets (p_id_CinemaHalls, p_id_Sessions, p_id_Places, p_id_Movies)
    VALUES (p_id_CinemaHalls, p_id_Sessions, p_id_Places, p_id_Movies);
END;
$$;



/*Хранимая процедура для удаления билета по его id:*/

CREATE OR REPLACE PROCEDURE delete_ticket(
    p_id_Tickets serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Tickets WHERE id_Tickets = p_id_Tickets;
END;
$$;



/*Хранимая процедура для добавления нового сеанса:*/

CREATE OR REPLACE PROCEDURE add_session(
  p_SessionDate date,
  p_SessionTime time,
  p_id_CinemaHalls serial,
  p_id_Movies serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Sessions (SessionDate, SessionTime, id_CinemaHalls, id_Movies)
    VALUES (p_SessionDate, p_SessionTime, p_id_CinemaHalls, p_id_Movies);
END;
$$;



/*Хранимая процедура для удаления сеанса по его id:*/

CREATE OR REPLACE PROCEDURE delete_session(
    p_id_Sessions serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Sessions WHERE id_Sessions = p_id_Sessions;
END;
$$;



/*Хранимая процедура для добавления нового клиента:*/

CREATE OR REPLACE PROCEDURE add_client(
  p_ClientName text,
  p_id_Tickets serial,
  p_Booking boolean,
  p_Sold boolean
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Client (ClientName, id_Tickets, Booking, Sold)
    VALUES (p_ClientName, p_id_Tickets, p_Booking, p_Sold);
END;
$$;



/*Хранимая процедура для добавления новой продажи:*/

CREATE OR REPLACE PROCEDURE add_sale(
  p_id_Movies serial,
  p_id_Client serial
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Sale (id_Movies, id_Client)
    VALUES (p_id_Movies, p_id_Client);
END;
$$;





/*Роли и политики доступа*/

-- Создание роли администратора
CREATE ROLE admin LOGIN PASSWORD 'admin123';

-- Предоставление доступа админу к базе данных
GRANT ALL PRIVILEGES ON DATABASE cinemaBD TO admin;

-- Предоставление доступа админу ко всем таблицам в схеме public
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

-- Создание роли суперпользоателя
CREATE ROLE superuser LOGIN PASSWORD 'superuser123';

-- Предоставление соединения суперпользователя к базе данных
GRANT CONNECT ON DATABASE cinemaBD TO superuser;

-- Предоставление доступа суперпользователю для выполнения запросов
GRANT SELECT ON ALL TABLES IN SCHEMA public TO superuser;
GRANT INSERT, UPDATE ON Actors, Client, Genres, Movies, Places, ProducersCountry, Sessions, MovieProducersCountry, MovieActor, MovieGenre TO superuser;
GRANT DELETE ON Tickets, Sessions TO superuser;

-- Создание роли пользователя
CREATE ROLE user LOGIN PASSWORD 'user123';

-- Предоставление соединения пользователя к базе данных
GRANT CONNECT ON DATABASE CinemaBD TO user;

-- Предоставление доступа пользователю для выполнения запросов
GRANT SELECT ON Cinemas, Movies, Sessions, CinemaHalls, Places, Actors, ProducersCountry, MovieProducersCountry, MovieActor, MovieGenre TO user;
GRANT INSERT ON Tickets TO user;

-- Обеспечивает безопасность, чтобы пользователи могли смотреть только свои билеты
ALTER TABLE Tickets ENABLE ROW LEVEL SECURITY;
CREATE POLICY tickets_policy ON Tickets FOR SELECT USING (id_Tickets = current_user);

-- Обеспечивает безопасность, чтобы пользователи могли смотреть только доступные сеансы
ALTER TABLE Sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY sessions_policy ON Sessions FOR SELECT USING (SessionDate >= current_date AND SessionTime >= current_time );





/*Наследование таблиц*/

CREATE TABLE `BusinessCinemaHalls` (
  Description text
) INHERITS(CinemaHalls);






/*Секционирование таблиц*/

CREATE TABLE logs (
    log_date DATE NOT NULL,
    id_Client serial NOT NULL,
    id_Tickets serial NOT NULL,
    id_Sale serial NOT NULL,
    log_data TEXT NOT NULL
) PARTITION BY RANGE (EXTRACT(MONTH FROM log_date));

CREATE TABLE logs_1 PARTITION OF logs
    FOR VALUES FROM (MINVALUE) TO (2);

CREATE TABLE logs_2 PARTITION OF logs
    FOR VALUES FROM (2) TO (4);
