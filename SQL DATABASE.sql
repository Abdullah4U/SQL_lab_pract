CREATE DATABASE KL355DB;
USE KL355DB;
SET SQL_SAFE_UPDATES = 0;

/* */

CREATE TABLE Student (
    stud_id INT,
    stud_name VARCHAR(20),
    city VARCHAR(20),
    email VARCHAR(40),
    age INT
);

INSERT INTO Student VALUES(100,'Shreya','Kalyab','shreya@gmail.com',22);
INSERT INTO Student VALUES(101,'Kartikh','Bhiwandi','kartithk@gmail.com',23);
INSERT INTO Student VALUES(102,'Joshua','Kalyan','joshua@gmail.com',20);
INSERT INTO Student VALUES(103,'Ahemad','Bhiwandi','Ahemad@gmail.com',25);
INSERT INTO Student VALUES(104,'Kashish','Kalyan','kashish@gmail.com',22);
INSERT INTO Student VALUES(105,'Shreya','Kalyan','Shreya1@gmail.com',22);
INSERT INTO Student VALUES(106,'Divesh','Kalyan','divesh@gmail.com',22);
INSERT INTO Student VALUES(107,'Rahul','Kalyan','rahul@gmail.com',22);
INSERT INTO Student VALUES(108,'Krumurthi','Kalyan','krumurthi@gmail.com',22);
SELECT 
    *
FROM
    Student;
DELETE FROM Student 
WHERE
    stud_id = 100;
INSERT INTO Student VALUES(109,'Gudiya','Kalyan','gudiya@gmail.com',22);
INSERT INTO Student VALUES(110,'Abdullah','Bhiwandi','abdullah@gmail.com',23);

USE KL355DB;
DESC Student;
SHOW TABLES;

/*Adding a Column*/
ALTER TABLE Student
ADD state VARCHAR(20);
SELECT 
    *
FROM
    Student;

/*Dropping a column*/
ALTER TABLE Student
DROP state;

/*Modifying Table Data type*/
ALTER TABLE Student
MODIFY age CHAR(3);
ALTER TABLE Student
MODIFY age INT;

/*Adding a column after desired column*/
ALTER TABLE Student
ADD state VARCHAR(20) AFTER city;

/*Adding Multiple Column at once*/
ALTER TABLE Student
ADD dob DATETIME,
ADD country VARCHAR(20);

/*Changing Column Name*/
ALTER TABLE Student
CHANGE COLUMN stud_id sid INT;

/*Renaming Table*/
ALTER TABLE Student
RENAME TO StudInfo;

DESC StudInfo;
SELECT 
    *
FROM
    StudInfo;
INSERT INTO StudInfo VALUES(109,'Sam','banras','UP','sam@gmail.com','22','2004-05-20','India');
INSERT INTO StudInfo (sid,city) VALUES(110,'kalyan');

UPDATE StudInfo 
SET 
    city = 'banaras'
WHERE
    stud_name = 'sam';



UPDATE StudInfo 
SET 
    sid = 111
WHERE
    stud_name = 'sam';

UPDATE StudInfo 
SET 
    sid = 112;
    
TRUNCATE TABLE StudInfo;

CREATE TABLE Student (
    stud_id INT PRIMARY KEY,
    stud_name VARCHAR(20) NOT NULL,
    email VARCHAR(20) UNIQUE,
    age INT CHECK (age >= 18 AND age <= 100),
    city VARCHAR(20) CHECK (city IN ('Mumbai' , 'Pune', 'Nagpu', 'Nasshik')),
    state VARCHAR(20) DEFAULT 'Maharashtra'
);

SELECT 
    *
FROM
    Student;
DESC Student;

INSERT INTO Student(stud_id,stud_name,email,city,state) 
VALUES
(100,'Ahmed','ahmed@gmail.com','Mumbai',DEFAULT),
(101,'Abdullah','abdullah@gmail.com','Mumbai',DEFAULT),
(102,'Karthik','karthik@gmail.com','Pune',DEFAULT);

UPDATE Student 
SET 
    age = 25
WHERE
    stud_id = 100;

UPDATE Student 
SET 
    age = 24
WHERE
    stud_id = 101;

UPDATE Student 
SET 
    age = 21
