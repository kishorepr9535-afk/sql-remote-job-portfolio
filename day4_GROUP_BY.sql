-- Day 4/30: GROUP BY + HAVING - City Revenue Dashboard
-- Business Problem: Find top revenue cities + expansion opportunities
-- Denmark Use Case: Regional sales dashboards, market analysis

USE school;

-- Main Query: City-wise revenue + student analytics
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
HAVING total_revenue > 0  -- Only show cities that made money
ORDER BY total_revenue DESC;

-- Expansion Query: Small cities with high avg fees = growth targets
SELECT 
    s.city,
    COUNT(DISTINCT s.name) AS student_count,
    ROUND(AVG(f.amount_paid), 2) AS avg_fee
FROM students s
JOIN fees f ON s.name = f.name
GROUP BY s.city
HAVING COUNT(DISTINCT s.name) < 3 AND AVG(f.amount_paid) > 7000
ORDER BY avg_fee DESC;
