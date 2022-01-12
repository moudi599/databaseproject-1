

/*===============================================*/
/* TRIGGERS										 */
/*===============================================*/


USE carrentaldb





/*  
	TRIGGER FOR REQUEST ON INSERT : Do not insert a request for invalid Customer id,
	or invalid Employee id , or rent id.
	In addition , initail request status should be 0 , and initailconfirmation date 
	should be null
*/
	

GO
CREATE TRIGGER TR_REQUEST_INSERT
ON Request
FOR INSERT AS
IF @@ROWCOUNT = 1
BEGIN
	DECLARE @CID int, @RID int, @EID int, @errno int, @errmsg Varchar(256)
	
	SET @CID = (SELECT CT_ID FROM inserted)
	SET @RID = (SELECT RENT_ID FROM inserted)
	SET @EID = (SELECT EMP_ID FROM inserted)

	if (exists (SELECT * FROM inserted as Ins, CUSTOMER as Ct
				 WHERE Ins.CT_ID = Ct.CT_ID )
		and

		exists (SELECT * FROM inserted as Ins, RENTINFO as Rin
				WHERE Ins.RENT_ID = Rin.RENT_ID )
		and

		exists (SELECT * FROM inserted as Ins, ADMINST as Adm
				WHERE Ins.EMP_ID = Adm.EMP_ID )
		and
			   (SELECT REQDATE FROM inserted) is null
		and
			   (SELECT REQSTATUS FROM inserted) = 0
		)
		BEGIN
			print 'Inserted info are consistent'
		END
	ELSE
		BEGIN
			PRINT 'Inconsisted info ... Aborting request initaition'
			SELECT  @errno = 50002,
					@errmsg = 'Parent does not exist in some table'
					GOTO error
		END
		RETURN
error:
	-- raiseerror @errno @errmsg
	rollback transaction
END
GO