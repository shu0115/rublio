source 'https://rubygems.org'
ruby '2.5.3'

gem 'rails', '5.2.1.1'

gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'minimum-omniauth-scaffold'
gem 'action_args'
gem 'html5_validators'
gem 'puma'
gem 'kaminari'
gem 'rails_config'
gem 'tapp-awesome_print'
gem 'exception_notification'
# gem 'haml-rails'
gem 'faml'

# Markdown
gem 'redcarpet'
gem 'coderay'

# [Ruby 2.4.0 で json gem v1.8.3 をビルドできない問題 - Qiita](http://qiita.com/shinichinomura/items/41e03d7e4fa56841e654)
gem 'json', github: 'flori/json', branch: 'v1.8'

# Design Template
gem 'therubyracer', platforms: :ruby
gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-fontawesome'
gem 'twitter-bootswatch-rails-helpers'

group :development do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'erb2haml'
  # gem 'quiet_assets'
  gem 'colorize_unpermitted_parameters'
  # gem 'rails-flog-disable-sql-format', require: 'flog'
  # gem 'rails-flog', require: "flog"
  gem 'bullet'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'bounscale'
  gem 'bugsnag'
  # gem 'appsignal'
end
