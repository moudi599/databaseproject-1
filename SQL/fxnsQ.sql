

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

CREATE FUNCTION fnApproveRefund (@RID int, @PTG float, @CNB int)
RETURNS int
AS
-- Return the refunded amount if succeeded
BEGIN
DECLARE @Cid int, @Reqid int, @toRefund float;
BEGIN TRAN @T1;

SET @Cid = (SELECT RI_CT_ID FROM TBLRENTINFO WHERE RI_RENT_ID = @RID) --get cid from rentinfo table

-- Tables included : ACCOUNT / REQUEST / RENTINFO
-- Update request status for the request with reqid and cid
UPDATE TBLREQUEST
SET REQ_STATUS = 1
WHERE REQ_CT_ID = @Cid AND REQ_RI_RENT_ID = @RID

-- Transfer money from admin account to customer
set @toRefund = (SELECT RI_AMOUNT FROM TBLRENTINFO 
				 WHERE RI_CT_ID = @Cid AND RI_RENT_ID = @RID) * (@PTG / 100);

UPDATE TBLACCOUNT
SET AC_BALANCE = AC_BALANCE - @toRefund
WHERE AC_CARD_NUMBER = 1 --Admin account
UPDATE TBLACCOUNT
SET AC_BALANCE = AC_BALANCE + @toRefund
WHERE AC_CARD_NUMBER = @CNB

UPDATE TBLREQUEST
SET REQ_CONFIRMDATE = (SELECT GETDATE())
WHERE REQ_CT_ID = @Cid AND REQ_RI_RENT_ID = @RID

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
CREATE FUNCTION fnViewCustAccounts (@Cid int)
RETURNS table
RETURN
	SELECT * FROM TBLACCOUNT WHERE AC_CT_ID = @Cid
GO