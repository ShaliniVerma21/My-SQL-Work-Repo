-- Single Line Comments

/*
MultiLine
Comments
*/

## This is Also used to write single line comments

/*
Usage of Comments

1. Documentation: Comments can be used to document the purpose of a SQL query or the logic 
behind complex operations.
2.Debugging: You can temporarily disable parts of your SQL code by commenting them out, 
which is useful for debugging.
3. Collaboration: When working in teams, comments help communicate the intent and 
functionality of the code to other developers.
*/

-- ----------------------------------- Database Queries ---------------------------------

-- create a school database
create database MVM;

-- to work on this database we need to use it (to execute press ctrl+enter)
use MVM;

-- -----------------------------------------------------------------------------------------

-- ------------------------------------ Table Queries --------------------------------------
-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,   -- primary key = unique + not null
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    Email VARCHAR(100)
);

INSERT INTO Students (StudentID, Name, Age, Gender, Email) VALUES
(1, 'Aarav Sharma', 20, 'M', 'aarav.sharma@example.com'),
(2, 'Diya Patel', 22, 'F', 'diya.patel@example.com'),
(3, 'Rohan Verma', 19, 'M', 'rohan.verma@example.com'),
(4, 'Sneha Iyer', 21, 'F', 'sneha.iyer@example.com'),
(5, 'Vikram Singh', 23, 'M', 'vikram.singh@example.com');

select * from Students;

-- remove records
truncate table students;

-- delete complete table
drop table students;

-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    Name VARCHAR(100),
    Subject VARCHAR(50),
    Experience INT,
    Email VARCHAR(100)
);

INSERT INTO Teachers (TeacherID, Name, Subject, Experience, Email) VALUES
(1, 'Mr. Rajesh Kumar', 'Mathematics', 10, 'rajesh.kumar@example.com'),
(2, 'Ms. Anita Desai', 'Science', 8, 'anita.desai@example.com'),
(3, 'Mr. Sanjay Gupta', 'English', 12, 'sanjay.gupta@example.com'),
(4, 'Ms. Priya Sharma', 'History', 5, 'priya.sharma@example.com'),
(5, 'Mr. Rakesh Mehta', 'Geography', 15, 'rakesh.mehta@example.com');

-- Table 3: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(10),
    Section CHAR(1),
    TotalStudents INT,
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

INSERT INTO Classes (ClassID, ClassName, Section, TotalStudents, TeacherID) VALUES
(1, '10th', 'A', 30, 1),
(2, '9th', 'B', 25, 2),
(3, '11th', 'C', 20, 3),
(4, '8th', 'A', 28, 4),
(5, '12th', 'B', 22, 5);

-- Table 4: Subjects
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50),
    Credits INT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Subjects (SubjectID, SubjectName, Credits, ClassID) VALUES
(1, 'Mathematics', 4, 1),
(2, 'Science', 4, 2),
(3, 'English', 3, 3),
(4, 'History', 3, 4),
(5, 'Geography', 3, 5);

-- Table 5: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(50),
    Date DATE,
    TotalMarks INT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Exams (ExamID, ExamName, Date, TotalMarks, ClassID) VALUES
(1, 'Mid Term Exam', '2023-10-15', 100, 1),
(2, 'Final Exam', '2023-12-20', 100, 2),
(3, 'Unit Test', '2023-11-10', 50, 3),
(4, 'Quarterly Exam', '2023-09-25', 75, 4),
(5, 'Annual Exam', '2024-03-15', 100, 5);

-- Table 6: Attendance 
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    ClassID INT,
    Date DATE,
    Status ENUM('Present', 'Absent'),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Attendance (AttendanceID, StudentID, ClassID, Date, Status) VALUES
(1, 1, 1, '2023-10-01', 'Present'),
(2, 2, 2, '2023-10-01', 'Absent'),
(3, 3, 3, '2023-10-01', 'Present'),
(4, 4, 4, '2023-10-01', 'Present'),
(5, 5, 5, '2023-10-01', 'Absent');

-- Table 7: Grades
CREATE TABLE Grades (
    GradeID INT PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
    Marks INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

INSERT INTO Grades (GradeID, StudentID, SubjectID, Marks) VALUES
(1, 1, 1, 85),
(2, 2, 2, 78),
(3, 3, 3, 90),
(4, 4, 4, 88),
(5, 5, 5, 92);

-- Table 8: Library
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    AvailableCopies INT
);

INSERT INTO Library (BookID, Title, Author, ISBN, AvailableCopies) VALUES
(1, 'The Alchemist', 'Paulo Coelho', '978-0061122415', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', '978-0061120084', 3),
(3, '1984', 'George Orwell', '978-0451524935', 4),
(4, 'Pride and Prejudice', 'Jane Austen', '978-1503290563', 2),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', '978-0743273565', 6);

-- Table 9: ExtracurricularActivities
CREATE TABLE ExtracurricularActivities (
    ActivityID INT PRIMARY KEY,
    ActivityName VARCHAR(100),
    Description TEXT,
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO ExtracurricularActivities (ActivityID, ActivityName, Description, ClassID) VALUES
(1, 'Basketball', 'Team sport played on a court.', 1),
(2, 'Debate Club', 'A club for debating current issues.', 2),
(3, 'Science Club', 'A club for science enthusiasts.', 3),
(4, 'Drama Club', 'A club for aspiring actors.', 4),
(5, 'Art Club', 'A club for artists and creative minds.', 5);

-- Table 10: ParentDetails
CREATE TABLE ParentDetails (
    ParentID INT PRIMARY KEY,
    StudentID INT,
    ParentName VARCHAR(100),
    Relationship VARCHAR(50),
    ContactNumber VARCHAR(15),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO ParentDetails (ParentID, StudentID, ParentName, Relationship, ContactNumber) VALUES
(1, 1, 'Mr. Anil Sharma', 'Father', '9876543210'),
(2, 2, 'Mrs. Sunita Patel', 'Mother', '9876543211'),
(3, 3, 'Mr. Raj Verma', 'Father', '9876543212'),
(4, 4, 'Mrs. Kavita Iyer', 'Mother', '9876543213'),
(5, 5, 'Mr. Vikram Singh', 'Father', '9876543214');
