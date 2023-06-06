CREATE PROCEDURE AddNewCustomer
(
	@Name NVARCHAR(200),
	@AccountNumber NVARCHAR(100),
	@Region NVARCHAR(100),
	@IsActive bit
)
AS
BEGIN
--add new customer
INSERT INTO Customers ([Name], AccountNumber, RegionName, IsActive)
VALUES (@Name, @AccountNumber,@Region,@IsActive)

--Total number of customers starting with the same char as the new customer
DECLARE @FirstChar nvarchar(1)
SET @FirstChar = LEFT(@Name,1)

SELECT COUNT(*) TotalCustomerWithSameFirstChar
FROM Customers
WHERE LEFT([Name],1) = @FirstChar

SELECT COUNT(*) TotalCustomerInRegion
FROM Customers
Where @Region = RegionName
END

EXEC AddNewCustomer
@Name = 'Kam Prilep',
@AccountNumber = '111334',
@Region = 'Prilepski',
@IsActive = 1

Select *
from Customers