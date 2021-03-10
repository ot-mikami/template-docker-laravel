DROP ROLE IF EXISTS
     "db_admin"
   , "schema_admin"
   , "writer"
   , "reader"
;

CREATE ROLE "reader"
    WITH
        NOLOGIN
;

CREATE ROLE "writer"
    WITH
        NOLOGIN
        IN ROLE "reader"
;

CREATE ROLE "schema_admin"
    WITH
        NOLOGIN
        IN ROLE "writer"
;

CREATE ROLE "db_admin"
    WITH
        NOLOGIN
        IN ROLE "schema_admin"
;
