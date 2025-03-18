with Job_postings as(
select count(job_id) Number_of_job_posted
,company_id from job_postings_fact
group by company_id)

select d.name,j.Number_of_job_posted from company_dim d
LEFT JOIN Job_postings  j
on d.company_id=j.company_id
order by j.Number_of_job_posted DESC