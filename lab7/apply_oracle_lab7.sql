-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab7.sql
--  Lab Assignment: Lab #7
--  Program Author: Michael McLaughlin
--  Creation Date:  02-Mar-2010
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
--   sql> @apply_oracle_lab7.sql
--
-- ------------------------------------------------------------------

-- Call library files.
@/home/student/Data/cit225/oracle/lab6/apply_oracle_lab6.sql

-- Open log file.
SPOOL apply_oracle_lab7.txt

-- ... insert lab 7 commands here ...
-- --------------------------------------------------------
--  Step #1
--  -------
--  Insert two ACTIVE_FLAG records in the COMMON_LOOKUP table.
-- --------------------------------------------------------

-- Insert step #1 statements here.

-- INSERT INTO PRICE
-- (PRICE_ID
-- ,ITEM_ID
-- ,PRICE_TYPE
-- ,ACTIVE_FLAG
-- ,START_DATE
-- ,END_DATE
-- ,AMOUNT
-- ,CREATED_BY
-- ,CREATION_DATE
-- ,LAST_UPDATED_BY
-- ,LAST_UPDATE_DATE
-- )
-- VALUES
-- ( );

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'YES'
,'Yes'
,1
,SYSDATE
,1
,SYSDATE
,'PRICE'
,'ACTIVE_FLAG'
,'Y');

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'NO'
,'No'
,1
,SYSDATE
,1
,SYSDATE
,'PRICE'
,'ACTIVE_FLAG'
,'N');

COLUMN common_lookup_table  FORMAT A20 HEADING "COMMON_LOOKUP_TABLE"
COLUMN common_lookup_column FORMAT A20 HEADING "COMMON_LOOKUP_COLUMN"
COLUMN common_lookup_type   FORMAT A20 HEADING "COMMON_LOOKUP_TYPE"
SELECT   common_lookup_table
,        common_lookup_column
,        common_lookup_type
FROM     common_lookup
WHERE    common_lookup_table = 'PRICE'
AND      common_lookup_column = 'ACTIVE_FLAG'
ORDER BY 1, 2, 3 DESC;

-- --------------------------------------------------------
--  Step #2
--  -------
--  Insert three PRICE_TYPE and three RENTAL_ITEM_TYPE
--  records in the COMMON_LOOKUP table.
-- --------------------------------------------------------

-- Insert step #2 statements here.
INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'1-DAY RENTAL'
,'1-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'PRICE'
,'PRICE_TYPE'
,'1');

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'3-DAY RENTAL'
,'3-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'PRICE'
,'PRICE_TYPE'
,'3');

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'5-DAY RENTAL'
,'5-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'PRICE'
,'PRICE_TYPE'
,'5');


INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'1-DAY RENTAL'
,'1-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'RENTAL_ITEM'
,'RENTAL_ITEM_TYPE'
,'1');

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'3-DAY RENTAL'
,'3-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'RENTAL_ITEM'
,'RENTAL_ITEM_TYPE'
,'3');

INSERT INTO COMMON_LOOKUP
(COMMON_LOOKUP_ID
,COMMON_LOOKUP_TYPE
,COMMON_LOOKUP_MEANING
,CREATED_BY
,CREATION_DATE
,LAST_UPDATED_BY
,LAST_UPDATE_DATE
,COMMON_LOOKUP_TABLE
,COMMON_LOOKUP_COLUMN
,COMMON_LOOKUP_CODE )
VALUES
(COMMON_LOOKUP_s1.nextval
,'5-DAY RENTAL'
,'5-Day Rental'
,1
,SYSDATE
,1
,SYSDATE
,'RENTAL_ITEM'
,'RENTAL_ITEM_TYPE'
,'5');


COLUMN common_lookup_table  FORMAT A20 HEADING "COMMON_LOOKUP_TABLE"
COLUMN common_lookup_column FORMAT A20 HEADING "COMMON_LOOKUP_COLUMN"
COLUMN common_lookup_type   FORMAT A20 HEADING "COMMON_LOOKUP_TYPE"
SELECT   common_lookup_table
,        common_lookup_column
,        common_lookup_type
FROM     common_lookup
WHERE    common_lookup_table IN ('PRICE','RENTAL_ITEM')
AND      common_lookup_column IN ('PRICE_TYPE','RENTAL_ITEM_TYPE')
ORDER BY 1, 3;

-- --------------------------------------------------------
--  Step #3
--  -------
--  Update the RENTAL_ITEM_TYPE column values and add a
--  foreign key constraint on the RENTAL_ITEM_TYPE column.
-- --------------------------------------------------------

