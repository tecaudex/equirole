README

-------------------------------------------------------------

Resume Tool
Tool to collect data from resumes and generate necessary pdfs

-------------------------------------------------------------

It uses a number of open source frameworks:


Rails 6.1.4 - Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.
[Ruby 3.0.0] - Ruby is a dynamic, reflective, object-oriented, general-purpose programming language.

Sqlite - SQLite is a relational database management system contained in a C library. 

--------------------------------------------------------------

ENVIRONMENT SETUP FOR WINDOWS

Install rails installer download from below link and run
https://s3.amazonaws.com/railsinstaller/Windows/railsinstaller-3.3.0.exe

After finishing installation it will open command line window
  i. Enter your name and press enter
  ii. Enter your email and press enter your git will be configured

Run a command gem install bundler
Run a command rails -v to check rails version
Clone project into C://sites
Database configuration will be provided in database.yml file
Run rails server 

--------------------------------------------------------------

DEVELOPMENT ENVIRONMENT FOR LINUX

1. Install RVM and bundle install
  \curl -sSL https://get.rvm.io | bash

2. Run the rake database create and seed scripts
    rake db:create
    rake db:migrate
    rake db:seed
    
3. Install wkhtmltopdf to your local machine    [sudo apt-get install wkhtmltopdf]
 
4. Run the server
    rails server
    
---------------------------------------------------------------

Plugins
It is currently extended with the following core elements.

Devise   [https://github.com/plataformatec/devise/blob/master/README.md] Devise
wicked_pdf
pdf-reader



