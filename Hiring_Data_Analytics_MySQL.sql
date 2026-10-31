create database hiring_data;
drop database hiring_data;
use hiring_data;

select * from candidates;

alter table candidates
modify interview_taken_on date;

-- How many candidates fall into each tier, and what is the average salary within each tier?

SELECT 
    CASE 
        WHEN offered_salary < 30000 THEN 'Tier 1 (< 30k)'
        WHEN offered_salary BETWEEN 30000 AND 60000 THEN 'Tier 2 (30k - 60k)'
        ELSE 'Tier 3 (> 60k)'
    END AS salary_tier,
    COUNT(*) AS total_candidates,
    ROUND(AVG(offered_salary), 2) AS avg_salary
FROM candidates
GROUP BY salary_tier
ORDER BY avg_salary ASC;

-- Which departments have an average offered salary strictly greater than the overall company-wide average offered salary?

SELECT 
    department,
    ROUND(AVG(offered_salary), 2) AS dept_avg_salary
FROM candidates
GROUP BY department
HAVING AVG(offered_salary) > (
    SELECT AVG(offered_salary) 
    FROM candidates
)
ORDER BY dept_avg_salary DESC;

-- For candidates who were successfully Hired, what is the total annualized financial commitment (SUM) and head count for each department?

SELECT 
    department,
    COUNT(*) AS hired_count,
    ROUND(SUM(offered_salary), 2) AS total_payroll_expense,
    ROUND(AVG(offered_salary), 2) AS avg_hired_salary
FROM candidates
WHERE status = 'Hired'
GROUP BY department
ORDER BY total_payroll_expense DESC;

-- Which top 5 job post designations (post_name) brought in the highest number of hired candidates?

SELECT 
    post_name,
    COUNT(*) AS hired_count,
    ROUND(AVG(offered_salary), 2) AS avg_offered_salary
FROM candidates
WHERE status = 'Hired'
GROUP BY post_name
ORDER BY hired_count DESC
LIMIT 5;


-- On which days of the week were the most interviews scheduled, and how does candidate throughput compare between weekdays and weekends?

SELECT 
    DAYNAME(interview_taken_on) AS day_of_week,
    COUNT(*) AS total_interviews,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM candidates), 2) AS pct_of_total_interviews
FROM candidates
GROUP BY DAYNAME(interview_taken_on)
order by pct_of_total_interviews ;


-- How many candidates offered between 40,000 and 60,000 were marked as 'Rejected' and 'hired', grouped by department?

with cte as (select * from (SELECT 
    department ,
    COUNT(*) AS rejected_mid_tier_count
FROM candidates
WHERE status = 'Rejected' 
  AND offered_salary BETWEEN 40000 AND 60000
GROUP BY department) t
join
(SELECT 
    department as dpt,
    COUNT(*) AS hired_mid_tier_count
FROM candidates
WHERE status = 'hired' 
  AND offered_salary BETWEEN 40000 AND 60000
GROUP BY department) k
on t.department=k.dpt)
select department,rejected_mid_tier_count,hired_mid_tier_count
from cte;