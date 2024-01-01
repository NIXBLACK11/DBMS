-- 1. Login to Oracle using your User Name and check your user name
CONNECT your_username;
SELECT USER FROM DUAL;

-- 2. See a list of all tables
SELECT table_name FROM user_tables;

-- 3. Create a table "Car" with the specified attributes
CREATE TABLE Car (
   ModelNo NUMBER PRIMARY KEY,
   ModelName VARCHAR2(50) UNIQUE,
   Company VARCHAR2(50) NOT NULL,
   EngineCapacity NUMBER CHECK (EngineCapacity > 1000),
   Color VARCHAR2(20),
   Doors NUMBER CHECK (Doors > 1),
   Weight NUMBER CHECK (Weight > 1000),
   TopSpeed NUMBER CHECK (TopSpeed < 500),
   RPM NUMBER CHECK (RPM > 5000),
   CostPrice NUMBER,
   SalePrice NUMBER
);

-- 4. Display the structure of the "Car" table
DESC Car;

-- 5. Populate the "Car" table with car models (INSERT statements not provided, you need to insert data).
-- Inserting data for "Maruti Suzuki"
INSERT INTO Car (ModelNo, ModelName, Company, EngineCapacity, Color, Doors, Weight, TopSpeed, RPM, CostPrice, SalePrice)
VALUES (1, 'ModelX', 'Maruti Suzuki', 1200, 'Blue', 4, 1100, 150, 6000, 500000, 550000);

-- Inserting data for "Hyundai"
INSERT INTO Car (ModelNo, ModelName, Company, EngineCapacity, Color, Doors, Weight, TopSpeed, RPM, CostPrice, SalePrice)
VALUES (2, 'ModelY', 'Hyundai', 1300, 'Red', 4, 1150, 160, 6200, 520000, 570000);

-- Inserting data for "Honda"
INSERT INTO Car (ModelNo, ModelName, Company, EngineCapacity, Color, Doors, Weight, TopSpeed, RPM, CostPrice, SalePrice)
VALUES (3, 'ModelZ', 'Honda', 1400, 'Black', 4, 1200, 170, 6400, 550000, 600000);

-- 6. Queries for different outputs
-- a. Show all records
SELECT * FROM Car;

-- b. Show names of all cars of Maruti
SELECT ModelName FROM Car WHERE Company = 'Maruti Suzuki';

-- c. Show records of all cars whose engine is more than 2000 CC
SELECT * FROM Car WHERE EngineCapacity > 2000;

-- d. Show records of all cars of white color
SELECT * FROM Car WHERE Color = 'White';

-- e. Show records of all vehicles that cost more than 4 Lacs
SELECT * FROM Car WHERE CostPrice > 400000;

-- f. Show the cost price, sale price, and profit on all cars
SELECT ModelName, CostPrice, SalePrice, (SalePrice - CostPrice) AS Profit FROM Car;

-- g. Show the names of all cars alphabetically
SELECT ModelName FROM Car ORDER BY ModelName;

-- a. Show all records
SELECT * FROM Car;

-- b. Show names of all cars of Maruti
SELECT ModelName FROM Car WHERE Company = 'Maruti Suzuki';

-- c. Show records of all cars whose engine is more than 2000 CC
SELECT * FROM Car WHERE EngineCapacity > 2000;

-- d. Show records of all cars of white color
SELECT * FROM Car WHERE Color = 'White';

-- e. Show records of all vehicles that cost more than 4 Lacs
SELECT * FROM Car WHERE CostPrice > 400000;

-- f. Show the cost price, sale price, and profit on all cars
SELECT ModelName, CostPrice, SalePrice, SalePrice - CostPrice AS Profit FROM Car;

-- g. Show the names of all cars alphabetically
SELECT ModelName FROM Car ORDER BY ModelName;

-- 7. Create the "Vehicle" table from the "Car" table
CREATE TABLE Vehicle AS
SELECT TopSpeed, Doors, CostPrice, ModelName, Company, RPM, EngineCapacity, Color, ModelNo, Weight, SalePrice
FROM Car
WHERE 1 = 0; -- This creates an empty "Vehicle" table with the desired column order.

-- 8. Display the structure of the new "Vehicle" table
DESC Vehicle;

-- 9. Populate the "Vehicle" table with records from the "Car" table in random order
INSERT INTO Vehicle (TopSpeed, Doors, CostPrice, ModelName, Company, RPM, EngineCapacity, Color, ModelNo, Weight, SalePrice)
SELECT TopSpeed, Doors, CostPrice, ModelName, Company, RPM, EngineCapacity, Color, ModelNo, Weight, SalePrice
FROM Car
ORDER BY DBMS_RANDOM.RANDOM;

-- 10. Re-write queries from Q6 on the "Vehicle" table (queries are the same as in Q6)
