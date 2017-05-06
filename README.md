
# _Volunteer Tracker_

#### _Volunteer database._

#### By _**Ilene Gorski**_

## Description

_The volunteer tracker allows a manager to enter projects and volunteers, and to assign each volunteer to a project._

## Setup/Installation Requirements

* _Open terminal_
* _Clone by running 'git clone https://github.com/eyelean7/volunteer_tracker'_
* _Open new terminal window or tab_
* _Make sure Postgres is installed 'https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef'_
* _In terminal, type the following commands_
* _'pg_ctl start'_
* _'postgres'_
* _'CREATE DATABASE volunteer_tracker;'_
* _'\c volunteer_tracker'_
* _'CREATE TABLE projects(id serial PRIMARY KEY, name varchar);'_
* _'CREATE TABLE volunteers(id serial PRIMARY KEY, first_name varchar, last_name varchar, project_id int);'_
* _Return to original terminal window, navigate to the volunteer_tracker folder and run 'bundle install'_
* _While still in the project folder, run 'ruby app.rb'_
* _Open Google Chrome and type in 'http://localhost:4567/' in the address bar_

## Known bugs

* _Unable to add volunteers to projects 

## Support and contact details

_Contact on [github](https://github.com/eyelean7)!_

## Technologies Used

_Ruby, Sinatra, Postgresql_

### License

*MIT*

Copyright (c) 2017 **_Ilene Gorski_**
