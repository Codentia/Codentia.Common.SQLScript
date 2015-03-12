if exists ( select * from sysobjects where id = object_id('[dbo].[fn_ErrorText]') )
begin
	DROP FUNCTION [dbo].[fn_ErrorText]
end
go

CREATE FUNCTION [dbo].[fn_ErrorText]
	(
	)
	
	RETURNS NVARCHAR(MAX)
AS

/*
	Function		fn_ErrorText

	Description:	Return formatted Error Text using the standard SQL ERROR_..() functions
	

	Arguments:		None

	Called By:		any procedure using an ErrorHandler

	History:		v1.00 - SH 27/07/2008 - Created

*/

BEGIN 
	
		DECLARE @RetVal NVARCHAR(MAX)
		
		SET @RetVal=ERROR_MESSAGE() + ' at line ' + CAST(ERROR_LINE() AS VARCHAR(20)) + ' in ' + ERROR_PROCEDURE() + 
			   ', State: ' + CAST(ERROR_STATE() AS VARCHAR(20)) + ', Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(20)) + ', Error No: '+ CAST(ERROR_NUMBER() AS VARCHAR(20))  

		RETURN @RetVal
END
  
GO
