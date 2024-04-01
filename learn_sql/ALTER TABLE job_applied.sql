ALTER TABLE job_applied
ADD contact VARCHAR(50);

ALTER TABLE job_applied
RENAME COLUMN contact to contact_name;

ALTER TABLE job_applied
RENAME COLUMN application_sent_data to application_sent_date;


ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;


SELECT * FROM job_applied;
