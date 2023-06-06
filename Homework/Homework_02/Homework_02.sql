SELECT *
FROM AchievementType
SELECT *
FROM Course
SELECT *
FROM Grade
SELECT *
FROM GradeDetails
SELECT *
FROM Student
SELECT *
FROM Teacher

--Find all Students with FirstName = Antonio
SELECT FirstName
FROM Student 
WHERE FirstName like 'Antonio'
--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT FirstName,LastName, DateOfBirth
FROM Student
WHERE DateOfBirth > '01.01.1999'
--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT FirstName, LastName, EnrolledDate
FROM Student
WHERE LastName LIKE 'J%' AND EnrolledDate >= '01.01.1998' and EnrolledDate <= '01.31.1998'
--List all Students ordered by FirstName
SELECT FirstName
FROM Student
ORDER BY FirstName ASC
--List all Teacher Last Names and Student Last Names in single result set, Remove Duplicates
SELECT FirstName, LastName
FROM Student
UNION
SELECT FirstName , LastName
FROM Teacher
--Add primary keys for each table
ALTER TABLE AchievementType
ADD PRIMARY KEY (ID)

ALTER TABLE Course
ADD PRIMARY KEY (ID)

ALTER TABLE Grade
ADD PRIMARY KEY (ID)

ALTER TABLE GradeDetails 
ADD PRIMARY KEY (ID)

ALTER TABLE Student
ADD PRIMARY KEY (ID)

ALTER TABLE Teacher
ADD PRIMARY KEY (ID)
--Create Foreign key constraints as needed

--student ID
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES Student (ID)

--course ID
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID)
REFERENCES Course (ID)

--teacher ID
ALTER TABLE Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID)
REFERENCES Teacher (ID)

--grade ID
ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID)
REFERENCES Grade (ID)

--achievement type ID
ALTER TABLE GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID)
REFERENCES AchievementType (ID)
