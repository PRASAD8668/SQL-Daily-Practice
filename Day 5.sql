create database p;
use p;
CREATE TABLE Employees (
    EmpID INT,
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
-- Highest Salary
SELECT * FROM Employees
WHERE Salary=(SELECT MAX(Salary) FROM Employees);

-- Lowest Salary
SELECT * FROM Employees
WHERE Salary=(SELECT MIN(Salary) FROM Employees);

-- Second Highest Salary
SELECT MAX(Salary)
FROM Employees
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

-- Third Highest Salary
SELECT MAX(Salary)
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (SELECT MAX(Salary) FROM Employees)
);

-- Employees Older Than Average Age
SELECT *
FROM Employees
WHERE Age > (SELECT AVG(Age) FROM Employees);

-- Employees Working In Amit's Department
SELECT *
FROM Employees
WHERE Department =
(
    SELECT Department
    FROM Employees
    WHERE Name='Amit'
);