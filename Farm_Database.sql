-- Create my Farm Database
-- CREATE DATABASE Farm;

USE Farm;

/* CREATE Fresh_Produce table
This Fresh Produce table stores the name, stock quantity, stock date, season, and price per unit  of each fresh produce item. 
produce_id is an auto increment primary key*/
CREATE TABLE Fresh_Produce (
produce_id INT PRIMARY KEY AUTO_INCREMENT,
produce_name VARCHAR(100) NOT NULL,
stock_quantity INT NOT NULL,
stock_date DATE NOT NULL,
season VARCHAR(10) NOT NULL CHECK (SEASON IN ('spring', 'summer', 'autumn', 'winter')),
price_per_unit DECIMAL(5, 2) NOT NULL
);

/* Create Animal_Produce table
This Animal Produce table stores the name, stock quantity, stock date, season, and price per unit  of each animal produce item. 
produce_id is an auto increment primary key */
CREATE TABLE Animal_Produce (
produce_id INT PRIMARY KEY AUTO_INCREMENT,
produce_name VARCHAR(100) NOT NULL,
stock_quantity INT NOT NULL,
stock_date DATE NOT NULL,
season VARCHAR(10) NOT NULL CHECK (season IN ('spring', 'summer', 'autumn', 'winter')),
price_per_unit DECIMAL(5, 2) NOT NULL
);

/*Create Seasonal_Hamper table
The Seasonal Hamper table stores the season that the hamper is made in (spring, summer, autumn, winter), and the hampers description. 
hamper_id is an auto increment primary key */
CREATE TABLE Seasonal_Hamper (
hamper_id INT PRIMARY KEY AUTO_INCREMENT,
season VARCHAR(10) NOT NULL CHECK (season IN ('spring', 'summer', 'autumn', 'winter')),
description VARCHAR(255)
);

/*Create Seasonal Hamper Contents table 
This table links to the Fresh Produce table, Animal Produce table and Seasonal Hamper table through foreign keys.
'hamper_id' column references the 'hamper id' in the Seasonal Hamper table.
'fresh_produce_id' column references the 'produce id' from the Fresh Produce table.
'animal_produce_id' column references the 'produce id' from the Animal produce table.
Each record should show a hamper with the details of the fresh producce and animal produce that it contains.
(Note to self - Recheck because I had a few problems setting up the foreign keys) */
CREATE TABLE Seasonal_Hamper_Contents (
hamper_content_id INT PRIMARY KEY AUTO_INCREMENT,
hamper_id INT,
fresh_produce_id INT,
animal_produce_id INT,
product_type VARCHAR(10) NOT NULL CHECK (product_type IN ('fresh', 'animal')),
FOREIGN KEY (hamper_id) REFERENCES Seasonal_Hamper(hamper_id), 
FOREIGN KEY (fresh_produce_id) REFERENCES Fresh_Produce(produce_id),
FOREIGN KEY (animal_produce_id) REFERENCES Animal_Produce(produce_id)
);

-- ALTER TABLE Seasonal_Hamper_Contents to DROP product_type column
ALTER TABLE Seasonal_Hamper_Contents
DROP COLUMN product_type;

-- Create Customer Table. This table stores information about the customers. 
CREATE TABLE Customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
phone_number VARCHAR(20),
sign_up_date DATE NOT NULL
);

/*Create Hamper Purchase Table to store the customer purchases.
This table links to the Customer Table and the Seasonal Hamper table through foreign keys.
'purchase_id' is an auto increment primary key.
'customer_id' references the 'customer id' in the Customer table.
'hamper_id' references the 'hamper id' from the Seasonal Hamper table.
'purchase_date' is the date that the purchase was made.
*/
CREATE TABLE Hamper_Purchase (
purchase_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
hamper_id INT, 
purchase_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (hamper_id) REFERENCES Seasonal_Hamper(hamper_id)
);

/*ALTER TABLE Animal_Produce to DROP Season column. 
I decided that the season column was not needed for the animal produce table. */
ALTER TABLE Animal_Produce
DROP COLUMN season;

-- Insert data into the Fresh_Produce table for autumn
INSERT INTO Fresh_Produce (produce_name, stock_quantity, stock_date, season, price_per_unit) VALUES
('Apples', 150, '2024-09-25', 'autumn', 1.20),
('Raspberry Jam', 75, '2024-09-20', 'autumn', 3.50),
('Cabbage', 120, '2024-09-22', 'autumn', 0.80),
('Cauliflower', 90, '2024-09-23', 'autumn', 1.50),
('Shallots', 200, '2024-09-18', 'autumn', 2.00),
('Pak Choi', 50, '2024-09-21', 'autumn', 1.75),
('Pears', 100, '2024-09-25', 'autumn', 1.40),
('Squash', 85, '2024-09-19', 'autumn', 1.30),
('Carrots', 180, '2024-09-24', 'autumn', 0.90),
('Beetroot', 110, '2024-09-17', 'autumn', 1.10),
('Cranberry Jam', 60, '2024-09-16', 'autumn', 3.80),
('Tomato Chutney', 70, '2024-09-15', 'autumn', 3.20);

