CREATE FUNCTION ConcatenateFullName
(
    @firstName NVARCHAR(100),
    @lastName NVARCHAR(200)
)
RETURNS NVARCHAR(300)
AS
BEGIN
    DECLARE @fullName NVARCHAR(300)
    SET @fullName = CONCAT(@firstName, ' ', @lastName)
    RETURN @fullName
END

SELECT Id, Firstname, Lastname, dbo.ConcatenateFullName(Firstname, Lastname) AS FullName
FROM Users

GO

CREATE FUNCTION ConcatFullNameFromId
(
	@Id INT
)
RETURNS NVARCHAR(300)
AS
BEGIN
	DECLARE @fullName NVARCHAR(300)(
	SELECT @fullName = CONCAT(firstName, ' ', lastName)
	FROM Users u
	WHERE u.Id = @Id)
	Return @fullName
END

GO

SELECT dbo.ConcatFullNameFromId(1) AS FullName

GO

ALTER VIEW UndeliveredPizzasWithUserNames 
AS
SELECT p.Name AS PizzaName, dbo.ConcatenateFullName(u.Firstname, u.Lastname) AS FullName
FROM Pizzas p
INNER JOIN Orders o ON p.OrderId = o.Id
INNER JOIN Users AS u ON o.UserId = u.Id
WHERE O.IsDelivered = 0;

GO

SELECT *
FROM UndeliveredPizzasWithUserNames;

