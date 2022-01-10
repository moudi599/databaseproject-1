/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2016                    */
/* Created on:     1/10/2022 9:27:10 AM                         */
/*==============================================================*/



use carrentaldb

/*==============================================================*/
/* Table: TBLACCOUNT                                            */
/*==============================================================*/
create table TBLACCOUNT (
   AC_CARD_NUMBER       int                  not null IDENTITY(1,1),
   AC_CT_ID             int	                 not null,
   AC_BALANCE           float                null,
   constraint PK_TBLACCOUNT primary key (AC_CARD_NUMBER)
)
go

/*==============================================================*/
/* Index: HAVEACCOUNT_FK                                        */
/*==============================================================*/




create nonclustered index HAVEACCOUNT_FK on TBLACCOUNT (AC_CT_ID ASC)
go

/*==============================================================*/
/* Table: TBLADMINST                                            */
/*==============================================================*/
create table TBLADMINST (
   ADMIN_ID             int                  not null,
   ADMIN_EMAIL          varchar(256)         null,
   ADMIN_PASSWORD       varchar(256)         null,
   ADM_CARD_NB          int                  null,
   constraint PK_TBLADMINST primary key (ADMIN_ID)
)
go

/*==============================================================*/
/* Table: TBLBRANCH                                             */
/*==============================================================*/
create table TBLBRANCH (
   LOC_ID               int                  not null IDENTITY(200,1),
   LOC_NAME             varchar(128)         null,
   LOC_EMAIL            varchar(128)         null,
   LOC_STREET           varchar(128)         null,
   LOC_PHONE            varchar(128)         null,
   constraint PK_TBLBRANCH primary key (LOC_ID)
)
go

/*==============================================================*/
/* Table: TBLCAR                                                */
/*==============================================================*/
create table TBLCAR (
   CAR_ID               int                  not null	IDENTITY(100,1),
   CAR_LOC_ID           int                  not null,
   CAR_COLOR            varchar(256)         null,
   CAR_YEAR             int                  null,
   CAR_MODEL            varchar(256)         null,
   CAR_TYPE             varchar(256)         null,
   CAR_RENTED_STATUS    bit                  null,
   CAR_PRICE_PER_DAY    float                null,
   CAR_PENALTY_PER_DAY  float                null,
   constraint PK_TBLCAR primary key (CAR_ID)
)
go

/*==============================================================*/
/* Index: LOCATED_FK                                            */
/*==============================================================*/




create nonclustered index LOCATED_FK on TBLCAR (CAR_LOC_ID ASC)
go

/*==============================================================*/
/* Table: TBLCUSTOMER                                           */
/*==============================================================*/
create table TBLCUSTOMER (
   CT_ID                int                  not null IDENTITY(1,1),
   CT_FIRSTNAME         varchar(256)         null,
   CT_LASTNAME          varchar(256)         null,
   CT_ADDRESS           varchar(256)         null,
   CT_AGE               int                  null,
   CT_EMAIL             varchar(256)         null,
   CT_PASSWORD          varchar(256)         null,
   CT_PREMUIM           bit                  null,
   constraint PK_TBLCUSTOMER primary key (CT_ID)
)
go

/*==============================================================*/
/* Table: TBLINSURANCE                                          */
/*==============================================================*/
create table TBLINSURANCE (
   INS_ID               int                  not null IDENTITY(200,1),
   INS_CAR_ID           int                  not null,
   INS_STARTING_DATE    datetime             null,
   INS_EXPIRY_DATE      datetime             null,
   INS_COST             float                null,
   constraint PK_TBLINSURANCE primary key (INS_ID)
)
go

/*==============================================================*/
/* Index: COVERS_FK                                             */
/*==============================================================*/




create nonclustered index COVERS_FK on TBLINSURANCE (INS_CAR_ID ASC)
go

/*==============================================================*/
/* Table: TBLRENT                                               */
/*==============================================================*/
create table TBLRENT (
   RT_CT_ID                int                  not null,
   RT_CAR_ID               int                  not null,
   constraint PK_TBLRENT primary key (RT_CT_ID, RT_CAR_ID)
)
go

/*==============================================================*/
/* Index: RENT_FK                                               */
/*==============================================================*/




create nonclustered index RENT_FK on TBLRENT (RT_CT_ID ASC)
go

/*==============================================================*/
/* Index: RENT2_FK                                              */
/*==============================================================*/




