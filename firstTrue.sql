-- 1. Log in to Oracle
CONNECT <your_username>/<your_password>;

-- 2. See a list of tables in your schema
SELECT table_name FROM user_tables;  -->

-- 3. View your username
SELECT USER FROM DUAL;

-- 4. View today's date
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;
SELECT current_timestamp from dual;

-- 5. Clear the screen (use client-specific command)
CLEAR SCREEN;

-- 6. See the list of all environment variables
SHOW PARAMETERS;

-- 7. Perform some mathematical operations using DUAL
SELECT 5 + 3 AS addition, 5 * 3 AS multiplication FROM DUAL;
SELECT 5+3 FROM DUAL;

-- 8. Create a "Student" table with the specified attributes
CREATE TABLE Student (
  Rollno NUMBER,
  Name VARCHAR2(10),
  City VARCHAR2(10)
);

-- 9. Display the structure of the "Student" table
DESC Student;

-- 10. See the records of the "Student" table
SELECT * FROM Student; -->

-- 11. Insert the provided data into the "Student" table and commit
INSERT INTO Student (Rollno, Name, City)
VALUES (1, 'Amit', 'Dehradun');
INSERT INTO Student (Rollno, Name, City)
VALUES (2, 'Kapil', 'Meerut');
INSERT INTO Student (Rollno, Name, City)
VALUES (3, 'Dehradun', NULL);
INSERT INTO Student (Rollno, Name, City)
VALUES (4, 'Amit', NULL);
INSERT INTO Student (Rollno, Name, City)
VALUES (5, NULL, 'Delhi');

COMMIT;

-- 12. See the records of the "Student" table
SELECT * FROM Student;

-- 13. Add a new column named "Email" with type VARCHAR2(15)
ALTER TABLE Student ADD (Email VARCHAR2(15));

-- 14. See the records of the "Student" table
SELECT * FROM Student;

-- 15. Display the structure of the "Student" table
DESC Student;

-- 16. Set the email of all records to 'btech@gmail.com'
UPDATE Student SET Email = 'btech@gmail.com';

-- 17. See the records of the "Student" table
SELECT * FROM Student;

-- 18. Roll back the email data
ROLLBACK;

-- 19. See the records of the "Student" table
SELECT * FROM Student;

-- 20. Display the structure of the "Student" table
DESC Student;

-- 21. Set the email of 'Amit' to 'abc@xyz'
UPDATE Student SET Email = 'abc@xyz' WHERE Name = 'Amit';

-- 22. See the records of the table
SELECT * FROM Student;

-- 23. Complete all the blank records of your own and add 5 More records (Total = 10)
-- You can add your own records or use placeholders
INSERT INTO Student (Rollno, Name, City, Email)
VALUES (6, '<Your_Name>', '<Your_City>', '<Your_Email>');
-- Add 4 more records with similar INSERT statements.

-- 24. Commit data & clear the screen (clear screen)
COMMIT;

-- 25. See all records
SELECT * FROM Student;

-- 26. Set linesize 20
SET LINESIZE 20;

-- 27. Again see all records (note the display style)
SELECT * FROM Student;
-- it prints only 15 char per line

-- 28. See the structure of the table (is it the same as displayed in question no. 20?)
DESC Student;

-- 29. Let linesize 500
SET LINESIZE 500;

-- 30. Again see all records (note the display style)
SELECT * FROM Student;

-- 31. Set pagesize 7
SET PAGESIZE 7;

-- 32. Again see all records (note the display style)
SELECT * FROM Student;

-- 33. Set pagesize 200
SET PAGESIZE 200;
-- limits the no of rows can see more by using more or scrolling

-- 34. Again see all records (note the display style)
SELECT * FROM Student;

-- 35. Set heading off
SET HEADING OFF;

-- 36. Again see all records (note the display style)
SELECT * FROM Student;

-- 37. Set heading on
SET HEADING ON;

-- 38. Again see all records (note the display style)
SELECT * FROM Student;

-- 39. Set pause on
SET PAUSE ON;

-- 40. Again see all records (if not displayed, press enter, see records once more)
SELECT * FROM Student;

-- 41. Remove the name column
ALTER TABLE Student DROP COLUMN Name;

-- 42. Display the structure
DESC Student;

-- 43. See the records
SELECT * FROM Student;

-- 44. Make a duplicate copy of Student table with the name “Duplicate”
CREATE TABLE Duplicate AS SELECT * FROM Student;

-- 46. Truncate the “Student” table
TRUNCATE TABLE Student;

    -- Speed: TRUNCATE is generally faster than DELETE. It's a minimally logged operation, which means it doesn't generate as much transaction log as DELETE. This makes it more efficient for removing all rows from a large table.

    -- Rollback: TRUNCATE cannot be rolled back, meaning you cannot undo a TRUNCATE operation using a ROLLBACK statement. Once you truncate a table, the data is permanently removed.

    -- Conditions: TRUNCATE doesn't allow you to specify a WHERE clause to conditionally delete rows. It removes all rows from the table.

    -- Logging: As mentioned earlier, TRUNCATE generates less transaction log than DELETE, which can be important for performance and disk space considerations.

-- 47. Rollback and see the records
ROLLBACK;
SELECT * FROM Student;

-- 48. Drop the STUDENT table
DROP TABLE Student;
-- In Oracle and many other relational database management systems (RDBMS), the DROP statement is typically not a transactional operation, and it cannot be rolled back using the ROLLBACK command. Once you execute a DROP statement to delete an object such as a table, it is generally irreversible, and the object and its associated data are permanently removed from the database.

-- 49. See the records of the dropped table
SELECT * FROM Student;
-- (You should not see any records because the table has been dropped)

-- 50. Rollback and again see the records of the dropped table
ROLLBACK;
SELECT * FROM Student;

-- 51. See the list of all tables (Is your table present?)
SELECT table_name FROM user_tables;

-- 52. Show the user name
SELECT USER FROM DUAL;

-- 53. Disconnect
DISCONNECT;