-- Insert data into the Fresh_Produce table for summer
INSERT INTO Fresh_Produce (produce_name, stock_quantity, stock_date, season, price_per_unit) VALUES
('Strawberries', 100, '2024-06-15', 'summer', 2.50);

-- Insert more data into the Fresh_Produce table for summer, spring and winter
INSERT INTO Fresh_Produce (produce_name, stock_quantity, stock_date, season, price_per_unit) VALUES
('Baby carrots', 150, '2024-06-20', 'summer', 1.10),
('Plums', 120, '2024-07-01', 'summer', 2.00),
('Courgette', 85, '2024-07-10', 'summer', 1.30),
('Summer Squash', 90, '2024-07-05', 'summer', 1.70),
('Currants', 60, '2024-06-25', 'summer', 3.00),
('Mint', 200, '2024-06-18', 'summer', 0.90),
('Parsley', 180, '2024-07-08', 'summer', 0.85),
('Cherries', 130, '2024-07-12', 'summer', 2.80),
('Cucumber', 110, '2024-06-30', 'summer', 1.20),
('Raspberries', 70, '2024-07-02', 'summer', 3.20),
('Tomatoes', 140, '2024-06-28', 'summer', 1.50),
('Peppers', 120, '2024-03-15', 'spring', 1.80),
('Kale', 90, '2024-03-20', 'spring', 1.50),
('Broccoli', 100, '2024-04-01', 'spring', 1.70),
('Asparagus', 85, '2024-04-10', 'spring', 2.20),
('Spring Cabbage', 110, '2024-04-05', 'spring', 1.00),
('Spring onion', 200, '2024-03-25', 'spring', 0.80),
('Radish', 75, '2024-04-08', 'spring', 0.60),
('Pepper Chutney', 65, '2024-03-18', 'spring', 3.40),
('Rhubarb', 95, '2024-04-12', 'spring', 2.30),
('Apricots', 130, '2024-05-02', 'spring', 2.90),
('Strawberry Jam', 80, '2024-04-20', 'spring', 3.50),
('Lettuce', 150, '2024-04-25', 'spring', 1.20),
('Parsnips', 90, '2024-12-05', 'winter', 1.30),
('Pumpkin', 70, '2024-12-10', 'winter', 2.50),
('Leeks', 120, '2024-12-15', 'winter', 1.60),
('Chilli Jam', 50, '2024-12-20', 'winter', 3.20),
('Carrots', 180, '2024-12-25', 'winter', 0.90),
('Pear Jam', 65, '2024-12-30', 'winter', 3.50),
('Apple Jam', 75, '2024-12-12', 'winter', 3.10),
('Brussel sprouts', 110, '2024-12-18', 'winter', 1.40),
('Sweet potatoes', 130, '2024-12-22', 'winter', 2.00),
('Apples', 140, '2024-12-28', 'winter', 1.20),
('Rhubarb Jam', 60, '2024-12-08', 'winter', 3.40),
('Potatoes', 200, '2024-12-14', 'winter', 1.00);

-- Insert data into Animal_Produce table
INSERT INTO Animal_Produce (produce_name, stock_quantity, stock_date, price_per_unit) VALUES
('Eggs', 200, '2024-08-15', 0.30),
('Cheese', 150, '2024-08-25', 2.50),
('Cows Milk', 250, '2024-09-01', 1.20),
('Honey', 75, '2024-09-10', 5.00),
('Butter', 180, '2024-08-30', 2.00),
('Yogurt', 120, '2024-09-05', 1.50),
('Clotted Cream', 90, '2024-09-12', 3.20),
('Goats Cheese', 80, '2024-08-20', 4.00),
('Kefir', 100, '2024-09-08', 2.70),
('Cream Cheese', 130, '2024-09-18', 2.30),
('Goats Milk', 110, '2024-09-02', 1.80),
('Beeswax Candle', 60, '2024-08-18', 6.50);

