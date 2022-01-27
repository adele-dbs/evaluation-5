CREATE DATABASE cinema ; 

CREATE TABLE cinema.rates (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	rate DECIMAL (3, 2) NOT NULL
);

CREATE TABLE cinema.payment_types (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL
) ;

CREATE TABLE cinema.movies (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL
) ;

CREATE TABLE cinema.cinemas (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL
) ;

CREATE TABLE cinema.timetables (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name TIME NOT NULL
) ;

CREATE TABLE cinema.rights (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
type VARCHAR (50) NOT NULL
) ;

CREATE TABLE cinema.rooms (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	seat_number DECIMAL (3, 0) NOT NULL,
is_located INT(11) NOT NULL,
FOREIGN KEY (is_located) 
	REFERENCES cinemas(id)
) ;


CREATE TABLE cinema.screenings (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	plays INT(11) NOT NULL,
FOREIGN KEY (plays) 
	REFERENCES movies(id),
is_played_in INT(11) NOT NULL,
FOREIGN KEY (is_played_in) 
	REFERENCES rooms(id),
is_played_at INT(11) NOT NULL,
FOREIGN KEY (is_played_at) 
	REFERENCES timetables(id)
) ;

CREATE TABLE cinema.users (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	birthday DATE NOT NULL,
	status VARCHAR (50),
	email VARCHAR (50) NOT NULL UNIQUE,
	password VARCHAR (50) NOT NULL,
needs INT(11) NOT NULL,
FOREIGN KEY (needs) 
	REFERENCES rights(id)

) ;

CREATE TABLE cinema.bookings (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date DATE NOT NULL,
user_id INT(11) NOT NULL,
FOREIGN KEY (user_id) 
	REFERENCES users(id),
	screening_id INT(11) NOT NULL,
FOREIGN KEY (screening_id) 
	REFERENCES screenings(id),
	rate_id INT(11) NOT NULL,
FOREIGN KEY (rate_id) 
REFERENCES rates(id),
	payment_type_id INT(11) NOT NULL,
FOREIGN KEY (payment_type_id) 
REFERENCES payment_types(id)
) ;

CREATE TABLE cinema.sellers (
user_id INT(11) NOT NULL PRIMARY KEY,
FOREIGN KEY (user_id) 
REFERENCES users(id)
) ;

CREATE TABLE cinema.admins (
user_id INT(11) NOT NULL PRIMARY KEY,
FOREIGN KEY (user_id) 
	REFERENCES sellers(user_id)
) ;

INSERT INTO cinema.rates (name, rate) VALUES
('Plein Tarif', '9.20') ;
('Étudiant', '7.60'),
('-14 ans', '5.90');

INSERT INTO cinema.payment_types (name) VALUE
('CB'),
('Espèce') ;

INSERT INTO cinema.movies (name) VALUES
('La vie des licornes'),
('Les lapins géants') ;

INSERT INTO cinema.cinemas (name) VALUES
('Le cinéma des étoiles'),
('CinéVille') ;

INSERT INTO cinema.timetables (name) VALUES
('10:00:00'),
('14:00:00'),
('16:00:00'),
('18:00:00'),
('21:00:00');

INSERT INTO cinema.rights (name, type) VALUE
('client', 'réserver'),
('vendeur', 'réserver, ajouter une séance'),
('administrateur', 'réserver, ajouter une séance et gérer l application') ;

INSERT INTO cinema.rooms (name, seat_number, is_located) VALUES
('Etoile polaire', '52', '1')
('Etoile filante', '85', '1'),
('Cannes', '65', '2'),
('Brest', '76', '2') ;

INSERT INTO cinema.screenings (plays, is_played_in, is_played_at) VALUES
('1', '1', '1'), 
('2', '2', '2'),
('2','4', '3') ;


INSERT INTO  cinema.users (first_name, last_name, birthday, email, password, needs) VALUES
('John', 'Pitt', '1959-10-21', 'john.pitt@mail.com', '$2y$10$wbiuoUtEJ8FYUYjaG.x5Qe1NGX0VaU61XFqFxOh9LFqvqIwHu3gtf', '3'),
('Raoul', 'Craig', '1990-02-25', 'raoul.craig@mail.com', '$2y$10$wbiuoUtEJ8FYUYjaG.x5Qe1NGX0VaU61XFqFxOh9LFqvqIwHu2qbS', '2'),
('Paul', 'Cruz', '1985-05-03', 'paul.cruz@mail.com', '$2y$10$wbiuoUtEJ8FYUYjaG.x5Qe1NGX0VaU61XFqFxOh9LFqvqIwHu5wps', '2'),
('Client', '1', '2001-08-01', 'client@mail.com', '$2y$10$wbiuoUtEJ8FYUYjaG.x5Qe1NGX0VaU61XFqFxOh9LFqvqIwHu7xgt', '1') ;

INSERT INTO  cinema.sellers(user_id) VALUES
('1'),
('2'),
('3') ;


INSERT INTO  cinema.admins(user_id) VALUES
('1');

INSERT INTO cinema.bookings (date, user_id, screening_id, rate_id ,payment_type_id) VALUES
('26/01/2022', '4', '1', '1', '1'),
('26/01/2022', '4', '2', '2', '1');

UPDATE cinema.timetables
SET name = '20:00:00'
WHERE id = '5' ;
