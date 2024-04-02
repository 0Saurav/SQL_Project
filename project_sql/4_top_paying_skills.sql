
/*
Question:   What are the top skills based on salary
    -Look at the average salary asscociated with each skill for Data Scientist positions
    -Focuses on roles with specified salaries, regardless of location
    -Why? It reveals how different skills impact salary levels for Data Scientist and
        helps identify most financially rewarding skills to acquire or improve
*/


SELECT
    skills,
    round(AVG(salary_year_avg),0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25;