/*Insert data into Seasonal_Hamper table 
This states the hampers season and describes the contents in the hamper*/
INSERT INTO Seasonal_Hamper (season, description) VALUES
('Spring', 'Spring hamper with fresh greens, fruits and dairy products from our farm to you'),
('Summer', 'Summer hamper with fresh vegetables, fruits and products from our farm to you'),
('Autumn', 'Autumn hamper with hearty vegetables, fruits and sweet treats from our farm to you'),
('Winter', 'Winter hamper with root vegetables, jams, and products from our farm to you');

/*Insert data into the Seasonal_Hamper_Contents table
I inserted one row of data into the Spring Hamper first to check that it works correctly.
 */
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(1, 25, 1); -- This is a Spring hamper which conatins peppers from fresh produce and eggs from animal produce.

-- Inserting the rest of the fresh produce and animal produce into the Spring Hamper
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(1, 26, 2), -- Spring hamper now also contains Kale and Cheese
(1, 27, 3), -- Spring hamper now also contains Brocolli and Cows milk
(1, 28, 4), -- Spring hamper now also contains Asparagus and Honey
(1, 29, 5), -- Spring hamper now also contains Spring Cabbage and Butter 
(1, 30, 6), -- Spring hamper now also contains Spring Onion and Yogurt
(1, 31, 7), -- Spring hamper now also contains Radish and Clotted Cream
(1, 32, 8), -- Spring hamper now also contains Pepepr Chutney and Goats cheese
(1, 33, 9), -- Spring hamper now also contains Rhubarb and Kefir
(1, 34, 10), -- Spring hamper now also contains Apricots and Cream cheese
(1, 35, 11), -- Spring hamper now also contains Strawberry jam and Goats milk
(1, 36, 12); -- Spring hamper now also contains Lettuce and a Beeswax candle

/*Insert the fresh produce and animal produce into the Summer Hamper 
I inserted one row of data into the Summer Hamper first to check that it works correctly.*/
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(2, 13, 1);
-- This is a Summer hamper which currently contains Strawberries from fresh produce and Eggs from animal produce.

-- Inserting the rest of the fresh produce and animal produce into the Summer Hamper 
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(2, 14, 2), -- Summer hamper now also contains baby carrots and Cheese
(2, 15, 3), -- Summer hamper now also contains Plums and Cows milk
(2, 16, 4), -- Summer hamper now also contains Courgette and Honey
(2, 17, 5), -- Summer hamper now also contains Summer squash and Butter
(2, 18, 6), -- Summer hamper now also contains Currants and Yogurt
(2, 19, 7), -- Summer hamper now also contains Mint and Clotted Cream
(2, 20, 8), -- Summer hamper now also contains Parsely and Goats cheese
(2, 21, 9), -- Summer hamper now also contains Cherries and Kefir
(2, 22, 10), -- Summer hamper now also contains Cucumber and Cream cheese
(2, 23, 11), -- Summer hamper now also contains Raspberries and Goats milk
(2, 24, 12); -- Summer hamper now also contains Tomatoes and a Beeswax candle

-- Insert the fresh produce and the animal produce into the Autumn Hamper
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(3, 1, 1), -- This is an Autumn Hamper which currently contains Apples and Eggs
(3, 2, 2), -- Autumn Hamper now also contains Raspberry jam and Cheese
(3, 3, 3), -- Autumn Hamper now also contains Cabbage and Cows milk
(3, 4, 4), -- Autumn Hamper now also contains Cauliflower and Honey
(3, 5, 5), -- Autumn Hamper now also contains Shallots and Butter 
(3, 6, 6), -- Autumn Hamper now also contains Pak Choi and Yogurt
(3, 7, 7), -- Autumn Hamper now also contains Pears and Clotted cream
(3, 8, 8), -- Autumn Hamper now also contains Squash and Goats cheese
(3, 9, 9), -- Autumn Hamper now also contains Carrots and Kefire
(3, 10, 10), -- Autumn Hamper now also contains Beetroot and Cream cheese
(3, 11, 11), -- Autumn Hamper now also contains Cranberry jam and Goats milk
(3, 12, 12); -- Autumn Hamper now also contains Tomato chutney and Beeswax Candle

-- Insert the fresh produce and the animal produce into the Winter Hamper
INSERT INTO Seasonal_Hamper_Contents (hamper_id, fresh_produce_id, animal_produce_id) VALUES
(4, 37, 1), -- This is a Winter Hamper which currently contains Parsnips and Eggs
(4, 38, 2), -- Winter Hamper now also contains Pumpkin and Cheese
(4, 39, 3), -- Winter Hamper now also contains Leeks and Cows milk
(4, 40, 4), -- Winter Hamper now also contains Chilli jam and Honey
(4, 41, 5), -- Winter Hamper now also contins Carrots and Butter
(4, 42, 6), -- Winter Hamper now also contains Pear jam and Yogurt
(4, 43, 7), -- Winter Hamper now also contains Apple jam and Clotted Cream
(4, 44, 8), -- Winter Hamper now also contains Brussel Sprouts and Goats cheese
(4, 45, 9), -- Winter Hamper now also contains Sweet Potatoes and Kefir
(4, 46, 10), -- Winter Hamper now also contains Apples and Cream cheese
(4, 47, 11), -- Winter Hamper now also contains Rhubarb jam and Goats Milk
(4, 48, 12); -- Winter Hamper now also contains Potatoes and a Beeswax candle

