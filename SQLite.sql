--N/A

--N/A

--N/A

CREATE TABLE categories (
     id_category integer PRIMARY KEY AUTOINCREMENT,
     name text NOT NULL
);

INSERT INTO categories VALUES 
     (1, 'aircrafts'), 
     (2, 'cars'),
     (3, 'yachts')
;

CREATE TABLE items (
     id_item integer PRIMARY KEY AUTOINCREMENT,
     name text NOT NULL,
     id_category integer,
     price decimal(12, 2) NOT NULL DEFAULT 0.00,
     FOREIGN KEY (id_category) REFERENCES categories(id_category)
);

INSERT INTO items VALUES 
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

UPDATE items SET price = 3.50 WHERE id_item = 1;

UPDATE items SET price = price + price * 0.1;

DELETE FROM items WHERE id_item = 2;

SELECT * FROM items ORDER BY name;

SELECT * FROM items ORDER BY price DESC, name;

SELECT * FROM items ORDER BY price DESC, name LIMIT 3;

SELECT * FROM items ORDER BY price, name LIMIT 3;

SELECT * FROM items ORDER BY price DESC, name LIMIT 3 OFFSET 3;

SELECT MAX(price) FROM items;

SELECT MIN(price) FROM items;

SELECT COUNT(id_item) FROM items;

SELECT AVG(price) FROM items;

CREATE VIEW MostExpensive AS SELECT * FROM items ORDER BY price DESC, name LIMIT 3;