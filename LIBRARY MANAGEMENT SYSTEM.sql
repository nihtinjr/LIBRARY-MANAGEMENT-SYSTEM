-- Create the library database

CREATE DATABASE library;
USE library;

-- Creating tables & Inserting Data

-- Creating Branch Table

CREATE TABLE branch 
(
    branch_no INT PRIMARY KEY,
    manager_id INT,
    branch_address VARCHAR(255),
    contact_no VARCHAR(15)
);

-- Inserting Data into Branch Table

INSERT INTO branch(branch_no,manager_id ,branch_address,contact_no) VALUES
(1, 101, '123 Library St, City A', '1234567890'),
(2, 102, '456 Knowledge Ave, City B', '0987654321'),
(3, 103, '789 Book Blvd, City C', '1122334455'),
(4, 104, '321 Study Ln, City D', '2233445566'),
(5, 105, '654 Wisdom Rd, City E', '3344556677'),
(6, 106, '987 Learn Dr, City F', '4455667788'),
(7, 107, '147 Reading Way, City G', '5566778899'),
(8, 108, '258 Literature St, City H', '6677889900'),
(9, 109, '369 Fiction St, City I', '7788990011'),
(10, 110, '159 Education Ave, City J', '8899001122');


-- Displaying Branch Table

SELECT * FROM branch;


-- Creating Employee Table

CREATE TABLE employee 
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2),
    branch_no INT,
    FOREIGN KEY (branch_no) REFERENCES branch(branch_no)
);

-- Inserting Data into Employee Table

INSERT INTO employee(emp_id,emp_name,position,salary,branch_no)VALUES
(201, 'Alice', 'Manager', 50000, 1),
(202, 'Bob', 'Clerk', 30000, 2),
(203, 'Charlie', 'Librarian', 40000, 3),
(204, 'Diana', 'Assistant', 25000, 4),
(205, 'Eve', 'Manager', 52000, 5),
(206, 'Frank', 'Clerk', 28000, 6),
(207, 'Grace', 'Librarian', 42000, 7),
(208, 'Hank', 'Assistant', 27000, 8),
(209, 'Ivy', 'Manager', 54000, 9),
(210, 'Jack', 'Clerk', 31000, 10);

-- Displaying Employee Table

SELECT * FROM employee;

-- Creating Books Table

CREATE TABLE books 
(
    isbn VARCHAR(20) PRIMARY KEY,
    book_title VARCHAR(255),
    category VARCHAR(100),
    rental_price DECIMAL(10, 2),
    status VARCHAR(3) CHECK (status IN ('yes', 'no')),
    author VARCHAR(100),
    publisher VARCHAR(100)
);

-- Inserting Data into Books Table

INSERT INTO books (isbn,book_title,category,rental_price,status,author,publisher)VALUES

('978000000001', 'Book A', 'Fiction', 10.99, 'yes', 'Author A', 'Publisher A'),
('978000000002', 'Book B', 'Science', 12.99, 'no', 'Author B', 'Publisher B'),
('978000000003', 'Book C', 'Math', 15.49, 'yes', 'Author C', 'Publisher C'),
('978000000004', 'Book D', 'History', 8.99, 'yes', 'Author D', 'Publisher D'),
('978000000005', 'Book E', 'Biography', 9.99, 'no', 'Author E', 'Publisher E'),
('978000000006', 'Book F', 'Philosophy', 14.99, 'yes', 'Author F', 'Publisher F'),
('978000000007', 'Book G', 'Arts', 20.99, 'no', 'Author G', 'Publisher G'),
('978000000008', 'Book H', 'Fiction', 7.99, 'yes', 'Author H', 'Publisher H'),
('978000000009', 'Book I', 'Science', 11.99, 'yes', 'Author I', 'Publisher I'),
('978000000010', 'Book J', 'Math', 19.99, 'yes', 'Author J', 'Publisher J');

-- Displaying Books Table

SELECT * FROM books;



-- Creating Customer Table

CREATE TABLE customer 
(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    reg_date DATE
);

-- Inserting data into Customer Table

INSERT INTO customer (customer_id,customer_name,customer_address,reg_date)VALUES

(301, 'John', '12 Main St, City A', '2023-01-15'),
(302, 'Jane', '34 Elm St, City B', '2023-02-20'),
(303, 'Sam', '56 Oak St, City C', '2023-03-10'),
(304, 'Sara', '78 Pine St, City D', '2023-04-05'),
(305, 'Tom', '90 Maple St, City E', '2023-05-25'),
(306, 'Anna', '23 Cedar St, City F', '2023-06-18'),
(307, 'Paul', '45 Birch St, City G', '2023-07-12'),
(308, 'Nina', '67 Walnut St, City H', '2023-08-30'),
(309, 'Leo', '89 Cherry St, City I', '2021-09-14'),
(310, 'Mia', '21 Spruce St, City J', '2023-10-07');

