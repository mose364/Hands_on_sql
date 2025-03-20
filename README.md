# Introduction
After exploring data related to the job market, 
my curiosity led me to delve deeper into various data analysis roles.
This project aims to identify the top-paying jobs, the most in-demand skills, 
and the intersections where these skills are not only highly sought after but also offer competitive salaries, 
job security, and financial stability. Below is the SQL query used to analyze this data.[Project_sql folder](/Project_sql/)


# Background
As an aspiring data analyst, my journey to effectively navigate the field has driven me to dedicate time to this project, where I aim to uncover valuable insights into the job market. This project focuses on identifying the top-paying jobs and the specific skills that are in high demand. The data used in this analysis comes from (https://www.lukebarousse.com/sql), and it provides detailed insights into various job titles, salaries, job locations, and essential skills.

In this project, we will address five key questions:

1.What are the top-paying data analyst jobs?                                            
2.What skills are required for these top-paying roles?                                        
3.What skills are most in demand for data analysts?                                    
4.Which skills are associated with higher salaries?                                      
5.What are the most optimal skills to learn for career growth?
# Tools Used
For deep analysis in this project, I utilized the power of several tools like SQL, PostgreSQL, Visual Studio Code, Git, and GitHub. Below is an overview of each tool, along with its advantages and disadvantages:

1. **SQL (Structured Query Language)**
Description: SQL is a standard programming language used to manage and manipulate relational databases. It enabled me  to query, update, and manage databases efficiently.
2. **PostgreSQL**
Description: PostgreSQL is an open-source relational database management system (RDBMS) that uses and extends the SQL language. It's known for its reliability, feature set, and extensibility.

3. **Visual Studio Code (VSCode)**
Description: Visual Studio Code is a lightweight, open-source code editor developed by Microsoft. It supports many programming languages and has rich extensions for various development needs.

4. **Git**: Git is a distributed version control system that allows developers to track changes to code, collaborate efficiently, and manage project history.

5. **GitHub** :GitHub is a cloud-based platform for hosting and managing Git repositories. It provides collaboration features such as pull requests, issue tracking, and project management tools.
# The analysis
- Each query in this project was designed to examine a distinct aspect of the data analysis job market. The approach taken for addressing each question is outlined as follows
## 1.What are the top-paying data analyst jobs?
- To identify the highest-paying roles, I combined two tables the job posting fact table and the company dim table using a left join on their common column, the company id. I then filtered the relevant columns: job_id, name, job_title, job_location, job_schedule_type, and salary_year_avg. The results were ordered by salary_year_avg, and I limited the output to the top five highest-paying roles
 ```sql
select 
job_id,name,
job_title,
job_location,
job_schedule_type,
salary_year_avg,
job_posted_date
from job_postings_fact C
left JOIN company_dim v
on C.company_id=v.company_id
where salary_year_avg is not null 
and job_title_short='Data Analyst'
order by salary_year_avg DESC
limit 5;
```

## 2.What skills are required for these top-paying roles?   
- To identify the top-paying skills, I combined the company dim table and the job_posting fact table using an inner join. I selected the relevant columns: company name, job_id, job_title, and salary_year_avg. I then filtered the data using a WHERE clause to exclude rows where salary_year_avg is null and to focus on job titles with the abbreviation 'Data Analyst'. The results were ordered by salary_year_avg, and I limited the output to the top 10 entries. This query was encapsulated within a Common Table Expression (CTE) named 'Top Paying Jobs'. I then joined this CTE with the skill_job_dim table using the common column, job_id, to retrieve the specific skill names associated with each job.
``` sql
with Top_paying_jobs as (
SELECT C.name Company_Name,job_id,job_title
,
salary_year_avg from job_postings_fact F
JOIN company_dim C
ON F.company_id=C.company_id
where salary_year_avg is not null and 
job_title_short='Data Analyst'
order by salary_year_avg DESC
limit 10 )
select T.*,skills from Top_paying_jobs T
inner JOIN skills_job_dim s
on T.job_id=s.job_id
inner join skills_dim d
on s.skill_id=d.skill_id;
```
## 3.What skills are most in demand for data analysts?
- To determine the most highly demanded skills for Data Analyst roles, I selected the skill_id column and counted the number of job postings requiring each skill from the skill_job table. I then grouped the results by skill_id and limited the display to the top five most in-demand skills. This query was encapsulated within a Common Table Expression (CTE) named 'Top Skills'. Subsequently, I joined the CTE with the skill dim table to retrieve the skill names corresponding to each skill_id in the CTE.

``` sql
with TOP_SKILLS AS(
select skill_id,count(job_id) from skills_job_dim
group by skill_id
limit 5)
SELECT S.*,skills FROM TOP_SKILLS S
INNER JOIN skills_dim D
ON S.skill_id=D.skill_id;
```

# What I have learned
