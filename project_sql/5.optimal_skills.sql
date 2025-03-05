/* What is the most optimal skills to learn
    - High demand and High Paying
    - Identify skills in high demand and associated with high average salaries for Data Analyst roles
    -Concentrate on remote positions with specialised salaries
    - Why? Targets skills that offer job security (High DEmand) and financial benefits (High salaries)
    - offering stratergic insights for career development in data analysis

*/
WITH skills_in_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = True 
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id, skills_dim.skills
), 
average_salary AS (
    SELECT
        skills_job_dim.skill_id, 
        skills_dim.skills,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id, skills_dim.skills
)

SELECT 
    skills_in_demand.skill_id,
    skills_in_demand.skills,
    demand_count,
    avg_salary
FROM skills_in_demand
INNER JOIN average_salary ON skills_in_demand.skill_id = average_salary.skill_id
WHERE demand_count > 10
ORDER BY avg_salary DESC, demand_count DESC
LIMIT 25;
