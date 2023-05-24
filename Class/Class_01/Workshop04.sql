--Change Product table always to insert value 1 in the price column if no price is provided on insert
--we need DEFAULT constraint
ALTER TABLE Products
ADD CONSTRAINT DF_Products_Price
DEFAULT 1 FOR Price

INSERT INTO [dbo].[Products]
           ([Code]
           ,[Name]
           ,[Description]
           ,[Weight]
           ,[Cost])
     VALUES
           (
           '111',
           'Test DF',
           'Test DF',
           12.2,
           10
           )
GO


select * 
from Products
where Code = '111'

--Change Products table to prevent inserting price that will more than 2x bigger than the cost price

ALTER TABLE Products
ADD CONSTRAINT CHK_Products_Price
CHECK (Price <= 2*Cost)

--this will fail because of the CHECK constraint
--INSERT INTO [dbo].[Products]
--           ([Code]
--           ,[Name]
--           ,[Description]
--           ,[Weight],
--		   [Price]
--           ,[Cost])
--     VALUES
--           (
--           '111',
--           'Test DF',
--           'Test DF',
--           12.2,
--		   100,
--           10
--           )
--GO
--change Products Table to guarantee unique names across the products
ALTER TABLE Products
ADD CONSTRAINT UC_Products_Name
UNIQUE ([Name])
--this will fail because of UNIQUE Constraint
--UPDATE Products
--Set [Name] = 'Crunchy'
--Where [Name] = 'Granola'

--if you add two products with code 111 this constraint won't succeed
--ALTER TABLE Products
--ADD CONSTRAINT UC_Products_Code
--UNIQUE (Code)
