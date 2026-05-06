-- Day 2: Student Fee Management System  
-- Skills: JOIN, WHERE, ORDER BY, Table Relationships
-- Goal: Remote Data Analyst ₹40k+/month

USE remote_job_prep;

-- Table 1: Student marks
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

-- Table 2: Fee payments
CREATE TABLE fees (
    id INT PRIMARY KEY,
    student_name VARCHAR(50),
    amount_paid INT,
    due_date DATE
);

-- Query 1: Complete student financial report
SELECT s.name, s.marks, s.city, f.amount_paid, f.due_date
FROM students s
JOIN fees f ON s.name = f.student_name;

-- Query 2: Identify fee defaulters under 5000
SELECT s.name, s.marks, f.amount_paid 
FROM students s 
JOIN fees f ON s.name = f.student_name 
WHERE f.amount_paid < 5000;

-- Query 3: Top performer with payment status
SELECT s.name, s.marks, s.city, f.amount_paid 
FROM students s 
JOIN fees f ON s.name = f.student_name 
ORDER BY s.marks DESC LIMIT 1; 