-- Insert customer data into Customer table
INSERT INTO Customer (first_name, last_name, email, phone_number, sign_up_date) VALUES
('John', 'Doe', 'johndoe@example.com', '1234567890', '2024-01-15'),
('Jane', 'Smith', 'janesmith@example.com', '0987654321', '2024-02-20'),
('Emma', 'Johnson', 'emmaj@example.com', '9876543210', '2024-03-10'),
('Liam', 'Brown', 'liamb@example.com', '6543219870', '2024-04-05'),
('Olivia', 'Davis', 'oliviad@example.com', '3216549870', '2024-05-15'),
('Noah', 'Miller', 'noahm@example.com', '4561237890', '2024-06-20'),
('Ava', 'Garcia', 'avag@example.com', '7893216540', '2024-07-10'),
('Elijah', 'Martinez', 'elijahm@example.com', '1597534680', '2024-08-05'),
('Sophia', 'Hernandez', 'sophiah@example.com', '7531594680', '2024-09-15'),
('James', 'Wilson', 'jamesw@example.com', '8529637410', '2024-09-21');

-- Insert data into Hamper Purchase table
INSERT INTO Hamper_Purchase (customer_id, hamper_id, purchase_date) VALUES
(1, 1, '2024-03-15'),  -- John Doe bought a Spring Hamper
(1, 2, '2024-07-10'),  -- John Doe also bought a Summer Hamper
(2, 2, '2024-06-18'),  -- Jane Smith bought a Summer Hamper
(2, 3, '2024-09-05'),  -- Jane Smith also bought an Autumn Hamper
(3, 1, '2024-03-10'),  -- Emma Johnson bought a Spring Hamper
(3, 2, '2024-08-12'),  -- Emma Johnson also bought a Summer Hamper
(3, 3, '2024-09-01'),  -- Emma Johnson also bought an Autumn Hamper
(4, 4, '2023-12-31'),  -- Liam Brown bought a Winter Hamper
(5, 1, '2024-05-10'),  -- Olivia Davis bought a Spring Hamper
(6, 2, '2024-07-22'),  -- Noah Miller bought a Summer Hamper
(7, 3, '2024-08-15'),  -- Ava Garcia bought an Autumn Hamper
(8, 4, '2024-09-18'),  -- Elijah Martinez bought a Winter Hamper
(9, 1, '2024-09-10'),  -- Sophia Hernandez bought a Spring Hamper
(10, 2, '2024-09-20'); -- James Wilson bought a Summer Hamper

-- ALTER Seasonal Hamper table to add a column for price
ALTER TABLE Seasonal_Hamper
ADD price DECIMAL(5, 2)

-- UPDATE the price column of Seasonal Hamper table to add a price for each hamper
UPDATE Seasonal_Hamper SET price = 55.99
WHERE hamper_id = 1;

UPDATE Seasonal_Hamper SET price = 59.99
WHERE hamper_id = 2;

UPDATE Seasonal_Hamper SET price = 49.99
WHERE hamper_id = 3;

UPDATE Seasonal_Hamper SET price = 55.99
WHERE hamper_id = 4;

/*Query to retrieve all the Fresh Produce for Summer 
Selects all the columns from the Fresh Produce table where the season is 'summer' */
SELECT * FROM Fresh_Produce WHERE season = 'summer';

/*Query to retrieve all hampers and the names of the fresh produce that goes into those hampers 
Joins 'Seasonal Hamper Contents' with 'fresh produce' to get the names of the fresh produce
Results are ordered by Seasonal Content hamper id and produce name*/
SELECT shc.hamper_id, fp.produce_name
FROM Seasonal_Hamper_Contents shc
JOIN Fresh_Produce fp ON shc.fresh_produce_id = fp.produce_id
ORDER BY shc.hamper_id, fp.produce_name;

-- Query to retrieve all hampers and the names of the animal produce that goes into those hampers
SELECT shc.hamper_id, ap.produce_name
FROM Seasonal_Hamper_Contents shc
JOIN Animal_Produce ap ON shc.animal_produce_id = ap.produce_id
ORDER BY shc.hamper_id, ap.produce_name;

