# Farm-Database - SQL Project

## About 
A database to manage the inventory, seasonal hampers, customer details, and purchases for a farm selling seasonal produce. Implemented features to ensure the farm maintains optimal stock levels and manages customer purchases throughout the year.

## Features 
- Keep track of inventory for both fresh produce and animal produce by season
- Ability to create seasonal hampers with specific contents based on the availability of both fresh and animal produce
- Manage customer purchases throughout the year
- The SQL script contains queries to:
  - Retrieve all the Fresh Produce for Summer
  - Retrieve all hampers and the names of the fresh produce that goes into those hampers
  - Retrieve all hampers and the names of the animal produce that goes into those hampers
  - To check stock levels for all produce
  - To see all customers details who purchased a Summer Hamper.
  - List all Hampers purchased by a specific customer, along with their description, price and purchase date.
  - AVG Aggregate Function to find the average price of the Seasonal Hampers
  - SUM Aggregate Function to find the total number of Animal Products in stock
  - Query to make sure that all of my hampers contain fresh produce and to list the names of the fresh produce
  - CONCAT to concatenate the first and last name of customers to retrieve their full name
  - MAX to find the highest priced Seasonal Hamper and MIN to find the lowest price Seasonal Hamper
  - Stored procedure to find a customers details based on their customer id. The 'find customer details' stored procedure will accept a customers id as input and returns their details from the Customer table.

## Technologies
- MySQL

## How to run
- In MySQL, uncomment and run Line 2: "CREATE DATABASE Farm;" to create the database.
- Then, comment out Line 2 and proceed with running the rest of the SQL file to use the created database.
