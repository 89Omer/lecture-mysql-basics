INSERT INTO Degrees (DegreeCode, DegreeName) VALUES
('CS', 'Computer Science'),
('EE', 'Electrical Engineering');

INSERT INTO Courses (CourseID, CourseName, DegreeCode) VALUES
(101, 'Introduction to Programming', 'CS'),
(102, 'Data Structures', 'CS'),
(103, 'Database Systems', 'CS'),
(201, 'Circuit Analysis', 'EE'),
(202, 'Digital Logic Design', 'EE');

INSERT INTO Tutors (TutorID, TutorName) VALUES
(1, 'Dr. Smith'),
(2, 'Prof. Johnson'),
(3, 'Dr. Lee'),
(4, 'Dr. Brown'),
(5, 'Prof. Davis');

INSERT INTO Students (StudentID, StudentName) VALUES
(1001, 'Alice'),
(1002, 'Bob'),
(1003, 'Charlie'),
(1004, 'Diana'),
(1005, 'Eve');

INSERT INTO Allocation (AllocationID, DegreeCode, CourseID, TutorID, StudentID) VALUES
(1, 'CS', 101, 1, 1001),
(2, 'CS', 101, 1, 1002),
(3, 'CS', 102, 2, 1003),
(4, 'CS', 102, 2, 1004),
(5, 'CS', 103, 3, 1005),
(6, 'CS', 103, 3, 1001),
(7, 'EE', 201, 4, 1002),
(8, 'EE', 201, 4, 1003),
(9, 'EE', 202, 5, 1004),
(10, 'EE', 202, 5, 1005),
(11, 'CS', 101, 1, 1003),
(12, 'CS', 102, 2, 1005),
(13, 'EE', 201, 4, 1001),
(14, 'EE', 202, 5, 1002),
(15, 'CS', 103, 3, 1004);


INSERT INTO Allocation (AllocationID, DegreeCode, CourseID, TutorID, StudentID) VALUES
(16, 'CS', 101, null, 1001);

-- Inserting sample data into Marks
INSERT INTO Marks (StudentID, CourseID, Marks) VALUES
(1, 101, 85),
(2, 101, 90),
(3, 102, 75),
(4, 103, 88),
(5, 201, 95);

-- Inserting sample data into Classroom
INSERT INTO Classroom (ClassroomID, ClassroomName, CourseID) VALUES
(1, 'Room 101', 101),
(2, 'Room 102', 102),
(3, 'Room 103', 103),
(4, 'Room 201', 201),
(5, 'Room 202', 202);