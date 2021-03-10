CREATE ROLE "app_user"
    WITH
        LOGIN
        PASSWORD 'p'
        IN ROLE "writer"
;

CREATE ROLE "app_admin"
    WITH
        LOGIN
        PASSWORD 'padmin'
        IN ROLE "db_admin"
;
