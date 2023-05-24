
CREATE TABLE Student (
  ID int identity(1,1),
  FirstName nvarchar(200) null,
  LastName nvarchar(200) null,
  DateOfBirth datetime null,
  EnrolledDate datetime null,
  Gender nvarchar(10) null,
  NationalIDNumber nvarchar(20) null,
  StudentCardNumber nvarchar(20) null
)

CREATE TABLE Teacher (
  ID int identity(1,1),
  FirstName nvarchar(200) null,
  LastName nvarchar(200) null,
  DateOfBirth datetime null,
  AcademicRank nvarchar(50) null,
  HireDate datetime null
);

CREATE TABLE Grade (
  ID int identity(1,1),
  StudentID  int null,
  CourseID int null,
  TeacherID int null,
  Grade int null,
  Comment nvarchar(800) null,
  CreatedDate datetime null,
)

CREATE TABLE Course (
  ID int identity(1,1),
  [Name] nvarchar(200) null,
  Credit int null,
  AcademicYear int null,
  Semester int null,
)

CREATE TABLE GradeDetails (
  ID int identity(1,1),
  GradeID int null,
  AchievementTypeID int null,
  AchievementPoints int null,
  AchievementMaxPoints int null,
  AchievementDate datetime null,
)

CREATE TABLE AchievementType (
  ID int identity(1,1),
  Name nvarchar(200),
  [Description] nvarchar(MAX),
  ParticipationRate int
);

drop table Student
drop table Teacher
drop table Grade
drop table Course
drop table GradeDetails
drop table AchievementType