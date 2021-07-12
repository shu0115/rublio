source 'https://rubygems.org'
ruby '3.0.2'

gem 'rails', '6.1.4'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

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
gem 'haml-rails'
# gem 'faml'
gem 'rexml'

# Markdown
gem 'redcarpet'
gem 'coderay'

## 2021/07/12「TypeError - incompatible marshal file format (can't be read)」エラー対処のためコメントアウト
# # [Ruby 2.4.0 で json gem v1.8.3 をビルドできない問題 - Qiita](http://qiita.com/shinichinomura/items/41e03d7e4fa56841e654)
# gem 'json', github: 'flori/json', branch: 'v1.8'

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

  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.0'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'bounscale'
  gem 'bugsnag'
  # gem 'appsignal'
end
