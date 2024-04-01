

SELECT
    company_id,
    name as company_name
FROM company_dim
WHERE company_id IN (
SELECT
    company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = true
ORDER BY
    company_id
)



