# 1.Query the existence of 1 course
select * from course where id = 1

# 2.Query the presence of both 1 and 2 courses
select * from course where id = 1 or id = 2

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select b.studentId, name, avg(score) as average_score
from student as a, student_course as b
where a.id = b.studentId
group by b.studentId
having  average_score >= 60
或
select b.studentId, name, avg(score) as average_score
from student as a join student_course as b on a.id = b.studentId
group by b.studentId
having  average_score >= 60

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select *
from student
where id not in (
	select a.id
	from student as a join student_course as b on a.id = b.studentId
)

# 5.Query all SQL with grades
select a.id, name, age, sex
from student as a join student_course as b on a.id = b.studentId
group by a.id

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select *
from student as a join student_course as b on a.id = b.studentId
where a.id in (
	select studentId from student_course 
	where courseId =  1) 
	and a.id in (
	select studentId from student_course 
	where courseId =  2) 

# 7.Retrieve 1 student score with less than 60 scores in descending order
select *
from student as a join student_course as b on a.id = b.studentId
where courseId = 1 and score < 60
order by score desc

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select a.id, name, avg(score) as average_score
from course as a join student_course as b on a.id = b.courseId
group by a.id
order by average_score desc, a.id asc

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select a.name, score
from student as a ,student_course as b, course as c
where a.id = b.studentId and b.courseId = c.id
	and c.name = 'Math' and score < 60