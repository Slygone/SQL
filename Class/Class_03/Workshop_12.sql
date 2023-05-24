DECLARE @FilterFemales BIT
SET @FilterFemales = 1

IF(@FilterFemales <> 1)
SELECT *
FROM Employees

ELSE 
SELECT *
FROM Employees
WHERE Gender = 'F'

--Declare temp table that will contain LastName and HireDate colums
--Fill the temp table with all Male names having First name starting with 'A'

CREATE TABLE #TempTable (
  LastName NVARCHAR(100),
  HireDate DateTime
)

INSERT INTO #TempTable(LastName, HireDate)
Select LastName, HireDate
From Employees
where Gender = 'M' and FirstName like 'A%'

select *
from #TempTable