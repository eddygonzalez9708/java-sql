-- use SQLite Studio to create a database, name it budget.sqlite3.

-- add an accounts table with the following schema:

-- id, numeric value with no decimal places that should autoincrement.
-- name, string, add whatever is necessary to make searching by name faster.
-- budget numeric value.

-- constraints
-- the id should be the primary key for the table.
-- account name should be unique.
-- account budget is required.
-- This can be done with the CREATE TABLE clause

CREATE TABLE accounts (id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name STRING UNIQUE NOT NULL,
    budget DOUBLE  NOT NULL
);
