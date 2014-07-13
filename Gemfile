source 'https://rubygems.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# Use postgresql as the database for Active Record
gem 'pg'

# Use unicorn as the web server
gem 'unicorn'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# For loading environment variables
gem 'dotenv-rails'

# For working with the Twitter API
gem 'twitter'

# For better working with PostgreSQL full text search
gem 'pg_search'

# For pagination
gem 'will_paginate', github: 'nazgum/will_paginate'

# For prettying things up
gem 'foundation-rails'

# For app monitoring
gem 'newrelic_rpm'

group :development, :test do
  gem 'thin'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'factory_girl_rails'
  gem 'shoulda'
  gem 'database_cleaner'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end