-- Create database if not exists
DO
$$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_catalog.pg_database WHERE pg_database.datname = 'items_manager_db') THEN
            PERFORM dblink_exec(
                    'dbname=postgres user=postgres password=V44b2500!!',
                    'CREATE DATABASE items_manager_db'
                    );
        END IF;
    END
$$;

-- CANNOT CONTINUE THE REST OF THE QUERY DUE TO POSTGRESQL TECHNICAL CONSTRAINTS

-- Create schema
CREATE SCHEMA IF NOT EXISTS tasks_manager_schema;

-- Set search path to user created schema
SET search_path TO tasks_manager_schema;

-- Create table
CREATE TABLE IF NOT EXISTS item
(
    item_id              BIGSERIAL    NOT NULL,
    item_name            VARCHAR(256) NOT NULL,
    item_description     TEXT         NULL,
    item_start_at        TIMESTAMPTZ  NOT NULL DEFAULT now(),
    item_end_at          TIMESTAMPTZ  NULL,
    item_related_item_id BIGINT       NULL     DEFAULT NULL,
    CONSTRAINT PK_item__item_id PRIMARY KEY (item_id),
    CONSTRAINT FK_item_item__item_related_item_id FOREIGN KEY (item_related_item_id) REFERENCES item (item_id) ON DELETE CASCADE
);