# solo_project_greazy
Greazy - Solo Project in Sinatra

Creating a Burger Tracker app to showcase skills learned in Ruby, SQL, HTML and CSS. 


Getting Started:
Using PostgreSQL: create an SQL database named 'greazy' - command line 'createdb greazy'.
Create database tables using the file /db/greazy.sql - command line 'psql -d greazy -f db/greazy.sql'
Seed the database using the ruby file /db/seeds.rb - command line 'ruby seeds.rb'
Run app.rb in terminal with the following command 'ruby app.rb' 


Running the tests:

As the code is focussed on SQL data handling, the only test required for calculation is 'model/specs/deal_spec.rb', which tests 
the apply_discount() method found in 'models/deal.rb'

The test_discount test asserts that the "price" attribute of the Burger class ('models/burger.rb') is correctly modified by 
the "discount" attribute of the Deal class ('models/deal.rb').


Viewing the App:
To view the app, use the following URL in Chrome: http://localhost:4567


Built With
Sinatra
GitHub
Ruby


Authors

Ian Henderson
http://ianhenderson.co


Acknowledgments

CodeClan Edinburgh
