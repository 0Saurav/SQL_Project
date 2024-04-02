
# Introduction
Dive into the data job market! Focusing on data scientist roles, this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data science.

 SQL Queries? Check them out here: [project_sql_folder](/project_sql/)

# Background

Driven by a quest to navigatethe data science job market more effectively, this project was born from a desire POV to find out top-paid and in-demand skills, streaming others work to find optimal jobs.

Data hails from Luke Barousse's course [SQL Course](/https://lukebarousse.com/sql). It is full of insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to be answered through my SQL queries were:
1. What are the top-paying data scientist jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in-demand for data scientist?
4. Which skills are associated with higher pay?
5. What are the most optimal skills to learn?
# Tools I Used
For my deep dive into the data scientist job market, I harnessed the power of several kep tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and discover critical insights.
- **PostgreSQL**: The chosen databse management system, ideal for handling the job posting data.
- **VS Code**: My go-to for database management system and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
Each query for this project aimed at investigating specific aspects of the data scientist job market. Here's how I approached each question:

### 1. Top Paying Data Scientist Jobs
and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.

``` sql
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
    LIMIT 10;
```

### 2. Top paying Data Scientist skills
``` sql
WITH top_paying_jobs AS (
SELECT
    job_id,
    name AS company_name,
    job_title,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Scientist' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs

INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id

ORDER BY
    salary_year_avg DESC
    LIMIT 10;
```
### 3. Most in-demand skills for data scientist

``` sql
SELECT
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Scientist' AND
    job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
    LIMIT 5;
```

### 4. Top paying skills for Data Scientist

``` sql
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
```
### 5. Most Optimal Skills to learn for Data Scientist

``` sql
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
```

# What I Learned
Throughout this adventure, I've learned SQL for Data Analytics.

- ***Data Retrieval***:

SELECT: Retrieves data from one or more tables.
FROM: Specifies the table(s) from which to retrieve data.
WHERE: Filters rows based on specified conditions.
ORDER BY: Sorts the result set based on specified columns.
LIMIT: Limits the number of rows returned in the result set.

- ****Data Manipulation****:

INSERT INTO: Adds new rows into a table.
UPDATE: Modifies existing rows in a table.
DELETE: Removes rows from a table.
TRUNCATE: Removes all rows from a table.

- ***Data Definition***:

CREATE TABLE: Defines a new table structure.
ALTER TABLE: Modifies an existing table structure.
DROP TABLE: Deletes an existing table.

- ***Constraints***:

PRIMARY KEY: Ensures uniqueness of a column or a combination of columns.
FOREIGN KEY: Establishes a link between two tables.
NOT NULL: Ensures that a column cannot contain NULL values.
UNIQUE: Ensures that all values in a column are unique.

- ***Joins***:

INNER JOIN: Returns rows when there is a match in both tables.
LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table, and the matched rows from the right table.
RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table, and the matched rows from the left table.
FULL JOIN (or FULL OUTER JOIN): Returns all rows when there is a match in one of the tables.

- ***Aggregate Functions***:

Functions like SUM, AVG, COUNT, MIN, MAX to perform calculations on a set of values.

- ***Sub Queries and CTEs, Union Operators, Case Expression etc.***

# Conclusions

Working on this project has been immensely beneficial for enhancing my SQL skills. Through querying and analyzing data, I gained valuable insights into various aspects of top-paying jobs in the data science field. By examining the salaries, required skills, and job locations, I developed a deeper understanding of the industry landscape.

This project enabled me to identify the skills that are most sought-after in high-paying data science roles, as well as uncovering the correlation between specific skills and salary levels. Additionally, I gained insights into the in-demand skills within the data science domain and identified the optimal skills to focus on for professional growth as a data scientist.

Overall, this project has not only honed my SQL abilities but has also provided invaluable insights into the intricacies of the data science job market, empowering me to make informed decisions regarding skill development and career advancement in this field.
