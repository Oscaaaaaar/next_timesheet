CREATE DATABASE next_timesheet_db;
\c next_timesheet_db

-- CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, email VARCHAR(100), is_manager VARCHAR(10), password_digest TEXT);


-- CREATE TABLE timesheets(id SERIAL PRIMARY KEY, user_id INT, manager_id INT, day_of_week TEXT, CONSTRAINT fk_users 
-- FOREIGN KEY(user_id)
-- REFERENCES users(user_id))




CREATE TABLE users(id SERIAL PRIMARY KEY, name TEXT, email TEXT, is_manager TEXT, password_digest TEXT);


CREATE TABLE timesheets(id SERIAL PRIMARY KEY, user_id TEXT, manager_id TEXT, mon TEXT, tue TEXT, wed TEXT, thu TEXT, fri TEXT, sat TEXT, sun TEXT, notes TEXT);