CREATE PROCEDURE TestStoredProcedure 
(
	@First as INT = 0, --we can add a default value by adding = value
	@Second as INT = 1,
	@Third as nvarchar(10) = 'Test'
)
AS 
BEGIN 
	PRINT 'FIRST'
	PRINT @First
	PRINT 'SECOND'
	PRINT @Second
	PRINT 'THIRD'
	PRINT @Third
END

--default values for parameters
EXEC TestStoredProcedure
EXEC TestStoredProcedure
EXEC TestStoredProcedure

EXEC TestStoredProcedure 1,5,'Hello'

DECLARE @ReturnValue INT

EXEC @ReturnValue = TestStoredProcedure

SELECT @ReturnValue as Return_Value 