SELECT c.Name, a.Name
FROM Course c
CROSS JOIN AchievementType a

--compare teacher id with grade teacher id find those who are not on the list
SELECT t.ID, g.TeacherID
FROM Teacher t
LEFT JOIN Grade g ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL;

SELECT t.ID as TeacherID, COUNT(G.Grade) as GradeCount
FROM Teacher t
INNER JOIN Grade g ON t.ID = g.TeacherID
GROUP BY t.ID

SELECT t.ID AS TeacherID, COUNT(g.Grade) AS GradeCount
FROM Teacher t
INNER JOIN Grade g ON t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.ID

SELECT g.studentId, AVG(g.Grade) as avarageGrade
FROM Grade g
GROUP BY StudentID

SELECT t.ID, t.FirstName, gradeCount
FROM Teacher t
INNER JOIN (
    SELECT TeacherID, COUNT(grade) AS gradeCount
    FROM Grade
    GROUP BY TeacherID
) g ON t.ID = g.TeacherID
WHERE g.gradeCount > 200;

SELECT s.FirstName, s.LastName, g.StudentID, COUNT(g.Grade) as GradeCount, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AvgGrade
FROM Grade g
INNER JOIN Student s ON g.StudentID = s.ID
GROUP BY g.StudentID, s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade);

