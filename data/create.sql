CREATE DATABASE `univeristy_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

-- Create Degrees Table
CREATE TABLE Degrees (
    DegreeCode VARCHAR(10) PRIMARY KEY,
    DegreeName VARCHAR(100) NOT NULL
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DegreeCode VARCHAR(10),
    FOREIGN KEY (DegreeCode) REFERENCES Degrees(DegreeCode)
);

-- Create Tutors Table
CREATE TABLE Tutors (
    TutorID INT AUTO_INCREMENT PRIMARY KEY,
    TutorName VARCHAR(100) NOT NULL
);

-- Create Students Table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(100) NOT NULL,
    StudentPassword VARCHAR(100) NOT NULL
);

-- Create Allocation Table
CREATE TABLE Allocation (
    AllocationID INT AUTO_INCREMENT PRIMARY KEY,
    DegreeCode VARCHAR(10),
    CourseID INT,
    TutorID INT,
    StudentID INT,
    FOREIGN KEY (DegreeCode) REFERENCES Degrees(DegreeCode),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);


-- Creating the Marks table
CREATE TABLE Marks (
    MarkID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Creating the Classroom table
CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY,
    ClassroomName VARCHAR(100),
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
