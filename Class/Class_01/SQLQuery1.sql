CREATE DATABASE SEDC

USE SEDC

--when we crate tables we must specify the columns, their types and whether they allow null as value
CREATE TABLE Customer(
Id int IDENTITY(1,1) not null,  --database will generate values for id, starting from 1, always incrementing by 1
[Name] nvarchar(100) not null, 
City nvarchar(200) null, 
)


--read data
SELECT *
FROM dbo.Customer

SELECT [Name], City --Read Name and City for each row
FROM dbo.Customer

--enter data in table
INSERT INTO dbo.Customer([Name], City)
VALUES('Vero', 'Skopje')

INSERT INTO dbo.Customer([Name],City)
VALUES('Kam','Skopje')

INSERT INTO dbo.Customer([Name],City)
VALUES('Tinex','Ohrid'), ('Ramstore', 'Kumanovo')

--edit rows
UPDATE dbo.Customer
SET [Name] = 'Tinex Ohrid'
WHERE [Name] = 'Tinex' --filters the row that we want to update

--UPDATE without WHERE AFFECTS ALL ROWS!!!!!!!!!
DELETE
FROM dbo.Customer
WHERE [Name] = 'Vero'
--UPDATE without WHERE AFFECTS ALL ROWS!!!!!!!!!
DELETE
FROM dbo.Customer