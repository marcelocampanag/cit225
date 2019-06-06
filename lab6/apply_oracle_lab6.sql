-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab6.sql
--  Lab Assignment: Lab #6
--  Program Author: Michael McLaughlin
--  Creation Date:  02-Mar-2018
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- The two scripts contain spooling commands, which is why there
-- isn't a spooling command in this script. When you run this file
-- you first connect to the Oracle database with this syntax:
--
--   sqlplus student/student@xe
--
-- Then, you call this script with the following syntax:
--
--   sql> @apply_oracle_lab6.sql
--
-- ------------------------------------------------------------------

-- Call library files.
@/home/student/Data/cit225/oracle/lab6/apply_oracle_lab6.sql

-- Open log file.
SPOOL apply_oracle_lab6.txt

-- ... insert lab 6 commands here ...
--1

ALTER TABLE RENTAL_ITEM ADD RENTAL_ITEM_PRICE NUMBER(22),
ALTER TABLE RENTAL_ITEM ADD RENTAL_ITEM_TYPE NUMBER(22),
ALTER TABLE RENTAL_ITEM ADD FOREIGN KEY(RENTAL_ITEM_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

--2

CREATE TABLE PRICE
(
PRICE_ID NUMBER(22) NOT NULL,
ITEM_ID NUMBER(22) NOT NULL,
PRICE_TYPE NUMBER(22),
ACTIVE_FLAG VARCHAR2(1) NOT NULL,
START_DATE  DATE NOT NULL,
END_DATE DATE,
AMOUNT NUMBER(22) NOT NULL,
CREATED_BY NUMBER(22) NOT NULL,
CREATION_DATE DATE NOT NULL,
LAST_UPDATED_BY NUMBER(22) NOT NULL,
LAST_UPDATE_DATE DATE NOT NULL,
PRIMARY KEY(PRICE_ID),
FOREIGN KEY(ITEM_ID) REFERENCES ITEM(	ITEM_ID),
FOREIGN KEY(PRICE_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID),
FOREIGN KEY(CREATED_BY) REFERENCES SYSTEM_USER(SYSTEM_USER_ID),
CONSTRAINT YN_PRICE CHECK( active_flag IN ('Y','N'))
);

--3
DROP INDEX COMMON_LOOKUP_N1;
DROP INDEX COMMON_LOOKUP_U2;

ALTER TABLE COMMON_LOOKUP
ADD
(COMMON_LOOKUP_TABLE VARCHAR2(30),
COMMON_LOOKUP_COLUMN VARCHAR2(30),
COOMMON_LOOKUP_CODE VARCHAR2(1)
);

UPDATE   common_lookup
SET      common_lookup_table = 'ADDRESS'
,        common_lookup_column = '	ADDRESS_TYPE'
WHERE    common_lookup_context = 'MULTIPLE';

UPDATE   common_lookup
SET      common_lookup_table = 'TELEPHONE'
,        common_lookup_column = '	TELEPHONE_TYPE'
WHERE    common_lookup_context = 'MULIPLE';

SPOOL OFF
