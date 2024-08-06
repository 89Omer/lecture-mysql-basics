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

--- CALL UpdateStudentStatus();

-- Student Login

DELIMITER $$

CREATE PROCEDURE StudentLogin (
    IN p_Username VARCHAR(100),
    IN p_Password VARCHAR(100)
)
BEGIN
    DECLARE v_StudentID INT;
    DECLARE v_StudentName VARCHAR(100);

    -- Handler for any SQL exception
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- If there is an exception, rollback the transaction
        ROLLBACK;
        SELECT 'Login Failed' AS Status;
    END;

    -- Start the transaction
    START TRANSACTION;

    -- Try to find the student with the given username and password
    SELECT StudentID, StudentName
    INTO v_StudentID, v_StudentName
    FROM Students
    WHERE StudentName = p_Username AND StudentPassword = p_Password;
    -- Use Binary for exact matching
    -- WHERE BINARY StudentName = p_Username AND BINARY StudentPassword = p_Password;


    IF v_StudentID IS NOT NULL THEN
        -- If login is successful, commit the transaction
        COMMIT;
        SELECT 'Login Successful' AS Status, v_StudentID AS StudentID, v_StudentName AS StudentName;
    ELSE
        -- If login fails, rollback the transaction
        ROLLBACK;
        SELECT 'Login Failed' AS Status;
    END IF;
END$$

DELIMITER ;

--How to call this method CALL StudentLogin('alex_smith', 'password789');


