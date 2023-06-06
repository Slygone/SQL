--There should be a stored procedure that when provided an order ID
--can return the full price of a whole order (Delivery(Order Price) + all pizza + all toppings)
alter Procedure CalculateOrderPrice
	@OrderId int,
	@TotalPrice decimal(18,2) OUTPUT
as
begin

	select @TotalPrice = Price
	from Orders o
	where o.Id = @OrderId


	select @TotalPrice = @TotalPrice + SUM(p.Price)
	from Pizzas p
	where p.OrderId = @OrderId


	Select @TotalPrice = @TotalPrice + SUM(t.Price)
	from Orders o 
	inner join Pizzas p
	on o.Id = p.OrderId
	inner join PizzaToppings pt
	on p.Id = pt.PizzaId
    inner join Toppings t
	on pt.ToppingId = t.Id
	where p.OrderId = @OrderId

end

Declare @price decimal(18,2)

exec CalculateOrderPrice @OrderId = 2, @TotalPrice = @price output 
 
select @price as TotalPrice

go

--there should be a view that lists pizzas
--by the number of times ordered( Call this view ordered by the most pupular pizza on top)
select *
from Pizzas p 
inner join Orders o
on o.Id = p.OrderId

--There should be a view with users and the amount of pizzas they ordered
select *
from Users

select *
from Pizzas

select *
from Orders

go

alter view UserPizzaAmount 
as
select u.Id, u.Firstname, u.Lastname, count(p.Id) as pizzaCount
from Users u
inner join Orders o
on u.Id = o.UserId
inner join Pizzas p
on p.OrderId = o.Id
group by u.Id, u.Firstname, u.Lastname

go

select*
from UserPizzaAmount

select *
from Users u
inner join Orders o
on u.Id = o.UserId
inner join Pizzas p
on p.OrderId = o.Id
where u.id = 3

select *
from Toppings

create view MostAskedTopping
as
select t.Id, t.Name, count(p.Id) as ToppingCount
from Toppings t
inner join PizzaToppings pt
on t.Id = pt.ToppingId
inner join Pizzas p
on pt.PizzaId = p.Id
group by t.Id, t.Name

select*
from MostAskedTopping