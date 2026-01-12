CREATE DATABASE company;
USE company;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Marketing');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    date_of_birth DATE,
    hire_date DATE,
    department_id INT,
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees VALUES
(101, 'Rahul', 'Sharma', 'Male', '1995-06-15', '2021-01-10', 3, 'Data Analyst', 60000, 105),
(102, 'Priya', 'Verma', 'Female', '1997-09-22', '2022-03-18', 4, 'Sales Executive', 45000, 106),
(103, 'Amit', 'Patel', 'Male', '1992-12-05', '2020-07-01', 2, 'Accountant', 55000, 107),
(104, 'Sneha', 'Kulkarni', 'Female', '1998-02-11', '2023-06-12', 5, 'Marketing Analyst', 48000, 108),
(105, 'Vikram', 'Rao', 'Male', '1988-04-20', '2018-09-15', 3, 'IT Manager', 90000, NULL),
(106, 'Neha', 'Singh', 'Female', '1990-08-30', '2019-11-25', 4, 'Sales Manager', 85000, NULL),
(107, 'Ramesh', 'Iyer', 'Male', '1987-01-14', '2017-05-19', 2, 'Finance Manager', 88000, NULL),
(108, 'Anjali', 'Mehta', 'Female', '1989-10-10', '2018-02-08', 5, 'Marketing Manager', 87000, NULL);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO attendance (employee_id, attendance_date, status) VALUES
(101, '2024-12-01', 'Present'),
(102, '2024-12-01', 'Absent'),
(103, '2024-12-01', 'Present'),
(104, '2024-12-01', 'Present'),
(101, '2024-12-02', 'Present');

select * from employees;
select * from attendance;
select * from departments;

select count(*) from employees;
select count(*) from departments;
select count(*) from attendance;

select * from employees
where salary >50000;

select salary
from employees 
order by salary desc
limit 1;

select count(manager_id) from employees;

select salary,
case
when salary < 50000 then "low salary"
when salary < 70000 then "average salary"
else "high salary"
end salary_distribution
from employees; 

#2nd highest salary
select distinct salary from employees
order by salary desc limit 1 offset 1;

select * 
from departments
left join employees 
on departments.department_id = employees.department_id
where job_title > 'Sales Executive';

select * 
from departments
left join employees 
on departments.department_id = employees.department_id
order by  job_title  desc
limit 5;

select * 
from attendance
left join employees 
on attendance.employee_id = employees.employee_id;

select * 
from attendance
left join employees 
on attendance.employee_id = employees.employee_id
where status = "Present";

select * 
from attendance
left join employees 
on attendance.employee_id = employees.employee_id
where status = "absent";

select * 
from employees 
inner join departments
on departments.department_id = employees.department_id
where department_name = "finance"
limit 2;

select distinct department_name
from departments;


select sum(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select avg(salary) from employees;
select distinct(salary) from employees;

#2nd minimum salary
select salary from employees 
order by salary asc limit 1 offset 1;

select * 
from attendance
left join employees 
on attendance.employee_id = employees.employee_id
where department_id ="3";

select 
     d demartments,
     e employees,
     e salary
	from employees e
    join departments d
    ON e.department_id = d.department_id;
    
SELECT 
    d.department_name,
    SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

select 
   d.department_name,
   avg(e.salary) as average_salary
from employees e
join departments d
ON e.department_id = d.department_id
group by d.department_name;

     
select 
   d.department_name,
   max(e.salary) as average_salary
from employees e
join departments d
ON e.department_id = d.department_id
group by d.department_name;

select gender, avg(salary) 
from employees 
group by gender
having avg(salary) > "50000";

select department_id, avg(salary)
from employees 
group by department_id
having avg(salary) > "50000";

# the salary more than average salary
select * from employees 
where salary > (select avg(salary) from employees);

select distinct salary from employees 
order by salary desc limit 1 offset 1;

select department_id, count(*)
from employees 
group by department_id
having count(*) > 1;

select concat(first_name, " " ,last_name) as full_name 
from employees;

SELECT 
 CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
where salary >50000
order by salary desc
limit 5;

select * from employees;

select datediff(hire_date,date_of_birth)
from employees;

select max(salary) from employees;

#2nd  higst salary
select salary from employees 
order by salary desc limit 1 offset 1;

#3rd highest salary
select salary from employees 
order by salary desc limit 1 offset 2;

SELECT  
department_id,
salary,
salary *0/ (SELECT SUM(SALARY) department_id) percentage
FROM department_id;


select salary from employees
order by salary desc limit 1 offset 1;

select * from employees;
select * from departments;
select concat(first_name, " ", last_name) from employees;

select 
      d.department_name,
      sum(e.salary) as total_salary
      from employees e
      join departments d
      on d.department_id = e.department_id
      group by d.department_name;
      
      
select 
   d.department_name,
   avg(e.salary) as average_salary
   from employees e
   join departments d
   on d.department_id = e.department_id
   group by d.department_name;


      