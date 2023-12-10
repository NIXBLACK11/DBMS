-- Logon to Oracle using your User Name
CONNECT your_username/your_password@your_oracle_instance;

-- See the list of tables
SELECT table_name FROM user_tables;

-- View the user name from dual
SELECT user FROM dual;

-- Create a table "Students" with the specified attributes
CREATE TABLE Students (
    Roll_No NUMBER(6),
    Name VARCHAR2(15),
    City VARCHAR2(12),
    Pincode VARCHAR2(8),
    Age NUMBER(2)
);

-- Display the structure of the "Students" table
DESC Students;

-- Insert the provided data into the "Students" table
INSERT ALL
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (1, 'Amit', 'Delhi', '214213', 21)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (2, 'Kumar', 'Bombay', '25', NULL)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (3, 'Kshitij', 'Madras', '110101', 16)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (4, 'Puneet', 'Calcutta', NULL, 18)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (5, 'Rohit', 'Delhi', '502207', 19)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (6, 'Karnal', 'Dehradun', '28', NULL)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (7, 'Shweta', 'Dehradun', '98102', 23)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (8, 'Mohit', 'Bombay', '12434', 22)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (9, 'Pankaj', 'Bombay', NULL, 17)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (10, 'Parul', 'Delhi', '76312', 24)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (11, 'Rohit', 'Baroda', '12131', 29)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (12, 'Gaurav', 'Rampur', '312125', NULL)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (13, 'Manish', NULL, '314136', NULL)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (14, 'Aviral', NULL, '319143', 29)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (15, 'Gwaliar', NULL, '313149', 25)
SELECT 1 FROM dual;

7. Write queries for the following outputs.
➢ Show all records
➢ Show names of all students living in Delhi.

    select Name from Students WHERE City like 'Delhi';

➢ Show record of all student whose name starts with “A”.

    select * from Students WHERE Name like 'A%';

➢ Show record of all student whose second alphabet of name is “a”.

    select * from Students WHERE Name like '_a%';

➢ Show record of all student whose name ends with “it”.

    select * from Students WHERE Name like '%t';

➢ Show record of all student whose name contains “t”.

    select * from Students WHERE Name like '%t%';

➢ Show record of all student whose name contains “t” but not in end.

    select * from Students WHERE Name like '%t%' AND Name not like '%t';

➢ Show records of all students having age greater than 25 & living in Dehradun.

    select * from Students WHERE City like 'Dehradun' And Age > 25;

➢ Show the list of all cities (names of cities should not be repeated)

    SELECT DISTINCT City FROM Students;

➢ Show the names students alphabetically in ascending order

    SELECT Name
    FROM Students
    ORDER BY Name ASC;

➢ Show the records of those students which are either less than 20 year or they are living in Bombay.

    SELECT * FROM STUDENTS WHERE Age < 20 OR City like 'Bombay';

➢ Show records of all those student who are not living in Dehradun.

    SELECT * FROM STUDENTS WHERE City not like 'Dehradun';

➢ Display all names in uppercase.

    SELECT UPPER(Name) FROM STUDENTS;

➢ Display all cities in lowercase.

    SELECT LOWER(Name) FROM STUDENTS;

➢ Display name in lowercase, cities in uppercase.

    SELECT LOWER(Name), UPPER(City) FROM STUDENTS;

➢ Show all records in uppercase

    SELECT UPPER(Roll_No) AS Roll_No,
       UPPER(Name) AS Name,
       UPPER(City) AS City,
       UPPER(Pincode) AS Pincode,
       UPPER(Age) AS Age
    FROM Students;

➢ Display those records which do not have pin code.

    SELECT * FROM Students Where pincode is NULL;

8. Insert the following data further into the same table.

    INSERT ALL
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (12, 'Amit', 'Rampur', '312125', NULL)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (14, 'Aviral', '', '314123', 29)
    INTO Students (Roll_No, Name, City, Pincode, Age) VALUES (15, '', 'Gwaliar', '313149', 25)
    SELECT 1 FROM dual;

9. Write queries for the following :-
(i) Assign Roll No. “13” to Manish.

    UPDATE Students SET name = 'Mansih' WHERE roll_no = 13;

(ii) Assign the name “Abhijeet” to Roll No. 15

    UPDATE Students SET Name = 'ABHIJEET' where Roll_No = 15;

(iii) Set the cities of Roll No. 13 & 14 to “Meerut”

    UPDATE Students SET City = 'Meerut' WHERE Roll_No = 13 OR Roll_No = 14;

(iv) Increase all age by 3 years.

    UPDATE Students SET Age = Age + 3;

(v) Set the age of all students living in Meerut to “25”.

    UPDATE Students SET Age = 12 WHERE City like 'Meerut';

10. Add a new column named “Balance”, type number to the Students table.

    ALTER TABLE Students ADD Balance NUMBER(10);

11. Set the balance of all students to Rs. 20,000/-. See All records. Commit.
12. Increase the balance by Rs. 500/- for all Bombay & Delhi students. See All records. Commit.
13. Show the total balance amount of all students.
14. Show the maximum balance.
15. Increase the size of “balance” column to 10.
16. Reduce the size of city to “10”
17. Create a new table “student2” as a copy of Students with all rows from Students table.
18. Show the records & structure of student2 table.
19. Delete the records of those students from “student2” table who are greater or equal to 25 years.
20. Show all records of student2 table.
21. Change the name of student2 to “Newstudent”
22. Delete all records from “Newstudent” using truncate. Do not use delete.
22(a) See the records of “Newstudent” .
22(b) Rollback and see records again. 
23. Drop the “Newstudent” table.
24. Again create the “Newstudent” table similar to Students table but this time without any records, 
copy only the structure. See the records and structure of “Newstudent” table.
25. Create a new table named “MCA” with only three columns RollNo, Name & balance from 
“Students” table along with its data. See the records and structure of “MCA” table