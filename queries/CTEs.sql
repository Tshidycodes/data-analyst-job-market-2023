-- COMMON TABLE EXPRESSION
-- a temporary result set that you can reference within a SELECT, INSERT, UPDATE or DELETE statement
-- exists only during the execution of a query
-- its a defined query that can be referenced in the main query or other CTES
-- WITH - used to define CTE at the beginning of a query

/*
FInd the companies that have the most job openings
    - 1. Get the total number of job postings per company id (job_posting_fact)
    -Return the total number of jobs with the company name (company_dim)
*/
-- first calculation
SELECT 
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY company_id
LIMIT 20;

--second calculation
WITH company_job_count AS (
SELECT 
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY company_id 
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC
LIMIT 10;