with Job_skills as (
SELECT j.skill_id,count(j.job_id) as Job_associated
from skills_job_dim j
INNER JOIN job_postings_fact f
on j.job_id=f.job_id
where job_work_from_home=True 
and job_title_short='Data Analyst' 
group by j.skill_id)
select d.skill_id , d.skills,h.Job_associated
from skills_dim d
INNER JOIN Job_skills h
on h.skill_id=d.skill_id
limit 5;