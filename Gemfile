source 'https://rubygems.org'

gem 'rails', '3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3', :group => :development

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# For Heroku
gem 'thin'

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end

# Utility
gem 'kaminari'
gem "rails_config"

# For OmniAuth
gem 'omniauth-twitter'

# Development Only
group :development do
  gem 'omniauth-scaffold'
  gem 'custom-template'
end

# For Markdown
gem 'redcarpet'
gem "pygments.rb"          # => 0.2.3
gem "rubypython", "0.5.1"  # For Heroku

# For EventMachine
gem 'eventmachine'
