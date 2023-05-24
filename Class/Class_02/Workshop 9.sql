--Calculate the total amount per BE on all orders in the system
select BusinessEntityId, SUM(TotalPrice),[Status]
from Orders 
group by BusinessEntityId

--Count all orders per customer
Select c.Name, Count(*) as TotalNumOfOrders
from Orders o
inner join Customers c
on c.Id = o.CustomerId
group by c.[Name]

select *
from Orders o
inner join
Customers c
on c.Id = o.CustomerId

--Calculate the total amount per BusinessEntity on all orders in the system from Customer with Id <20
select BusinessEntityId, Sum(TotalPrice) as TotalAmount
from Orders
where CustomerId < 20
group by BusinessEntityId

--Find the Maximal order amount, And the avarage order amount per Business Entity on all orders in the system
Select be.[Name], Max(TotalPrice) as MaxAmount, MIN(TotalPrice) as MinAmount, AVG(TotalPrice) as AvgAmount
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]

--find all entities for which the toal amount is greater than 500.000
select BusinessEntityId, Sum(TotalPrice) as TotalAmount
from Orders
group by BusinessEntityId
having SUM(TotalPrice) > 500000

--Find the Maximal order amount, And the avarage order amount per Business Entity
--on all orders in the system. Filter only records where Total order ammount is more than 4x bifgger than avarage



Select be.[Name], Max(TotalPrice) as MaxAmount, MIN(TotalPrice) as MinAmount, AVG(TotalPrice) as AvgAmount
from Orders o
inner join BusinessEntities be
on o.BusinessEntityId = be.Id
group by be.[Name]
having Max(TotalPrice) > 4 * AVG(TotalPrice)

select ProductId, Count(*) as c
from OrderDetails
group by ProductId
order by c desc