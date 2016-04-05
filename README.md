# Profiles

A community profiles app. Sign up and share your profile with others

## Getting started

### Dependecies

To run this app you need to install:

* Ruby 2.3.0 (RVM is the best way https://rvm.io)

* Rails 5.0

* [PostgreSQL 9.4](http://www.postgresql.org)
  * Ubuntu: ```$ sudo apt-get install postgresql```
  * OSX: http://postgresapp.com

### Setup

* Clone this project

  ```
  $ git clone https://github.com/alesshh/profiles.git
  ```

* Enter the project folder
  ```
  $ cd profiles
  ```

* Configure the database
  ```
  $ cp config/database.yml.example config/database.yml
  ```

* Install gems
  ```
  $ bundle install
  ```

* Create the database and seed data
  ```
  $ rake db:create db:migrate db:seed
  ```

### Runnig the project

* Run Rails server
  ```
  $ rails s
  ```

* Open the browser and visit http://localhost:3000

### Running tests

* This project uses [RSpec](http://rspec.info) as test suite. To run tests, just execute the below command:
  ```
  $ bundle exec rspec spec
  ```

* To check the test [coverage](https://github.com/colszowka/simplecov), just run:
  ```
  $ COV=true bundle exec rspec spec
  ```
  Open the file **coverage/index.html** on your prefered browser.

### Best practices

* Use this style guide: https://github.com/bbatsov/ruby-style-guide

* To check the code, just run:
  ```
  $ rubocop .
  ```

* Keep safe, just run:
  ```
  $ brakeman .
  ```

## Credits

Author: Alessandro Tegner

## License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.





