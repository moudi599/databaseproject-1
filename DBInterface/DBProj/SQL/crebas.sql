/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     1/8/2022 11:38:46 AM                         */
/*==============================================================*/

use carrentaldb

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT (
   CARD_NUMBER          int			         not null IDENTITY(1,1),
   CT_ID                int                  not null,
   BALANCE              float                null,
   constraint PK_ACCOUNT primary key (CARD_NUMBER)
)
go

/*==============================================================*/
/* Index: HAVEACCOUNT_FK                                        */
/*==============================================================*/




create nonclustered index HAVEACCOUNT_FK on ACCOUNT (CT_ID ASC)
go

/*==============================================================*/
/* Table: ADMINST                                               */
/*==============================================================*/
create table ADMINST (
   EMP_ID               int                  not null IDENTITY(1,1),
   EMP_NAME             varchar(256)         null,
   EMP_PHONE            varchar(256)         null,
   EMP_ADDRESS          varchar(256)         null,
   EMP_AGE              int                  null,
   EMP_EMAIL            varchar(256)         null,
   EMP_PASSWORD         varchar(256)         null,
   constraint PK_ADMINST primary key (EMP_ID)
)
go

/*==============================================================*/
/* Table: BRANCH                                                */
/*==============================================================*/
create table BRANCH (
   LOC_ID               int                  not null IDENTITY(1,1),
   LOC_NAME             varchar(128)         null,
   LOC_EMAIL            varchar(128)         null,
   LOC_STREET           varchar(128)         null,
   LOC_PHONE            varchar(128)         null,
   constraint PK_BRANCH primary key (LOC_ID)
)
go

/*==============================================================*/
/* Table: CAR                                                   */
/*==============================================================*/
create table CAR (
   CAR_ID               int                  not null IDENTITY(1,1),
   LOC_ID               int                  not null,
   CAR_COLOR            varchar(256)         null,
   CAR_YEAR             int                  null,
   CAR_MODEL            varchar(256)         null,
   CAR_TYPE             varchar(256)         null,
   RENTED_STATUS        bit                  null,
   PRICE_PER_DAY        float                null,
   RC_PENALTY_PER_DAY   float                null,
   constraint PK_CAR primary key (CAR_ID)
)
go

/*==============================================================*/
/* Index: LOCATED_FK                                            */
/*==============================================================*/




create nonclustered index LOCATED_FK on CAR (LOC_ID ASC)
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CT_ID                int                  not null IDENTITY(1,1), 
   CT_FIRSTNAME         varchar(256)         null,
   CT_LASTNAME          varchar(256)         null,
   CT_ADDRESS           varchar(256)         null,
   CT_AGE               int                  null,
   CT_EMAIL             varchar(256)         null,
   CT_PASSWORD          varchar(256)         null,
   CT_PREMUIM           bit                  null,
   constraint PK_CUSTOMER primary key (CT_ID)
)
go

/*==============================================================*/
/* Table: INSURANCE                                             */
/*==============================================================*/
create table INSURANCE (
   INS_ID               int                  not null IDENTITY(1,1),
   CAR_ID               int                  not null,
   INS_STARTING_DATE    datetime             null,
   INS_EXPIRY_DATE      datetime             null,
   INS_COST             float                null,
   constraint PK_INSURANCE primary key (INS_ID)
)
go

/*==============================================================*/
/* Index: COVERS_FK                                             */
/*==============================================================*/




create nonclustered index COVERS_FK on INSURANCE (CAR_ID ASC)
go

/*==============================================================*/
/* Table: RENT                                                  */
/*==============================================================*/
create table RENT (
   CT_ID                int                  not null,
   CAR_ID               int                  not null,
   constraint PK_RENT primary key (CT_ID, CAR_ID)
)
go

/*==============================================================*/
/* Index: RENT_FK                                               */
/*==============================================================*/




