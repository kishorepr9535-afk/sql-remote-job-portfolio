-- Step 1: Create database + tables if you haven't
CREATE DATABASE IF NOT EXISTS school;
USE school;

CREATE TABLE IF NOT EXISTS students (
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

CREATE TABLE IF NOT EXISTS fees (
    name VARCHAR(50),
    amount_paid INT,
    fee_month VARCHAR(20)
);

-- Step 2: Insert sample data for Day 4
INSERT INTO students VALUES
('Kishore', 'Kasaragod', 85),
('Arjun', 'Bangalore', 92),
('Meera', 'Kasaragod', 78),
('Ravi', 'Bangalore', 88),
('Priya', 'Chennai', 95),
('Arjun', 'Mumbai', 75);  -- duplicate name, different city/marks

INSERT INTO fees VALUES
('Kishore', 5000, 'Jan'),
('Arjun', 8000, 'Jan'),  -- Bangalore Arjun
('Meera', 0, 'Jan'),     -- didn't pay
('Ravi', 7500, 'Jan'),
('Priya', 9000, 'Jan');
-- Mumbai Arjun didn't pay - shows in LEFT JOIN

-- Step 3: NOW run your Day 4 query
SELECT 
    s.city,
    COUNT(DISTINCT s.name) AS total_students,
    COUNT(f.name) AS paying_students,
    COALESCE(SUM(f.amount_paid), 0) AS total_revenue,
    ROUND(COALESCE(AVG(f.amount_paid), 0), 2) AS avg_fee_per_student,
    ROUND(
        (COUNT(f.name) * 100.0 / COUNT(DISTINCT s.name)), 1
    ) AS payment_rate_percent
FROM students s
LEFT JOIN fees f ON s.name = f.name
GROUP BY s.city
HAVING total_revenue > 0
ORDER BY total_revenue DESC;
