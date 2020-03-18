DROP TABLE IF EXISTS purchase;
CREATE TABLE purchase
(
    purchase_id SERIAL PRIMARY KEY,
    purchase_price INTEGER NOT NULL,
    purchase_method VARCHAR (50) NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    purchase_from_member BOOLEAN NOT NULL,
    purchase_type VARCHAR (250) NOT NULL,
    purchase_items VARCHAR (250) NOT NULL
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(15) NOT NULL,
    personal_number BIGINT NOT NULL,
    contact VARCHAR(20) NOT NULL,
    address_info VARCHAR(30) DEFAULT NULL,
    salary BIGINT DEFAULT NULL,
    sex char(1) DEFAULT NULL,
    bdate TIMESTAMP DEFAULT NULL,
    employment_date TIMESTAMP NOT NULL,
    contract_type VARCHAR(30),
    title VARCHAR(30)
);

DROP TABLE IF EXISTS drinks_menu;
CREATE TABLE drinks_menu
(
    drink_id SERIAL PRIMARY KEY,
    drink_name VARCHAR(100) NOT NULL,
    drink_price INTEGER NOT NULL,
    drink_size VARCHAR(10) NOT NULL,
    drink_type VARCHAR(20) DEFAULT NULL
);

DROP TABLE IF EXISTS food_menu;
CREATE TABLE food_menu
(
    item_id SERIAL PRIMARY KEY,
    food_name VARCHAR(100) NOT NULL,
    food_price INTEGER NOT NULL,
    food_category VARCHAR(20) DEFAULT NULL,
    is_vegan BOOLEAN NOT NULL
);

DROP TABLE IF EXISTS food_category;
CREATE TABLE food_category
(
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    category_description VARCHAR(100) NOT NULL
);


INSERT INTO purchase
    (purchase_price, purchase_method, purchase_date, purchase_from_member, purchase_type, purchase_items)
VALUES
    (250, 'card', '2016-06-22 19:10:25-07', false, 'breakfast combo', 'coffee and cheese sandwich'),
    (99, 'card', '2019-01-05', true, 'lunch combo', 'soup and tea'),
    (50, 'swish', '2017-06-22 19:10:25-07', true, 'lunch combo', 'soup and tea');


INSERT INTO staff
    (first_name, last_name, personal_number, contact, address_info, salary, sex, bdate, employment_date, contract_type, title)
VALUES
    ('John', 'Doe', 9052631485, '0760759618', 'Malmo', 30000, 'M', '1990-11-14', '2018-01-01', 'Full-time', 'Boss'),
    ('Adam', 'Adamson', 9511148166, '0760759618', 'Malmo', 22000, 'M', '1995-11-14', '2018-01-01', 'Full-time', 'Barista'),
    ('Ildana', 'Ruzybayeva', 874065056, '0760759618', 'Malmo', 22000, 'F', '1987-11-14', '2019-05-01', 'Full-time', 'Barista'),
    ('Alva', 'Rosqvist', 6698751124, '07564315', 'Malmo', 15000, 'F', '1966-08-14', '2019-07-01', 'Part-time', 'Barista');


INSERT INTO drinks_menu
    (drink_name, drink_price, drink_size, drink_type)
VALUES
    ('Latte', 39, 'Small', 'Warm'),
    ('Latte', 42, 'Medium', 'Warm'),
    ('Latte', 45, 'Large', 'Warm'),
    ('Cappuccino', 39, 'Small', 'Warm'),
    ('Cappuccino', 42, 'Medium', 'Warm'),
    ('Cappuccino', 45, 'Large', 'Warm'),
    ('Iced-Chai', 45, 'Medium', 'Cold'),
    ('Iced-Chai', 47, 'Large', 'Cold');

INSERT INTO food_menu
    (food_name, food_price, food_category, is_vegan)
VALUES
    ('Chicken-Salad', 99, 'salad', false),
    ('Shirmp-Salad', 99, 'salad', false),
    ('Oumph-Salad', 99, 'salad', true),
    ('Hummus-Roll', 49, 'sandwich', true),
    ('Ham and Cheese grilled sandwich', 67, 'sandwich', false),
    ('Granola youghurt', 29, 'youghurt', false),
    ('Cheescake', 39, 'fika', false),
    ('Carrots cake', 35, 'fika', false),
    ('Egg sandwich', 45, 'sandwich', false);


INSERT INTO food_category
    (category_name, category_description)
VALUES
    ('salad', 'four types of salads based on shrimps, oumph, chicken and halloumi'),
    ('sandwich', 'grilled sandwiches, rolls and bagels'),
    ('youghurt', 'granola and nuts options'),
    ('fika', 'chocolate, gluten-free, milk-free, sugar-free');


    --Linking food_menu and food_category 
    SELECT * 
    FROM food_menu
    JOIN food_category
    ON food_menu.food_category = food_category.category_name;