/*Query to create database with name pizza_sales_analysis*/
CREATE DATABASE pizza_sales_analysis;
USE pizza_sales_analysis;

/*Query to see list of all databases*/
SHOW DATABASES;

/*Query to create table*/
CREATE TABLE orders
( 
order_id INT,
order_date DATE
);

/*query to add column time with datatype time after date column in above order table*/
ALTER TABLE orders
ADD order_time TIME AFTER order_date;

/* Query to rename the table order to orders*/
ALTER TABLE orders
RENAME TO orders;

/*Add primary key constraint to the column id on existing table orders*/
ALTER TABLE orders
ADD PRIMARY KEY (order_id);





