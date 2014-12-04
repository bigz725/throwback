throwback
=========

Baseball intelligence
Running the app:

Prerequisites:
<ol>
<li>Ruby (I used 2.1.4 but any version 1.9.3 or greater should work)</li>
<li>MySQL and a user capable of creating other users and databases</li>
</ol>

Steps:
<ol>
<li>From the application root (throwback), run bundle install</li>
<li>Place the commandfx_2014.csv file in db/</li>
<li>Run the SQL script db/create_database.sql as the MYSQL user mentioned above.</li>
<li>rake:db:setup (installs the database schema)</li>
<li>rake:db:seed (installs the seed data handling pitches and outcomes)</li>
<li>rake:db:prime (imports the PitchFx data from the commandfx_2014.csv file, may take some time)</li>
</ol>



