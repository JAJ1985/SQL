Create PROCEDURE [2019OnTimeCompletion]
AS
select a.[description],
          b.trainee_id,
          b.launch_date,
          DATEADD(d,a.due_date,b.launch_date) as due_date,
          b.complete_date
from training_course a 
inner join training_data b on a.infocard_id = b.course_id
where 1 = 1
AND launch_date LIKE '%2019%'
--and  [description] ='JJ-10279 SOP - Document Management'
and b.training_id = (select max(b1.training_id)
                              from   training_data b1
                              where  b.trainee_id = b1.trainee_id
                              and    b.course_id = b1.course_id)
--and b.complete_date > DATEADD(d,a.due_date,b.launch_date)
order by 1,2

--------------------------------------------------------------------

CREATE PROCEDURE [2020OnTimeCompletion]
AS
select a.[description],
          b.trainee_id,
          b.launch_date,
          DATEADD(d,a.due_date,b.launch_date) as due_date,
          b.complete_date
from training_course a 
inner join training_data b on a.infocard_id = b.course_id
where 1 = 1
AND launch_date LIKE '%2020%'
--and  [description] ='JJ-10279 SOP - Document Management'
and b.training_id = (select max(b1.training_id)
                              from   training_data b1
                              where  b.trainee_id = b1.trainee_id
                              and    b.course_id = b1.course_id)
--and b.complete_date > DATEADD(d,a.due_date,b.launch_date)
order by 1,2