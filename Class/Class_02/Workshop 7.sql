-- List all Business Entities that has any order

select  be.[Name], o.OrderDate, o.TotalPrice
from BusinessEntities be
inner join Orders o
on o.BusinessEntityId = be.Id

select *
from Orders

--find date and price of all orders made from Vitalia Bitola
select o.OrderDate, o.TotalPrice
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
where be.Name like '%Vitalia Bitola%'

select * 
from Orders o
inner join Employees e
on o.EmployeeId = e.Id
inner join Customers c
on o.CustomerId = c.Id