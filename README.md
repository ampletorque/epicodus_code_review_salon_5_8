
Salon Management System
=======================

For Epicodus Code Review: Friday, May 8, 2015
---------------------------------------------

Note on submission:
-------------------

Saturday note 1:
----------------

Friday due to the president's visit downtown and the job-fair we worked from home. My submission was sent in Saturday instead of Friday end-of-class. Primarily this was due to having installed a system update last week (after the last assessment) that apparently broke several dependencies in ruby and the database, and made it so I didn't get rpsec and postgres to work. I spent most of Friday trying to get it working first on OS X, then on a virtualbox I had running on my Mac, which kept choking on the version of postgres that was required to work with the PG gem. As such I didn't get started coding until pretty late. The assignment is partly complete - I didn't finish prettying it up completely, and I didn't finish writing the Sinatra interface for the delete stylist/client or change-name for stylist/client. If I'd had a little more time Friday due to not fighting my environment I think I'd have had them done. I now have both my system fixed and my test environment and a test server so I don't think this should happen in future when working from home. Sorry!!

Saturday note 2:
----------------
After I got back home, I realized that even though it's all getting posted late, I might as well just hook up the change-name and delete functions, since I'd already written the underlying ruby code. I added/changed the relevant code in the forms and app.rb to make it run in the browser and pass some new additions to the integration spec.

Description:
------------
Allows salon manager to add stylists, add clients, add clients to a stylist, add a stylist to a client, and view their connections.

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

and at the interface, the following commands:

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
