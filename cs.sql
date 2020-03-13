DROP DATABASE IF EXISTS COFFEE_SHOP;
CREATE DATABASE COFFEE_SHOP;
USE COFFEE_SHOP;

DROP TABLE IF EXISTS PURCHASE;
CREATE TABLE PURCHASE
(
    Purchase_id serial PRIMARY KEY,
    Purchase_price integer NOT NULL,
    Purchase_method VARCHAR (50) NOT NULL,
    Purchase_date TIMESTAMP NOT NULL,
    Purchase_from_member BOOLEAN NOT NULL,
    Purchase_type VARCHAR (250) NOT NULL,
    Purchase_items VARCHAR (250) NOT NULL
);

DROP TABLE IF EXISTS STAFF;
CREATE TABLE STAFF
(
    STAFF_ID serial PRIMARY KEY,
    First_name VARCHAR(15) NOT NULL,
    Last_name VARCHAR(15) NOT NULL,
    Personal_number BIGINT NOT NULL,
    Contact VARCHAR(20) NOT NULL,
    Address_info VARCHAR(30) DEFAULT NULL,
    Salary VARCHAR(30) DEFAULT NULL,
    Sex char(1) DEFAULT NULL,
    Bdate TIMESTAMP DEFAULT NULL,
    Employment_Date TIMESTAMP NOT NULL,
    Contract_type VARCHAR(30),
    Title VARCHAR(30)
);

DROP TABLE IF EXISTS DRINKS_MENU;
CREATE TABLE DRINKS_MENU
(
    Drink_ID serial PRIMARY KEY,
    Drink_name VARCHAR(100) NOT NULL,
    Drink_price INTEGER NOT NULL,
    Drink_size VARCHAR(10) NOT NULL,
    Drink_type VARCHAR(20) DEFAULT NULL
);

DROP TABLE IF EXISTS FOOD_MENU;
CREATE TABLE FOOD_MENU
(
    Item_ID serial PRIMARY KEY,
    Food_name VARCHAR(100) NOT NULL,
    Food_price INTEGER NOT NULL,
    Food_category VARCHAR(20) DEFAULT NULL,
    is_vegan BOOLEAN NOT NULL
);


INSERT INTO PURCHASE
    (Purchase_price, Purchase_method, Purchase_date, Purchase_from_member, Purchase_type, Purchase_items)
VALUES
    (250, 'card', '2016-06-22 19:10:25-07', false, 'breakfast combo', 'coffee and cheese sandwich'),
    (99, 'card', now(), true, 'lunch combo', 'soup and tea'),
    (50, 'swish', '2017-06-22 19:10:25-07', true, 'lunch combo', 'soup and tea');


INSERT INTO STAFF
    (First_name, Last_name, Personal_number, Contact, Address_info, Salary, Sex, Bdate, Employment_Date, Contract_type, Title)
VALUES
    ('Ildana', 'Ruzybayeva', 9511148166, '0760759618', 'Malmo', '120 / hour', 'F', '1995-11-14', '2019-07-01', 'Full-time', 'Barista'),
    ('Alva', 'Rosqvist', 9511148166, '07564315', 'Malmo', '120 / hour', 'F', '1993-08-14', '2019-04-01', 'Part-time', 'Barista');


INSERT INTO DRINKS_MENU
    (Drink_name, Drink_price, Drink_size, Drink_type)
VALUES
    ('Latte', 39, 'Small', 'Warm'),
    ('Latte', 42, 'Medium', 'Warm'),
    ('Latte', 45, 'Large', 'Warm'),
    ('Cappuccino', 39, 'Small', 'Warm'),
    ('Cappuccino', 42, 'Medium', 'Warm'),
    ('Cappuccino', 45, 'Large', 'Warm'),
    ('Iced-Chai', 45, 'Medium', 'Cold'),
    ('Iced-Chai', 47, 'Large', 'Cold');

INSERT INTO FOOD_MENU
    (Food_name, Food_price, Food_category, is_vegan)
VALUES
    ('Chicken-Salad', 99, 'salad', false),
    ('Shirmp-Salad', 99, 'salad', false),
    ('Oumph-Salad', 99, 'salad', true),
    ('Hummus-Roll', 49, 'sandwich', true),
    ('Ham and Cheese grilled sandwich', 67, 'sandwich', false),
    ('Granola youghurt', 29, 'youghurt', false),
    ('Egg sandwich', 45, 'sandwich', false);