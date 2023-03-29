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






/*Триггер на каскадное удаление данных*/

CREATE OR REPLACE FUNCTION delete_cinema_function()
RETURNS TRIGGER AS $$
BEGIN
DELETE FROM CinemaHalls WHERE id_Cinemas = OLD.id;
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
SELECT Cinemas.id_Cinemas, Cinemas.CinemaName, CinemaHalls.id_CinemaHalls, CinemaHalls.HallCategory, Tickets.movie_id, Tickets.movie_name, Movies.id_Movies, Movies.MovieName
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



/*
Запрос 1: Получить список всех фильмов, которые были показаны в кинотеатре с именем “Космос” в 2022 году, отсортированных по дате и времени сеанса.
SELECT f.title, s.date, s.time
FROM film f
JOIN session s ON f.id = s.film_id
JOIN cinema c ON s.cinema_id = c.id
WHERE c.name = 'Космос' AND s.date BETWEEN '2022-01-01' AND '2022-12-31'
ORDER BY s.date, s.time;
Запрос 2: Получить список всех актеров, которые снимались в фильмах жанра “комедия” или “мюзикл”, и количество таких фильмов для каждого актера.
SELECT a.name, COUNT(DISTINCT f.id) AS num_films
FROM actor a
JOIN film_actor fa ON a.id = fa.actor_id
JOIN film f ON fa.film_id = f.id
JOIN film_genre fg ON f.id = fg.film_id
JOIN genre g ON fg.genre_id = g.id
WHERE g.name IN ('комедия', 'мюзикл')
GROUP BY a.name;
Запрос 3: Получить список всех зрителей, которые посмотрели больше 10 разных фильмов в 2022 году, и средний рейтинг, который они поставили этим фильмам.
SELECT v.name, AVG(r.rating) AS avg_rating
FROM viewer v
JOIN review r ON v.id = r.viewer_id
JOIN session s ON r.session_id = s.id
WHERE s.date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY v.name
HAVING COUNT(DISTINCT s.film_id) > 10;
Запрос 4: Получить список всех режиссеров, которые сняли хотя бы один фильм жанра “ужасы”, и общую сумму бюджетов их фильмов.
SELECT d.name, SUM(f.budget) AS total_budget
FROM director d
JOIN film_director fd ON d.id = fd.director_id
JOIN film f ON fd.film_id = f.id
JOIN film_genre fg ON f.id = fg.film_id
JOIN genre g ON fg.genre_id = g.id
WHERE g.name = 'ужасы'
GROUP BY d.name;
Запрос 5: Получить список всех фильмов, которые имеют рейтинг выше 8 на сайте КиноПоиск и выше 7 на сайте IMDb, и разницу между этими рейтингами.
SELECT f.title, f.rating_kp, f.rating_imdb, ABS(f.rating_kp - f.rating_imdb) AS rating_diff
FROM film f
WHERE f.rating_kp > 8 AND f.rating_imdb > 7;
Запрос 6: Получить список всех кинотеатров, которые показывают фильмы режиссера Стивена Спилберга в 2022 году, и количество таких фильмов для каждого кинотеатра.
SELECT c.name, COUNT(DISTINCT s.film_id) AS num_films
FROM cinema c
JOIN session s ON c.id = s.cinema_id
JOIN film_director fd ON s.film_id = fd.film_id
JOIN director d ON fd.director_id = d.id
WHERE d.name = 'Стивен Спилберг'
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





/*Роли и политики доступа*/

-- Создание роли администратора
CREATE ROLE admin LOGIN PASSWORD 'admin123';

-- Предоставление доступа админу к базе данных
GRANT ALL PRIVILEGES ON DATABASE cinemaBD TO admin;

-- Предоставление доступа админу ко всем таблицам в схеме public
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin;

-- Создание роли пользователя
CREATE ROLE user LOGIN PASSWORD 'user123';

-- Предоставление соединения пользователя к базе данных
GRANT CONNECT ON DATABASE CinemaBD TO user;

-- Предоставление доступа пользователю для выполнения запросов SELECT
GRANT SELECT ON Cinemas, Movies, Sessions, CinemaHalls, Places, Actors TO user;

-- Обеспечивает безопасность, чтобы пользователи могли смотреть только свои билеты
ALTER TABLE Tickets ENABLE ROW LEVEL SECURITY;
CREATE POLICY tickets_policy ON Tickets FOR SELECT USING (id_Tickets = current_user);

-- Обеспечивает безопасность, чтобы пользователи могли смотреть только доступные сеансы
ALTER TABLE Sessions ENABLE ROW LEVEL SECURITY;
CREATE POLICY sessions_policy ON Sessions FOR SELECT USING (SessionDate >= current_date AND SessionTime >= current_time );





/*Наследование таблиц*/

CREATE TABLE `Movies2` (
  Description text
) INHERITS(Movies);





/*Секционирование таблиц*/

CREATE TABLE logs (
    log_date DATE NOT NULL,
    log_data TEXT NOT NULL
) PARTITION BY RANGE (EXTRACT(MONTH FROM log_date));

CREATE TABLE logs_1 PARTITION OF logs
    FOR VALUES FROM (MINVALUE) TO (2);

CREATE TABLE logs_2 PARTITION OF logs
    FOR VALUES FROM (2) TO (4);
