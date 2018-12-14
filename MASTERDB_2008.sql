/*
  hhdemodb base tables
*/
drop table if exists A_2008;
drop table if exists AG_2008;
drop table if exists BS_2008;
drop table if exists M_2008;

/*==============================================================*/
/* Table: ABTEILUNGEN (A_2008)                                  */
/*==============================================================*/
create table A_2008  (
   ABT_NR               INTEGER                         not null,
   ABT_BEZ              VARCHAR(30));
   
/*==============================================================*/
/* Table: ALTERSGRUPPEN                                         */
/*==============================================================*/
create table AG_2008  (
   GR_NR                INTEGER                         not null,
   GR_BEZ               VARCHAR(30),
   GR_ALTERVON          INTEGER,
   GR_ALTERBIS          INTEGER);
   
/*==============================================================*/
/* Table: BEITRAGSSATZE                                         */
/*==============================================================*/
create table BS_2008  (
   GR_NR                INTEGER                         not null,
   BS_NR                INTEGER                         not null,
   BS_AB                DATE,
   BS_BIS               DATE,
   BS_BETRAG            DECIMAL(4,2));
   

/*==============================================================*/
/* Table: MITGLIEDER                                            */
/*==============================================================*/
create table M_2008  (
   MI_NR                INTEGER                         not null,
   ABT_NR               INTEGER                         not null,
   MIT_KOORD            INTEGER,
   MI_NAME              VARCHAR(30),
   MI_VNAME             VARCHAR(30),
   MI_GEBDATUM          DATE,
   MI_SEIT              DATE,
   MI_AUFENT            INTEGER,
   MI_BEITR_AKT         DECIMAL(4,2));
   
insert into A_2008(ABT_NR, ABT_BEZ) values (1, 'Kegeln');
insert into A_2008(ABT_NR, ABT_BEZ) values (2, 'Bowling');
insert into A_2008(ABT_NR, ABT_BEZ) values (3, 'Jugend');
insert into A_2008(ABT_NR, ABT_BEZ) values (4, 'Verwaltung');
insert into A_2008(ABT_NR, ABT_BEZ) values (5, 'Judo');

