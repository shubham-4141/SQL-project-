
-- Create Tables
DROP TABLE IF EXISTS Books;

CREATE TABLE Books(
    Book_id serial PRIMARY KEY,
	Title varchar(100),
	Author varchar(100),
	Genere varchar(100),
	Published_Year int,
	Price numeric(10,2),
	Stock int
	
);
SELECT * FROM Books;

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
-- if data are not serially than use serial not use int 
      Customer_id int PRIMARY KEY,
	  Name varchar(100),
	  Email varchar(100),
	  Phone varchar(15),
	  City varchar(50),
	  Country varchar(100)
);
SELECT * FROM Customers;

-- Order Table Does not Crated Before tables(Books,Customers) becuse 
-- customer_id book_id take refrences from abve two tables
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
    Order_id int PRIMARY KEY,
	Customer_id int REFERENCES Customers(Customer_id),
	Book_id int REFERENCES Books(Book_id),
	Order_Date date,
	Quantity int,
	Total_Amount numeric(10,2)
);
SELECT * FROM Orders

-- IMPORT DATA FROM CSV FILES

-- Copy Data  From Books Csv File 
COPY Books(Book_id,Title,Author,Genere,Published_Year,Price,Stock)
FROM 'C:\Sqlproject\Books.csv' 
DELIMITER ','
CSV HEADER;

SELECT * FROM Books;

-- Copy Data  From Customers Csv File 
COPY customers(customer_id,name,email,phone,city,country)
FROM 'C:\Sqlproject\Customers.csv' 
DELIMITER ','
CSV HEADER;

SELECT * FROM customers

-- Copy Data  From Orders Csv File

COPY orders(order_id,customer_id,book_id,order_date,quantity,total_amount)
FROM 'C:\Sqlproject\Orders.csv' 
DELIMITER ','
CSV HEADER;

SELECT * FROM orders;

-- 1) Retrieve all books in the "Fiction" genre:
     SELECT * FROM Books
	 WHERE genere ='Fiction';



-- 2) Find books published after the year 1950:
     SELECT * FROM Books 
	 WHERE published_year > 1950;

-- 3) List all customers from the Canada:
      SELECT * FROM Customers
	  WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023:
       SELECT * FROM Orders
	   WHERE order_date BETWEEN '2023-11-01'AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
      SELECT SUM(stock) AS total_stock
	  FROM Books;
	  

-- 6) Find the details of the most expensive book:
      SElECT * FROM Books
	  ORDER BY price DESC
	  LIMIT 1;
     
-- 7) Show all customers who ordered more than 6 quantity of a book:
      SELECT * FROM Orders
	  WHERE quantity >6;
      
	  

-- 8) Retrieve all orders where the total amount exceeds $20:
      SELECT * FROM Orders
	  WHERE total_amount>20;

-- 9) List all genres available in the Books table:
      SELECT DISTINCT(genere) FROM Books; 
	  

-- 10) Find the book with the lowest stock:
       SELECT * FROM Books
	   ORDER BY stock
	   LIMIT 1;
       

-- 11) Calculate the total revenue generated from all orders:
       SELECT SUM(total_amount) AS total_revenue
	   FROM Orders;
	   

	   
-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
      SELECT b.genere,SUM(o.quantity) AS Total_booksold
	  FROM Orders AS o
	  JOIN Books AS b
	  ON o.Book_id = b.Book_id
	  GROUP BY b.genere;
	 S


-- 2) Find the average price of books in the "Fantasy" genre:
      ELECT  ROUND(AVG(price),2) AS Average_price
	  FROM Books 
	  WHERE Genere ='Fantasy'

-- 3) List customers who have placed at least 2 orders:
      SELECT o.customer_id,c.name,COUNT(o.order_id) AS Order_count
	  FROM orders AS o
	  JOIN customers AS c
	  ON o.customer_id=c.customer_id
	  GROUP BY o.customer_id,c.name
	  HAVING COUNT(order_id)>=2

-- 4) Find the most frequently ordered book:
      SELECT book_id ,COUNT(order_id) AS most_frequentorder
	  FROM orders
	  GROUP BY book_id
	  ORDER BY most_frequentorder DESC
	  LIMIT 1;

	  --For above question give frequently order book with name
	  
      SELECT o.book_id,b.title ,COUNT(o.order_id) AS most_frequentorder
	  FROM orders AS o
	  JOIN books AS b
	  ON o.book_id = b.book_id
	  GROUP BY o.book_id , b.title
	  ORDER BY most_frequentorder DESC
	  LIMIT 1;
	  
	  


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
      SELECT * FROM Books
	  WHERE genere = 'Fantasy'
	  ORDER BY price DESC
	  LIMIT 3;
	  
      

-- 6) Retrieve the total quantity of books sold by each author:
      SELECT b.author ,SUM(o.quantity) AS quantity_sold
	  FROM orders AS o
	  JOIN books AS b
	  ON o.book_id = b.book_id
	  GROUP BY b.author

	-- most quantity sold by an author 
      SELECT b.author ,SUM(o.quantity) AS quantity_sold
	  FROM orders AS o
	  JOIN books AS b
	  ON o.book_id = b.book_id
	  GROUP BY b.author
	  ORDER BY quantity_sold DESC
	  LIMIT 1;
	  

-- 7) List the cities where customers who spent over $30 are located:
      SELECT DISTINCT(c.city),total_amount
	  FROM orders AS o
	  JOIN customers AS c
	  ON o.customer_id=c.customer_id
	  WHERE o.total_amount >30;
	 
	 

-- 8) Find the customer who spent the most on orders:
      SELECT o.customer_id, c.name,SUM(o.total_amount) AS Most_spent 
	  FROM orders AS o
	  JOIN customers AS c
	  ON o.customer_id=c.customer_id
	  GROUP BY o.customer_id,c.name
	  ORDER BY Most_spent DESC
	  LIMIT 1;
	 
	 

--9) Calculate the stock remaining after fulfilling all orders:
      SELECT b.book_id,b.title,b.stock,
	  COALESCE(SUM(o.quantity),0) AS order_quantity,
	  b.stock - COALESCE(SUM(o.quantity),0) AS remaining_stock
	  FROM books AS b
	  LEFT JOIN orders AS o
	  ON b.book_id = o.book_id
	  GROUP BY b.booK_id
	  ORDER BY b.book_id 
	  