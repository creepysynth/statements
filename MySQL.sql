CREATE DATABASE shop;

CREATE USER 'shop'@'localhost' IDENTIFIED BY 'shop';

GRANT ALL PRIVILEGES ON shop.* TO 'shop'@'localhost';

FLUSH PRIVILEGES;

CREATE USER 'viewer'@'localhost' IDENTIFIED BY 'viewer';

GRANT SELECT ON shop.* TO 'viewer'@'localhost';

FLUSH PRIVILEGES;

USE shop;

CREATE TABLE category (
    id_category int(11) NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    PRIMARY KEY (id_category)
);

INSERT INTO category VALUES 
    (1, 'aircrafts'), 
    (2, 'cars'),
    (3, 'yachts')
;

CREATE TABLE item (
    id_item int(11) NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    price decimal(12,2) NOT NULL DEFAULT 0.00,
    id_category int(11) NOT NULL,
    PRIMARY KEY (id_item),
    KEY id_category (id_category)
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

UPDATE item SET price = 3.50 WHERE id_item = 1;

UPDATE item SET price = price + price * 0.1;

DELETE FROM item WHERE id_item = 2;

SELECT * FROM item ORDER BY name;

SELECT * FROM item ORDER BY price DESC, name;

SELECT * FROM item ORDER BY price DESC, name LIMIT 3;

SELECT * FROM item ORDER BY price, name LIMIT 3;

SELECT * FROM item ORDER BY price DESC, name LIMIT 3, 3;

SELECT name AS 'the most expensive' FROM item ORDER BY price DESC LIMIT 1;

SELECT name AS 'the cheapest' FROM item ORDER BY price LIMIT 1;

SELECT COUNT(id_item) FROM item;

SELECT AVG(price) FROM item;

CREATE VIEW MostExpensive AS SELECT * FROM item ORDER BY price DESC, name LIMIT 3;