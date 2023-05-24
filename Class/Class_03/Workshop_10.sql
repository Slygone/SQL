--list all customer ids and sum of prices of all orders made by each customer
CREATE VIEW CustomerOrders
AS
SELECT CustomerId, SUM(TotalPrice) as Price
FROM Orders
GROUP BY CustomerId
GO


SELECT *
FROM CustomerOrders
GO

SELECT CustomerId
FROM CustomerOrders
GO

--change the view to show Customer Names instead of CustomerId
ALTER VIEW CustomerOrders
AS
SELECT c.[Name], SUM(o.TotalPrice) AS Price
FROM Customers c
INNER JOIN Orders o
on o.CustomerId = c.Id
GROUP BY c.[Name]
GO

SELECT *
FROM CustomerOrders
GO

--Change the view to show the ruslts ordered by the customer with biggest total price
-- THIS WILL GIVE AN ERROR!!! ORDER BY is not allowed
ALTER VIEW CustomerOrders
AS
SELECT c.[Name], SUM(o.TotalPrice) AS Price
FROM Customers c
INNER JOIN Orders o
on o.CustomerId = c.Id
GROUP BY c.[Name]
order by Price desc
GO

--VALID WAY
select *
from CustomerOrders
order by Price desc
go
--CREATE new View (vv_EmployeeOrders) That will list all empoloyees
--frist name last name employee
--and total quanitty they sold

CREATE VIEW vv_EmployeeOrders
AS
SELECT e.FirstName, e.LastName, p.[Name], SUM(od.Quantity) as TotalQuantity
FROM 
Employees e
INNER JOIN Orders o
ON e.Id = o.EmployeeId
INNER JOIN OrderDetails od
ON o.Id = od.OrderId
INNER JOIN Products p 
ON p.Id = od.ProductId
GROUP BY e.FirstName, e.LastName, p.[Name]
GO

SELECT * 
FROM vv_EmployeeOrders
GO
--ALTER THE VIEW TO SHOW ONLY SALES FROM Business enteties belonging to region 'Skopski'

ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName, e.LastName, p.[Name], SUM(od.Quantity) as TotalQuantity
FROM 
Employees e
INNER JOIN Orders o
ON e.Id = o.EmployeeId
INNER JOIN OrderDetails od
ON o.Id = od.OrderId
INNER JOIN Products p 
ON p.Id = od.ProductId
INNER JOIN BusinessEntities be
ON be.Id = o.BusinessEntityId
WHERE be.Region like '%Skopski'
GROUP BY e.FirstName, e.LastName, p.[Name]
GO

SELECT * 
FROM vv_EmployeeOrders
GO 
