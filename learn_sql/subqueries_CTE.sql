
--Sub Queries

SELECT *
FROM (  -- subquery starts here
    SELECT *
FROM job_postings_fact
WHERE EXTRACT(month FROM job_posted_date) = 1
)    -- ends here
AS january_jobs;


-- Common Table Expressions (CTEs)

WITH january_jobs AS (  -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    where EXTRACT(MONTH FROM job_posted_date) = 1
    ) -- ends here

    SELECT *
    FROM january_jobs;