create nonclustered index RENT_FK on RENT (CT_ID ASC)
go

/*==============================================================*/
/* Index: RENT2_FK                                              */
/*==============================================================*/




create nonclustered index RENT2_FK on RENT (CAR_ID ASC)
go

/*==============================================================*/
/* Table: RENTINFO                                              */
/*==============================================================*/
create table RENTINFO (
   RENT_ID              int                  not null IDENTITY(1,1),
   CT_ID                int                  not null,
   CAR_ID               int                  not null,
   NB_OF_DAYS           int                  null,
   RENTED_DAY           datetime             null,
   ARR_DATE             datetime             null,
   ARR_DUE              datetime             null,
   PENALTY              float                null,
   AMOUNT               float                null,
   constraint PK_RENTINFO primary key (RENT_ID)
)
go

/*==============================================================*/
/* Index: HASRENTINFO_FK                                        */
/*==============================================================*/




create nonclustered index HASRENTINFO_FK on RENTINFO (CAR_ID ASC)
go

/*==============================================================*/
/* Index: GETRENTINFO_FK                                        */
/*==============================================================*/




create nonclustered index GETRENTINFO_FK on RENTINFO (CT_ID ASC)
go

/*==============================================================*/
/* Table: REQUEST                                               */
/*==============================================================*/
create table REQUEST (
   REQID                int                  not null IDENTITY(1,1),
   EMP_ID               int                  not null,
   RENT_ID              int                  not null,
   CT_ID                int                  not null,
   REQSTATUS            varchar(30)          null,
   REQDATE              datetime             null,
   REQCONFIRMDATE       datetime             null,
   constraint PK_REQUEST primary key (REQID)
)
go

/*==============================================================*/
/* Index: ASSOCIATION_22_FK                                     */
/*==============================================================*/




create nonclustered index ASSOCIATION_22_FK on REQUEST (CT_ID ASC)
go

/*==============================================================*/
/* Index: HANDLE_FK                                             */
/*==============================================================*/




create nonclustered index HANDLE_FK on REQUEST (EMP_ID ASC)
go

/*==============================================================*/
/* Index: BELONGS_FK                                            */
/*==============================================================*/




create nonclustered index BELONGS_FK on REQUEST (RENT_ID ASC)
go

alter table ACCOUNT
   add constraint FK_ACCOUNT_HAVEACCOU_CUSTOMER foreign key (CT_ID)
      references CUSTOMER (CT_ID)
go

alter table CAR
   add constraint FK_CAR_LOCATED_BRANCH foreign key (LOC_ID)
      references BRANCH (LOC_ID)
go

alter table INSURANCE
   add constraint FK_INSURANC_COVERS_CAR foreign key (CAR_ID)
      references CAR (CAR_ID)
go

alter table RENT
   add constraint FK_RENT_RENT_CUSTOMER foreign key (CT_ID)
      references CUSTOMER (CT_ID)
go

alter table RENT
   add constraint FK_RENT_RENT2_CAR foreign key (CAR_ID)
      references CAR (CAR_ID)
go

alter table RENTINFO
   add constraint FK_RENTINFO_GETRENTIN_CUSTOMER foreign key (CT_ID)
      references CUSTOMER (CT_ID)
go

alter table RENTINFO
   add constraint FK_RENTINFO_HASRENTIN_CAR foreign key (CAR_ID)
      references CAR (CAR_ID)
go

alter table REQUEST
   add constraint FK_REQUEST_ASSOCIATI_CUSTOMER foreign key (CT_ID)
      references CUSTOMER (CT_ID)
go

alter table REQUEST
   add constraint FK_REQUEST_BELONGS_RENTINFO foreign key (RENT_ID)
      references RENTINFO (RENT_ID)
go

alter table REQUEST
   add constraint FK_REQUEST_HANDLE_ADMINST foreign key (EMP_ID)
      references ADMINST (EMP_ID)
go

