CREATE PROCEDURE CreateGrade(@StudentId int, @CourseId int, @TeacherId int,@CreatedDate date, @Grade int)
AS
BEGIN
	INSERT INTO Grade(StudentID, CourseID, TeacherID, CreatedDate, Grade)
	VALUES(@StudentId, @CourseId, @TeacherId, @CreatedDate, @Grade)

	SELECT COUNT(*) AS TotalGradesForStudents
	FROM Grade 
	WHERE StudentID = @StudentId


	SELECT MAX(Grade) as MAX_GRADE
	FROM Grade
	WHERE StudentID = @StudentId and TeacherID = @TeacherId

END
GO

select *
from Student

EXEC CreateGrade @StudentId = 200, @CourseId = 6, @TeacherId = 80, @CreatedDate = '1990-02-19', @Grade = 7

SELECT * 
FROM Grade
WHERE CreatedDate = '1990-02-19'
GO

ALTER PROCEDURE CreateGradeDetail (@GradeId INT, @AchievementTypeId INT, @AchievementPoints INT, @AchievementMaxPoints INT, @AchievementDate DATETIME)
AS 
BEGIN
	INSERT INTO GradeDetails (GradeId, AchievementTypeId, AchievementPoints, AchievementMaxPoints, AchievementDate)
	VALUES (@GradeId, @AchievementTypeId, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)


	SELECT SUM(AchievementPoints / AchievementMaxPoints * ParticipationRate)
	FROM GradeDetails gd
	INNER JOIN Grade g ON gd.GradeID = g.ID

END
GO

EXEC CreateGradeDetail  @GradeId = 4,@AchievementTypeID=12,@AchievementPoints=81,@AchievementMaxPoints=100,@AchievementDate = '1999-02-02'