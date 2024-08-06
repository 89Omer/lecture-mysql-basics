DELIMITER //

CREATE PROCEDURE UpdateStudentStatus()
BEGIN
    -- Update status to 'pass' for students with marks greater than 50
    UPDATE Students s
    JOIN Marks m ON s.StudentID = m.StudentID
    SET s.status = 'pass'
    WHERE m.Marks > 50;

    -- Update status to 'fail' for students with marks 50 or less
    UPDATE Students s
    JOIN Marks m ON s.StudentID = m.StudentID
    SET s.status = 'fail'
    WHERE m.Marks <= 50;
END //

DELIMITER ;
