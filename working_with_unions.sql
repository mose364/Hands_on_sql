
SELECT Quoter1.job_title_short,
Quoter1.job_location,Quoter1.salary_year_avg,
Quoter1.job_posted_date::Date from(

select * from jan_2023_jobs
union ALL
select * FROM feb_2023_jobs
UNION ALL
select * FROM march_2023_jobs)
as Quoter1
where Quoter1.salary_year_avg>70000 AND
Quoter1.job_title_short ='Data Analyst'
order by Quoter1.salary_year_avg DESC