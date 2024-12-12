CREATE DATABASE db_sweetcrud;

USE db_sweetcrud;

CREATE TABLE profiles (
    id_profile INT NOT NULL auto_increment PRIMARY KEY,
    profile_name VARCHAR(255) NOT NULL
);

INSERT INTO profiles (profile_name) VALUES
('admin'),
('client');

-- Creación tabla de usuarios
CREATE TABLE users (
    id_user INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    id_profile INT NOT NULL,
    FOREIGN KEY (id_profile) REFERENCES profiles(id_profile)
);

INSERT INTO users (email, password, id_profile) VALUES
('jorge@gmail.com', '000', 1), 
('maria@gmail.com', 'mmm', 1), 
('pedro@gmail.com', 'abc', 2), 
('carla@gmail.com', '444', 2), 
('jose@gmail.com', 'aaa', 2);

CREATE TABLE category (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(500),
    PRIMARY KEY (id) 
);

CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(35) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

-- ------------ADDING RECORDS TO TABLES-----------------------------
INSERT INTO category (name, description) VALUES 
('Cakes and Cupcakes', 'Large cakes for celebrations and events, including traditional cakes for special occasions or any day'),
('Ice Cream Desserts', 'Cold and refrigerated desserts perfect for refreshing moments with great flavor'),
('Tartlets', 'Individual or family cakes with various flavors and decorative designs')
;


-- -------------------------------------------------------------------------------
INSERT INTO product (name, price, stock, category_id) VALUES 
-- Cakes and Cupcakes (Category ID 1)
('Chocolate Layer Cake', 35.50, 15, 1),
('Red Velvet Cupcakes (6 pack)', 22.00, 20, 1),
('Carrot Cake', 32.75, 10, 1),
('Classic Vanilla Cake', 30.00, 18, 1),
('Birthday Celebration Cake', 45.00, 12, 1),
('Oreo Cheesecake', 38.50, 8, 1),
('Lemon Cupcakes (4 pack)', 18.50, 25, 1),

-- Ice Cream Desserts (Category ID 2)
('Strawberry Gelato', 12.50, 30, 2),
('Chocolate Sundae', 15.75, 22, 2),
('Mango Sorbet', 11.00, 35, 2),
('Mixed Fruit Ice Cream', 14.25, 18, 2),
('Tiramisu Semifreddo', 16.50, 15, 2),
('Chocolate Mousse Cake', 22.00, 12, 2),
('Vanilla Bean Gelato', 13.75, 25, 2),

-- Tartlets (Category ID 3)
('Apple Pie Tartlet', 8.50, 40, 3),
('Chocolate Fruit Tartlet', 9.75, 35, 3),
('Lemon Meringue Tartlet', 8.25, 45, 3),
('Blueberry Cheese Tartlet', 9.00, 30, 3),
('Caramel Pecan Tartlet', 10.50, 25, 3),
('Mini Fruit Tart Assortment', 12.00, 20, 3)
;


-- Creación tabla de ventas 
CREATE TABLE sales (
    id_sale INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id INT NOT NULL,
    credit_card_number CHAR(16) NOT NULL,
    expiration_month INT NOT NULL,
    expiration_year INT NOT NULL,
    cvv CHAR(3) NOT NULL,
    cardholder_name VARCHAR(255) NOT NULL,
    sale_date DATETIME NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id) REFERENCES product(id)
)
;

