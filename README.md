throwback
=========

Baseball intelligence
Running the app:

Prerequisites:
1. Ruby (I used 2.1.4 but any version 1.9.3 or greater should work)
2. MySQL and a user capable of creating other users and databases

Steps:
1. From the application root (throwback), run bundle install
2. Place the commandfx_2014.csv file in db/
3. Run the SQL script db/create_database.sql as the MYSQL user mentioned above.
4. rake:db:setup (installs the database schema)
5. rake:db:seed (installs the seed data handling pitches and outcomes)
6. rake:db:prime (imports the PitchFx data from the commandfx_2014.csv file, may take some time)


