--find all regions where we have business entities or we have customers or both
select Region
from BusinessEntities
UNION
select RegionName
from Customers

--find all regions where we have customers and business entities at the same time
select Region
from BusinessEntities
INTERSECT
select RegionName
from Customers


select Region
from BusinessEntities
EXCEPT
select RegionName
from Customers