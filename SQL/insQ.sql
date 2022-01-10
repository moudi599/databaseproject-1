
/*=======================================================================*/
/* INSERTING DATA INTO THE DATABASE                                      */
/*=======================================================================*/

use carrentaldb

/*=========================== INSERTING CUSTOMERS =======================*/


insert into TBLCUSTOMER(ct_firstname, ct_lastname, ct_address, ct_age, ct_email, ct_password)
values
('mohammad', 'ajami', 'beirut', 22, 'mhmhajmi@gmail.com', 'mhmd123'),
('ali', 'younes', 'baalbck', 21, 'alyuns@gmail.com', 'alyns123'),
('rami', 'hammoud', 'sour', 33, 'ramihmd@gmail.com', 'rmsour343'),
('fadi', 'sawan', 'zahle', 29, 'fadiswn@hotmail.com', 'fd12swn34'),
('bilal', 'ahmad', 'hamra', 18, 'bilal@outlook.com', 'bilal1342');


select * from TBLCUSTOMER



/*========================= INSERTING BranchInfo ========================*/



insert into TBLBRANCH (LOC_NAME, LOC_EMAIL, LOC_STREET, LOC_PHONE)
values
('hamra', 'firstbranch@gmail.com', 'aub street', '03 001 002'),
('sin el fil', 'secondbranch@gmail.com', 'conservatiour main road', '03 003 004'),
('beirut', 'thirdbranch@gmail.com', 'hadi nasrallah street', '03 005 006');

select * from TBLBRANCH

/*========================= INSERTING CARSFORRENT =========================*/



insert into TBLCAR (car_loc_id, car_color, car_year, car_model, car_type, car_price_per_day)
values
(200,'blue', 2009, 'bmw', 'jeep', 30.28),
(200,'silver', 2020, 'bmw', 'car', 88.36),
(200,'black', 2017, 'audi', 'car', 57.01),
(201, 'black', 2019, 'toyota', 'car', 66.12),
(201,'white', 2012, 'renault', 'jeep', 26.88),
(202,'silver', 2016, 'mercedes', 'jeep', 40.58),
(202,'yellow', 2018, 'mercedes', 'car', 44.32);

select * from TBLCAR

/*========================== INSERTING INTO CAR INSURANCE =========================*/


insert into TBLINSURANCE (INS_CAR_ID, INS_STARTING_DATE, INS_EXPIRY_DATE, INS_COST)
values
(100,2019-03-21, 2020-6-21, 800),
(100,2020-07-07, 2021-07-07, 800),
(101,2021-04-25, 2022-04-25, 750),
(102,2020-12-06, 2021-12-06, 690);

SELECT * FROM TBLINSURANCE

-- TRIGGER : INSURANCE FOR CARS THAT EXIST AND DOESN'T HAVE AN ACTIVE INSURANCE


/*======================== INSERTING INTO ADMIN =========================*/


insert into TBLADMINST (ADMIN_ID, ADMIN_EMAIL, ADMIN_PASSWORD, ADM_CARD_NB)
values
(3301, 'admin@admin.org', 'adminst123', 1);
 

 SELECT * FROM TBLADMINST

 /*====================== INSERTING INTO RENT =============================*/

insert into TBLRENT
values
(1,100),
(1,101),
(2,102),
(2,103),
(3,103),
(4,101);

select * from TBLRENT

/*=================== INSERTING INTO RENT INFO ===========================*/

insert into TBLRENTINFO (RI_CT_ID, RI_CAR_ID, RI_NB_OF_DAYS, RI_RENTED_DAY, RI_ARR_DATE, RI_ARR_DUE, RI_PENALTY, RI_AMOUNT)
values
(1, 100, 15,'2021-3-14', '2021-3-31', '2021-3-29', 20, 440.45);

select * from TBLRENTINFO



/*======================= INSERTING INTO ACCOUNT ========================*/

insert into TBLACCOUNT (AC_CT_ID, AC_BALANCE)
values
(1, 347.3);

SELECT * FROM TBLACCOUNT

/*=================== INSERTING INTO REQUEST INFO ========================*/


insert into TBLREQUEST (REQ_RI_RENT_ID, REQ_CT_ID, REQ_AC_CARD_NUMBER, REQ_STATUS, REQ_DATE)
values
(2, 1, 1, 1,'2022-1-3 00:00:00');

SELECT * FROM TBLREQUEST




/*======================== END OF INSERTION *=============================*/
