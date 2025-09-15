

-- Create Database
CREATE DATABASE SalesDB;

USE SalesDB;

--Create Tables

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50));

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Category VARCHAR(50));

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT Foreign key REFERENCES Customers(CustomerID) ,
    OrderDate DATE)


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY  REFERENCES Orders(OrderID),
    ProductID INT   FOREIGN KEY  REFERENCES Products(ProductID),
    Quantity INT,)
  

-- Insert Sample Data

INSERT INTO Customers VALUES
(1,'Amit Sharma','Delhi','India'),
(2,'John Smith','New York','USA'),
(3,'Priya Patel','Mumbai','India'),
(4,'Sara Lee','London','UK');

INSERT INTO Products VALUES
(1,'Laptop',50000,'Electronics'),
(2,'Mobile',20000,'Electronics'),
(3,'Headphones',2000,'Accessories'),
(4,'Book',500,'Stationery');

INSERT INTO Orders VALUES
(101,1,'2024-01-10'),
(102,2,'2024-02-15'),
(103,3,'2024-03-20'),
(104,1,'2024-04-05'),
(105,4,'2024-05-12');

INSERT INTO OrderDetails VALUES
(1,101,1,1), 
(2,101,3,2),  
(3,102,2,1),  
(4,103,4,3),  
(5,104,2,2),  
(6,105,1,1), 
(7,105,4,5); 


select * from Customers
select * from products
select * from orders 
select * from orderdetails



-----------------------------------------------------
-- 15 SQL Queries for Resume Project
-----------------------------------------------------

-- 1. Show all customers name
select customername from customers

-- 2. Show all products with price > 1000
select * from products where price>1000

-- 3. List all orders made in 2024
select * from orders where orderdate like '2024%'

-- 4. Show customers from India only
select * from customers where country = 'India'

-- 5. Count total orders placed
Select count(*) as  totalorders from orders

--6. Find average price of all products
select avg(price) as avg_price from products


-- 7. Show orders with customer names
select a.orderid , b.customername , a.orderdate 
from orders as a 
join customers as b on a.customerid = b.customerid


-- 8. Show order details with product name
select a.orderdetailid , b.productname,a.quantity from orderdetails as a 
join products as b on a.productid=b.productid

-- 9. Calculate total amount for each order
select b.orderid , sum(b.quantity*a.price) as total_amount 
from products as a join orderdetails as b 
on a.productid=b.productid 
group by orderid


-- 10. Find total sales by each customer
select a.customername , sum(c.quantity*d.price) as total_sale from customers as a 
join orders as b on a.customerid=b.customerid
join orderdetails as c on b.orderid =c.orderid 
join products as d on c.productid =d.productid 
group by a.customername


--11. Find best selling product (by quantity) 
select top 1 productname ,sum(quantity) as total_qty from products as a 
join orderdetails as b on a.productid =b.productid 
group by productname 
order by sum(quantity) desc


-- 12. Find customers who bought 'Laptop'
select customername from customers as a 
join orders as b on a.customerid=b.customerid 
join orderdetails as c on b.orderid=c.orderid 
join products as d on c.productid=d.productid 
where productname = 'Laptop'



































