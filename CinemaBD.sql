SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";





CREATE TABLE `Cinemas` (
  `id_Cinemas` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `CinemaName` text COLLATE utf8_unicode_ci NOT NULL,
  `CinemaLocation` text COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfHalls` varchar(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `CinemaHalls` (
  `id_CinemaHalls` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Cinemas` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfHalls` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfRows` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `NumberOfPlaces` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `HallCategory` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Sessions` (
  `id_Sessions` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `SessionDate` date NOT NULL,
  `SessionTime` time NOT NULL,
  `id_CinemaHalls` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Movies` (
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `MovieName` text COLLATE utf8_unicode_ci NOT NULL,
  `MovieLength` time NOT NULL,
  `MovieReleaseYear` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Tickets` (
  `id_Tickets` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_CinemaHalls` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Sessions` int(3) NOT NULL,
  `id_Places` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Places` (
  `id_Places` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_CinemaHalls` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `Row` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `Places` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `PlacesCategory` text COLLATE utf8_unicode_ci NOT NULL,
  `PlacesPrice` decimal(6,2) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Genres` (
  `id_Genres` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `GenreName` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Actors` (
  `id_Actors` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `ActorName` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `ProducersCountry` (
  `id_ProducersCountry` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `Country` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieGenre` (
  `id_MovieGenre` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Genres` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieActor` (
  `id_MovieActor` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Actors` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `MovieProducersCountry` (
  `id_MovieProducersCountry` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_ProducersCountry` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Sale` (
  `id_Sale` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL,
  `id_Client` int(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `Client` (
  `id_Client` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `ClientName` text COLLATE utf8_unicode_ci NOT NULL,
  `id_Tickets` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `Booking` boolean COLLATE utf8_unicode_ci NOT NULL,
  `Sold` boolean COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuyMovie` (
  `id_BuyMovie` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `BuyMovieClientName` text COLLATE utf8_unicode_ci NOT NULL,
  `id_Movies` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuySessions` (
  `id_BuySessions` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_Sessions` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `BuyPlace` (
  `id_BuyPlace` int(4) COLLATE utf8_unicode_ci NOT NULL,
  `id_Places` int(3) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;







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

