-- Create Table
CREATE DATABASE Q;
USE Q;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

-- Insert Data
INSERT INTO Employees (EmpID, Name, Age, Department, Salary, City)
VALUES
(1, 'Amit', 25, 'IT', 40000, 'Pune'),
(2, 'Neha', 30, 'HR', 35000, 'Mumbai'),
(3, 'Ravi', 28, 'IT', 50000, 'Pune'),
(4, 'Priya', 35, 'Finance', 60000, 'Delhi'),
(5, 'Karan', 22, 'HR', 30000, 'Mumbai');

#Display all column from Employees
 Select * from Employees;
 #Display only name, salary.
select Name,Salary from Employees;
#Display only name of Employees.
select Name from Employees;
#Display all departments.
select Department from Employees;
#Display unique department 
select distinct(Department) from Employees;
#Display all City
select distinct(City) from Employees;
#Where Condition
#Find employees from Pune
select * from Employees 
where City="Pune";
#Find employees whose salary is >40000
select * from Employees
where Salary >40000;
#Find employees whose age is less than 30
select * from Employees
where Age<30;
#find employees from Mumbai
select * from Employees
where City="Mumbai";
#Find employees working in it department
select * from Employees 
where Department="IT";
#Find employees whose salary equals 50000
Select * from Employees
where Salary=50000;
#Comparison Operators
Select * from Employees
where Salary>50000;
#AND,OR,NOT
#Employees from pune and it department
select * from Employees
where City="Pune" and Department="IT";
#Employees from Mumbai or Delhi
select * from Employees
where City="Mumbai" or City="Delhi";
#Employees whose age <25 and salary>40000
select * from Employees 
where Age<25 and Salary>40000;
#Employees not from pune
select * from Employees
where City!="Pune";
#Employees not in hr Department 
select * from Employees 
where Department !="HR";
#EMPLOYEES FROM PUNRE OR Salary>50000
select * from Employees 
where City="Pune" or Salary>50000;
#Between
#Salary between 30000 and 50000
select * from Employees 
where Salary between 30000 and 50000;
#Age between 25 and 35
select * from Employees
where Age between 25 and 35;
#Salary not between 30000 and 50000
select * from Employees
where Salary not between 30000 and 50000;
#Employees ids between 2 and 4
select * from Employees
where EmpID between 2 and 4;
#IN Operator 
#Employees from pune or Mumbai
select * from Employees
where City in ("Pune","Mumbai");
#Employees in HR AND IT department
select * from Employees 
where Department in ("HR","T");
#Employees with EmpID 1,3,5
select * from Employees
where EmpID IN (1,3,5);
#Employees not in Finance department
select * from Employees
where Department not in ("Finance");
#LIKE Operator
select * from Employees 
where Name like "a%";
#name endind with a
select * from Employees 
where name like "%a";
#name containing i
select * from Employees 
where Name like "%i%";
#name with second letter m
select * from Employees
where name like "_m%";
#Order by
#Sort salary ascending 
#Sort salary ascending
select * from employeeS
order by salary asc;
#Sort by city and salary 
select * from Employees
order by City and Salary;
#Limit / Top
#Display first 3 employees
select * from Employees
limit 3;
#Display highest paid employee.
select * from Employees 
order by Salary desc 
limit 1;
#Display lowest paid employee.
select * from Employees
order by Salary 
limit 1;