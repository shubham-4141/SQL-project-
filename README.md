## Book Store Management System - SQL Project
## Overview
This project represents a basic Book Store Management System implemented in SQL. The system allows for tracking books, customers, and orders, and provides insightful queries for various aspects of the business. The system is designed with three primary tables:

- Books: Stores information about books, including title, author, genre, price, and stock levels.
- Customers: Stores customer information such as name, email, phone, city, and country.
- Orders: Tracks customer orders, including the book(s) ordered, order date, quantity, and total amount.
## Objective
The goal of this project is to design and implement a relational database for a book store, manage data related to books, customers, and orders, and generate useful insights using SQL queries. The project includes data import from CSV files, table creation, and multiple queries for analysis.

## Project Structure
- Tables Created:
  - Books: Contains details about books.
  - Customers: Contains customer details.
  - Orders: Contains details of orders placed by customers, with references to books and 
   customers.
- Data Import: Data is imported from CSV files for books, customers, and orders.
# SQL Scripts
## 1. Table Creation
The CREATE TABLE statement is used to define a new table within a database. This table is structured to hold data in columns, each with a specified data type, constraints, and other properties. Below is a detailed breakdown of the CREATE TABLE statement for the tables defined in your project:






## 2. Data Import from CSV 
The COPY command is often used to import data from CSV files into database tables. This is particularly useful when you need to load large datasets quickly into your database. 
 


## 3. Simple Queries for Data Analysis
-  Retrieve all books in the "Fiction" genre:
-  Find books published after the year 1950:
-  List all customers from the Canada:
-  Show orders placed in November 2023:
-  Retrieve the total stock of books available:
-  Find the details of the most expensive book:
-  Show all customers who ordered more than 1 quantity of a book:
-  Retrieve all orders where the total amount exceeds $20:
-  List all genres available in the Books table:
-  Find the book with the lowest stock:
-  Calculate the total revenue generated from all orders:



## 4. Advanced Queries

- Retrieve the total number of books sold for each genre:
- Find the average price of books in the "Fantasy" genre:
- List customers who have placed at least 2 orders:
- Find the most frequently ordered book:
- Show the top 3 most expensive books of 'Fantasy' Genre :
- Retrieve the total quantity of books sold by each author:
- List the cities where customers who spent over $30 are located:
- Find the customer who spent the most on orders:
- Calculate the stock remaining after fulfilling all orders:

## Potential Enhancements
1. Reports and Visualizations: Using tools like Power BI or Tableau, integrate the database with a reporting system for visual analysis of sales trends, customer behaviors, and book performance.

2. Additional Features:

- Add more tables for inventory management, suppliers, or discounts.
- Implement more complex business logic for customer loyalty programs or promotional discounts.
## Conclusion
This project provides a solid foundation for managing a book store's data using SQL. The system allows for easy tracking of books, customers, and orders, while offering advanced queries to generate key business insights. It can be further expanded to include more features or integrated with business intelligence tools for more advanced reporting and visualization.


