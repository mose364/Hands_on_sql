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
on s.skill_id=d.skill_id