-- Displaying Customer Table

SELECT * FROM customer;

-- Creating IssueStatus Table

CREATE TABLE issue_status 
(
    issue_id INT PRIMARY KEY,
    issued_cust INT,
    issued_book_name VARCHAR(255),
    issue_date DATE,
    isbn_book VARCHAR(20),
    FOREIGN KEY (issued_cust) REFERENCES customer(customer_id),
    FOREIGN KEY (isbn_book) REFERENCES books(isbn)
);
 
-- Inserting data into IssueStatus Table
INSERT INTO issue_status (issue_id,issued_cust,issued_book_name,issue_date,isbn_book
)VALUES
(401, 301, 'Book A', '2023-06-05', '978000000001'),
(402, 302, 'Book B', '2024-01-02', '978000000002'),
(403, 303, 'Book C', '2024-01-03', '978000000003'),
(404, 304, 'Book D', '2024-01-04', '978000000004'),
(405, 305, 'Book E', '2024-01-05', '978000000005'),
(406, 306, 'Book F', '2024-01-06', '978000000006'),
(407, 307, 'Book G', '2024-01-07', '978000000007'),
(408, 308, 'Book H', '2024-01-08', '978000000008'),
(409, 309, 'Book I', '2024-01-09', '978000000009'),
(410, 310, 'Book J', '2024-01-10', '978000000010');

-- Displaying IssueStatus Table

SELECT * FROM issue_status;

-- Creating ReturnStatus Table

CREATE TABLE return_status 
(
    return_id INT PRIMARY KEY,
    return_cust INT,
    return_book_name VARCHAR(255),
    return_date DATE,
    isbn_book2 VARCHAR(20),
    FOREIGN KEY (isbn_book2) REFERENCES books(isbn)
);

-- Inserting data into ReturnStatus Table

INSERT INTO return_status (return_id,return_cust,return_book_name,return_date ,
isbn_book2) VALUES
(501, 301, 'Book A', '2024-01-11', '978000000001'),
(502, 302, 'Book B', '2024-01-12', '978000000002'),
(503, 303, 'Book C', '2024-01-13', '978000000003'),
(504, 304, 'Book D', '2024-01-14', '978000000004'),
(505, 305, 'Book E', '2024-01-15', '978000000005'),
(506, 306, 'Book F', '2024-01-16', '978000000006'),
(507, 307, 'Book G', '2024-01-17', '978000000007'),
(508, 308, 'Book H', '2024-01-18', '978000000008'),
(509, 309, 'Book I', '2024-01-19', '978000000009'),
(510, 310, 'Book J', '2024-01-20', '978000000010');
 
-- Displaying Return Status Table

SELECT * FROM return_status;

-- Retrieve the book title, category, and rental price of all available books.

SELECT book_title, category, rental_price
FROM books
WHERE status = 'yes';

-- List the employee names and their respective salaries in descending order of salary.

SELECT emp_name, salary
FROM employee
ORDER BY salary DESC;



-- Retrieve the book titles and the corresponding customers who have issued those books

SELECT b.book_title, c.customer_name
FROM books AS b
JOIN issue_status AS i ON b.isbn = i.isbn_book
JOIN customer AS c ON i.issued_cust = c.customer_id;

-- Display the total count of books in each category

SELECT category, COUNT(*) AS total_books
FROM books
GROUP BY category;

-- Retrieve the employee names and their positions for employees whose salaries are above Rs.50,000

SELECT emp_name, position
FROM employee
WHERE salary > 50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet

SELECT customer_name
FROM customer
WHERE reg_date < '2022-01-01'
AND customer_id NOT IN (SELECT issued_cust FROM issue_status);

-- Display the branch numbers and the total count of employees in each branch

SELECT branch_no, COUNT(*) AS total_employees
FROM employee
GROUP BY branch_no;

-- Display the names of customers who have issued books in the month of June 2023

SELECT DISTINCT c.customer_name
FROM customer AS c
JOIN issue_status AS i ON c.customer_id = i.issued_cust
WHERE issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from books table containing "history"
SELECT book_title
FROM books
WHERE category LIKE '%History%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT branch_no, COUNT(*) AS total_employees
FROM employee
GROUP BY branch_no
HAVING COUNT(*) > 5;

-- Retrieve the names of employees who manage branches and their respective branch addresses

SELECT e.emp_name, b.branch_address
FROM employee AS e
JOIN branch AS b ON e.emp_id = b.manager_id;

-- Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT c.customer_name
FROM customer AS c
JOIN issuestatus AS i ON c.customer_id = i.issued_cust
JOIN books AS b ON i.isbn_book = b.isbn
WHERE b.rental_price > 25;