DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;
    
USE SpotifyClone;

CREATE TABLE artists(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

INSERT INTO artists (name)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');
  
CREATE TABLE albums(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	id_artist INT NOT NULL,
	realease_year YEAR NOT NULL,
	FOREIGN KEY (id_artist) REFERENCES artists(id)
) ENGINE = InnoDB;

INSERT INTO albums (title, id_artist, realease_year)
VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);
  
CREATE TABLE musics(
	id INT PRIMARY KEY AUTO_INCREMENT,
	track VARCHAR(100) NOT NULL,
	duration MEDIUMINT NOT NULL,
	id_album INT NOT NULL,
	FOREIGN KEY (id_album) REFERENCES albums(id)
) ENGINE = InnoDB;
    
INSERT INTO musics (track, duration, id_album)
VALUES
	('BREAK MY SOUL', 279, 1),
	('VIRGO’S GROOVE', 369, 1),
	('ALIEN SUPERSTAR', 116, 1),
	('Don’t Stop Me Now', 203, 2),
	('Under Pressure', 152, 3),
	('Como Nossos Pais', 105, 4),
	('O Medo de Amar é o Medo de Ser Livre', 207, 5),
	('Samba em Paris', 267, 6),
	('The Bard’s Song', 244, 7),
	('Feeling Good', 100, 8);
    
CREATE TABLE plans(
	id INT PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(20) NOT NULL,
	price DECIMAL(4, 2) NOT NULL
) ENGINE = InnoDB;
    
INSERT INTO plans (type, price)
VALUES
	('gratuito', 0.00),
	('universitário', 5.99),
	('pessoal', 6.99),
	('familiar', 7.99);
    
CREATE TABLE users(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	age SMALLINT NOT NULL,
	id_plan INT NOT NULL,
	subscription_date DATE NOT NULL,
	FOREIGN KEY (id_plan) REFERENCES plans(id)
) ENGINE = InnoDB;

INSERT INTO users (name, age, id_plan, subscription_date)
VALUES
	('Barbara Liskov', 82, 1, '2019-10-20'),
	('Robert Cecil Martin', 58, 1, '2017-01-06'),
	('Ada Lovelace', 37, 4, '2017-12-30'),
	('Martin Fowler', 46, 4, '2017-01-17'),
	('Sandi Metz', 58, 4, '2018-04-29'),
	('Paulo Freire', 19, 2, '2018-02-14'),
	('Bell Hooks', 26, 2, '2018-01-05'),
	('Christopher Alexander', 85, 3, '2019-06-05'),
	('Judith Butler', 45, 3, '2020-05-13'),
	('Jorge Amado', 58, 3, '2017-02-17');
    
CREATE TABLE history(
	id_user INT NOT NULL,
	id_music INT NOT NULL,
	date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(id_user, id_music),
	FOREIGN KEY (id_user) REFERENCES users(id),
	FOREIGN KEY (id_music) REFERENCES musics(id)
) ENGINE = InnoDB;

INSERT INTO history (id_user, id_music, date)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');
    
CREATE TABLE following(
	id_user INT NOT NULL,
	id_artist INT NOT NULL,
  CONSTRAINT PRIMARY KEY(id_user, id_artist),
	FOREIGN KEY (id_user) REFERENCES users(id),
	FOREIGN KEY (id_artist) REFERENCES artists(id)
) ENGINE = InnoDB;

INSERT INTO following (id_user, id_artist)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 4),
	(5, 5),
	(5, 6),
	(6, 6),
	(6, 1),
	(7, 6),
	(9, 3),
	(10, 2);