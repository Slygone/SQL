--scalar variable (variable that holds one value)
DECLARE @FirstName NVARCHAR(100)
SET @FirstName = 'Aleksandar'

DECLARE @LastName NVARCHAR(100), @Quantity INT
SET @LastName = 'Ivanovski'
SET @Quantity = 10

SELECT * 
FROM Employees 
WHERE FirstName = @FirstName AND LastName = @LastName

--we can declare variable that gets value from a query
DECLARE @FName NVARCHAR(100)
SELECT @FName
 = (SELECT TOP(1) FirstName from Employees)

 Select *
 FROM Employees
 WHERE FirstName = @FName

 --table variables
 DECLARE @FemaleEmployees TABLE
 (EmployeeId int not null, FirstName NVARCHAR(100), LastName NVARCHAR(100))

 INSERT INTO @FemaleEmployees (EmployeeId, FirstName, LastName)
 VALUES(100, 'Petre', 'Petrovski')

 select * from @FemaleEmployees

 INSERT INTO @FemaleEmployees (EmployeeId, FirstName, LastName)
 SELECT Id, FirstName, LastName
 FROM Employees
 where Gender = 'F'

 select *
 FROM @FemaleEmployees

 GO

