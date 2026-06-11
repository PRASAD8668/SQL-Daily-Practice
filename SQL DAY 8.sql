-- Create Table

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    Age INT
);

INSERT INTO Employees VALUES
(1,'Amit','IT',40000,25),
(2,'Neha','HR',35000,30),
(3,'Ravi','IT',50000,28),
(4,'Priya','Finance',60000,35),
(5,'Karan','HR',30000,22),
(6,'Rahul','IT',55000,31);

--------------------------------------------------
-- VIEWS
--------------------------------------------------

-- Q1 Create View
CREATE VIEW Employee_View AS
SELECT Name,Department,Salary
FROM Employees;

-- Q2 Display View
SELECT * FROM Employee_View;

-- Q3 Create IT Employee View
CREATE VIEW IT_Employees AS
SELECT *
FROM Employees
WHERE Department='IT';

-- Q4 Display IT Employees
SELECT * FROM IT_Employees;

-- Q5 Delete View
DROP VIEW Employee_View;

--------------------------------------------------
-- INDEXES
--------------------------------------------------

-- Q6 Create Index on Name
CREATE INDEX idx_name
ON Employees(Name);

-- Q7 Create Index on Department
CREATE INDEX idx_dept
ON Employees(Department);

-- Q8 Composite Index
CREATE INDEX idx_dept_salary
ON Employees(Department,Salary);

-- Q9 Remove Index
DROP INDEX idx_name;

-- Q10 Search Using Index
SELECT *
FROM Employees
WHERE Name='Amit';

--------------------------------------------------
-- STORED PROCEDURES
--------------------------------------------------

-- Q11 Create Procedure
CREATE PROCEDURE GetEmployees
AS
BEGIN
SELECT * FROM Employees;
END;

-- Q12 Execute Procedure
EXEC GetEmployees;

-- Q13 IT Employees Procedure
CREATE PROCEDURE GetITEmployees
AS
BEGIN
SELECT *
FROM Employees
WHERE Department='IT';
END;

-- Q14 Execute IT Procedure
EXEC GetITEmployees;

-- Q15 Procedure With Parameter
CREATE PROCEDURE GetEmployeeByID
@EmpID INT
AS
BEGIN
SELECT *
FROM Employees
WHERE EmpID=@EmpID;
END;

-- Q16 Execute Parameter Procedure
EXEC GetEmployeeByID 3;

--------------------------------------------------
-- TRIGGERS
--------------------------------------------------

-- Q17 Audit Table
CREATE TABLE Employee_Audit(
EmpID INT,
ActionType VARCHAR(20)
);

-- Q18 Insert Trigger
CREATE TRIGGER trg_InsertEmployee
ON Employees
AFTER INSERT
AS
BEGIN
INSERT INTO Employee_Audit
SELECT EmpID,'INSERT'
FROM inserted;
END;

-- Q19 Test Trigger
INSERT INTO Employees
VALUES(7,'Rohan','Sales',45000,26);

-- Q20 Check Audit Table
SELECT * FROM Employee_Audit;

-- Q21 Delete Trigger
CREATE TRIGGER trg_DeleteEmployee
ON Employees
AFTER DELETE
AS
BEGIN
INSERT INTO Employee_Audit
SELECT EmpID,'DELETE'
FROM deleted;
END;

-- Q22 Test Delete Trigger
DELETE FROM Employees
WHERE EmpID=7;

-- Q23 Update Trigger
CREATE TRIGGER trg_UpdateEmployee
ON Employees
AFTER UPDATE
AS
BEGIN
PRINT 'Employee Updated';
END;

-- Q24 Test Update Trigger
UPDATE Employees
SET Salary=65000
WHERE EmpID=4;

-- Q25 Display All Employees
SELECT * FROM Employees;

