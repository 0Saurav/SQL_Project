SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact;


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
    LIMIT 5;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(DAY FROM job_posted_date) AS day
FROM
    job_postings_fact
    LIMIT 5;


SELECT
    COUNT(job_id) as job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
    WHERE
        job_title_short = 'Data Analyst'
        GROUP BY
        month
    order BY
        job_count DESC;
