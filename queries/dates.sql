-- REMOVE Time from date using casting
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;
ORDER BY 
    title
LIMIT 50;

-- 

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;
ORDER BY 
    title
LIMIT 50;

-- Changing time zones 
-- documentation postgresql.org/docs/7.2/timezones.html
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT 5;

-- Extracting month from job_posting_date
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM
    job_postings_fact
LIMIT 5;

--Counting jobs posted in various months
SELECT  
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
job_postings_fact
GROUP BY
    month

--Counting DATA ANALYST jobs posted in various months and order them by count
SELECT 
    COUNT(job_id) AS job_posted_count, 
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY month
ORDER BY job_posted_count DESC;
 -- RESELTS show that jobs are usually posted more on JAN,FEB and MARCH later in the year (NOV and DEC) are lower on the list