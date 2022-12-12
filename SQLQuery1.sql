use Education;
--select * from subject;//1

--select * from institute;//2

select DISTINCT stipendia from student;

select DISTINCT course from student; 

select family,name,last_name,birthday from student ORDER BY family;
select family,name,last_name,birthday from student ORDER BY name;
select family,name,last_name,birthday from student ORDER BY last_name;
--select family,name,last_name,birthday from student ORDER BY birthday;

--select family,course,birthday from student ORDER BY course DESC; 
--select family,course,birthday from student ORDER BY birthday ASC; 

select  inst_id,family,name,last_name from lecturer;

select *from student  WHERE stipendia>0 ORDER BY family;

select *from student  WHERE course=1 ORDER BY family ASC; 
select *from student WHERE course>1 and course<4; 

select *from student WHERE NOT course=1 and NOT course=3;
-- WHERE  course!=1 and course!=3; //11.2

select DISTINCT subj_name,subj_id,mark from subject,exam WHERE mark=5; 

select DISTINCT subj_name,hour,mark from subject,knowledge,exam,nagruzka WHERE (subject.subj_id=knowledge.subj_id AND knowledge.kvant_id = nagruzka.kvant_id AND nagruzka.nagr_id = exam.nagr_id) AND mark=2;

select DISTINCT town_name,family,mark 
from town,student,exam,subject,parents,knowledge,nagruzka 
WHERE (student.student_id = parents.parent_id AND town.town_id = parents.town_id)
and town_name = 'Березовский'and student.student_id = exam.student_id and mark > 2 and exam.nagr_id = nagruzka.nagr_id and nagruzka.kvant_id = knowledge .kvant_id and knowledge.subj_id = subject.subj_id and subject.subj_id =1;

select DISTINCT family,mark,subj_name from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE mark>2 
ORDER BY family ASC , mark DESC , subj_name ASC ;

select DISTINCT family,mark,subj_name from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
and subject.subj_id = 1
WHERE mark=2 
ORDER BY family ASC;

select DISTINCT family,town_name from student
join medalist on student.student_id = medalist.student_id
join parents on parents.student_id = student.student_id
join town on town.town_id = parents.town_id 
join eduinst on eduinst.eduinst_id = parents.eduinst_id
join medali on medalist.medal_id = medali.medal_id
WHERE name_medal = 'золотая'
ORDER BY family ASC;

select DISTINCT family,subj_name,exam_date from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
and subject.subj_id = 1
WHERE mark=2 
ORDER BY family ASC, subj_name ASC;

select DISTINCT family,mark,exam_date,subj_name from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
WHERE mark=2 and (exam_date='2019.05.24' or exam_date = '2019.06.13');

select DISTINCT student.family,mark,subj_name,lecturer.family,inst_name,knowledge.hour from student
join exam on exam.student_id = student.student_id
join nagruzka on nagruzka.nagr_id = exam.nagr_id
join knowledge on knowledge.kvant_id = nagruzka.kvant_id
join subject on subject.subj_id = knowledge.subj_id
join lecturer on lecturer.lect_id = nagruzka.lect_id
join institute on institute.inst_id = lecturer.inst_id
WHERE mark=2 and knowledge.hour>100

--select DISTINCT student.family,mark,subj_name,lecturer.family,inst_name,knowledge.hour from student
--join exam on exam.student_id = student.student_id
--join nagruzka on nagruzka.nagr_id = exam.nagr_id
--join knowledge on knowledge.kvant_id = nagruzka.kvant_id
--join subject on subject.subj_id = knowledge.subj_id
--join lecturer on lecturer.lect_id = nagruzka.lect_id
--jo
--WHERE mark=5 

--------------2
select distinct SIN(stipendia) as SinFromStipendia from student 

select distinct FLOOR(15.15) as Floor

select distinct CEILING(321.5) as Ceiling

select distinct EXP(stipendia) as ExpFromStipendia from student 

select distinct SQRT(stipendia) as SqrtFromStipendia from student where stipendia >0

select distinct ROUND(1342.315,2) as Round 

select distinct LOG(hour,2) as LogFromHour from knowledge 

select distinct LOG10(hour) as Log10FromHour from knowledge 

--------------3
select family+' '+name from student

select family, CHARINDEX('ева',family)  from student

select LEFT(family,3) from student

select REPLACE(family,'а','о') from student

select LTRIM ('  '+family) from student

select RTRIM (family+'  ') from student

select family+SPACE(5)+name from student

select SUBSTRING(family,1,5) from student

----
select CONCAT(family,LEFT(name,1),LEFT(last_name,1)) from student --3.1.1
where LEFT(family,1) = 'С'

select family + SPACE(1) + LEFT(name,1) + SPACE(1) + LEFT(last_name,1) from student --3.1.2
where LEFT(family,1) = 'С'

select family + ' ' + LEFT(name,1) + '.' + LEFT(last_name,1) from student --3.1.3
where LEFT(family,1) = 'С'

select subject.subj_name, CHARINDEX('т',subj_name) from subject --3.2

select SPACE(LEN(last_name))+lecturer.last_name+SPACE(LEN(last_name)) from lecturer --3.3

select REPLACE(subj_name, 'ик',' теслова') from subject --3.4

select subj_name, CHARINDEX('в',subj_name)from subject --3.5

----------4
select exam_date,DATEADD(YEAR,5,exam_date) from exam

select exam_date,DATENAME(day,exam_date),DATENAME(month,exam_date), DATENAME(WEEKDAY,exam_date) from exam
----------5
select DATEDIFF(year,'1996-05-03','1996-07-15') as YearDiff, DATEDIFF(MONTH,'1996-05-03','1996-07-15') as MonthDiff, DATEDIFF(DAY,'1996-05-03','1996-07-15') as DayDiff
----------6
select POWER(4,2)
select POWER(stipendia,course) from student where stipendia > 0
select POWER(mark,2) from exam



