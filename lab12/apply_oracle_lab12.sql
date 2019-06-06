-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab12.sql
--  Lab Assignment: Lab #12
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
--   sql> @apply_oracle_lab12.sql
--
-- ------------------------------------------------------------------

-- Run the prior lab script.
@/home/student/Data/cit225/oracle/lab12/apply_oracle_lab12.sql

-- Spool log file.
SPOOL apply_oracle_lab12.txt

-- ... insert lab 12 commands here ...

SPOOL OFF