create nonclustered index RENT2_FK on TBLRENT (RT_CAR_ID ASC)
go

/*==============================================================*/
/* Table: TBLRENTINFO                                           */
/*==============================================================*/
create table TBLRENTINFO (
   RI_RENT_ID           int                  not null IDENTITY(1,1),
   RI_CT_ID             int                  not null,
   RI_CAR_ID            int                  not null,
   RI_NB_OF_DAYS        int                  null,
   RI_RENTED_DAY        datetime             null,
   RI_ARR_DATE          datetime             null,
   RI_ARR_DUE           datetime             null,
   RI_PENALTY           float                null,
   RI_AMOUNT            float                null,
   constraint PK_TBLRENTINFO primary key (RI_RENT_ID)
)
go

/*==============================================================*/
/* Index: HASRENTINFO_FK                                        */
/*==============================================================*/




create nonclustered index HASRENTINFO_FK on TBLRENTINFO (RI_CAR_ID ASC)
go

/*==============================================================*/
/* Index: GETRENTINFO_FK                                        */
/*==============================================================*/




create nonclustered index GETRENTINFO_FK on TBLRENTINFO (RI_CT_ID ASC)
go

/*==============================================================*/
/* Table: TBLREQUEST                                            */
/*==============================================================*/
create table TBLREQUEST (
   REQ_ID               int                  not null IDENTITY(1,1),
   REQ_RI_RENT_ID       int                  not null,
   REQ_CT_ID            int                  not null,
   REQ_AC_CARD_NUMBER   int                  not null,
   REQ_STATUS           varchar(256)         null,
   REQ_DATE             datetime             null,
   REQ_CONFIRMDATE      datetime             null,
   constraint PK_TBLREQUEST primary key (REQ_ID)
)
go

/*==============================================================*/
/* Index: ASSOCIATION_22_FK                                     */
/*==============================================================*/




create nonclustered index ASSOCIATION_22_FK on TBLREQUEST (REQ_CT_ID ASC)
go

/*==============================================================*/
/* Index: BELONGS_FK                                            */
/*==============================================================*/




create nonclustered index BELONGS_FK on TBLREQUEST (REQ_RI_RENT_ID ASC)
go

/*==============================================================*/
/* Index: REFUNDED_FK                                           */
/*==============================================================*/




create nonclustered index REFUNDED_FK on TBLREQUEST (REQ_AC_CARD_NUMBER ASC)
go

alter table TBLACCOUNT
   add constraint FK_TBLACCOU_HAVEACCOU_TBLCUSTO foreign key (AC_CT_ID)
      references TBLCUSTOMER (CT_ID)
go

alter table TBLCAR
   add constraint FK_TBLCAR_LOCATED_TBLBRANC foreign key (CAR_LOC_ID)
      references TBLBRANCH (LOC_ID)
go

alter table TBLINSURANCE
   add constraint FK_TBLINSUR_COVERS_TBLCAR foreign key (INS_CAR_ID)
      references TBLCAR (CAR_ID)
go

alter table TBLRENT
   add constraint FK_TBLRENT_RENT_TBLCUSTO foreign key (RT_CT_ID)
      references TBLCUSTOMER (CT_ID)
go

alter table TBLRENT
   add constraint FK_TBLRENT_RENT2_TBLCAR foreign key (RT_CAR_ID)
      references TBLCAR (CAR_ID)
go

alter table TBLRENTINFO
   add constraint FK_TBLRENTI_GETRENTIN_TBLCUSTO foreign key (RI_CT_ID)
      references TBLCUSTOMER (CT_ID)
go

alter table TBLRENTINFO
   add constraint FK_TBLRENTI_HASRENTIN_TBLCAR foreign key (RI_CAR_ID)
      references TBLCAR (CAR_ID)
go

alter table TBLREQUEST
   add constraint FK_TBLREQUE_ASSOCIATI_TBLCUSTO foreign key (REQ_CT_ID)
      references TBLCUSTOMER (CT_ID)
go

alter table TBLREQUEST
   add constraint FK_TBLREQUE_BELONGS_TBLRENTI foreign key (REQ_RI_RENT_ID)
      references TBLRENTINFO (RI_RENT_ID)
go

alter table TBLREQUEST
   add constraint FK_TBLREQUE_REFUNDED_TBLACCOU foreign key (REQ_AC_CARD_NUMBER)
      references TBLACCOUNT (AC_CARD_NUMBER)
go

