source 'https://rubygems.org'
ruby '2.1.7'

gem 'bundler'
gem 'rails', '~> 4.0.0'

gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'capistrano', group: :development
# debugger
gem 'byebug', :group => [:development, :test]

gem 'fog'
gem 'rest-client', :require => 'rest_client'
gem 'newrelic_rpm'
gem 'email_validator'
gem 'thin'
gem 'date_validator'

gem 'compass-rails'
gem 'yui-compressor'
gem 'bootstrap-sass'
gem 'jquery-ui-rails'
gem 'fancybox2-rails', '~> 0.2.8'

# Memcache client gem
gem 'dalli'

# Mongoid
gem "mongoid", "~> 5.0"

# I18n
gem 'rails-i18n'
# gem 'i18n_routing' Will change to https://github.com/enriclluelles/route_translator
gem "carmen-rails"
gem "carmen"

gem 'RedCloth'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'rmagick'

# 12 Factor Application
group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-rails', :group => [:development, :test]
  gem 'database_cleaner', git: 'https://github.com/agrass/database_cleaner.git'
  gem 'mongoid-rspec'
  gem 'factory_girl_rails'
  gem 'capybara'
end

gem 'mongoid_i18n_rails', '~> 0.0.7'
gem 'rack-cache'
