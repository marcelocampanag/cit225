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

ALTER TABLE RENTAL_ITEM ADD RENTAL_ITEM_PRICE NUMBER(22);
ALTER TABLE RENTAL_ITEM ADD RENTAL_ITEM_TYPE NUMBER(22);
ALTER TABLE RENTAL_ITEM ADD FOREIGN KEY(RENTAL_ITEM_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);

-- select table query

SET NULL ''
COLUMN table_name   FORMAT A14
COLUMN column_id    FORMAT 9999
COLUMN column_name  FORMAT A22
COLUMN data_type    FORMAT A12
SELECT   table_name
,        column_id
,        column_name
,        CASE
           WHEN nullable = 'N' THEN 'NOT NULL'
           ELSE ''
         END AS nullable
,        CASE
           WHEN data_type IN ('CHAR','VARCHAR2','NUMBER') THEN
             data_type||'('||data_length||')'
           ELSE
             data_type
         END AS data_type
FROM     user_tab_columns
WHERE    table_name = 'RENTAL_ITEM'
ORDER BY 2;

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

-- select table query

SET NULL ''
COLUMN table_name   FORMAT A14
COLUMN column_id    FORMAT 9999
COLUMN column_name  FORMAT A22
COLUMN data_type    FORMAT A12
SELECT   table_name
,        column_id
,        column_name
,        CASE
           WHEN nullable = 'N' THEN 'NOT NULL'
           ELSE ''
         END AS nullable
,        CASE
           WHEN data_type IN ('CHAR','VARCHAR2','NUMBER') THEN
             data_type||'('||data_length||')'
           ELSE
             data_type
         END AS data_type
FROM     user_tab_columns
WHERE    table_name = 'PRICE'
ORDER BY 2;

-- select constraint query

COLUMN constraint_name   FORMAT A16
COLUMN search_condition  FORMAT A30
SELECT   uc.constraint_name
,        uc.search_condition
FROM     user_constraints uc INNER JOIN user_cons_columns ucc
ON       uc.table_name = ucc.table_name
AND      uc.constraint_name = ucc.constraint_name
WHERE    uc.table_name = UPPER('price')
AND      ucc.column_name = UPPER('active_flag')
AND      uc.constraint_name = UPPER('yn_price')
AND      uc.constraint_type = 'C';

--- 3




--5


