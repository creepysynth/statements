CREATE DATABASE shop;

CREATE USER shop WITH PASSWORD 'shop';

GRANT ALL PRIVILEGES ON DATABASE shop TO shop;

CREATE USER viewer WITH PASSWORD 'viewer';

GRANT CONNECT ON DATABASE shop TO viewer;

CREATE TABLE category (
    category_id serial PRIMARY KEY,
    category_name varchar(30) NOT NULL
);

INSERT INTO category VALUES 
    (1, 'aircrafts'),     
    (2, 'cars'),
    (3, 'yachts')
;

CREATE TABLE item (
    item_id serial PRIMARY KEY,
    item_name varchar(30) NOT NULL,
    item_price decimal(12,2) DEFAULT 0.00,
    category_id serial REFERENCES category(category_id)
);

INSERT INTO item VALUES 
    (1, 'Dodge Avenger', 2, 1.00),
    (2, 'Diamond Aircraft DA-52', 1, 1.00),
    (3, 'Lexus RX325', 2, 1.00),
    (4, 'Mersedes AMG550', 2, 1.00),
    (5, 'Cessna 182', 1, 1.00),
    (6, 'Rest 210', 3, 1.00),
    (7, 'Bentley Continental', 2, 1.00),
    (8, 'Azimut 77S', 3, 1.00),
    (9, 'Benetti Breeze FB802', 3, 1.00),
    (10, 'T30 Katana', 1, 1.00)
;

UPDATE item SET item_price = 3.50 WHERE item_id = 1;

UPDATE item SET item_price = item_price + item_price * 0.1;

DELETE FROM item WHERE item_id = 2;

SELECT * FROM item ORDER BY item_name;

SELECT * FROM item ORDER BY item_price DESC, item_name;

SELECT * FROM item ORDER BY item_price DESC, item_name LIMIT 3;

SELECT * FROM item ORDER BY item_price, item_name LIMIT 3;

SELECT * FROM item ORDER BY item_price DESC, item_name LIMIT 3 OFFSET 3;

SELECT MAX(item_price) FROM item;

SELECT MIN(item_price) FROM item;

SELECT COUNT(item_id) FROM item;

SELECT AVG(item_price) FROM item;

CREATE VIEW most_expensive AS SELECT * FROM item ORDER BY item_price DESC, item_name LIMIT 3;