source 'https://rubygems.org'
ruby '2.1.4'

gem 'rails',           '4.1.6'
gem 'pg'                       # Use postgresql as the database
gem 'unicorn'                  # Use unicorn as the web server
gem 'sass-rails',   '~> 4.0.2' # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0' # Use Uglifier as compressor for JS assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets/views
gem 'jquery-rails'             # Use jquery as the JavaScript library
gem 'foundation-rails'         # Use Foundation as the CSS framework
gem 'jbuilder',     '~> 1.2'   # For building JSON APIs easily
gem 'dotenv-rails'             # For loading environment variables
gem 'twitter'                  # For working with the Twitter API
gem 'pg_search'                # For PostgreSQL full text search
gem 'newrelic_rpm'             # For app monitoring
gem 'will_paginate',           # For pagination
github: 'edariedl/will_paginate',
branch: 'rename_select_for_count_method'

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