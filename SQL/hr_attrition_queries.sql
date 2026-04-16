
-- ================================================
-- HR Analytics — Employee Attrition SQL Queries
-- Author: Parshwa Shah
-- Dataset: IBM HR Analytics Employee Attrition
-- ================================================

-- Query 1: Attrition by Department
SELECT
    Department,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Binary)                           AS employees_left,
    ROUND(SUM(Attrition_Binary)*100.0/COUNT(*),2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 2)                    AS avg_monthly_income
FROM employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- Query 2: Attrition by Job Role
SELECT
    JobRole,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Binary)                           AS employees_left,
    ROUND(SUM(Attrition_Binary)*100.0/COUNT(*),2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 2)                    AS avg_income
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- Query 3: Attrition by Salary Band
SELECT
    SalaryBand,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Binary)                           AS employees_left,
    ROUND(SUM(Attrition_Binary)*100.0/COUNT(*),2)  AS attrition_rate_pct
FROM employees
GROUP BY SalaryBand
ORDER BY attrition_rate_pct DESC;

-- Query 4: Satisfaction Scores — Left vs Stayed
SELECT
    Attrition,
    ROUND(AVG(JobSatisfaction), 2)         AS avg_job_satisfaction,
    ROUND(AVG(EnvironmentSatisfaction), 2) AS avg_env_satisfaction,
    ROUND(AVG(WorkLifeBalance), 2)         AS avg_work_life_balance,
    ROUND(AVG(MonthlyIncome), 2)           AS avg_monthly_income,
    COUNT(*)                               AS employee_count
FROM employees
GROUP BY Attrition;

-- Query 5: Attrition by Tenure Band
SELECT
    TenureBand,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Binary)                           AS employees_left,
    ROUND(SUM(Attrition_Binary)*100.0/COUNT(*),2)  AS attrition_rate_pct
FROM employees
GROUP BY TenureBand
ORDER BY attrition_rate_pct DESC;

-- Query 6: Overtime vs Attrition
SELECT
    OverTime,
    COUNT(*)                                        AS total_employees,
    SUM(Attrition_Binary)                           AS employees_left,
    ROUND(SUM(Attrition_Binary)*100.0/COUNT(*),2)  AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 2)                    AS avg_income
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;
