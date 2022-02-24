CREATE DATABASE next_timesheet_db;
\c next_timesheet_db
CREATE TABLE users(id SERIAL PRIMARY KEY, name TEXT, email TEXT, is_manager TEXT, password_digest TEXT);

CREATE TABLE timesheets(id SERIAL PRIMARY KEY, user_id TEXT, manager_id TEXT, mon TEXT, tue TEXT, wed TEXT, thu TEXT, fri TEXT, sat TEXT, sun TEXT, notes TEXT);