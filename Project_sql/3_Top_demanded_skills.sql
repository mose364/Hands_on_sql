with TOP_SKILLS AS(
select skill_id,count(job_id) from skills_job_dim
group by skill_id
limit 5)
SELECT S.*,skills FROM TOP_SKILLS S
INNER JOIN skills_dim D
ON S.skill_id=D.skill_id

