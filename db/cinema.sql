DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS films;
DROP TABLE IF EXISTS items;

CREATE TABLE customers (
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    funds SMALLINT CONSTRAINT non_negative_funds CHECK (funds >= 0),
    age SMALLINT CONSTRAINT non_negative_age CHECK (age > 0),
    student_status BOOLEAN,
    items_purchased VARCHAR(255)
);

CREATE TABLE films (
    id SERIAL8 PRIMARY KEY,
    title VARCHAR(255),
    price SMALLINT CONSTRAINT positive_price CHECK (price > 0),
    age_rating SMALLINT,
    duration INT
);

CREATE TABLE screenings (
    id SERIAL8 PRIMARY KEY,
    film_id INT8 REFERENCES films(id),
    seatings SMALLINT CONSTRAINT non_negative_seatings CHECK (seatings >= 0),
    start_time TIME,
    day VARCHAR(255)
);

CREATE TABLE tickets (
    id SERIAL8 PRIMARY KEY,
    screening_id INT8 REFERENCES screenings(id),
    customer_id INT8 REFERENCES customers(id)
);

CREATE TABLE items(
    id SERIAL8 PRIMARY KEY,
    name VARCHAR(255),
    price SMALLINT CONSTRAINT positive_price CHECK (price > 0),
    stock_quantity SMALLINT
);
