--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
create view vv_StudentGrades
as
select StudentID, COUNT(g.Grade) as CountGrade
from Grade g
group by StudentID
GO

--Change the view to show Student First and Last Names instead of StudentID
alter view vv_StudentGrades
as
select s.FirstName as FirstName, s.LastName as LastName, COUNT(g.Grade) as CountGrade
from Grade g
inner join Student s
on g.StudentID = s.ID
group by s.FirstName, s.LastName
go

select *
from vv_StudentGrades
order by CountGrade DESC

--Declare scalar variable for storing FirstName values
declare @FirstName NVARCHAR(200)
--Assign value ‘Antonio’ to the FirstName variable
set @FirstName = 'Antonio'
--Find all Students  having FirstName  same as the variable
select *
from Student
where FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
declare @StudentList table
(StudentId int, StudentName NVARCHAR(200), DateOfBirth date)
insert into @StudentList

select ID, FirstName, DateOfBirth
from Student
where Gender = 'F'

select * 
from @StudentList

--Declare temp table that will contain LastName and EnrolledDate columns
create table #ListOfMaleStudents 
(LastName NVARCHAR(200), EnrolledDate datetime)

insert into #ListOfMaleStudents
--Fill the temp table with all Male students having First Name starting with ‘A’
select LastName, EnrolledDate
from Student
where FirstName like 'A%' and Gender = 'M'
--Retrieve  the students  from the  table which last name  is with 7 characters
select *
from #ListOfMaleStudents
where LEN(LastName) = 7


-- Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName  and LastName are the same
create table #TeacherList
(FirstName NVARCHAR(200), LastName NVARCHAR(200))
insert into #TeacherList

select FirstName, LastName
from Teacher
where SUBSTRING(FirstName,1,3) = SUBSTRING(LastName,1,3) and LEN(FirstName) < 5

select *
from #TeacherList