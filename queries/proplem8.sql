/*
Find job postings from the first quarter that have a salary freater than $70K
-Combine job posting tables from the first quarter of 2023 (JAN - MARCH)
-Gets job posting tables with an average yearly salary >$70000
*/

WITH first_quarter_jobs AS (
SELECT *
FROM january_jobs
UNION ALL
SELECT * 
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs
)
 SELECT  
    first_quarter_jobs.job_title_short,
    first_quarter_jobs.job_location,
    first_quarter_jobs.job_via,
    first_quarter_jobs.job_posted_date::DATE
 FROM first_quarter_jobs
 WHERE first_quarter_jobs.salary_year_avg > 70000
 LIMIT 6;

 -- Filter for Data Analyst jobs
 WITH first_quarter_jobs AS (
SELECT *
FROM january_jobs
UNION ALL
SELECT * 
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs
)
 SELECT  
    first_quarter_jobs.job_title_short,
    first_quarter_jobs.job_location,
    first_quarter_jobs.job_via,
    first_quarter_jobs.job_posted_date::DATE,
    first_quarter_jobs.salary_year_avg
 FROM first_quarter_jobs
 WHERE first_quarter_jobs.salary_year_avg > 70000 AND 
    first_quarter_jobs.job_title_short = 'Data Analyst'
ORDER BY 
    first_quarter_jobs.salary_year_avg DESC
 LIMIT 6;