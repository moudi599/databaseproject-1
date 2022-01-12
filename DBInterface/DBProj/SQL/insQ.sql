
/*=======================================================================*/
/* INSERTING DATA INTO THE DATABASE										 */
/*=======================================================================*/



/*=========================== INSERTING CUSTOMERS =======================*/


insert into customer (ct_firstname, ct_lastname, ct_address, ct_age, ct_email, ct_password)
values
('mohammad', 'ajami', 'beirut', 22, 'mhmhajmi@gmail.com', 'mhmd123'),
('ali', 'younes', 'baalbck', 21, 'alyuns@gmail.com', 'alyns123'),
('rami', 'hammoud', 'sour', 33, 'ramihmd@gmail.com', 'rmsour343'),
('fadi', 'sawan', 'zahle', 29, 'fadiswn@hotmail.com', 'fd12swn34'),
('bilal', 'ahmad', 'hamra', 18, 'bilal@outlook.com', 'bilal1342');


select * from CUSTOMER



/*========================= INSERTING BranchInfo ========================*/



insert into Branch
values
('hamra', 'firstbranch@gmail.com', 'aub street', '03 001 002'),
('sin el fil', 'secondbranch@gmail.com', 'conservatiour main road', '03 003 004'),
('beirut', 'thirdbranch@gmail.com', 'hadi nasrallah street', '03 005 006');

select * from Branch

/*========================= INSERTING CARSFORRENT =========================*/



insert into Car (loc_id, car_color, car_year, car_model, car_type, price_per_day)
values
(1,'blue', 2009, 'bmw', 'jeep', 30.28),
(1,'silver', 2020, 'bmw', 'car', 88.36),
(2,'black', 2017, 'audi', 'car', 57.01),
(2, 'black', 2019, 'toyota', 'car', 66.12),
(3,'white', 2012, 'renault', 'jeep', 26.88),
(3,'silver', 2016, 'mercedes', 'jeep', 40.58),
(3,'yellow', 2018, 'mercedes', 'car', 44.32);

select * from Car

/*========================== INSERTING INTO CAR INSURANCE =========================*/


insert into Insurance (CAR_ID, INS_STARTING_DATE, INS_EXPIRY_DATE, INS_COST)
values
(1,2019-03-21, 2020-6-21, 800),
(2,2020-07-07, 2021-07-07, 800),
(3,2021-04-25, 2022-04-25, 750),
(4,2020-12-06, 2021-12-06, 690);

SELECT * FROM INSURANCE

-- TRIGGER : INSURANCE FOR CARS THAT EXIST AND DOESN'T HAVE AN ACTIVE INSURANCE


/*======================== INSERTING INTO ADMIN =========================*/


insert into adminst (EMP_NAME, EMP_PHONE, EMP_ADDRESS, EMP_AGE, EMP_EMAIL, EMP_PASSWORD)
values
('maher', '71 324 435','beirut', 42, 'admin@admin.org', 'admin1234');
 

 SELECT * FROM ADMINST

 /*====================== INSERTING INTO RENT =============================*/

insert into RENT
values
(1,2),
(1,3),
(2,1),
(2,2),
(3,1),
(4,4);

select * from RENT

/*=================== INSERTING INTO RENT INFO ===========================*/

insert into RENTINFO (CT_ID, CAR_ID, NB_OF_DAYS, RENTED_DAY, ARR_DATE, ARR_DUE, PENALTY, AMOUNT)
values
(2, 15, '2021-3-14', '2021-3-31', '2021-3-29', 20, 440.45);

select * from RENTINFO


/*=================== INSERTING INTO REQUEST INFO ========================*/


insert into REQUEST (EMP_ID, RENT_ID, CT_ID, REQSTATUS, REQDATE)
values
(1, 2, 1, 1, '2022-1-3 00:00:00'), 
(1, 2, 1, 0, '2021-7-21 12:33:44'),
(1, 2, 1, 0, '2021-2-13 12:33:44'),
(1, 2, 1, 0, '2021-3-6 12:33:44'),
(1, 3, 1, 0, '2021-11-13 12:33:44'),
(1, 3, 2, 0, '2021-12-21 12:33:44'),
(1, 4, 3, 0, '2021-7-4 12:33:44'),
(1, 4, 3, 0, '2021-5-5 12:33:44');

SELECT * FROM REQUEST

delete from REQUEST where REQSTATUS = 1
--remove emp id because no one else can approve
delete from request where REQID  > 0
/*======================== END OF INSERTION *=============================*/
