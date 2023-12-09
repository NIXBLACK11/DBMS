-- 1. WAQ to create the "Account" table with the specified constraints:
CREATE TABLE Account (
    AccountNo NUMBER PRIMARY KEY,
    CustName VARCHAR2 NOT NULL,
    AccountType VARCHAR2 DEFAULT 'Saving',
    Balance NUMBER CHECK (Balance > 1000),
    PassportNo VARCHAR2 UNIQUE
);

-- 2. To see the structure of the "Account" table:
DESCRIBE Account;

-- 3. To see the contents of the "User_Constraints" table for your "Account" table:
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'ACCOUNT';

-- 4. To insert the provided data into the "Account" table:
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117501, 'Puneet', 'Saving', 1100, 'B9895');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117502, NULL, 'Saving', 2100, 'A9895');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117507, 'Rohit', 'Current', 500, 'C9898');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117507, 'Rohit', 'Current', 5000, 'C9898');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117504, 'Kumar', 'Saving', 1100, 'C9898');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117508, 'Shweta', 'Saving', 7100, 'A6789');
INSERT INTO Account (AccountNo, CustName, AccountType, Balance, PassportNo) VALUES (117503, 'Deepak', 'Current', 12000, NULL);

-- Repeat this INSERT statement for each row
COMMIT;

-- 5. WAQ to create the "Account2" table with the specified constraints:
CREATE TABLE Account2 (
    AccountNo NUMBER PRIMARY KEY,
    CustName VARCHAR2 NOT NULL,
    AccountType VARCHAR2 DEFAULT 'Current',
    Balance NUMBER CHECK (Balance > 5000),
    PassportNo VARCHAR2 UNIQUE
);

-- 6. To see the structure of the "Account2" table:
DESCRIBE Account2;

7.
CREATE TABLE Account3 (
    AccountNo NUMBER,
    CustName VARCHAR2(255),
    CONSTRAINT pk_Account3 PRIMARY KEY (AccountNo),
    CONSTRAINT nn_CustName_Account3 CHECK (CustName IS NOT NULL)
);


-- 8. To see the contents of the "User_Constraints" table for your "Account3" table:
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'ACCOUNT3';

-- 9. To drop the NOT NULL constraint from the "Account3" table for the "CustName" column:
ALTER TABLE Account3
MODIFY CustName NULL;

-- 10. WAQ to create the "Account4" table with the specified constraints and constraint names:
CREATE TABLE Account4 (
    AccountNo NUMBER constraint PKey Primary key,
    CustName VARCHAR2(255) constraint NNull Not null,
    AccountType VARCHAR2(50) DEFAULT 'Current',
    Balance NUMBER constraint ChkBal CHECK (Balance > 5000),
    PassportNo VARCHAR2(20) constraint UU unique
);



-- 11. To see the contents of the "User_Constraints" table for your "Account4" table:
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'ACCOUNT4';

-- 12. To drop the Primary Key and Unique constraints from the "Account4" table:
ALTER TABLE Account4
DROP PRIMARY KEY CASCADE;
ALTER TABLE Account4
DROP UNIQUE (PassportNo);

-- 13. WAQ to create the "Account5" table without any constraints:
CREATE TABLE Account5 (
    AccountNo NUMBER,
    CustName VARCHAR2,
    Balance NUMBER
);

-- 14. To insert the provided data into the "Account5" table:
INSERT INTO Account5 (AccountNo, CustName, Balance)
VALUES (8111, 'Puneet', 1000);
-- Repeat this INSERT statement for each row

-- 15. To see the structure of the "Account5" table:
DESCRIBE Account5;

-- 16. To add the Primary Key constraint for "AccountNo" in the "Account5" table:
ALTER TABLE Account5
ADD CONSTRAINT PK_Account5 PRIMARY KEY (AccountNo);

-- 17. In case of an error in the previous question, rectify the table contents and repeat the question.

-- 18. To see the contents of the "User_Constraints" table and search for the name of the "Account5" table:
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'ACCOUNT5';

-- 19. To add a UNIQUE constraint for the "CustName" field in the "Account5" table:
ALTER TABLE Account5
ADD CONSTRAINT UQ_CustName UNIQUE (CustName);

-- 20. To add a CHECK constraint for the "Balance" field in the "Account5" table (Amount > 1500):
ALTER TABLE Account5
ADD CONSTRAINT Chk_Balance CHECK (Balance > 1500);

-- 21. In case of an error in the previous question, rectify the table contents and repeat the question.

-- 22. To see the contents of the "User_Constraints" table and find the constraint number for the "Account5" table:
SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'ACCOUNT5';
 