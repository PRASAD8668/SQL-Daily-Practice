-- Create Table

CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employees VALUES
(1,'Amit','IT',40000),
(2,'Neha','HR',35000),
(3,'Ravi','IT',50000),
(4,'Priya','Finance',60000),
(5,'Karan','HR',30000);

--------------------------------------------------
-- VIEWS
--------------------------------------------------

-- 1. Create View
CREATE VIEW Emp_View AS
SELECT Name, Department, Salary
FROM Employees;

-- 2. Display View
SELECT * FROM Emp_View;

-- 3. Create IT View
CREATE VIEW IT_View AS
SELECT *
FROM Employees
WHERE Department='IT';

-- 4. Display IT View
SELECT * FROM IT_View;

-- 5. Drop View
DROP VIEW IT_View;

--------------------------------------------------
-- INDEXES
--------------------------------------------------

-- 6. Create Index on Name
CREATE INDEX idx_name
ON Employees(Name);

-- 7. Create Index on Department
CREATE INDEX idx_dept
ON Employees(Department);

-- 8. Create Composite Index
CREATE INDEX idx_dept_salary
ON Employees(Department, Salary);

-- 9. Search Using Indexed Column
SELECT *
FROM Employees
WHERE Name='Amit';

-- 10. Drop Index
DROP INDEX idx_name;

--------------------------------------------------
-- STORED PROCEDURES
--------------------------------------------------

-- 11. Create Procedure
CREATE PROCEDURE GetEmployees
AS
BEGIN
SELECT * FROM Employees;
END;

-- 12. Execute Procedure
EXEC GetEmployees;

-- 13. Create Department Procedure
CREATE PROCEDURE GetITEmployees
AS
BEGIN
SELECT *
FROM Employees
WHERE Department='IT';
END;

-- 14. Execute IT Procedure
EXEC GetITEmployees;

-- 15. Procedure With Parameter
CREATE PROCEDURE GetEmployeeByID
@EmpID INT
AS
BEGIN
SELECT *
FROM Employees
WHERE EmpID=@EmpID;
END;

-- 16. Execute Parameter Procedure
EXEC GetEmployeeByID 3;

--------------------------------------------------
-- TRIGGERS
--------------------------------------------------

-- 17. Create Audit Table
CREATE TABLE AuditLog (
EmpID INT,
ActionType VARCHAR(20)
);

-- 18. Insert Trigger
CREATE TRIGGER trg_Insert
ON Employees
AFTER INSERT
AS
BEGIN
INSERT INTO AuditLog
SELECT EmpID,'INSERT'
FROM inserted;
END;

-- 19. Test Insert Trigger
INSERT INTO Employees
VALUES(6,'Rahul','IT',55000);

-- 20. View Audit Data
SELECT * FROM AuditLog;

-- 21. Delete Trigger
CREATE TRIGGER trg_Delete
ON Employees
AFTER DELETE
AS
BEGIN
INSERT INTO AuditLog
SELECT EmpID,'DELETE'
FROM deleted;
END;

-- 22. Test Delete Trigger
DELETE FROM Employees
WHERE EmpID=6;

-- 23. Update Trigger
CREATE TRIGGER trg_Update
ON Employees
AFTER UPDATE
AS
BEGIN
PRINT 'Record Updated';
END;

-- 24. Test Update Trigger
UPDATE Employees
SET Salary=65000
WHERE EmpID=4;

-- 25. Display Final Table
SELECT * FROM Employees;