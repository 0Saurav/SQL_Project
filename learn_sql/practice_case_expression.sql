SELECT
count(job_id) AS number_of_jobs,
    CASE
    WHEN salary_year_avg > 100000 THEN 'High'
    WHEN salary_year_avg >=50000 AND salary_year_avg< 100000 THEN 'Standard'
    WHEN salary_year_avg < 50000 THEN 'Low'
    ELSE 'Null'
    END AS salary_standards
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
    GROUP BY
    salary_standards
    ORDER BY number_of_jobs;

