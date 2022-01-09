

/*===============================================*/
/* FUNCTIONS                                     */
/*===============================================*/



USE carrentaldb


/*
FXN INPUT : Rental ID, Refund percentage
FXN OUTPUT: Amount refunded
FXN to approve and carry out a refund transaction
*/


DECLARE @T1 VARCHAR(20);
SELECT @T1 = 'RefundTransaction';
GO

CREATE FUNCTION APP_REFUND_REQ (@RID int, @PTG float, @CNB int)
RETURNS int
AS
-- Return the refunded amount if succeeded
BEGIN
DECLARE @Cid int, @Reqid int, @toRefund float;
BEGIN TRAN @T1;

SET @Cid = (SELECT CT_ID FROM RENTINFO WHERE RENT_ID = @RID) --get cid from rentinfo table

-- Tables included : ACCOUNT / REQUEST / RENTINFO
-- Update request status for the request with reqid and cid
UPDATE REQUEST
SET REQSTATUS = 1
WHERE CT_ID = @Cid AND RENT_ID = @RID

-- Transfer money from admin account to customer
set @toRefund = (SELECT AMOUNT FROM RENTINFO 
				 WHERE CT_ID = @Cid AND RENT_ID = @RID) * (@PTG / 100);

UPDATE ACCOUNT
SET BALANCE = BALANCE - @toRefund
WHERE CARD_NUMBER = 1 --Admin account
UPDATE ACCOUNT
SET BALANCE = BALANCE + @toRefund
WHERE CARD_NUMBER = @CNB

UPDATE REQUEST
SET REQCONFIRMDATE = (SELECT GETDATE())
WHERE CT_ID = @Cid AND RENT_ID = @RID

-- delete from REQUEST table according to RENT_ID
-- deleting according to REQID may not delete all refund requests
-- one or more requests may have same RENT_ID , but they'll have different REQID


COMMIT TRAN T1

RETURN @toRefund
END
GO

---- END OF TRANSACTION AND APPROVAL





/* FXN INPUT : Customer id
   FXN OUTPUT: His accounts
*/

GO
ALTER FUNCTION ViewCustAccounts (@Cid int)
RETURNS table
RETURN
	SELECT * FROM ACCOUNT WHERE CT_ID = @Cid
GO