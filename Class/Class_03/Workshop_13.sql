CREATE FUNCTION fv_EmployeeFullName (@EmployeeId int)
RETURNS NVARCHAR (2000)
AS 
BEGIN

DECLARE @FullName NVARCHAR(2000)

SELECT @FullName = 
(SELECT FirstName + N' ' + LastName
FROM Employees
WHERE Id = @EmployeeId)
RETURN @FullName

END
GO

SELECT dbo.fv_EmployeeFullName(1)
GO
--Declare scalar function (fn_FormatProductName) for retreiving Product description for specific ProductId in the following format:
--Second and Third character from the code
--Last Three characters from the Name
--Product Price
ALTER FUNCTION fn_FormatProductName (@ProductId int)
RETURNS NVARCHAR(100)
AS 
BEGIN
    DECLARE @Description NVARCHAR(100)
    
    SELECT @Description = 
	(SELECT SUBSTRING(Code, 2,2) + '-' + RIGHT([Name],3) + '-' + CONVERT(nvarchar(10), price)
	FROM Products
	Where Id = @ProductId
    )
    RETURN @Description
END
GO

select dbo.fn_FormatProductName(1)