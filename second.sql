-- 1. Logon to Oracle by user name given to you.

-- 2. See list of tables by using “Tab”

-- 3. View the user name, make sure it’s your login name.
SELECT user FROM dual;

-- 4. Create a new table “Employee” with the specified attributes:
CREATE TABLE Employee (
  EmpCode NUMBER,
  Name VARCHAR2(6),
  Salary NUMBER
);

-- 5. Display the structure of the "Employee" table:
DESCRIBE Employee;

-- 6. See the records of the table:
SELECT * FROM Employee;

-- 7. Insert the provided data into the table:
INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (101, 'Amit', 30000);

INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (201, 'Kapil', 22000);

INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (301, 'Rohit', 45000);

INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (401, 'Amit', 27000);

-- 8. See the records of the "Employee" table:
SELECT * FROM Employee;

-- 9. Try to add the following new record:
INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (901, 'Bhattacharya', 33000);

-- 10. See the structure of the "Employee" table and note the size of the "Name" column:
DESCRIBE Employee;

-- 11. Increase the size of name column to 25:
ALTER TABLE Employee MODIFY (Name VARCHAR2(25));

-- 12. See the structure of the "Employee" table again:
DESCRIBE Employee;

-- 13. See the records of the "Employee" table:
SELECT * FROM Employee;

-- 14. Try to add the previously failed new record again.
INSERT INTO Employee (EmpCode, Name, Salary)
VALUES (901, 'Bhattacharya', 33000);

-- 15. See the records of the "Employee" table.
SELECT * FROM Employee;

-- 16. Reduce the size of the "Name" column to 5 (Note the output even if it is an error):
ALTER TABLE Employee MODIFY (Name VARCHAR2(5));

-- 17. Commit the data and see all records:
COMMIT;

-- 18. Execute the following SQL queries and note the result:
-- a) Select name from employee.
SELECT Name FROM Employee;

-- b) Select name, name, name, name from employee.
SELECT Name, Name, Name, Name FROM Employee;

-- c) Select name, empcode from employee order by salary.
SELECT Name, EmpCode FROM Employee ORDER BY Salary;

-- d) Select name, Salary, salary + 500 , salary-50000 from employee.
SELECT Name, Salary, Salary + 500, Salary - 50000 FROM Employee;

-- e) Select sum(salary) from employee;
SELECT SUM(Salary) FROM Employee;

-- f) Select min(salary) from employee;
SELECT MIN(Salary) FROM Employee;

-- g) Select max(salary) from employee;
SELECT MAX(Salary) FROM Employee;


-- 19. Display name, actual salary, and 50% increased salary of all employees.
SELECT Name, Salary, Salary*(1.5) FROM Employee;

-- 20. Make a copy of the "Employee" table as “NewEmp” table with all records:
CREATE TABLE NewEmp AS SELECT * FROM Employee;

-- 21. See the records of “NewEmp” table:
SELECT * FROM NewEmp;

-- 22. Make a copy of the "Employee" table as “Emp2” table with no (Zero) records:
CREATE TABLE Emp2 AS SELECT * FROM Employee WHERE 1 = 0;

-- 23. See the records of all 3 tables (Employee, NewEmp, and Emp2).
SELECT * FROM Employee;
SELECT * FROM NewEmp;
SELECT * FROM Emp2;

-- 24. See the structure of all 3 tables (Employee, NewEmp, and Emp2):
DESCRIBE Employee;
DESCRIBE NewEmp;
DESCRIBE Emp2;

-- 25. Create a new table “MyTable” from the "Employee" table with only Name and Salary columns:
CREATE TABLE MyTable AS SELECT Name, Salary FROM Employee;

-- 26. See the records of Employee Table and MyTable:
SELECT * FROM Employee;
SELECT * FROM MyTable;

-- 27. See the list of all tables:
SELECT table_name FROM user_tables;

-- 28. Commit your data.
COMMIT;

-- 29. Drop the columns “Name” and “EmpCode” from NewEmp table:
ALTER TABLE NewEmp DROP COLUMN Name;
ALTER TABLE NewEmp DROP COLUMN EmpCode;

-- 30. See the records of NewEmp Table:
SELECT * FROM NewEmp;

-- 31. Truncate the “MyTable” table (do not use delete command):
TRUNCATE TABLE MyTable;

-- 32. See the records of “MyTable” table:
SELECT * FROM MyTable;

-- 33. Rollback.
ROLLBACK;

-- 34. Again See the records of “MyTable” table (What is your observation?).
SELECT * FROM MyTable;

-- 35. Drop the “MyTable” table:
DROP TABLE MyTable;

-- 36. See the records of “MyTable” table:
SELECT * FROM MyTable;

-- 37. Rollback.
ROLLBACK;

-- 38. Again See the records of “MyTable” table (What is your observation?).
SELECT * FROM MyTable;

-- 39. See the list of all tables in our login:
SELECT table_name FROM user_tables;

-- 40. Commit the data.
COMMIT;
