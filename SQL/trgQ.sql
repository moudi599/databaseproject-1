

/*===============================================*/
/* TRIGGERS                                      */
/*===============================================*/


USE carrentaldb




/*
	Trigger on RENTINFO Table that acts as a foriegn key constraint
	for each inserted data , it should have a parent in the CAR table
	and a parent in the CUSTOMER table
*/

GO
CREATE TRIGGER trRentInfoInsert
ON TBLRENTINFO FOR INSERT
AS
BEGIN
	DECLARE @CtId int, @CrId int
	
	IF ( exists (SELECT * FROM inserted as ins, TBLCUSTOMER as ct
				WHERE ins.RI_CT_ID = ct.CT_ID) )
		BEGIN
			PRINT '+++ Found match in Customer table +++'

			IF ( exists (SELECT * from inserted as ins, TBLCAR as cr
						WHERE ins.RI_CAR_ID = cr.CAR_ID) )
				BEGIN
					PRINT '+++ Found match in Car table +++'
					PRINT 'Insertion completed with no errors'
				END
			ELSE
				BEGIN
					PRINT '---Cannot find parent in Car table ---'
					PRINT 'Insertion aborted'
					ROLLBACK TRAN
				END
		END
	ELSE
		BEGIN
			PRINT '--- Cannot find parent in Customer table ---'
			PRINT 'Insertion aborted'
			ROLLBACK TRAN
		END
END
GO
