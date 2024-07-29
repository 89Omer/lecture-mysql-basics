--Find the students with highest number of marks in each course
SELECT s.StudentName, c.CourseName, m.Marks
FROM Students s
JOIN Marks m ON s.StudentID = m.StudentID
JOIN Courses c ON m.CourseID = c.CourseID
WHERE m.Marks = (
    SELECT MAX(m2.Marks)
    FROM Marks m2
    WHERE m2.CourseID = m.CourseID
);


-- List Tutors teaching more than one subject
SELECT t.TutorName
FROM Tutors t
WHERE t.TutorID IN (
    SELECT a.TutorID
    FROM Allocation a
    GROUP BY a.TutorID
    HAVING COUNT(a.CourseID) > 1
);

--List courses not being taught by anyone
SELECT c.CourseName
FROM Courses c
WHERE c.CourseID NOT IN (
    SELECT a.CourseID
    FROM Allocation a
);

--Find students not enrolled in any course
SELECT s.StudentName
FROM Students s
WHERE s.StudentID NOT IN (
    SELECT a.StudentID
    FROM Allocations a
);

