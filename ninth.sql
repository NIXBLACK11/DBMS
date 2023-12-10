-- (a) Show Details of all Students:
SELECT * FROM Student;

-- (b) Show Details of students who are not registered in any course:
select S.*
from student S
left join register R on R.rollno = S.rollno
where R.coursecode is null;

SELECT * FROM Student WHERE RollNo NOT IN (SELECT RollNo FROM Register);

-- (c) Show Details of students who are registered in any course:
-- 1. Using Join:
SELECT S.* FROM Student S JOIN Register R ON S.RollNo = R.RollNo;

-- 2. Using Subquery:
SELECT * FROM Student WHERE RollNo IN (SELECT RollNo FROM Register);

-- (d) Details of students along with course code in which they are registered using simple join:
SELECT S.*, R.CourseId FROM Student S JOIN Register R ON S.RollNo = R.RollNo;

-- (e) Details of students along with course details in which they are registered using simple join:
SELECT S.*, C.* FROM Student S JOIN Register R ON S.RollNo = R.RollNo JOIN Course C ON R.CourseId = C.CourseId;

-- (f) Details of courses in which no student is registered:
SELECT C.* FROM Course C LEFT JOIN Register R ON C.CourseId = R.CourseId WHERE R.RollNo IS NULL;

-- (g) Name of all students who are registered in "MCA" course:
-- 1. Using Join:
SELECT S.Name FROM Student S JOIN Register R ON S.RollNo = R.RollNo JOIN Course C ON R.CourseId = C.CourseId WHERE C.CourseName = 'MCA';

-- 2. Using Subquery:
SELECT Name FROM Student WHERE RollNo IN (SELECT RollNo FROM Register WHERE CourseId IN (SELECT CourseId FROM Course WHERE CourseName = 'MCA'));

-- (h) Details of students who are registered in the most expensive course:
select S.*, C.*
from student S
join register R on R.rollno = S.rollno
join course C on C.coursecode = R.coursecode
where coursefees = (select max(coursefees) from course);

SELECT S.*, C.* FROM Student S JOIN Register R ON S.RollNo = R.RollNo JOIN Course C ON R.CourseId = C.CourseId ORDER BY C.Coursefees DESC FETCH FIRST 1 ROW ONLY;

-- (i) Display Highest course fees:
SELECT MAX(Coursefees) AS HighestFees FROM Course;

-- (j) Display Second highest course fees:
SELECT MAX(Coursefees) AS SecondHighestFees FROM Course WHERE Coursefees < (SELECT MAX(Coursefees) FROM Course);

-- (k) Display total sum of all course fees:
SELECT SUM(Coursefees) AS TotalSumFees FROM Course;

-- (l) Display department-wise total fees of all courses. Show both department name & total fees:
SELECT Department, SUM(Coursefees) AS TotalFees FROM Course GROUP BY Department;

-- (m) Display department-wise total fees of all those departments whose total department fees is greater than Rs. 80000/-.
-- (How many rows are displayed?)
SELECT Department, SUM(Coursefees) AS TotalFees FROM Course GROUP BY Department HAVING SUM(Coursefees) > 80000;

-- (n) Display department-wise total fees of only those courses having fees greater than Rs. 30000/-.
-- (How many rows are displayed?)
SELECT Department, SUM(Coursefees) AS TotalFees FROM Course WHERE Coursefees > 30000 GROUP BY Department;

-- (o) Run Queries for All Types of Joins Like:
-- - Inner Join
SELECT S.*, R.CourseId, C.CourseName FROM Student S INNER JOIN Register R ON S.RollNo = R.RollNo INNER JOIN Course C ON R.CourseId = C.CourseId;

-- - Left Outer Join
SELECT S.*, R.CourseId, C.CourseName FROM Student S LEFT JOIN Register R ON S.RollNo = R.RollNo LEFT JOIN Course C ON R.CourseId = C.CourseId;

-- - Right Outer Join
SELECT S.*, R.CourseId, C.CourseName FROM Student S RIGHT JOIN Register R ON S.RollNo = R.RollNo RIGHT JOIN Course C ON R.CourseId = C.CourseId;

-- - Full Outer Join
SELECT S.*, R.CourseId, C.CourseName FROM Student S FULL JOIN Register R ON S.RollNo = R.RollNo FULL JOIN Course C ON R.CourseId = C.CourseId;

-- - Self Join
SELECT S1.Name AS Student1, S2.Name AS Student2, S1.City FROM Student S1 JOIN Student S2 ON S1.City = S2.City AND S1.RollNo < S2.RollNo;
