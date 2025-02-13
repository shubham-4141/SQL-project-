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
## SQL Scripts
# 1. Table Creation
- Books Table
sql
Copy
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    Book_id serial PRIMARY KEY,
    Title varchar(100),
    Author varchar(100),
    Genere varchar(100),
    Published_Year int,
    Price numeric(10,2),
    Stock int
);
- Customers Table
sql
Copy
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Customer_id int PRIMARY KEY,
    Name varchar(100),
    Email varchar(100),
    Phone varchar(15),
    City varchar(50),
    Country varchar(100)
);
- Orders Table
sql
Copy
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    Order_id int PRIMARY KEY,
    Customer_id int REFERENCES Customers(Customer_id),
    Book_id int REFERENCES Books(Book_id),
    Order_Date date,
    Quantity int,
    Total_Amount numeric(10,2)
);
# 2. Data Import from CSV
To import data from CSV files, use the COPY command in PostgreSQL.

sql
Copy
COPY Books(Book_id, Title, Author, Genere, Published_Year, Price, Stock)
FROM 'C:\Sqlproject\Books.csv' 
DELIMITER ',' CSV HEADER;

COPY Customers(Customer_id, Name, Email, Phone, City, Country)
FROM 'C:\Sqlproject\Customers.csv' 
DELIMITER ',' CSV HEADER;

COPY Orders(Order_id, Customer_id, Book_id, Order_Date, Quantity, Total_Amount)
FROM 'C:\Sqlproject\Orders.csv' 
DELIMITER ',' CSV HEADER;
# 3. Sample Queries for Data Analysis
- Retrieve all books in the "Fiction" genre:

sql
Copy
SELECT * FROM Books WHERE genere = 'Fiction';
Find books published after 1950:

sql
Copy
SELECT * FROM Books WHERE published_year > 1950;
Retrieve the total stock of books available:

sql
Copy
SELECT SUM(stock) AS total_stock FROM Books;
Find the most expensive book:

sql
Copy
SELECT * FROM Books ORDER BY price DESC LIMIT 1;
Show all customers who ordered more than 6 copies of a book:

sql
Copy
SELECT * FROM Orders WHERE quantity > 6;
Retrieve total revenue from all orders:

sql
Copy
SELECT SUM(total_amount) AS total_revenue FROM Orders;
4. Advanced Queries
Retrieve the total number of books sold for each genre:

sql
Copy
SELECT b.genere, SUM(o.quantity) AS Total_booksold
FROM Orders AS o
JOIN Books AS b ON o.Book_id = b.Book_id
GROUP BY b.genere;
List customers who have placed at least 2 orders:

sql
Copy
SELECT o.customer_id, c.name, COUNT(o.order_id) AS Order_count
FROM Orders AS o
JOIN Customers AS c ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(o.order_id) >= 2;
Find the most frequently ordered book (with name):

sql
Copy
SELECT o.book_id, b.title, COUNT(o.order_id) AS most_frequentorder
FROM Orders AS o
JOIN Books AS b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY most_frequentorder DESC
LIMIT 1;
How to Use the Project
Step 1: Set Up the Database
Install PostgreSQL and set up a new database.
Create the necessary tables using the provided SQL scripts.
Import data from the provided CSV files into the tables.
Step 2: Execute Queries
You can run the provided queries directly in your PostgreSQL environment to get useful insights about the book store.

Potential Enhancements
Reports and Visualizations: Using tools like Power BI or Tableau, integrate the database with a reporting system for visual analysis of sales trends, customer behaviors, and book performance.

Additional Features:

Add more tables for inventory management, suppliers, or discounts.
Implement more complex business logic for customer loyalty programs or promotional discounts.
Conclusion
This project provides a solid foundation for managing a book store's data using SQL. The system allows for easy tracking of books, customers, and orders, while offering advanced queries to generate key business insights. It can be further expanded to include more features or integrated with business intelligence tools for more advanced reporting and visualization.


