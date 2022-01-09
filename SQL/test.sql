
/*====================================*/
/*TESTING                             */
/*====================================*/




USE carrentaldb


SELECT * FROM UNAPPROVED_REQUESTS

/* INTENT : Initaiting a request */

/* FLOW:
		1.  customer initaite refund request
			spInitRequest @Email, @Rent_id executed
				a. new row is inserted to REQUEST table
*/


EXEC spInitRequest 5, 'mhmhajmi@gmail.com' -- REQUSET SHOULD BE ABORTED DUE TO INVALID RENT_ID FOR CUSTOMER