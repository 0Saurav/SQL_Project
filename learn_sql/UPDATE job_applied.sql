INSERT INTO skills_job_dim (job_id, job_id, skill_id, skill_id)
VALUES (
    job_id:integer,
    job_id:integer,
    skill_id:integer,
    skill_id:integer
  );UPDATE job_applied
SET contact = 'Lionel Messi'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Cristiano Ronaldo'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Neymar Jr'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Kylian Mbappé'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Di Maria'
WHERE job_id = 5;

SELECT * FROM job_applied;
