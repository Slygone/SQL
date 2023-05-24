--List all possible combinations of Customer names and Product names that can be ordered from specific customer
select *
from Customers c
cross join Products p
order by c.Name

select c.Name , p.Name
from Customers c
cross join Products p
order by c.Name

--take all possible product for eurofarm Bitola
select c.Name, p.Name
from Customers c
cross join Products p
where c.Name like 'Eurofarm Bitola'

