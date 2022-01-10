

/*===============================================*/
/* VIEWS										 */
/*===============================================*/



/*==============================*/
/* VIEW FOR UNAPPROVED REQUESTS */
/*==============================*/


GO
CREATE VIEW vwUnapprovedRequests
AS
SELECT REQ_CT_ID,REQ_RI_RENT_ID, COUNT(*) AS UNAPPROVED
FROM TBLREQUEST
WHERE REQ_STATUS = 0
GROUP BY REQ_CT_ID, REQ_RI_RENT_ID
GO

SELECT * FROM vwUnapprovedRequests


/*==============================*/
/* VIEW FOR APPROVED REQUESTS   */
/*==============================*/

GO
CREATE VIEW vwApprovedRequests
AS
	SELECT CT_ID, CT_FIRSTNAME, CT_LASTNAME, REQ_RI_RENT_ID
	FROM TBLCUSTOMER, TBLREQUEST
	WHERE REQ_STATUS = 1 AND CT_ID = REQ_CT_ID
GO

SELECT * FROM vwApprovedRequests


/*==============================*/
/* VIEW FOR CUSTOEMR RENT INFO  */
/*==============================*/