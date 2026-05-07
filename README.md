# SQL Portfolio for Remote Data Analyst Roles 🇮🇳

Target: ₹40k+/month remote jobs | Location: India > Global

## Day 2: Student Fee Management System
Skills Demonstrated: MySQL, INNER JOIN, WHERE, ORDER BY, Relational Database Design

Business Problem Solved: 
Connected student academic data with payment records to enable financial reporting.

Key Queries:
1. Complete Financial Report: JOIN students + fees tables for full payment status
2. Fee Defaulter Analysis: WHERE clause to identify students who paid < ₹5000  
3. Top Performer Tracking: ORDER BY + LIMIT to find highest scorer + payment status

Files in This Project:
* day2_student_fees.sql - All queries with business context comments
* Day2_JOIN_Basic.png - Live result: Complete student + fee data
* Day2_JOIN_Filter.png - Live result: Fee defaulters under ₹5000
* Day2_JOIN_TopStudent.png - Live result: Top scorer with payment info

## Next Up
Day 3: LEFT JOIN + Handling Missing Data | NULL values

---
*Built with MySQL Workbench | Documented for remote job applications*
--------------------------------------------------------------------------
--------------------------------------------------------------------------
## Day 3: LEFT JOIN + NULL Handling - Churn Detection

Business Problem: Find ALL students including those who never paid fees

SQL Skills: LEFT JOIN, COALESCE, CASE WHEN for NULL handling

Denmark/EU Use Case: Monthly SaaS churn reports, customer payment tracking

### Result Screenshot
![Day 3 LEFT JOIN Result](./day3_LEFT_JOIN_part1.png,/day3_LEFT_JOIN_part2.png)

Business Impact: Identified 2 students with ₹0 payment = ₹20,000 recovery opportunity

Data Note: Handled duplicate student names with different marks/cities - real-world dirty data scenario

Files: day3_LEFT_JOIN.sql

---

## LinkedIn Progress
Day 2: 44 impressions, 63% IT Services, 1 profile view  

Next: Day 4 - GROUP BY + HAVING for city-wise revenue dashboards
