-- Open log file.
SPOOL apply_oracle_lab1.txt

-- Run instructor provided setup scripts.
@@/Usuarios/marcelo/ScriptsSQL/Data/cit225/oracle/lib1/utility/cleanup_oracle.sql
@@/Usuarios/marcelo/ScriptsSQL/Data/cit225/oracle/lib1/create/create_oracle_store2.sql

-- Close log file.
SPOOL OFF
