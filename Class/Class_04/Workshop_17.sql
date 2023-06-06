CREATE PROCEDURE FindProductsByName
(
	@ProductName nvarchar(300),
	@Count INT OUT,
	@TotalPrice decimal (18,2) OUT
)
AS
BEGIN

SELECT @Count = COUNT(*)
FROM Products 
Where [Name] like '%' + @ProductName + '%'

--returns the number of rows affected by last statment
SELECT @Count = @@ROWCOUNT
SELECT @TotalPrice = SUM(Price)
FROM Products
WHERE [Name] like '%' + @ProductName + '%'
END

DECLARE @TotalPriceOut INT
DECLARE @NumOfAffectedRows INT
EXEC FindProductsByName @ProductName = 'Gluten Free', @Count = @NumOfAffectedRows OUT, @TotalPrice = @TotalPriceOut

SELECT @NumOfAffectedRows, @TotalPriceOut