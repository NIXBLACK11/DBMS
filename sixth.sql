-- Create Course table with constraints
CREATE TABLE Course (
    CourseCode Number PRIMARY KEY,
    CourseName Varchar2 NOT NULL,
    CourseFees Number DEFAULT 60000,
    CourseSemester Number CHECK (CourseSemester >= 1),
    Dept Varchar2 NOT NULL
);

-- Describe Course table
DESCRIBE Course;

-- Insert data into Course table
INSERT INTO Course (CourseCode, CourseName, CourseFees, CourseSemester, Dept)
VALUES
    (101, 'MCA', 80000, 6, 'MCA'),
    (102, 'MBA', 50000, 4, 'MGMT'),
    (103, 'Btech', 45000, 8, 'ENGG'),
    (104, 'BCA', 30000, 6, 'MCA'),
    (105, 'BSCIT', 25000, 6, 'ALLIED'),
    (106, 'MSCIT', 35000, 6, 'ALLIED'),
    (107, 'BBA', 35000, 6, 'MGMT'),
    (108, 'OCP', 3000, 2, 'MCA'),
    (109, 'PGDM', 25000, 3, 'MGMT'),
    (110, 'CCNA', 15000, 3, 'ENGG'),
    (111, 'BscCS', 55000, 3, 'MCA');
COMMIT;

-- Create Department table with data
CREATE TABLE Department (
    DeptCode Number PRIMARY KEY,
    DeptName Varchar2
);

INSERT INTO Department (DeptCode, DeptName)
VALUES
    (1, 'MCA'),
    (2, 'MGMT'),
    (3, 'ENGG'),
    (4, 'ALLIED');

COMMIT;

-- Create Student table with constraints
CREATE TABLE Student (
    RollNo Number PRIMARY KEY,
    Name Varchar2 NOT NULL,
    DOB Date,
    City Varchar2 DEFAULT 'Dehradun'
);

-- Describe Student table
DESCRIBE Student;

-- Insert data into Student table
INSERT INTO Student (RollNo, Name, DOB, City)
VALUES
    (1, 'Amit', TO_DATE('1-Jan-77', 'DD-MON-YY'), 'Delhi'),
    (2, 'Rohit', TO_DATE('11-Sep-78', 'DD-MON-YY'), 'Bombay'),
    (3, 'Shweta', TO_DATE('21-Feb-81', 'DD-MON-YY'), 'Bombay'),
    (4, 'Puneet', TO_DATE('5-Aug-72', 'DD-MON-YY'), 'Goa'),
    (5, 'Shashwat', TO_DATE('7-Aug-70', 'DD-MON-YY'), 'Haridwar'),
    (6, 'Kumar', TO_DATE('8-Jan-75', 'DD-MON-YY'), 'DDN'),
    (7, 'Rohit', TO_DATE('9-Dec-83', 'DD-MON-YY'), 'Delhi'),
    (8, 'Gagan', TO_DATE('2-Apr-73', 'DD-MON-YY'), 'DDN');
COMMIT;

-- Create Register table with foreign key constraints
CREATE TABLE Register (
    RollNo Number,
    CourseCode Number,
    FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Describe Register table
DESCRIBE Register;

-- Insert data into Register table
INSERT INTO Register (RollNo, CourseCode)
VALUES
    (4, 103),
    (3, 101),
    (2, 101),
    (9, 222);
COMMIT;

-- Add primary key constraint (RollNo) to Register table
ALTER TABLE Register ADD CONSTRAINT pk_register PRIMARY KEY (RollNo);

-- Drop Register table
DROP TABLE Register;

-- Create a new Register table with primary and foreign key constraints
CREATE TABLE Register (
    RollNo Number PRIMARY KEY,
    CourseCode Number,
    FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Insert data into the new Register table
INSERT INTO Register (RollNo, CourseCode)
VALUES
    (4, 222),
    (9, 101);

-- Truncate Register table
TRUNCATE TABLE Register;

-- Insert data into the truncated Register table
INSERT INTO Register (RollNo, CourseCode)
VALUES
    (2, 101),
    (3, 201),
    (2, 101);

-- Observe the contents of the Register table for duplicates

-- Create a Register2 table with primary and foreign key constraints
CREATE TABLE Register2 (
    RollNo Number PRIMARY KEY,
    CourseCode Number PRIMARY KEY,
    FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Insert data into the Register2 table
INSERT INTO Register2 (RollNo, CourseCode)
VALUES
    (2, 101),
    (3, 201),
    (2, 101);

-- Observe the contents of the Register2 table for duplicates

-- Create a Register3 table with primary and foreign key constraints to ensure "One Student is allowed to take admission in One Course Only"

-- Insert data into the Register3 table and note output in each case

-- Insert data into the Register3 table with missing CourseCode and observe the result

-- Create a Register4 table to eliminate the problem in Register3

-- Insert data into the Register4 table and note output in each case

-- Create a Register5 table with primary and foreign key constraints to ensure "In one course only one student is allowed to take admission"

-- Insert data into the Register5 table and note output in each case

-- Register3 Table (One Student is allowed to take admission in One Course Only)
CREATE TABLE Register3 (
    RollNo NUMBER,
    CourseCode NUMBER,
    PRIMARY KEY (RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Insert data into Register3 table and note output in each case
-- Note: You should handle missing CourseCode in your application logic to avoid foreign key constraint violations.
INSERT INTO Register3 (RollNo, CourseCode) VALUES (1, 101);
INSERT INTO Register3 (RollNo, CourseCode) VALUES (2, 102);
-- Insert data with missing CourseCode (This will cause a foreign key constraint violation)
-- INSERT INTO Register3 (RollNo) VALUES (3); -- This will fail
-- View contents of Register3 table
-- SELECT * FROM Register3;

-- Register4 Table (Eliminate the problem in Register3)
CREATE TABLE Register4 (
    RollNo NUMBER,
    CourseCode NUMBER,
    PRIMARY KEY (RollNo, CourseCode),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Insert data into Register4 table and note output in each case
-- Note: Since the primary key is on both RollNo and CourseCode, it allows one student to take admission in one course only.
INSERT INTO Register4 (RollNo, CourseCode) VALUES (1, 101);
INSERT INTO Register4 (RollNo, CourseCode) VALUES (2, 102);
-- Insert data with missing CourseCode (This will fail due to the primary key constraint)
-- INSERT INTO Register4 (RollNo) VALUES (3); -- This will fail
-- View contents of Register4 table
-- SELECT * FROM Register4;

-- Register5 Table (In one course only one student is allowed to take admission)
CREATE TABLE Register5 (
    RollNo NUMBER,
    CourseCode NUMBER,
    PRIMARY KEY (CourseCode),
    FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
);

-- Insert data into Register5 table and note output in each case
-- Note: This ensures that in one course only one student is allowed to take admission.
INSERT INTO Register5 (RollNo, CourseCode) VALUES (1, 101);
INSERT INTO Register5 (RollNo, CourseCode) VALUES (2, 102);
-- Insert duplicate data for the same course (This will fail due to the primary key constraint)
-- INSERT INTO Register5 (RollNo, CourseCode) VALUES (3, 101); -- This will fail
-- View contents of Register5 table
-- SELECT * FROM Register5;
