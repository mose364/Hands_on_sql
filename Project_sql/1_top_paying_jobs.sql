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
limit 5