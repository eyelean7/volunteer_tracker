CREATE DATABASE volunteer_tracker;
\c volunteer_tracker
CREATE TABLE projects(id serial PRIMARY KEY, name varchar);
CREATE TABLE volunteers(id serial PRIMARY KEY, first_name varchar, last_name varchar, project_id int);
