DROP SCHEMA IF EXISTS "public" CASCADE;
CREATE SCHEMA IF NOT EXISTS "public";

DROP TABLE IF EXISTS "food_categories";
CREATE TABLE IF NOT EXISTS "food_categories"
(
    "id" SERIAL PRIMARY KEY,
    "category" VARCHAR(100) NOT NULL,
    "description" VARCHAR(100) NOT NULL
);

INSERT INTO "food_categories"
    ("id", "category", "description")
VALUES
    (1, 'salad', 'four types of salads based on shrimps, oumph, chicken and halloumi'),
    (2, 'sandwich', 'grilled sandwiches, rolls and bagels'),
    (3, 'youghurt', 'granola and nuts options'),
    (4, 'fika', 'chocolate, gluten-free, milk-free, sugar-free'),
    (5, 'misc', 'botteled drinks, testing products etc');

DROP TABLE IF EXISTS "food_products";
CREATE TABLE IF NOT EXISTS "food_products"
(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "price" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "is_vegan" BOOLEAN NOT NULL
);

INSERT INTO "food_products"
    ("name", "price", "category_id", "is_vegan")
VALUES
    ('Chicken-Salad', 99, 1, false),
    ('Shirmp-Salad', 99, 1, false),
    ('Oumph-Salad', 99, 1, true),
    ('Hummus-Roll', 49, 2, true),
    ('Ham and Cheese grilled sandwich', 67, 2, false),
    ('Granola youghurt', 29, 3, false),
    ('Cheescake', 39, 4, false),
    ('Carrots cake', 35, 4, false),
    ('Egg sandwich', 45, 2, false),
    ('Home made fruit smoothies', 45, 5, false);


--Create a query that shows products with categories name and description #10 

SELECT * 
FROM food_products
JOIN food_categories
ON food_products.category_id = food_categories.id;

