CREATE PROCEDURE CreateOrder
(
	@CustomerId INT,
	@EmployeeId INT,
	@BusinessEntityId INT,
	@Status smallint,
	@OrderDate Date,
	@OrderCount INT OUT,
	@OrdersAmount Decimal(18,2) OUT
)
AS
BEGIN


SELECT @OrderCount = COUNT(*)
FROM Orders
WHERE CustomerId = @CustomerId

SELECT @OrdersAmount = SUM(TotalPrice)
FROM Orders
WHERE CustomerId = @CustomerId AND BusinessEntityId = @BusinessEntityId

INSERT INTO Orders(CustomerId,EmployeeId, BusinessEntityId, [Status], OrderDate)
VALUES(@CustomerId, @EmployeeId,@BusinessEntityId, @Status,@OrderDate)

END