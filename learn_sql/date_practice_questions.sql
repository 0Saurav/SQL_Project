/* 1. write a query to find both average salary both yearly and
hourly for job postings that were posted after June 1, 2023.
Group the result by job schedule type */


SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS average_yearly_salary,
    AVG(salary_hour_avg) AS average_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date >='2023-06-01'
group by
    job_schedule_type;


/* 2. Write a query to count the number of job postings for each month in 2023,
adjusting the job_posted_date to be in 'America/nY' time zone before
extracting the month. assume the job_posted_date is stored in UTC.
   group by order by month  */

SELECT
    COUNT(job_posted_date) AS number_of_jobs_posted,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-01-01'
GROUP BY
    month
ORDER BY
    month;



/*3. Write a query to find companies (include company name) that have posted jobs
offering health insurance, where these postings were made in the second quarter
 of 2023. Use date extraction to filter by quarter */

SELECT
    job_health_insurance,
    job_postings_fact.company_id,
    company.name,
    EXTRACT(quarter FROM job_posted_date) AS quarter
FROM job_postings_fact
LEFT JOIN company_dim AS company ON job_postings_fact.company_id = company.company_id
WHERE
    EXTRACT(quarter FROM job_posted_date) = 2 AND
    (job_posted_date > '2023-04-01' AND job_posted_date < '2023-07-01')
    AND job_health_insurance = TRUE;



