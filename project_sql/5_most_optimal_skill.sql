
/*
Question: What are the most optimal skills to learn (High in demand & high paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Scientist roles
- Concentrates on remote postions with specified salaries
- Why? Targetskills that offer job security (high demand) and financal benefits(high salaries)
    offering strategic onsights for career development in data science.
*/


WITH skills_demand AS (
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skill_id
), average_salary AS (
    SELECT
    skills_job_dim.skill_id,
    round(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY
    skills_job_dim.skill_id
)

SELECT skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
skills_demand
inner join average_salary on skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count >10
ORDER BY
    average_salary DESC,
    demand_count DESC
limit 25




-- rewriting the query more concisely:

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    count(skills_job_dim.job_id) AS demand_count,
    round(AVG(salary_year_avg),0) AS average_salary
FROM
    job_postings_fact
INNER join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
Having
    count(skills_job_dim.job_id) >10
ORDER BY
    average_salary DESC,
    demand_count DESC
limit 25;
