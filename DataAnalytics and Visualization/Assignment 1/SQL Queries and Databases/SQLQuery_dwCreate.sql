create database Employee_DW
go

create table Calendar_Dimension
( calenderKey int not null identity,
fullDate datetime,						--from employees table : hire_date and birth_date
monthOfDate char(10),
quarterOfDate char(2),
yearOfDate int,
PRIMARY KEY (calenderKey)
);
go
--(DATEPART("qq",date) == 1 ? "Q1" : DATEPART("qq",date) == 2 ? "Q2" : DATEPART("qq",date) == 3 ? "Q3" : DATEPART("qq",date) == 4 ? "Q4" : "")

create table Employee_Dimension
( empNo int not null identity,		--from employees table
firstName nvarchar(50),				--from employees table
lastName nvarchar(50),				--from employees table
gender nvarchar(50),					--from employees table
birthDate date,						--from employees table
hiredDate date,						--from employees table
title nvarchar(50),					--from titles table WITH RECENT to_date
PRIMARY KEY (empNo)
);
go

create table Department_Dimension
(deptNo nvarchar(255) not null ,
deptName nvarchar(50),
PRIMARY KEY (deptNo) 
);
go

create table Salary_Fact
( 
empNo int null,						--from DimEmp
deptNo nvarchar(255),				--from DimDept
calenderKey int null,					--from DimCalender
salary int,							--from salaries table WITH RECENT to_date
PRIMARY KEY (empNo,deptNo,calenderKey),
foreign key (empNo) references Employee_Dimension(empNo),
foreign key (deptNo) references Department_Dimension(deptNo),
foreign key (calenderKey) references Calendar_Dimension(calenderKey),
);
go

create table titles
(empNo int not null identity,
title nvarchar(50),
from_Date date,	
to_Date date,	
PRIMARY KEY (empNo) 
);
go