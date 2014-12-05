throwback
=========

Baseball intelligence
<p>Running the app:</p>
<p>
Prerequisites:
<ol>
<li>Ruby (I used 2.1.4 but any version 1.9.3 or greater should work)</li>
<li>MySQL and a user capable of creating other users and databases</li>
</ol>
</p>
<p>
Steps (please note, as of 12/4/2014, these have changed):
<ol>
<li>From the application root (throwback), run bundle install</li>
<li>Place the commandfx_2014.csv file in db/</li>
<li>Run the SQL script db/create_database.sql as the MYSQL user mentioned above.</li>
<li>rake db:migrate (installs the database schema)</li>
<li>rake db:seed (installs the seed data handling pitches and outcomes)</li>
<li>rake db:prime (imports the PitchFx data from the commandfx_2014.csv file, may take some time)</li>
</ol>
</p>
<p>Now the application should be prepared in the development environment for the
usual rails commands (console, server, etc.). </p> 
<p>Note, the db:migrate command is used because I used varchars for primary keys,
due to the CSV file.  In a production environment, I would try to use normal serial ints.
If you try to do a rake db:setup (which automatically calls rake db:seed) instead, 
Rails will create the tables based on schema.rb,
which results in integer primary keys, which doesn't work out well for this app.</p>

