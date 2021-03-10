\connect "todo_db";


GRANT USAGE
    ON SCHEMA "public"
    TO "reader"
;

GRANT ALL PRIVILEGES
    ON SCHEMA "public"
    TO "schema_admin"
;