Insert into M_2008 values(121,4,NULL,'Meller','Peter'  ,STR_TO_DATE('24.08.1955', '%d.%m.%Y'),STR_TO_DATE('01.03.1995', '%d.%m.%Y'), 230,25.00);
Insert into M_2008 values( 65,1, 121,'Kappes','Agnes'  ,STR_TO_DATE('22.11.1983', '%d.%m.%Y'),STR_TO_DATE('01.07.1990', '%d.%m.%Y'), 130,25.00);
Insert into M_2008 values( 44,2, 121,'Renzer','Florian',STR_TO_DATE('13.05.1986', '%d.%m.%Y'),STR_TO_DATE('01.05.1997', '%d.%m.%Y'), 130,25.00);
Insert into M_2008 values( 13,3, 121,'Fluck' ,'Sigrid' ,STR_TO_DATE('07.02.1991', '%d.%m.%Y'),STR_TO_DATE('01.05.2001', '%d.%m.%Y'), 110,15.00);
Insert into M_2008 values(113,1,  65,'Sulzer','Frank'  ,STR_TO_DATE('03.04.1985', '%d.%m.%Y'),STR_TO_DATE('01.11.2004', '%d.%m.%Y'),  90,25.00);
Insert into M_2008 values( 71,1, 113,'Holer' ,'Rene'   ,STR_TO_DATE('23.07.1986', '%d.%m.%Y'),STR_TO_DATE('01.07.1995', '%d.%m.%Y'), 140,25.00);
Insert into M_2008 values( 66,1, 113,'Rack'  ,'Tim'    ,STR_TO_DATE('15.07.1977', '%d.%m.%Y'),STR_TO_DATE('01.06.1990', '%d.%m.%Y'),  95,25.00);
Insert into M_2008 values( 88,1, 113,'Berbes','Jens'   ,STR_TO_DATE('27.07.1973', '%d.%m.%Y'),STR_TO_DATE('01.04.1988', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 14,1, 113,'Carnot','France' ,STR_TO_DATE('03.07.1971', '%d.%m.%Y'),STR_TO_DATE('01.03.1995', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 97,1,  65,'Krapp' ,'Theo'   ,STR_TO_DATE('10.10.1978', '%d.%m.%Y'),STR_TO_DATE('01.03.1998', '%d.%m.%Y'), 115,25.00);
Insert into M_2008 values( 22,1,  97,'Lang'  ,'Martha' ,STR_TO_DATE('23.03.1983', '%d.%m.%Y'),STR_TO_DATE('01.06.1991', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 39,1,  97,'Jerres','Jenny'  ,STR_TO_DATE('15.02.1975', '%d.%m.%Y'),STR_TO_DATE('01.04.1988', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 41,1,  97,'Adomit','Karl'   ,STR_TO_DATE('31.07.1972', '%d.%m.%Y'),STR_TO_DATE('01.06.1982', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 83,1,  97,'Lering','Paul'   ,STR_TO_DATE('01.04.1966', '%d.%m.%Y'),STR_TO_DATE('01.05.2003', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 52,1,  65,'Zander','Alois'  ,STR_TO_DATE('07.08.1966', '%d.%m.%Y'),STR_TO_DATE('01.12.1986', '%d.%m.%Y'),  90,25.00);
Insert into M_2008 values(105,1,  52,'Hirth' ,'Simone' ,STR_TO_DATE('14.04.1976', '%d.%m.%Y'),STR_TO_DATE('01.06.2001', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 27,1,  52,'Simons','Terry'  ,STR_TO_DATE('12.12.1982', '%d.%m.%Y'),STR_TO_DATE('01.04.2004', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 33,1,  52,'Krupp' ,'Karla'  ,STR_TO_DATE('17.03.1970', '%d.%m.%Y'),STR_TO_DATE('01.06.1998', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 76,1,  52,'Popich','Harry'  ,STR_TO_DATE('04.01.1968', '%d.%m.%Y'),STR_TO_DATE('01.05.1997', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values(109,2,  44,'Rahn'  ,'Herbert',STR_TO_DATE('07.06.1992', '%d.%m.%Y'),STR_TO_DATE('01.03.2001', '%d.%m.%Y'), 120,15.00);
Insert into M_2008 values( 28,2, 109,'Fietz' ,'Jasper' ,STR_TO_DATE('07.07.1990', '%d.%m.%Y'),STR_TO_DATE('01.03.2001', '%d.%m.%Y'),NULL,15.00);
Insert into M_2008 values( 35,2, 109,'Frantz','Wolli'  ,STR_TO_DATE('15.06.1991', '%d.%m.%Y'),STR_TO_DATE('01.03.2001', '%d.%m.%Y'),NULL,15.00);
Insert into M_2008 values( 78,2, 109,'Kohler','Bert'   ,STR_TO_DATE('24.03.1991', '%d.%m.%Y'),STR_TO_DATE('01.03.2001', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values(119,2,  44,'Albers','Hans'   ,STR_TO_DATE('07.10.1966', '%d.%m.%Y'),STR_TO_DATE('01.05.1980', '%d.%m.%Y'),  90,25.00);
Insert into M_2008 values( 23,2, 119,'Remsen','Jorge'  ,STR_TO_DATE('07.07.1982', '%d.%m.%Y'),STR_TO_DATE('01.09.1992', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 55,2, 119,'Holter','Burgi'  ,STR_TO_DATE('15.06.1980', '%d.%m.%Y'),STR_TO_DATE('01.07.2003', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values( 91,2, 119,'Jammer' ,'Jens'  ,STR_TO_DATE('24.03.1986', '%d.%m.%Y'),STR_TO_DATE('01.01.1996', '%d.%m.%Y'),NULL,25.00);
Insert into M_2008 values(107,3,  13,'Traut' ,'Jenny'  ,STR_TO_DATE('09.06.1991', '%d.%m.%Y'),STR_TO_DATE('01.07.2004', '%d.%m.%Y'),NULL,15.00);
Insert into M_2008 values(123,3,  13,'Dierks','Benn'   ,STR_TO_DATE('01.04.1992', '%d.%m.%Y'),STR_TO_DATE('01.10.2003', '%d.%m.%Y'),NULL,15.00);
Insert into M_2008 values( 57,3,  13,'Ruppel','Hilda'  ,STR_TO_DATE('15.07.1993', '%d.%m.%Y'),STR_TO_DATE('01.10.2006', '%d.%m.%Y'),NULL,10.00);
Insert into M_2008 values( 68,3,  13,'Engels','Bruno'  ,STR_TO_DATE('24.04.1994', '%d.%m.%Y'),STR_TO_DATE('01.03.2007', '%d.%m.%Y'),NULL,10.00);
Insert into M_2008 values( 86,3,  13,'Brutt' ,'Jasmin' ,STR_TO_DATE('12.12.1995', '%d.%m.%Y'),STR_TO_DATE('01.01.2007', '%d.%m.%Y'),NULL, 7.50);
Insert into M_2008 values( 95,3,  13,'Brahms','Steffi' ,STR_TO_DATE('04.04.1997', '%d.%m.%Y'),STR_TO_DATE('01.02.2007', '%d.%m.%Y'),NULL, 5.00);
Insert into M_2008 values( 79,3,  13,'Eckel' ,'Bernd'  ,STR_TO_DATE('17.08.1999', '%d.%m.%Y'),STR_TO_DATE('01.01.2008', '%d.%m.%Y'),NULL, 2.50);
Insert into M_2008 values(125,3,  13,'Mahn'  ,'Willy'  ,STR_TO_DATE('23.05.1999', '%d.%m.%Y'),STR_TO_DATE('01.03.2008', '%d.%m.%Y'),NULL, 2.50);

Insert into AG_2008 (GR_NR, GR_BEZ, GR_ALTERVON, GR_ALTERBIS)
                          values(1, 'Erwachsene', 18, 150);
Insert into AG_2008 values(2, 'B-Jugend'  , 15,  17);
Insert into AG_2008 values(3, 'C-Jugend'  , 13,  14);
Insert into AG_2008 values(4, 'D-Jugend'  , 12,  12);
Insert into AG_2008 values(5, 'E-Jugend'  , 10,  11);
Insert into AG_2008 values(6, 'F-Jugend'  ,  0,   9);

Insert into BS_2008 (GR_NR, BS_NR, BS_AB, BS_BIS, BS_BETRAG)
                          values (1, 1, STR_TO_DATE('01.01.2008','%d.%m.%Y'),STR_TO_DATE('31.12.2009','%d.%m.%Y'),25.00); 
Insert into BS_2008 values (1, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'),27.00); 
Insert into BS_2008 values (1, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'),30.00); 
Insert into BS_2008 values (2, 1, STR_TO_DATE('01.01.2008', '%d.%m.%Y'),STR_TO_DATE('31.12.2009', '%d.%m.%Y'),15.00); 
Insert into BS_2008 values (2, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'),16.50); 
Insert into BS_2008 values (2, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'),18.00); 
Insert into BS_2008 values (3, 1, STR_TO_DATE('01.01.2008', '%d.%m.%Y'),STR_TO_DATE('31.12.2009', '%d.%m.%Y'),10.00); 
Insert into BS_2008 values (3, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'),12.00); 
Insert into BS_2008 values (3, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'),13.50); 
Insert into BS_2008 values (4, 1, STR_TO_DATE('01.01.2008', '%d.%m.%Y'),STR_TO_DATE('31.12.2009', '%d.%m.%Y'), 7.50); 
Insert into BS_2008 values (4, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'), 8.50); 
Insert into BS_2008 values (4, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'),10.00); 
Insert into BS_2008 values (5, 1, STR_TO_DATE('01.01.2008', '%d.%m.%Y'),STR_TO_DATE('31.12.2009', '%d.%m.%Y'), 5.00); 
Insert into BS_2008 values (5, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'), 6.00); 
Insert into BS_2008 values (5, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'), 7.00); 
Insert into BS_2008 values (6, 1, STR_TO_DATE('01.01.2008', '%d.%m.%Y'),STR_TO_DATE('31.12.2009', '%d.%m.%Y'), 2.50); 
Insert into BS_2008 values (6, 2, STR_TO_DATE('01.01.2010', '%d.%m.%Y'),STR_TO_DATE('31.12.2011', '%d.%m.%Y'), 3.00); 
Insert into BS_2008 values (6, 3, STR_TO_DATE('01.01.2012', '%d.%m.%Y'),STR_TO_DATE('31.12.2013', '%d.%m.%Y'), 3.50); 

COMMIT;
