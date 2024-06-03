use DBEmp

select count(*) from employee.employees
--300024
select count(distinct emp_no) from employee.employees
--300024
select count(distinct birth_date) from employee.employees
--4750
select count(distinct hire_date) from employee.employees
--5434


--TABLE salaries
select count(*) from employee.salaries
--2844047
select count(distinct emp_no) from employee.salaries
--300024
select s.emp_no, sum(s.salary) from employee.salaries s
group by s.emp_no
order by s.emp_no
--
--no of salaries and to_date of each employee
select s.emp_no, count(s.salary) as "CountSalary", count(s.to_date) as "CountTo_date" from employee.salaries s
group by s.emp_no
order by s.emp_no
--
--getting salary, to_date each employee
select s.emp_no, s.salary, s.to_date from employee.salaries s
order by s.emp_no
--
--getting all details with to_date(recent) each employee
select * from employee.salaries s
order by s.emp_no, s.to_date desc
--
select s.to_date from employee.salaries s
where s.emp_no = 10001
--
--emp and its max to_date
select s.emp_no, max(s.to_date) from employee.salaries s
group by s.emp_no
order by s.emp_no
--







--TABLE titles
select count(*) from employee.titles
--443308
select count(distinct emp_no) from employee.titles
--300024
--
--no of titles of each employee
select t.emp_no, count(t.title) from employee.titles t
group by t.emp_no
order by t.emp_no
--
--getting all details with to_date(recent) each employee
select * from employee.titles t
order by t.emp_no, t.to_date desc
--###########################
--emp and its max to_date
select t.emp_no, max(t.to_date) from employee.titles t
group by t.emp_no
order by t.emp_no
--###########################





--TABLE dept_emp
select count(*) from employee.dept_emp
--331603
select count(distinct emp_no) from employee.dept_emp
--300024
--
--getting all details with to_date(recent) each employee
select * from employee.dept_emp e
order by e.emp_no, e.to_date desc





--TABLE dept_manager
select count(*) from employee.dept_manager
--24
select count(distinct dept_no) from employee.dept_manager
--9
select count(distinct emp_no) from employee.dept_manager
--24
--
--getting all details with to_date(recent) each employee
select * from employee.dept_manager m
order by m.dept_no, m.to_date desc
--
--dept_no and its max to_date
select m.dept_no, max(m.to_date) from employee.dept_manager m
group by m.dept_no
--###########################ERROR
--emp_no, dept_no and its max to_date
select m.dept_no, m.emp_no, max(m.to_date) from employee.dept_manager m
group by m.dept_no, m.emp_no
order by m.dept_no
--###########################




--TABLE DimCLient
--checking for repeating EmpNo
use dw
SELECT e.EmpNo, COUNT(*)
FROM [DWEmp].[dbo].[DimEmp] e
GROUP BY e.EmpNo
HAVING COUNT(*) > 1

--TABLE FactTable
select count(*) FROM [dw].[dbo].[FactSalary]
--
SELECT TOP (1000) [empNo]
      ,[deptNo]
      ,[calendarKey]
      ,[salary]
  FROM [dw].[dbo].[FactSalary]
--checking for repeating EmpNo
use dw
SELECT f.EmpNo, COUNT(*) as repeats
FROM [dw].[dbo].[FactSalary] f
GROUP BY f.EmpNo
HAVING COUNT(*) > 1
--
use dw
SELECT f.EmpNo, f.calendarKey, f.salary, COUNT(*) as repeats
FROM [dw].[dbo].[FactSalary] f
GROUP BY f.EmpNo, f.calendarKey, f.salary
HAVING COUNT(*) > 1
ORDER BY f.EmpNo
--

--TABLE FactTableClean
select count(*) FROM [dw].[dbo].[FactSalaryClean]
