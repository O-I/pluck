source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails',           '4.2.4'
gem 'pg'                       # Use postgresql as the database
gem 'puma'                     # Use puma as the web server
gem 'sass',         '~> 3.3.0' # Use at least 3.3 for Foundation to work
gem 'sass-rails'               # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0' # Use Uglifier as compressor for JS assets
gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets/views
gem 'jquery-rails'             # Use jquery as the JavaScript library
gem 'foundation-rails'         # Use Foundation as the CSS framework
gem 'dotenv-rails'             # For loading environment variables
gem 'twitter'                  # For working with the Twitter API
gem 'pg_search'                # For PostgreSQL full text search
gem 'newrelic_rpm'             # For app monitoring
gem 'will_paginate',           # For pagination
github: 'edariedl/will_paginate',
branch: 'rename_select_for_count_method'
gem 'rack-mini-profiler', require: false
gem 'flamegraph'

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