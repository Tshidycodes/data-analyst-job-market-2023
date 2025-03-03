--reclasify where a job is located
SELECT
    job_title_short,
    job_location
FROM job_postings_fact
LIMIT 20;

/*
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' Jobs as 'Local'
-Otherwise 'Onsite'
*/

SELECT
    job_title_short,
    job_location,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
ELSE 'Onsite'
END AS location_category
FROM job_postings_fact
LIMIT 20;

-- Use FROUP BY to aggregate values for various location categories
SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
ELSE 'Onsite'
END AS location_category
FROM job_postings_fact
GROUP BY location_category;

-- Number of job analyst roles in each category
SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
ELSE 'Onsite'
END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;