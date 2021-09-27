SELECT @@version

--create table
create table Helloworld
(
  id int identity,
  description varchar(100)
 );
 
--insert row into table
 insert into Helloworld 
 (description)
 values ('helloworld')
 
 
--select all rows from table
SELECT * from Helloworld
 
 
insert into Helloworld 
 (description) values ('hellomars')
 
 SELECT * from Helloworld
 
--count no.of rows in table
SELECT count(*) from Helloworld

--update a row in a table
UPDATE Helloworld set description='hellojupyter' where id=2

SELECT * from Helloworld

--delete a row in table
DELETE from Helloworld where id =2

--select top 10 rows from table
select top 10 * from dbo.Employee order by empname

--select top 10 rows from a column in table
select top 10 [empname] from dbo.Employee
where department='Accounts'
order by empname desc


select top 10 [empname] from dbo.Employee
where department like 'A%'
order by empname desc

select * from Employee

select * from EmployeeDetails

--select columns from two different tables by joining them
select top 5 Employee.*,EmployeeDetails.mobile
from Employee
inner join EmployeeDetails
on Employee.empid=EmployeeDetails.empid
ORDER by Employee.empname


--aliasing the table name
-- join joins along x-axis
SELECT top 5 e.*,ed.mobile as MobileNumber
from Employee e
inner join EmployeeDetails ed
on e.EmpID=ed.empid
order by ed.empname 


-- union joins along y-axis and duplicates are removed 
SELECT empname as EmployeeName,department from Employee
UNION
SELECT city,area from EmployeeDetails


-- union all wont remove duplicates
SELECT empname as EmployeeName from Employee
UNION ALL
SELECT empname from Employee


--Table variables (used mostly in stored procedures)
-- table variables are recommended if less than 100 rows else go for temp table
DECLARE @region as table
(
  RegionId int,
  RegionDescription Nchar(50)
)

insert into @region values (3,'Northern')
Insert into @region VALUES (4,'Southern')

SELECT * from @region

--deletes all rows but not table
--condition can be applied
delete from Helloworld 



--deletes all rows but not table
--condition cant be applied
--identity resets back
--not fire any trigger and no logs for it
truncate TABLE Helloworld


SELECT * from Helloworld


insert into Helloworld values ('hellomars')


print 'helloworld'


SELECT * from Employee
where empname like 'm%'
AND (department='Accounts' or department='It')




SELECT @@version


SELECT @@servername

SELECT @@servicename

SELECT * into hello from Helloworld

SELECT * from hello

select * from Helloworld

begin transaction
UPDATE Helloworld set description='hellomars'
where id =1
ROLLBACK transaction
--rollbacks transaction


--begins transaction
begin transaction
UPDATE Helloworld set description='hellomars'
where id =1
COMMIT transaction
--commits transaction


DECLARE @fakedate as varchar(10)
Declare @realdate as varchar(10)
set @fakedate = 'iamnotadate'
set @realdate='10-02-2020'
SELECT TRY_PARSE(@fakedate as date)
UNION
SELECT TRY_PARSE(@realdate as date)
--try_parse only for strings to int/date 


--try_convert is for all type of possible explicit conversions 
DECLARE @sampletext as varchar(10)
set @sampletext = '123456'
SELECT TRY_CONVERT(int,@sampletext)


--try_cast is syntax same as try_parse and working same as try_convert 
DECLARE @sampletext as varchar(10)
set @sampletext = '123456'
SELECT TRY_CAST(@sampletext as int)
--parse and convert and cast throws error if failedBooks



--user defined table types 
create type Mytable as TABLE
(
  Id int,
  Name varchar(10)
)


--select statement 
select * from Employee

SELECT * from Employee where empid=1

SELECT *from Employee order by empid desc

SELECT department as department,count(*) as [COUNT] FROM Employee GROUP by department
