-- Insert step #3 statements here.

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


UPDATE   rental_item ri
              SET      rental_item_type =
                         (SELECT   cl.common_lookup_id
                          FROM     common_lookup cl
                          WHERE    cl.common_lookup_code =
                            (SELECT   rental.return_date - rental.check_out_date
--                                          FROM     rental,rental_item ri
                                         FROM     rental
                                          WHERE    rental.rental_id = ri.rental_id)
                          AND      cl.common_lookup_table = 'RENTAL_ITEM'
                          AND      cl.common_lookup_column = 'RENTAL_ITEM_TYPE');


SELECT   ROW_COUNT
,        col_count
FROM    (SELECT   COUNT(*) AS ROW_COUNT
         FROM     rental_item) rc CROSS JOIN
        (SELECT   COUNT(rental_item_type) AS col_count
         FROM     rental_item
         WHERE    rental_item_type IS NOT NULL) cc;


         COL ROWNUM              FORMAT 999999  HEADING "Row|Number"
         COL rental_item_type    FORMAT 999999  HEADING "Rental|Item|Type"
         COL common_lookup_id    FORMAT 999999  HEADING "Common|Lookup|ID #"
         COL common_lookup_code  FORMAT A6      HEADING "Common|Lookup|Code"
         COL return_date         FORMAT A11     HEADING "Return|Date"
         COL check_out_date      FORMAT A11     HEADING "Check Out|Date"
         COL r_rental_id         FORMAT 999999  HEADING "Rental|ID #"
         COL ri_rental_id        FORMAT 999999  HEADING "Rental|Item|Rental|ID #"
         SELECT   ROWNUM
         ,        ri.rental_item_type
         ,        cl.common_lookup_id
         ,        cl.common_lookup_code
         ,        r.return_date
         ,        r.check_out_date
         ,        CAST((r.return_date - r.check_out_date) AS CHAR) AS lookup_code
         ,        r.rental_id AS r_rental_id
         ,        ri.rental_id AS ri_rental_id
         FROM     rental r FULL JOIN rental_item ri
         ON       r.rental_id = ri.rental_id FULL JOIN common_lookup cl
         ON       cl.common_lookup_code =
                    CAST((r.return_date - r.check_out_date) AS CHAR)
         WHERE    cl.common_lookup_table = 'RENTAL_ITEM'
         AND      cl.common_lookup_column = 'RENTAL_ITEM_TYPE'
         AND      cl.common_lookup_type LIKE '%-DAY RENTAL'
         ORDER BY r.rental_id
         ,        ri.rental_id;

ALTER TABLE RENTAL_ITEM ADD CONSTRAINT FK_RENTAL_ITEM_7 FOREIGN KEY(RENTAL_ITEM_TYPE) REFERENCES COMMON_LOOKUP(COMMON_LOOKUP_ID);


COLUMN table_name      FORMAT A12 HEADING "TABLE NAME"
COLUMN constraint_name FORMAT A18 HEADING "CONSTRAINT NAME"
COLUMN constraint_type FORMAT A12 HEADING "CONSTRAINT|TYPE"
COLUMN column_name     FORMAT A18 HEADING "COLUMN NAME"
SELECT   uc.table_name
,        uc.constraint_name
,        CASE
           WHEN uc.constraint_type = 'R' THEN
            'FOREIGN KEY'
         END AS constraint_type
,        ucc.column_name
FROM     user_constraints uc INNER JOIN user_cons_columns ucc
ON       uc.constraint_name = ucc.constraint_name
WHERE    uc.table_name = 'RENTAL_ITEM'
AND      ucc.column_name = 'RENTAL_ITEM_TYPE';

ALTER TABLE RENTAL_ITEM MODIFY ( RENTAL_ITEM_TYPE CONSTRAINT NN_RENTAL_ITEM_7 NOT NULL);

COLUMN CONSTRAINT FORMAT A10
SELECT   TABLE_NAME
,        column_name
,        CASE
           WHEN NULLABLE = 'N' THEN 'NOT NULL'
           ELSE 'NULLABLE'
         END AS CONSTRAINT
FROM     user_tab_columns
WHERE    TABLE_NAME = 'RENTAL_ITEM'
AND      column_name = 'RENTAL_ITEM_TYPE';
-- --------------------------------------------------------
--  Step #4
--  -------
--  Create a query to fabricate pricing data that you
--  will insert into a PRICE table in lab 8.
-- --------------------------------------------------------

-- Insert step #4 statements here.

-- Close log file.
SPOOL OFF

-- Make all changes permanent.
-- COMMIT;
