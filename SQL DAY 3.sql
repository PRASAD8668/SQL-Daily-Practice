#HAVING Clause + Advanced GROUP BY
#Departments having more than 2 employees
select Department,count(*) as total_emp from Employees
group by Department
having total_emp>2;
#Cities having more than 1 employee
select City,count(*) from Employees 
group by City
having count(*) >1;
#Departments with average salary > 45000
select Department,avg(Salary) as avg_salary from Employees 
group by Department 
having avg_salary> 45000;
#Cities with total salary > 70000
select City ,sum(Salary) as total_salary from Employees
group by City
having total_salary>70000;
#Departments with maximum salary > 60000
select Department, max(salary) as max_salary from Employees 
group by Department
having max_salary>60000;
#Employees with salary > 40000 grouped by department
SELECT Department,
       COUNT(*) AS Employees
FROM Employees
WHERE Salary > 40000
GROUP BY Department;

#Salary > 35000 grouped by City
SELECT City,
       COUNT(*) AS Employee_Count
FROM Employees
WHERE Salary > 35000
GROUP BY City;

#Pune employees grouped by Department
SELECT Department,
       COUNT(*) AS Employee_Count
FROM Employees
WHERE City = 'Pune'
GROUP BY Department;

#Delhi employees grouped by Department
SELECT Department,
       COUNT(*) AS Employee_Count
FROM Employees
WHERE City = 'Delhi'
GROUP BY Department;

#Salary > 45000 and Average Salary > 50000
SELECT Department,
       AVG(Salary) AS Avg_Salary
FROM Employees
WHERE Salary > 45000
GROUP BY Department
HAVING AVG(Salary) > 50000;


#Employee Count by Department and City
SELECT Department,
       City,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department, City;

#Average Salary by Department and City
SELECT Department,
       City,
       AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department, City;

#Maximum Salary by Department and City
SELECT Department,
       City,
       MAX(Salary) AS Max_Salary
FROM Employees
GROUP BY Department, City;

#Minimum Salary by Department and City
SELECT Department,
       City,
       MIN(Salary) AS Min_Salary
FROM Employees
GROUP BY Department, City;

#otal Salary by Department and City
SELECT Department,
       City,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department, City;


#Department with Highest Average Salary
SELECT Department,
       AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary DESC
LIMIT 1;

# City with Highest Total Salary
SELECT City,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY City
ORDER BY Total_Salary DESC
LIMIT 1;

#Department with Lowest Average Salary
SELECT Department,
       AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary ASC
LIMIT 1;

#City with Most Employees
SELECT City,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY City
ORDER BY Employee_Count DESC
LIMIT 1;

#Top 3 Departments by Total Salary
SELECT Department,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
ORDER BY Total_Salary DESC
LIMIT 3;




#Departments having Employee Count > 1
SELECT Department,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 1;

#Cities where Average Salary > 40000
SELECT City,
       AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY City
HAVING AVG(Salary) > 40000;

#Departments whose Total Salary exceeds 80000
SELECT Department,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 80000;
#Cities with Maximum Salary > 50000
SELECT City,
       MAX(Salary) AS Max_Salary
FROM Employees
GROUP BY City
HAVING MAX(Salary) > 50000;

# Departments with Minimum Salary < 35000
SELECT Department,
       MIN(Salary) AS Min_Salary
FROM Employees
GROUP BY Department
HAVING MIN(Salary) < 35000;

#Departments having Average Salary > 40000 and Employee Count > 1
SELECT Department,
       AVG(Salary) AS Avg_Salary,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 40000
   AND COUNT(*) > 1;

#Cities having Total Salary between 70000 and 150000
SELECT City,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY City
HAVING SUM(Salary) BETWEEN 70000 AND 150000;

#Departments with Exactly 2 Employees
SELECT Department,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Department
HAVING COUNT(*) = 2;

# Departments with Total Salary not exceeding 100000
SELECT Department,
       SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) <= 100000;

# Cities where Employee Count < 3
SELECT City,
       COUNT(*) AS Employee_Count
FROM Employees
GROUP BY City
HAVING COUNT(*) < 3;