WHERE
    stud_id = 102;

INSERT INTO Student(stud_id,stud_name,email,age,city,state) 
VALUES
(103,'Pratham','pratham@gmail.com',22,'Pune',DEFAULT),
(104,'Joshua','joshua@gmail.com',20,'Pune',DEFAULT),
(105,'Divesh','divesh@gmail.com',23,'Pune',DEFAULT);

CREATE TABLE Batch (
    stud_id INT,
    batch_id INT PRIMARY KEY,
    batch_name VARCHAR(20),
    marks INT,
    CONSTRAINT fk_id FOREIGN KEY (stud_id)
        REFERENCES Student (stud_id)
);

INSERT INTO Batch(stud_id,batch_id,batch_name,marks) 
VALUES
(100,1000,'DSDA-2026',78);

INSERT INTO Batch(stud_id,batch_id,batch_name,marks) 
VALUES
(101,1001,'DSDA-2026',80);
SELECT 
    *
FROM
    Batch;

CREATE TABLE book (
    book_id INT,
    book_name VARCHAR(20),
    price INT,
    email VARCHAR(20)
);

ALTER TABLE book
ADD PRIMARY KEY(book_id);

ALTER TABLE book
ADD UNIQUE(email);

ALTER TABLE book
ADD city VARCHAR(20) CHECK(city in('Mumbai','Pune'));

ALTER TABLE book
ADD state VARCHAR(20) DEFAULT 'MH';
DESC book;

SELECT 
    *
FROM
    student;

SELECT 
    stud_name, age, age + 10 AS 'new age'
FROM
    student;

SELECT 
    *
FROM
    student
WHERE
    stud_name = 'pratham';

SELECT 
    *
FROM
    student
WHERE
    stud_id = 103;

SELECT 
    *
FROM
    student
ORDER BY stud_name DESC;

SELECT DISTINCT
    city
FROM
    student;

SELECT 
    *
FROM
    student
LIMIT 2;

SELECT 
    *
FROM
    student
LIMIT 2 OFFSET 1;

CREATE TABLE book (
    book_id INT,
    book_name VARCHAR(50),
    cost FLOAT,
    author VARCHAR(20),
    date_of_publish DATETIME
);
SHOW TABLES;
DROP TABLE book;

INSERT INTO book(book_id, book_name, cost, author)
VALUES
(0001,"Song of Ice and Fire",2500,"G.R Martin"),
(0002,"Harry Porter Deathly Hollows",2700,"J.K Rowling"),
(0003,"Song of Ice and Fire",2500,"G.R Martin")
;

SELECT 
    *
FROM
    book;

SELECT 
    book_name, SUM(cost) AS total_cost
FROM
    book
GROUP BY book_name
ORDER BY SUM(cost) DESC;

SELECT 
    book_name, SUM(cost) AS total_cost
FROM
    book
GROUP BY book_name
HAVING SUM(cost) < 2600
ORDER BY SUM(cost) DESC;

/* Window Function*/

INSERT INTO book(book_id, book_name, cost, author)
VALUES
(0003,"Song of Ice and Fire",2500,"G.R Martin"),
(0004,"Harry Porter Deathly Hollows",2700,"J.K Rowling"),
(0005,"Song of Ice and Fire",2500,"G.R Martin");

SELECT book_name, cost, RANK() OVER(ORDER BY book_name) FROM book;
SELECT book_name, cost, ROW_NUMBER() OVER(ORDER BY book_name) FROM book;
SELECT book_name, cost, DENSE_RANK() OVER(ORDER BY book_name) FROM book;
SELECT book_name, SUM(cost), DENSE_RANK() OVER(ORDER BY book_name) FROM book
GROUP BY book_name;

SELECT book_name, cost, DENSE_RANK() OVER(PARTITION BY book_name) FROM book;
SELECT book_id, book_name, SUM(cost) OVER(ORDER BY book_name) FROM book;
SELECT book_id, book_name, SUM(cost) OVER() FROM book;

/* JOINS */
CREATE TABLE Customers (
    cust_id INT,
    cus_name VARCHAR(20),
    email VARCHAR(40)
);

ALTER TABLE Customers
CHANGE COLUMN cus_name cust_name VARCHAR(20);

