--Create three tables
-- Jan 2023 jobs
-- Feb 2023 jobs
-- March 2023 jobs

SELECT * 
FROM job_postings_fact
LIMIT 10;

--GET values that only have january
SELECT * 
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
LIMIT 10;

-- use a CREATE TABLE statement to create table
CREATE TABLE january_jobs AS
    SELECT * 
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;
    
-- February jobs table
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--March jobs table
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;