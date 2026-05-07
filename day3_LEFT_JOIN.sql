-- Day 3/30: LEFT JOIN + NULL Handling for Churn Detection
-- Business Problem: Find ALL students including those who never paid fees
-- Denmark Use Case: SaaS churn reports, customer payment tracking

USE school;

-- Main Query: Show all students with payment status
SELECT 
    s.name,
    s.city,
    s.marks,
    COALESCE(f.amount_paid, 0) AS amount_paid,
    COALESCE(f.fee_month, 'No Record') AS fee_month,
    CASE 
        WHEN f.amount_paid IS NULL THEN 'Never Paid'
        WHEN f.amount_paid < 5000 THEN 'Partial Payment'
        ELSE 'Paid Full'
    END AS payment_status
FROM students s 
LEFT JOIN fees f ON s.name = f.name
ORDER BY 
    CASE WHEN f.amount_paid IS NULL THEN 0 ELSE f.amount_paid END ASC;

-- Business Insight Query: Count churned students
SELECT 
    COUNT(*) AS total_students,
    SUM(CASE WHEN f.amount_paid IS NULL THEN 1 ELSE 0 END) AS never_paid_count,
    SUM(CASE WHEN f.amount_paid IS NULL THEN 0 ELSE f.amount_paid END) AS total_revenue_collected
FROM students s 
LEFT JOIN fees f ON s.name = f.name;