INSERT INTO Customers
VALUES (100,'Ravi','ravi@gmail.com'),
(101,'Sneha','sneha@gmail.com'),
(102,'Susan','susan@gmail.com'),
(103,'Zoya','zoya@gmail.com'),
(104,'Kaif','kaif@gmail.com'),
(110,'Krish','krish@gmail.com'),
(111,'John','john@gmail.com');

SELECT 
    *
FROM
    Customers;

CREATE TABLE Orders (
    order_id INT,
    product_name VARCHAR(20),
    brand_name VARCHAR(30),
    cust_id INT
);

INSERT INTO Orders
VALUES (1000,'Mobile','Samsung',100),
(1001,'Laptop','Dell',102),
(1002,'LED TV','Sony',103),
(1003,'Laptop','HP',108),
(1004,'LED TV','Samsung',109),
(1005,'Mobile','Apple',101);
SELECT 
    *
FROM
    Orders;

/* INNER JON query */
SELECT 
    cust_name, email, product_name, brand_name
FROM
    Customers
        JOIN
    Orders ON Customers.cust_id = Orders.cust_id;

/* For fetching common data as well */
SELECT 
    Customers.cust_id,
    cust_name,
    email,
    product_name,
    brand_name
FROM
    Customers
        JOIN
    Orders ON Customers.cust_id = Orders.cust_id;

