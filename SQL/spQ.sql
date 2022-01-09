

/*===============================================*/
/* STORED PROCEDURES							 */
/*===============================================*/

USE carrentaldb;
GO


/*
SP INPUT : CUSTOMER EMAIL , RENTAL ID
SP OUTPUT: NO OUTPUT
SP WORK  : INITAITING A CUSTOMER REFUND REQUEST
*/

ALTER PROC spInitRequest
	@RID	int, 
	@CEMAIL Varchar(256)
AS
	DECLARE @CID int, @RD datetime
	SET @CID = (SELECT CT_ID FROM CUSTOMER WHERE CT_EMAIL = @CEMAIL)
	SET @RD = (SELECT GETDATE())
	INSERT INTO REQUEST (EMP_ID, RENT_ID, CT_ID, REQSTATUS, REQDATE)
	VALUES
	(1, @RID, @CID, 0, @RD);
GO

/*
SP INPUT : NB OF DAYS WANT TO RENT, CUSTOMER EMAIL , CAR ID
SP OUTPUT: NO OUTPUT
SP WORK  : RENT SPECIFIC CAR
*/

CREATE PROC spRentCar
	@CARID	int,
	@DAYS	int,
	@CEMAIL	Varchar(256)
AS
	DECLARE	@CID		int,
			@Date		datetime,
			@Adue		datetime,
			@Total		float
	SET @CID = (SELECT CT_ID FROM CUSTOMER WHERE CT_EMAIL = @CEMAIL)
	SET @Date = (SELECT GETDATE())
	SET @Adue = (DATEADD(DAY, @DAYS, @Date))
	SET @Total = ( (SELECT PRICE_PER_DAY FROM CAR WHERE CAR_ID = @CARID) * @DAYS)
GO


/*
SP INPUT : REQUEST ID
SP OUTPUT: NO OUTPUT
SP WORK  : DELETE ROW SPECIFIED BY REQUEST FROM REQUEST TABLE
*/

ALTER PROC spDeleteRequest
	@RentId	int
AS
	DELETE FROM REQUEST WHERE RENT_ID = @RentId
GO