

/*===============================================*/
/* FUNCTIONS									 */
/*===============================================*/



USE carrentaldb


/*
FXN INPUT : Customer ID, Rental ID, Refund percentage
FXN OUTPUT: Amount refunded
FXN to approve and carry out a refund transaction
*/


DECLARE @T1 VARCHAR(20);
SELECT @T1 = 'RefundTransaction';
GO

CREATE FUNCTION APP_REFUND_REQ (@CID int, @RID int, @PTG float, @CNB int)
RETURNS int
AS
-- Return the refunded amount if succeeded
BEGIN
DECLARE @toRefund float;
BEGIN TRAN @T1;

-- Tables included : ACCOUNT / REQUEST / RENTINFO
UPDATE REQUEST
SET REQSTATUS = 1
WHERE CT_ID = @CID AND RENT_ID = @RID

-- Transfer money from admin account to customer
set @toRefund = (SELECT AMOUNT FROM RENTINFO 
				 WHERE CT_ID = @CID AND RENT_ID = @RID) * @PTG;

UPDATE ACCOUNT
SET BALANCE = BALANCE - @toRefund
WHERE CARD_NUMBER = 1 --Admin account
UPDATE ACCOUNT
SET BALANCE = BALANCE + @toRefund
WHERE CARD_NUMBER = @CNB

COMMIT TRAN T1

RETURN @toRefund
END


---- END OF TRANSACTION AND APPROVAL


