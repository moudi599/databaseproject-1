

/*===============================================*/
/* VIEWS										 */
/*===============================================*/



/*==============================*/
/* VIEW FOR UNAPPROVED REQUESTS */
/*==============================*/


GO
ALTER VIEW UNAPPROVED_REQUESTS
AS
SELECT CT_ID, RENT_ID, COUNT(*) AS UNAPPROVED
FROM REQUEST
WHERE REQSTATUS = 0
GROUP BY CT_ID, RENT_ID
GO

SELECT * FROM UNAPPROVED_REQUESTS


/*==============================*/
/* VIEW FOR APPROVED REQUESTS   */
/*==============================*/
GO
ALTER VIEW APPROVED_REQUESTS
AS
SELECT C.CT_ID, C.CT_FIRSTNAME, C.CT_LASTNAME, RENT_ID
FROM CUSTOMER AS C , REQUEST AS R
WHERE REQSTATUS = 1 AND C.CT_ID = R.CT_ID
GO

SELECT * FROM APPROVED_REQUESTS




/*==============================*/
/* VIEW FOR CUSTOEMR RENT INFO  */
/*==============================*/