/*Query to check stock levels for all produce
Using a UNION to combine the results from 'Fresh Produce' and 'Animal Produce' tables */
SELECT produce_name, stock_quantity FROM Fresh_Produce
UNION ALL 
SELECT produce_name, stock_quantity FROM Animal_Produce;

/*Query to see all customers details who purchased a Summer Hamper. I've used a nested query. 
The Customer and Hamper Purchase tables are joined to retrieve customer details of people who purchased a summer hamper.
And the subquery fethes the hamper id for 'summer' season from the Seasonal Hamper table */
SELECT c.first_name, c.last_name, c.email, c.phone_number
FROM Customer c 
JOIN Hamper_Purchase hp ON c.customer_id = hp.customer_id
WHERE hp.hamper_id = (SELECT hamper_id FROM Seasonal_Hamper WHERE season = 'summer');

/*Query to list all Hampers purchased by Emma Johnson, along with their description, price and purchase date.
Joining the Customer, Hamper Purchase, and Seasonal Hamper tables to retrieve all the hampers bought by Emma Johnson where the first name is 'Emma' and last name is 'Johnson'.
The result shows the first name, last name, season, description, price and purchase date.
The result is ordered by purchase date.
 */
SELECT c.first_name, c.last_name, sh.season, sh.description, sh.price, hp.purchase_date
FROM Customer c 
JOIN Hamper_Purchase hp ON c.customer_id = hp.customer_id
JOIN Seasonal_Hamper sh ON hp.hamper_id = sh.hamper_id
WHERE c.first_name = 'Emma' AND c.last_name = 'Johnson'
ORDER BY hp.purchase_date;

-- I have to disable SQL Safe Mode so that I can delete the record 'Wool' from the Animal Produce table
SET SQL_SAFE_UPDATES=0;

-- Query to add 'Wool' to the Animal Produce Table
INSERT INTO Animal_Produce (produce_name, stock_quantity, stock_date, price_per_unit) VALUES
('Wool', 150, '2024-03-15', 7.50);


-- Query to DELETE the value 'Wool' from the Animal_Produce table
DELETE FROM Animal_Produce
WHERE produce_name = 'Wool';

/*Using the AVG Aggregate Function to find the average price of the Seasonal Hampers
I gave the price column the alias 'avg_price' */
SELECT AVG(price) AS avg_price
FROM Seasonal_Hamper;

/*Using the SUM Aggregate Function to find the total number of Animal Products in stock
I gave Stock quantity column the alias total_animal_produce_stock' */
SELECT SUM(stock_quantity) AS total_animal_produce_stock
FROM Animal_Produce;

/*Query to make sure that all of my hampers contain fresh produce and to list the names of the fresh produce. 
Using a Left Join to join the Seasonal Hamper Contents, Seasonal Hamper, and Fresh Produce tables
to list all of the Hampers, and all of their contents, even if they don't contain fresh produce. 
If a hamper didn't contain any fresh produce, the produce_name would show NULL for that hamper.
Season Hamper.season column is aliased as 'Seasonal Hamper' */
SELECT Seasonal_Hamper.season AS Seasonal_Hamper, Fresh_Produce.produce_name
FROM Seasonal_Hamper
LEFT JOIN Seasonal_Hamper_Contents ON Seasonal_Hamper.hamper_id = Seasonal_Hamper_Contents.hamper_id
LEFT JOIN Fresh_Produce ON Seasonal_Hamper_Contents.fresh_produce_id = Fresh_Produce.produce_id;

-- Using additional in-built functions

-- Using CONCAT to concatenate the first and last name of customers to retrieve their full name
SELECT CONCAT('Noah', 'Miller') AS 'Customer Full Name';

-- Using MAX to find the highest priced Seasonal Hamper and MIN to find the lowest price Seasonal Hamper
SELECT MAX(price) AS HighestPrice,
MIN(price) AS LowestPrice 
FROM Seasonal_Hamper;

/*Creating a stored procedure to find a cutomers details based on their customer id.
The 'find customer details' stored procedure will accept a customers id as input and returns their details from the Customer table.
 */
DELIMITER $$
CREATE PROCEDURE find_customer_details(IN inputCustomerID INT)
BEGIN
SELECT customer_id, first_name, last_name, email, phone_number
FROM Customer
WHERE customer_id = inputCustomerID;
END $$

/*Invoke the stored procedure to find a customers details based on their customer id.
Will return the details of the customer where their cstumer id is '1'. In this case, John Doe. */
CALL find_customer_details(1);








