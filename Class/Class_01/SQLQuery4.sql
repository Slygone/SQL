CREATE DATABASE SEDC

USE SEDC

CREATE TABLE BusinessEntities(
Id int IDENTITY(1,1) not null,
[Name] nvarchar(200) not null,
[Region] nvarchar(200) not null,
ZipCode nvarchar(10) null,
Size nvarchar(20) null
)

CREATE TABLE Products(
Id int IDENTITY(1,1) not null,
Code nvarchar(50)  not null,
[Name] nvarchar(300) not null,
[Description] nvarchar(max) null,
[Weight] decimal(18,2) null,
Price decimal(18,2) not null,
Cost decimal(18,2) null
)

CREATE TABLE Employees(
Id int IDENTITY(1,1) not null,
FirstName nvarchar(100) not null,
LastName nvarchar(100) not null,
DateOfBirth date null,
Gender nchar(1) not null,
HireDate date not null,
NationalIdNumber nvarchar(20) not null
)

CREATE TABLE Customers(
Id int IDENTITY(1,1) not null,
[Name] nvarchar(200) not null,
AccountNumber nvarchar(100) not null,
City nvarchar(100) null,
RegionName nvarchar(100) null,
Size nvarchar(10) null,
PhoneNumber nvarchar(20) null,
IsActive bit not null --0 -> False, 1 -> True, there is no bool datatype
)

CREATE TABLE Orders(
Id int IDENTITY(1,1) not null,
CustomerId int not null,
EmployeeId int not null,
BusinessEntityId int not null,
[Status] smallint not null,
OrderDate date not null,
Comment nvarchar(max) null,
TotalPrice decimal(18,2) null --left null becuase sometimes we might not need it or get it from another table
)

CREATE TABLE OrderDetails(
Id int IDENTITY(1,1) not null,
OrderId int not null,
ProductId int not null,
Quantity int not null,
Price decimal(18,2) null
)

