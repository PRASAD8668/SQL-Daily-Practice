-- Create Table

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

--------------------------------------------------
-- 1. Assign Row Numbers
--------------------------------------------------

SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS RowNum
FROM Employees;

--------------------------------------------------
-- 2. Rank Employees by Salary
--------------------------------------------------

SELECT *,
RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
FROM Employees;

--------------------------------------------------
-- 3. Dense Rank Employees
--------------------------------------------------

SELECT *,
DENSE_RANK() OVER(ORDER BY Salary DESC) AS DenseRank
FROM Employees;

--------------------------------------------------
-- 4. Highest Paid Employee
--------------------------------------------------

WITH CTE AS
(
SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) RN
FROM Employees
)
SELECT *
FROM CTE
WHERE RN=1;

--------------------------------------------------
-- 5. Second Highest Salary
--------------------------------------------------

WITH CTE AS
(
SELECT Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC) DR
FROM Employees
)
SELECT Salary
FROM CTE
WHERE DR=2;

--------------------------------------------------
-- 6. Third Highest Salary
--------------------------------------------------

WITH CTE AS
(
SELECT Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC) DR
FROM Employees
)
SELECT Salary
FROM CTE
WHERE DR=3;

--------------------------------------------------
-- 7. Highest Salary In Each Department
--------------------------------------------------

WITH CTE AS
(
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY Department ORDER BY Salary DESC) RN
FROM Employees
)
SELECT *
FROM CTE
WHERE RN=1;

--------------------------------------------------
-- 8. Second Highest Salary In Each Department
--------------------------------------------------

WITH CTE AS
(
SELECT *,
DENSE_RANK() OVER
(PARTITION BY Department ORDER BY Salary DESC) DR
FROM Employees
)
SELECT *
FROM CTE
WHERE DR=2;

--------------------------------------------------
-- 9. Lowest Salary In Each Department
--------------------------------------------------

WITH CTE AS
(
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY Department ORDER BY Salary) RN
FROM Employees
)
SELECT *
FROM CTE
WHERE RN=1;

--------------------------------------------------
-- 10. Employee Count Department Wise
--------------------------------------------------

WITH DeptCount AS
(
SELECT Department,
COUNT(*) EmpCount
FROM Employees
GROUP BY Department
)
SELECT *
FROM DeptCount;

--------------------------------------------------
-- 11. Average Salary By Department
--------------------------------------------------

WITH AvgSalary AS
(
SELECT Department,
AVG(Salary) AvgSal
FROM Employees
GROUP BY Department
)
SELECT *
FROM AvgSalary;

--------------------------------------------------
-- 12. Total Salary By Department
--------------------------------------------------

WITH TotalSalary AS
(
SELECT Department,
SUM(Salary) TotalSal
FROM Employees
GROUP BY Department
)
SELECT *
FROM TotalSalary;

--------------------------------------------------
-- 13. Employees Above Department Average
--------------------------------------------------

SELECT *
FROM Employees E1
WHERE Salary >
(
SELECT AVG(Salary)
FROM Employees E2
WHERE E1.Department=E2.Department
);

--------------------------------------------------
-- 14. Top 2 Salaries
--------------------------------------------------

WITH CTE AS
(
SELECT Salary,
DENSE_RANK() OVER
(ORDER BY Salary DESC) DR
FROM Employees
)
SELECT *
FROM CTE
WHERE DR<=2;

--------------------------------------------------
-- 15. Top 3 Salaries In Each Department
--------------------------------------------------

WITH CTE AS
(
SELECT *,
DENSE_RANK() OVER
(PARTITION BY Department ORDER BY Salary DESC) DR
FROM Employees
)
SELECT *
FROM CTE
WHERE DR<=3;

--------------------------------------------------
-- 16. Oldest Employee
--------------------------------------------------

SELECT *
FROM Employees
WHERE Age=
(
SELECT MAX(Age)
FROM Employees
);

--------------------------------------------------
-- 17. Youngest Employee
--------------------------------------------------

SELECT *
FROM Employees
WHERE Age=
(
SELECT MIN(Age)
FROM Employees
);

--------------------------------------------------
-- 18. Rank Employees By Age
--------------------------------------------------

SELECT *,
RANK() OVER(ORDER BY Age DESC) AgeRank
FROM Employees;

--------------------------------------------------
-- 19. Department Wise Age Rank
--------------------------------------------------

SELECT *,
ROW_NUMBER() OVER
(
PARTITION BY Department
ORDER BY Age DESC
) AgeRank
FROM Employees;

--------------------------------------------------
-- 20. Duplicate Salaries
--------------------------------------------------

WITH CTE AS
(
SELECT Salary,
COUNT(*) Cnt
FROM Employees
GROUP BY Salary
)
SELECT *
FROM CTE
WHERE Cnt>1;

--------------------------------------------------
-- 21. Department With Highest Average Salary
--------------------------------------------------

WITH CTE AS
(
SELECT Department,
AVG(Salary) AvgSal,
RANK() OVER
(
ORDER BY AVG(Salary) DESC
) RN
FROM Employees
GROUP BY Department
)
SELECT *
FROM CTE
WHERE RN=1;

--------------------------------------------------
-- 22. Salary Difference From Highest Salary
--------------------------------------------------

SELECT Name,
Salary,
(MAX(Salary) OVER())-Salary AS Difference
FROM Employees;

--------------------------------------------------
-- 23. Cumulative Salary Total
--------------------------------------------------

SELECT Name,
Salary,
SUM(Salary) OVER
(
ORDER BY Salary
) AS RunningTotal
FROM Employees;

--------------------------------------------------
-- 24. Running Total Salary
--------------------------------------------------

SELECT Name,
Salary,
SUM(Salary) OVER
(
ORDER BY EmpID
) AS RunningTotal
FROM Employees;

--------------------------------------------------
-- 25. Employees With Rank <= 3
--------------------------------------------------

WITH CTE AS
(
SELECT *,
DENSE_RANK() OVER
(ORDER BY Salary DESC) DR
FROM Employees
)
SELECT *
FROM CTE
WHERE DR<=3;