CREATE TABLE members (
    member_id INT,
    member_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

INSERT INTO members value
(1,'Rahul Sharma','rahul@gmail.com','9876543210','Mumbai'),
(2,'Priya Patil','priya@gmail.com','98768422210','Pune'),
(3,'Amit Kumar','amit@gmail.com','9874563210','Delhi'),
(4,'Sneha Joshi','sneha@gmail.com','9885243210','Nashik'),
(5,'Rohit Singh','rohit@gmail.com','9863543210','Mumbai'),
(6,'Neha Verma','neha@gmail.com','9876587410','Thane'),
(7,'Vikas More','vikas@gmail.com','9876459710','Nagour'),
(8,'Pooja Shah','pooja@gmail.com','98765478562','Surat'),
(9,'Karan Mehta','karan@gmail.com','9876543654','Mumbai'),
(10,'Anjali Rao','anjali@gmail.com','9876548952','Bangalore');

SELECT 
    *
FROM
    members;

CREATE TABLE authors (
    author_id INT,
    author_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO authors VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'R.K Narayan', 'India'),
(3, 'J.K Rowling', 'UK'),
(4, 'George Orwell', 'UK'),
(5, 'Robert C. Martin', 'USA'),
(6, 'James Clear', 'USA'),
(7, 'Yuval Noah', 'Israel'),
(8, 'Paulo Coelho', 'Brazi');

CREATE TABLE books (
    book_id INT,
    book_name VARCHAR(150),
    category VARCHAR(50),
    price DECIMAL(10 , 2 ),
    author_id INT
);
   
INSERT INTO books VALUES
(101, 'The Guide'  , 'Fiction' , 350.00, 1),
(102, 'Malgudi days' , 'Fiction' , 550.00, 1),
(103, 'Five Points Someone' , 'Fiction' , 60.00, 2),
(104, '2 States ' , 'Romance' , 250.00, 2),
(105, 'Harry Potter' , 'Fantasy' , 950.00, 3),
(106, '1984' , 'Dystpoian' , 450.00, 4),
(107, 'Clean Code' , 'Programming' , 800.00, 5),
(108, 'Atomic Habits' , 'Self Help' , 550.00, 6),
(109, 'Sapiens' , 'Hisory' , 700.00, 7),
(110, 'The Alchemist' , 'Fiction' , 400.00, 8),
(111, 'Unkown Book' , 'General' , 250.00, NULL);

CREATE TABLE book_issue (
    issue_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    statuss VARCHAR(20)
);

INSERT INTO book_issue
VALUES

(1, 1, 101, '2026-08-01', '2026-08-10', 'Returned'),
(2, 2, 105, '2026-08-03', NULL, 'Issued'),
(3, 3, 107, '2026-08-05', '2026-08-15', 'Returned'),
(4, 4, 108, '2026-08-07', NULL, 'Issued'),
(5, 5, 103, '2026-08-10', '2026-08-20', 'Returned'),
(6, 1, 109, '2026-08-12', NULL, 'Issued'),
(7, 6, 106, '2026-08-15', '2026-08-25', 'Returned'),
(8, 7, 110, '2026-08-18', NULL, 'Issued'),
(9, 8, 104, '2026-08-20', NULL, 'Issued'),
(10, 9, 102, '2026-08-22', '2026-08-30', 'Returned'),
(11, 2, 101, '2026-08-25', NULL, 'Issued'),
(12, 10, 105, '2026-08-28', NULL, 'Issued');

SELECT 
    *
FROM
    book_issue;
SELECT 
    *
FROM
    books;
SELECT 
    *
FROM
    members;

/* author - book
 book - book_issue
 members - book_issue */
 
SELECT 
    author_name, book_name
FROM
    authors
        JOIN
    books ON authors.author_id = books.author_id;
    
SELECT 
    statuss, book_name
FROM
    book_issue
        JOIN
    books ON book_issue.book_id = books.book_id;
    
SELECT 
    member_name, issue_id, statuss
FROM
    members
        JOIN
    book_issue ON members.member_id = book_issue.member_id;

/* Left outer join */    
SELECT 
    member_name
FROM
    members
        LEFT JOIN
    book_issue ON members.member_id = book_issue.member_id;
    
SELECT 
    cust_name, email, product_name, brand_name
FROM
    Customers
        LEFT OUTER JOIN
    orders ON Customers.cust_id = orders.cust_id;

/* Right outer join */
SELECT 
    cust_name, email, product_name, brand_name
FROM
    Customers
        RIGHT OUTER JOIN
    orders ON Customers.cust_id = orders.cust_id;

/* CROSS JOIN */
SELECT 
    *
FROM
    Customers
        CROSS JOIN
    orders;
SELECT 
    *
FROM
    orders;

/* NATURAL JOIN */

CREATE TABLE demo1 (
    id INT,
    name VARCHAR(20),
    city VARCHAR(20)
);

CREATE TABLE demo2 (
    id INT,
    email VARCHAR(40),
    city VARCHAR(20)
);

INSERT INTO demo1 VALUES 
(1, 'Amit', 'Kalyan'),
(2, 'Ganesh', 'Dadar'),
(3, 'Suresh', 'Vashi');

INSERT INTO demo2 VALUES 
(1, 'amit@gmail.com', 'Kalyan'),
(2, 'ganesh@gmail.com', 'Dadar'),
(3, 'suresh@gmail.com', 'Vashi');

UPDATE demo2 
SET 
    city = 'Nerul'
WHERE
    id = 3;

SELECT 
    *
FROM
    demo1
        NATURAL JOIN
    demo2;

/* SELF JOIN */

CREATE TABLE Employee (
    emp_id INT,
    emp_name VARCHAR(20),
    salary INT,
    email VARCHAR(50),
    mgr_id INT
);

INSERT INTO Employee VALUES 
(100, 'Rajiv', 25000, 'rajiv@gmailcom', NULL),
(101, 'Sumit', 45000, 'sumit@gmailcom', 100),
(102, 'Kalpesh', 35000, 'kalpesh@gmailcom', 101),
(103, 'Nilesg', 15000, 'nilesh@gmailcom', 100),
(104, 'Tushar', 55000, 'tushar@gmailcom', 102);

SELECT * FROM Employee;

SELECT e1.emp_name AS 'Eployee', e2.salary As 'Manager' FROM Employee e1 JOIN Employee e2
ON e1.emp_id = e2.mgr_id;

/* Subquery */

SELECT * FROM student;
SELECT * FROM batch;

SELECT stud_name, stud_id, email from student where stud_id = (select stud_id FROM batch where marks = 78);
SELECT stud_name, stud_id, email from student where stud_id > (select stud_id FROM batch where marks = 78);
SELECT stud_name, stud_id, email from student where stud_id < (select stud_id FROM batch where marks = 80);
SELECT stud_name, stud_id, email from student where stud_id <> (select stud_id FROM batch where marks = 80);
SELECT stud_name, stud_id, email from student where stud_id >= (select stud_id FROM batch where marks = 78);
SELECT stud_name, stud_id, email from student where stud_id <= (select stud_id FROM batch where marks = 78);

INSERT INTO batch VALUES
(102,1002,'DSDA-2026',62),
(103,1003,'DSDA-2026',58),
(104,1004,'DSDA-2026',39),
(105,1005,'DSDA-2026',78);

UPDATE batch 
SET batch_name = 'CS-2026'
WHERE batch_id = 1005;

SELECT stud_name, stud_id, email from student where stud_id IN (SELECT stud_id FROM batch WHERE batch_name = 'CS-2026');
SELECT stud_name, stud_id, email from student where stud_id >ANY (SELECT stud_id FROM batch WHERE batch_name = 'DSDA-2026');
SELECT stud_name, stud_id, email from student where stud_id <ANY (SELECT stud_id FROM batch WHERE batch_name = 'DSDA-2026');
SELECT stud_name, stud_id, email from student where stud_id >ALL (SELECT stud_id FROM batch WHERE batch_name = 'CS-2026');
SELECT stud_name, stud_id, email from student where stud_id <ALL (SELECT stud_id FROM batch WHERE batch_name = 'CS-2026');

/* Corelated sub query */ 
SHOW tables;

SELECT * FROM employee;
ALTER TABLE employee
ADD department VARCHAR(20);

UPDATE employee
SET department = 'HR'
WHERE emp_id in (102);

SELECT salary, emp_name, department FROM employee e1
WHERE salary > (SELECT avg(salary) FROM employee e2 WHERE e2.department = e1.department);

/* NOTE: Table alias is used when we have to compare two tables */
/* 2nd lowest salary */
SELECT min(salary) FROM employee
WHERE salary > (SELECT min(salary) FROM employee);

/* 2nd Highest salary */
SELECT max(salary) FROM employee
WHERE salary < (SELECT max(salary) FROM employee);

/* Highest salary from each department */
SELECT salary, emp_name, department FROM employee e1
WHERE salary = (SELECT max(salary) FROM employee e2 WHERE e2.department = e1.department);

/* Lowest salary from each department */
SELECT salary, emp_name, department FROM employee e1
WHERE salary = (SELECT min(salary) FROM employee e2 WHERE e2.department = e1.department);

/* View */
/* Simple View */

CREATE VIEW vw_emp
AS
SELECT emp_id, emp_name, email, department FROM employee;

SELECT * FROM vw_emp;
INSERT INTO vw_emp VALUES
(105, 'Omkar', 'omkar@gmail.com', 'HR');

UPDATE vw_emp
SET department = "Finance"
WHERE emp_id = 104;

DELETE FROM vw_emp 
WHERE emp_id = 105;

/* Complex View */

CREATE VIEW vw_emp1
AS 
SELECT department, sum(salary) FROM employee
GROUP BY department;

/* With check option */
CREATE VIEW vw_emp2
AS 
SELECT emp_id, emp_name, email, department FROM employee
WHERE emp_id > 101;

INSERT INTO vw_emp2 VALUES
(106,'Qazi','qazi@gmail.com','sales');

SELECT * FROM vw_emp2;
SELECT * FROM employee;

CREATE OR REPLACE VIEW vw_emp2
AS 
SELECT emp_id, emp_name, email, department FROM employee
WHERE emp_id > 101
WITH CHECK OPTION;

UPDATE employee
SET salary = 17000 
WHERE emp_id = 106;

SELECT * FROM employee;

CREATE OR REPLACE VIEW vw_stud_batch
AS
SELECT stud_name, email, city, marks, batch_name 
FROM student JOIN batch 
on student.stud_id = batch.stud_id;

SELECT * FROM vw_stud_batch;

CREATE OR REPLACE VIEW vw_stud_name
AS
SELECT stud_name, email, batch_name
FROM student LEFT JOIN BATCH
ON student.stud_id = batch.stud_id;

SELECT * FROM vw_stud_name;
SELECT * FROM student;
SELECT * FROM batch;

DROP VIEW vw_stud_batch;

/* Creating an Index */
CREATE INDEX idx_stud_name ON student (stud_name);

DESC demo1;
CREATE UNIQUE INDEX idx_id ON demo1 (id);


