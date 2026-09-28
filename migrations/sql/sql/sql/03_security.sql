DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'app_read'
    ) THEN
        CREATE ROLE app_read;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'app_write'
    ) THEN
        CREATE ROLE app_write;
    END IF;
END
$$;

GRANT CONNECT
ON DATABASE bootcamp
TO app_read, app_write;

GRANT USAGE
ON SCHEMA public
TO app_read, app_write;

GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO app_read;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO app_write;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO app_write;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'api'
    ) THEN
        CREATE USER api
        LOGIN
        PASSWORD 'StrongSecret123!';
    END IF;
END
$$;

GRANT app_write TO api;

SELECT
    rolname,
    rolsuper,
    rolcreatedb,
    rolcreaterole,
    rolcanlogin
FROM pg_roles
WHERE rolname IN (
    'app_read',
    'app_write',
    'api'
)
ORDER BY rolname;

SELECT
    grantee,
    table_schema,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN (
    'app_read',
    'app_write'
)
ORDER BY
    grantee,
    table_name,
    privilege_type;DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'app_read'
    ) THEN
        CREATE ROLE app_read;
    END IF;

    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'app_write'
    ) THEN
        CREATE ROLE app_write;
    END IF;
END
$$;

GRANT CONNECT
ON DATABASE bootcamp
TO app_read, app_write;

GRANT USAGE
ON SCHEMA public
TO app_read, app_write;

GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO app_read;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO app_write;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO app_write;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_roles
        WHERE rolname = 'api'
    ) THEN
        CREATE USER api
        LOGIN
        PASSWORD 'StrongSecret123!';
    END IF;
END
$$;

GRANT app_write TO api;

SELECT
    rolname,
    rolsuper,
    rolcreatedb,
    rolcreaterole,
    rolcanlogin
FROM pg_roles
WHERE rolname IN (
    'app_read',
    'app_write',
    'api'
)
ORDER BY rolname;

SELECT
    grantee,
    table_schema,
    table_name,
    privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN (
    'app_read',
    'app_write'
)
ORDER BY
    grantee,
    table_name,
    privilege_type;