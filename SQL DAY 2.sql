#Aggregate Functions
#Count total employees.
select count(*) from Employees;
#Find maximum salary.
select max(Salary) from Employees;
#Find minimum salary.
select min(Salary) from Employees;
#Find average salary.
select avg(Salary) from Employees;
#Find total salary.
select sum(Salary) from Employees;
#Step 2: Aggregate Functions + GROUP BY
select count(*) from employees;
#Count employees in the IT department.
select count(*) from Employees
where Department="IT";
#Count employees from Pune.
select count(*) from employees
where City="Pune";
#Count employees with salary greater than 40,000
select count(*) from employees 
where Salary>40000;
#Count distinct departments
select count(distinct(Department)) from employees;
#SUM
#Find the total salary of all employees.
select sum(Salary) from Employees;
#Find the total salary of IT employees.
select sum(Salary) from employees
where Department='IT';
#Find the total salary of employees from Mumbai.
select sum(Salary) from Employees
Where City='Mumbai';
#Find the total salary of employees older than 25
select sum(Salary) from Employees
WHERE Age>25;
#AVG
#Find the average salary of all employees.
select avg(Salary) from Employees;
#Find the average age of employees.
select avg(Age) from Employees;
#Find the average salary of HR employees.
select avg(Salary) from Employees
where Department="HR";
#Find the average salary of employees from Pune.
select avg(Salary) from Employees
WHERE City="Pune";
#MAX
#Find the highest salary.
select max(Salary) from  Employees;
#Find the highest age.
select max(Age) from Employees;
#Find the highest salary in the IT department.
select max(Salary) from  Employees
where Department='IT';
#Find the highest salary in Mumbai.
select max(Salary) from  Employees
where City="Mumbai";
#GROUP BY
#Count employees in each department.
select Department,count(*) from Employees
group by Department;
#Count employees in each city.
select City,count(*) from Employees
group by City;
#Find total salary by department.
select Department , sum(Salary) from Employees
group by Department;
#Find total salary by city
select City,count(*) from Employees
group by City;
#Find average salary by department
select Department , avg(Salary) from Employees
group by Department;
#Find average salary by city
select City,avg(Salary) from Employees
group by City;
#Find maximum salary by department.
select Department , max(Salary) from Employees
group by Department;
#Find minimum salary by department.
select Department , min(Salary) from Employees
group by Department;
#Find average age by department
select Department , avg(Age) from Employees
group by Department;
#Count employees in each department and city.
select Department,City,count(*) from Employees
group by Department,City;
#Find total salary for each department and city
select Department,City,sum(Salary) from Employees
group by Department,City;
#Find average salary for each department and city.
select Department,City,avg(Salary) from Employees
group by Department,City;
#Find total salary of employees whose salary > 40,000 grouped by department.
select Department,SUM(Salary) from Employees
 where Salary>40000
 group by Department;
 #Find average salary of employees older than 25 grouped by city
 select City ,avg(Salary) from Employees
 where Age>25
 group by City;
 #Which department has the highest average salary?
 SELECT Department, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY Department
ORDER BY Avg_Salary DESC
LIMIT 1;
#Which city has the most employees?
Select City,count(*) as count_emp from Employees
group by City
order by count_emp desc
limit 1;
#Which department has the highest total salary?
select Department ,sum(Salary) as total_salary from Employees
group by Department
order by total_salary desc
limit 1;
#Which city has the lowest average salary?
select City ,avg(Salary) as avg_salary from Employees
group by City
order by avg_salary 
limit 1;
#Display departments and their employee counts sorted by count descending.
select Department,count(*) as total_emp from Employees
group by Department
order by total_emp desc;
#Display cities and their total salaries sorted descending
select City ,sum(Salary) as total_salary from Employees 
group by City
order by total_salary desc;
#Find departments with more than 1 employee.
select Department,count(*) as total_emp from Employees
group by Department
having total_emp>1;
#Show employee count, average salary, maximum salary, and minimum salary for each department.
select Department,count(*) as total_emp ,avg(Salary),min(Salary),max(Salary) from Employees
group by Department;