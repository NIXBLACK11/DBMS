-- Insert into "Student" Table
INSERT ALL
    INTO Student (RollNo, Name, City) VALUES (1, 'Amit', 'Delhi')
    INTO Student (RollNo, Name, City) VALUES (2, 'Sumit', 'Goa')
    INTO Student (RollNo, Name, City) VALUES (3, 'Shweta', 'Gwaliar')
    INTO Student (RollNo, Name, City) VALUES (4, 'Kumar', 'Goa')
    INTO Student (RollNo, Name, City) VALUES (5, 'Puneet', 'Meerut')
    INTO Student (RollNo, Name, City) VALUES (6, 'Bharat', 'Gwaliar')
SELECT * FROM dual;

-- Insert into "Course" Table
INSERT ALL
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (101, 'MCA', 80000, 'MCA')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (102, 'MBA', 60000, 'MBA')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (103, 'Btech', 75000, 'Engg')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (104, 'BCA', 30000, 'MCA')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (105, 'BSc(IT)', 25000, 'MCA')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (106, 'MSc(IT)', 35000, 'MCA')
    INTO Course (CourseId, CourseName, Coursefees, Department) VALUES (107, 'BBA', 22000, 'MBA')
SELECT * FROM dual;

-- Insert into "Register" Table
INSERT ALL
    INTO Register (RollNo, CourseId) VALUES (2, 101)
    INTO Register (RollNo, CourseId) VALUES (4, 103)
    INTO Register (RollNo, CourseId) VALUES (5, 101)
    INTO Register (RollNo, CourseId) VALUES (3, 105)
    INTO Register (RollNo, CourseId) VALUES (1, 103)
SELECT * FROM dual;


-- (a) Details of students who are not registered in any course:
SELECT *
FROM Student
WHERE RollNo NOT IN (SELECT RollNo FROM Register);

-- (b) Rollno of students not registered in any course (only Rollno):
SELECT RollNo
FROM Student
WHERE RollNo NOT IN (SELECT RollNo FROM Register);

-- (c) Details of students who are registered in "MCA" course:
SELECT Student.RollNo, Student.Name, Student.City, Course.Coursecode, course.coursename, course.coursefees, course.department
FROM Student
JOIN Register ON Student.RollNo = Register.RollNo
JOIN Course ON Register.CourseCode = Course.CourseCode
where coursename like 'MCA';

select * from student 
    where rollno in (select rollno from register 
    	where coursecode in (select coursecode from course 
    		where coursename like 'MCA'
    	)
    );

SELECT S.*
FROM Student S
JOIN Register R ON S.RollNo = R.RollNo
JOIN Course C ON R.CourseCode = C.CourseCode
WHERE C.CourseName = 'MCA';

-- (d) List of courses in which no students are registered:
SELECT C.*
FROM Course C
LEFT JOIN Register R ON C.CourseCode = R.CourseCode
WHERE R.CourseCode IS NULL;

SELECT *
FROM Course
LEFT JOIN Register ON Course.CourseCode = Register.CourseCode
WHERE Register.CourseCode IS NULL;

-- (e) List of courses in which at least one student is registered:
SELECT DISTINCT C.*
FROM Course C
JOIN Register R ON C.CourseCode = R.CourseCode;

-- (f) List of courses having fees greater than "BCA" course:
SELECT *
FROM Course
WHERE CourseFees > (SELECT CourseFees FROM Course WHERE CourseName = 'BCA');

-- (g) Total fees of all courses and also show average fees:
SELECT SUM(CourseFees) AS TotalFees, AVG(CourseFees) AS AverageFees
FROM Course;

-- (h) Department-wise total fees of all courses:
SELECT Department, SUM(CourseFees) AS TotalFees
FROM Course
GROUP BY Department;

-- (i) Maximum course fee of each department:
SELECT Department, MAX(CourseFees) AS MaxFee
FROM Course
GROUP BY Department;

-- (j) Details of courses which are having fees greater than average fees:
SELECT *
FROM Course
WHERE CourseFees > (SELECT AVG(CourseFees) FROM Course);

-- (k) Details of those courses in which students of "Goa" are registered:
SELECT C.*
FROM Course C
JOIN Register R ON C.CourseCode = R.CourseCode
JOIN Student S ON R.RollNo = S.RollNo
WHERE S.City like 'Goa';

-- (l) Increase the fees of all courses by 10% and commit:
UPDATE Course
SET CourseFees = CourseFees * 1.1;

COMMIT;

-- (m) View all records of the course table:
SELECT * FROM Course;

-- (n) Display highest, lowest, and average fees:
SELECT MAX(CourseFees) AS HighestFees, MIN(CourseFees) AS LowestFees, AVG(CourseFees) AS AverageFees
FROM Course;

-- (o) Names of students who are registered in a course having fees less than 30000:
SELECT S.Name
FROM Student S
JOIN Register R ON S.RollNo = R.RollNo
JOIN Course C ON R.CourseCode = C.CourseCode
WHERE C.CourseFees < 30000;

-- (p) Display course codes along with the total number of registrations in those courses:
SELECT R.CourseCode, COUNT(*) AS TotalRegistrations
FROM Register R
GROUP BY R.CourseCode;

select coursecode, count(*) from register
group by coursecode;


-- (q) Display the total number of students from Goa:
SELECT COUNT(*) AS TotalStudentsFromGoa
FROM Student
WHERE City = 'Goa';

-- (r) Display the highest fees:
SELECT MAX(CourseFees) AS HighestFees
FROM Course;

-- (s) Display the 4th highest fees:
SELECT DISTINCT CourseFees
FROM Course
ORDER BY CourseFees DESC
OFFSET 3 ROWS FETCH NEXT 1 ROW ONLY;
