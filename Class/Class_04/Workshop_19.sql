CREATE PROCEDURE CreateOrderDetails
(
	@OrderId INT,
	@ProductId INT,
	@Quantity INT,
	@Price decimal(18,2)
)
AS
BEGIN
--TODO CREATE NEW ORDER DETAILS
	SELECT *
	FROM OrderDetails
	WHERE OrderId = @OrderId

	INSERT INTO OrderDetails (OrderId, ProductId, Quantity, Price)
    VALUES (@OrderId, @ProductId, @Quantity, @Price);

	SELECT *
	FROM OrderDetails
	WHERE OrderId = @OrderId

--TODO Recalcualte of total price for the given @OrderId
	DECLARE @TotalPrice decimal(18,2);

    SELECT @TotalPrice = SUM(Quantity * Price)
    FROM OrderDetails
    WHERE OrderId = @OrderId;

	SELECT @TotalPrice as TotalPrice

	UPDATE Orders
	SET TotalPrice = @TotalPrice
	WHERE Id = @OrderId
END