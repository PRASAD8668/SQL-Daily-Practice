-- Create Table
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    Age INT
);

-- Insert Data
INSERT INTO Employees VALUES
(1,'Amit','IT',40000,25),
(2,'Neha','HR',35000,30),
(3,'Ravi','IT',50000,28),
(4,'Priya','Finance',60000,35),
(5,'Karan','HR',30000,22),
(6,'Rahul','IT',55000,31);



-- 1. Employees earning above average salary
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 2. Employees earning below average salary
SELECT * FROM Employees
WHERE Salary < (SELECT AVG(Salary) FROM Employees);

-- 3. Employees older than average age
SELECT * FROM Employees
WHERE Age > (SELECT AVG(Age) FROM Employees);

-- 4. Employees younger than average age
SELECT * FROM Employees
WHERE Age < (SELECT AVG(Age) FROM Employees);

-- 5. Employees earning more than Ravi
SELECT * FROM Employees
WHERE Salary >
(
    SELECT Salary
    FROM Employees
    WHERE Name='Ravi'
);

-- 6. Employees older than Neha
SELECT * FROM Employees
WHERE Age >
(
    SELECT Age
    FROM Employees
    WHERE Name='Neha'
);

-- 7. Employees working in Amit's department
SELECT * FROM Employees
WHERE Department =
(
    SELECT Department
    FROM Employees
    WHERE Name='Amit'
);

-- 8. Employees working in Rahul's department
SELECT * FROM Employees
WHERE Department =
(
    SELECT Department
    FROM Employees
    WHERE Name='Rahul'
);

-- 9. Employees earning highest salary
SELECT * FROM Employees
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employees
);

-- 10. Employees earning lowest salary
SELECT * FROM Employees
WHERE Salary =
(
    SELECT MIN(Salary)
    FROM Employees
);



-- 11. Second-highest salary
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
);

-- 12. Third-highest salary
SELECT MAX(Salary) AS ThirdHighestSalary
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary <
    (
        SELECT MAX(Salary)
        FROM Employees
    )
);

-- 13. Employees earning more than department average
SELECT *
FROM Employees E
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = E.Department
);

-- 14. Employees earning less than department average
SELECT *
FROM Employees E
WHERE Salary <
(
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = E.Department
);

-- 15. Highest-paid employee in each department
SELECT *
FROM Employees E
WHERE Salary =
(
    SELECT MAX(Salary)
    FROM Employees
    WHERE Department = E.Department
);

-- 16. Lowest-paid employee in each department
SELECT *
FROM Employees E
WHERE Salary =
(
    SELECT MIN(Salary)
    FROM Employees
    WHERE Department = E.Department
);

-- 17. Departments having more than 2 employees
SELECT Department
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 2;

-- 18. Departments having average salary > 40000
SELECT Department
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 40000;

-- 19. Departments having average age > 28
SELECT Department
FROM Employees
GROUP BY Department
HAVING AVG(Age) > 28;

-- 20. Employees from departments whose average salary > 45000
SELECT *
FROM Employees
WHERE Department IN
(
    SELECT Department
    FROM Employees
    GROUP BY Department
    HAVING AVG(Salary) > 45000
);


-- 21. Employees whose salary is greater than ALL HR employees
SELECT *
FROM Employees
WHERE Salary > ALL
(
    SELECT Salary
    FROM Employees
    WHERE Department='HR'
);

-- 22. Employees whose salary is greater than ANY HR employee
SELECT *
FROM Employees
WHERE Salary > ANY
(
    SELECT Salary
    FROM Employees
    WHERE Department='HR'
);

-- 23. Department with highest average salary
SELECT Department
FROM Employees
GROUP BY Department
HAVING AVG(Salary) =
(
    SELECT MAX(AvgSal)
    FROM
    (
        SELECT AVG(Salary) AS AvgSal
        FROM Employees
        GROUP BY Department
    ) X
);

-- 24. Employees from department having highest salary
SELECT *
FROM Employees
WHERE Department =
(
    SELECT Department
    FROM Employees
    WHERE Salary =
    (
        SELECT MAX(Salary)
        FROM Employees
    )
);

-- 25. Employees from department having lowest salary
SELECT *
FROM Employees
WHERE Department =
(
    SELECT Department
    FROM Employees
    WHERE Salary =
    (
        SELECT MIN(Salary)
        FROM Employees
    )
);

----------------------------------------------------
-- QUICK INTERVIEW NOTES
----------------------------------------------------

-- What is a Subquery?
-- A query written inside another query.

-- Example:
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);

-- Types of Subqueries

-- 1. Single Row Subquery
SELECT *
FROM Employees
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
);

-- 2. Multiple Row Subquery
SELECT *
FROM Employees
WHERE Department IN
(
    SELECT Department
    FROM Employees
    WHERE Salary > 40000
);

-- 3. Correlated Subquery
SELECT *
FROM Employees E
WHERE Salary >
(
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = E.Department
);