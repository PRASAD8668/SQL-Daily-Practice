use Q;
CREATE TABLE Employee (
    EmpID INT,
    Name VARCHAR(50),
    DepartmentID INT
);

INSERT INTO Employee VALUES
(1,'Amit',101),
(2,'Neha',102),
(3,'Ravi',101),
(4,'Priya',103),
(5,'Karan',104);
CREATE TABLE Departments (
    DepartmentID INT,
    DepartmentName VARCHAR(50)
);
INSERT INTO Departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(105,'Marketing');
-- 1. Display employee names with department names
SELECT e.Name, d.DepartmentName
FROM Employee e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- 2. Show all employees and departments using LEFT JOIN
SELECT e.Name, d.DepartmentName
FROM Employee e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- 3. Show all departments even if no employee exists
SELECT e.Name, d.DepartmentName
FROM Employee e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;

-- 4. Find employees without departments
SELECT e.*
FROM Employee e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- 5. Find departments without employees
SELECT d.*
FROM Departments d
LEFT JOIN Employee e
ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID IS NULL;

-- 6. Count employees in each department
SELECT d.DepartmentName, COUNT(*) AS EmployeeCount
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 7. Find average salary by department
SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 8. Find highest salary in each department
SELECT d.DepartmentName, MAX(e.Salary) AS HighestSalary
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 9. Display employee and manager details using SELF JOIN
SELECT e.Name AS Employee, m.Name AS Manager
FROM Employee e
JOIN Employee m
ON e.ManagerID = m.EmpID;

-- 10. Display all combinations using CROSS JOIN
SELECT e.Name, d.DepartmentName
FROM Employee e
CROSS JOIN Departments d;

-- 11. Find employees working in IT
SELECT e.Name
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

-- 12. Find employees not assigned to any department
SELECT e.*
FROM Employee e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- 13. Show departments having more than 2 employees
SELECT d.DepartmentName, COUNT(*) AS EmployeeCount
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(*) > 2;

-- 14. Find total salary by department
SELECT d.DepartmentName, SUM(e.Salary) AS TotalSalary
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 15. Display employee count department-wise
SELECT d.DepartmentName, COUNT(*) AS EmployeeCount
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 16. Find departments with highest average salary
SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AvgSalary DESC;

-- 17. Display employee names and department IDs
SELECT Name, DepartmentID
FROM Employee;

-- 18. Show departments having no employees
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employee e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmpID IS NULL;

-- 19. Find employees whose department starts with 'F'
SELECT e.Name
FROM Employee e
JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE 'F%';

-- 20. List all employee-department combinations
SELECT e.Name, d.DepartmentName
FROM Employee e
CROSS JOIN Departments d;