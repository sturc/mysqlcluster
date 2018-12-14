/* 
 create up to date hhdemodb tables from base tables
*/

drop table  if exists BEITRAGSSATZE cascade;
drop table  if exists ALTERSGRUPPEN cascade;
drop table  if exists MITGLIEDER    cascade;
drop table  if exists ABTEILUNGEN   cascade;


/*==============================================================*/
/* Table: ABTEILUNGEN                                           */
/*==============================================================*/
CREATE TABLE ABTEILUNGEN  (
   ABT_NR               INTEGER                         NOT NULL ,
   ABT_BEZ              VARCHAR(30),
   CONSTRAINT PK_ABTEILUNGEN PRIMARY KEY (ABT_NR))
   ENGINE=NDBCLUSTER 
   PARTITION BY KEY(ABT_NR);  
INSERT INTO ABTEILUNGEN SELECT * FROM A_2008;

/*==============================================================*/
/* Table: ALTERSGRUPPEN                                         */
/*==============================================================*/
CREATE TABLE ALTERSGRUPPEN  (
   GR_NR                INTEGER                         NOT NULL,
   GR_BEZ               VARCHAR(30),
   GR_ALTERVON          INTEGER,
   GR_ALTERBIS          INTEGER,
   CONSTRAINT PK_ALTERSGRUPPEN PRIMARY KEY (GR_NR))
   ENGINE=NDBCLUSTER 
   PARTITION BY KEY(GR_NR);
INSERT INTO ALTERSGRUPPEN SELECT * FROM AG_2008;

/*==============================================================*/
/* Table: BEITRAGSSATZE                                         */ 
/*==============================================================*/
CREATE TABLE BEITRAGSSATZE  (
   GR_NR                INTEGER                         not null,
   BS_NR                INTEGER                         not null,
   BS_AB                DATE,
   BS_BIS               DATE,
   BS_BETRAG            DECIMAL(4,2),
   CONSTRAINT PK_BEITRAGSSATZE PRIMARY KEY (GR_NR, BS_NR))
   ENGINE=NDBCLUSTER 
   PARTITION BY KEY(GR_NR, BS_NR);
   
INSERT INTO BEITRAGSSATZE (SELECT GR_NR, BS_NR,  date_add(BS_AB,INTERVAL (YEAR(current_date())-2008)  YEAR) BS_AB, 
	        date_add(BS_BIS,INTERVAL (YEAR(current_date())-2008) YEAR) BS_BIS,
	     BS_BETRAG FROM BS_2008);


/*==============================================================*/
/* Index: HABEN_FK                                              */
/*==============================================================*/
create index HABEN_FK on BEITRAGSSATZE (   GR_NR ASC);

/*==============================================================*/
/* Table: MITGLIEDER                                            */
/*==============================================================*/
create table MITGLIEDER (
   MI_NR                INTEGER                         not null,
   ABT_NR               INTEGER                         not null,
   MIT_KOORD            INTEGER,
   MI_NAME              VARCHAR(30),
   MI_VNAME             VARCHAR(30),
   MI_GEBDATUM          DATE,
   MI_SEIT              DATE,
   MI_AUFENT            INTEGER,
   MI_BEITR_AKT         DECIMAL(4,2),
   CONSTRAINT PK_MITGLIEDER PRIMARY KEY (MI_NR)
   )
   ENGINE=NDBCLUSTER 
   PARTITION BY KEY(MI_NR);

INSERT INTO MITGLIEDER (SELECT MI_NR, ABT_NR, MIT_KOORD, MI_NAME, MI_VNAME, 
      date_add(MI_GEBDATUM,INTERVAL (YEAR(current_date())-2008)  YEAR) MI_GEBDATUM,
	   date_add(MI_SEIT,INTERVAL (YEAR(current_date())-2008)  YEAR) MI_SEIT,
	         MI_AUFENT, MI_BEITR_AKT FROM M_2008);

/*==============================================================*/
/* Index: HAT_FK                                                */
/*==============================================================*/
CREATE INDEX HAT_FK ON MITGLIEDER (
   ABT_NR ASC);

/*==============================================================*/
/* Index: KOORDINIEREN_FK                                       */
/*==============================================================*/
CREATE INDEX KOORDINIEREN_FK ON MITGLIEDER (
   MIT_KOORD ASC);

ALTER TABLE BEITRAGSSATZE
   ADD CONSTRAINT FK_AG_HABEN_BEITRS FOREIGN KEY (GR_NR)
      REFERENCES ALTERSGRUPPEN (GR_NR);

ALTER TABLE MITGLIEDER
   ADD CONSTRAINT FK_ABT_HAT_M FOREIGN KEY (ABT_NR)
      REFERENCES ABTEILUNGEN (ABT_NR);

ALTER TABLE MITGLIEDER
   ADD CONSTRAINT FK_M_KOORD_M FOREIGN KEY (MIT_KOORD)
      REFERENCES MITGLIEDER (MI_NR);

COMMIT;