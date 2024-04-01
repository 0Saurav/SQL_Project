-- January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE
    EXTRACT(month from job_posted_date) = 1;


-- February
CREATE TABLE february_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(month FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(month FROM job_posted_date) = 3;



SELECT job_posted_date from march_jobs;
