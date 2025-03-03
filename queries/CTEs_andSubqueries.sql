--Common Table Expressions (CTEs): define a temporary result set that you can reference
-- can reference within a SELECT, INSERT, UPDATE, or DELETE statement
-- DEFINED with WITH

WITH january_jobs AS (
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)
SELECT *
FROM january_jobs
LIMIT 10;