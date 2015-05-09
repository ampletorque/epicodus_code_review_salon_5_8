
Salon Management System
=======================

For Epicodus Code Review: Friday, May 8, 2015
---------------------------------------------

Description:
------------
Allows user to add words to a dictionary and definitions to each word, show a list of words and a list of definitions for each word.

By:
---
Andrew David Burt (andrew@ampletorque.com)

Setup:
------
Runs under ruby v2.0.0p481 on OS X.
You will need to create a postgres database for this app and its tests to run.
After postgres is installed, run:
    $ postgres
and leave it running in the background. Then run:
    $ psql
end at the interface, the following commands:
    CREATE DATABASE hair_salon;
    \c hair_salon
    CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
    CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
    CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
Then run app as follows:
    $ ruby app.rb

License:
--------
MIT License. Copyright 2015 Andrew David Burt.

Bugs:
-----
None so far.

Notes:
------
None.
