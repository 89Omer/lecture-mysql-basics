-- Inner Joins --
##Find how many allocations for degrees
select a.DegreeCode, deg.DegreeName, a.StudentID from allocation as a
inner join degrees as deg ON a.DegreeCode = deg.DegreeCode;

select a.DegreeCode, deg.DegreeName, count(a.StudentID) as TotalStudents from allocation as a
inner join degrees as deg ON a.DegreeCode = deg.DegreeCode
group by a.DegreeCode;


-- Left Joins --
#Find all students whether allocated or not allocated any course
select a.studentID, a.DegreeCode, a.CourseID, stud.StudentName from allocation as a
left join students as stud on a.StudentID = stud.StudentID;

select a.studentID, a.DegreeCode, a.CourseID, stud.StudentName from students as stud
left join allocation as a on stud.StudentID = a.StudentID;

##Find the course name for student = Charlie
Select s.StudentID, s.StudentName, c.CourseName from students as s
inner join allocation as a on s.StudentID = a.StudentID
Inner Join courses as c on a.CourseID = c.CourseID
where s.StudentName = 'Charlie';

##Find count of courses allocated for student = Charlie
Select count(a.AllocationID) as TotalSubjects, s.StudentName from students as s
inner join allocation as a on s.StudentID = a.StudentID
Inner Join courses as c on a.CourseID = c.CourseID
where s.StudentName = 'Charlie'
group by s.StudentName;

##Find me what subject a tutor is teaching
SELECT DISTINCT t.TutorID, t.TutorName, c.CourseID, c.CourseName
FROM Allocation a
INNER JOIN Tutors t ON a.TutorID = t.TutorID
INNER JOIN Courses c ON a.CourseID = c.CourseID
ORDER BY t.TutorID, c.CourseID;

-- Right Joins --
-- Determine the highest mark for each student
SELECT m.StudentID, MAX(m.Marks) AS HighestMarks
FROM Marks m
GROUP BY m.StudentID;

-- Use a RIGHT JOIN to include all students and their highest marks
-- COALESEC is used to replace the null values with 0
SELECT s.StudentName, COALESCE(m.HighestMarks, 0) AS HighestMarks
FROM Students s
RIGHT JOIN (
    SELECT m.StudentID, MAX(m.Marks) AS HighestMarks
    FROM Marks m
    GROUP BY m.StudentID
) AS m ON s.StudentID = m.StudentID
ORDER BY s.StudentName;

SELECT s.StudentName, COALESCE(MAX(m.Marks), 0) AS HighestMarks
FROM Students s
LEFT JOIN Marks m ON s.StudentID = m.StudentID
GROUP BY s.StudentID, s.StudentName
ORDER BY s.StudentName;

-- Full OuterJoin --
--MySQL does not support a direct FULL OUTER JOIN clause. 
--However, you can achieve the same effect using a combination of LEFT JOIN 
--and RIGHT JOIN with a UNION.
SELECT Students.StudentID, Students.StudentName, Marks.Marks
FROM Students
LEFT JOIN Marks ON Students.StudentID = Marks.StudentID

UNION

SELECT Marks.StudentID, Students.StudentName, Marks.Marks
FROM Marks
LEFT JOIN Students ON Students.StudentID = Marks.StudentID;





