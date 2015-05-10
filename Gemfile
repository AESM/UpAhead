source 'https://rubygems.org'

## Leaving comments in for instructional sake

## Rails!
gem 'rails', '4.2.1'
## Use PostgreSQL as the database for ActiveRecord
gem 'pg'
## Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
## Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
## Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
## Use jQuery as the JavaScript library
gem 'jquery-rails'
## Following links in your web app faster: https://github.com/rails/turbolinks
gem 'turbolinks'
## Build JSON APIs with ease: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

## Prints Ruby objects with color and indentation to visualize their structure
gem 'awesome_print'
## A templating engine designed to make writing HTML documents easier
gem 'haml'
## Makes consuming RESTful web services easy
gem 'httparty'
## A modular, Rack, and MVC based authentication solution for Rails
gem 'devise', '~> 3.4.1'
## Provides jQuery UI stylesheets for the Rails asset pipeline in SCSS format
gem 'jquery-ui-sass-rails'
## Provides jQuery UI stylesheets for the Rails asset pipeline
gem 'jquery-ui-rails'
## Use Pry as an alternative REPL
gem 'pry'

group :doc do
  ## bundle exec rake doc:rails generates the API under doc/api
  gem 'sdoc', '~> 0.4.1', require: false
end

group :development, :test do
  ## Makes errors easier to read
  gem 'better_errors'
  ## Retrieves binding of a method's caller and bindings further up the stack, evaluating code in that context
  gem 'binding_of_caller'
  ## Used to ensure a clean state for testing
 #  gem 'database_cleaner'
  ## Shim to load environment variables from `.env` into `ENV` in development
  gem 'dotenv-rails'
  ## The RSpec testing framework for Rails 3.x and 4.x
  gem 'rspec-rails', '~> 3.2.1'
  # gem 'selenium-webdriver'
end

group :development do
  ## Runs app in the background, speeding up development
  gem 'spring'
end

group :test do
  ## Used to easily generate fake data
  gem 'faker'
  ## A Rack based, integration testing tool, simulating user interaction
  gem 'capybara', '~> 2.4.4'
  ## BDD in plain text
  gem 'cucumber-rails', :require => false
  ## Allows quick definition of prototypes for each model and requests for instances with properties that are important to the test at hand
  gem 'factory_girl_rails'
  ## Use 'shoulda' syntax
  gem 'shoulda-matchers', '~> 2.8.0'
end

## Deploying to Heroku?
group :production do
  ## Enables serving assets in production and setting logger to standard out
  gem 'rails_12factor'
  ## A web server that "glues" Mongrel parser, Event Machine, and Rack together
  gem 'thin'
end
