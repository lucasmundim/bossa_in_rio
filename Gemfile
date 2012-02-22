source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'fog'

gem 'rest-client', :require => 'rest_client'

gem 'rpm_contrib'
gem 'newrelic_rpm'
gem 'spectator-validates_email', :require => 'validates_email'
gem 'thin'
gem 'twitter-bootstrap-rails', :git => 'http://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'date_validator'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'uglifier', '>= 1.0.3'
end

gem 'coffee-rails', '~> 3.1.1'

gem 'jquery-rails'
gem 'fancybox-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
gem 'ruby-debug19', :require => 'ruby-debug', :group => [:development, :test]

# Javascript runtime
group :development do
  gem "therubyracer", :require => 'v8'
end

# Mongoid
gem "mongoid", "~> 2.3"
gem "bson_ext", "~> 1.4"

# I18n
gem 'rails-i18n'
gem 'mongoid_globalize', :git => 'http://github.com/vicentemundim/mongoid_globalize.git'
gem 'i18n_routing'
gem "carmen", "0.2.12"

gem 'RedCloth'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'rmagick'


group :test do
  # Rspec
  gem 'rspec-rails', '>= 2.7.0', :group => [:development, :test]
  # use the database_cleaner gem to reset the test database
  gem 'database_cleaner', '>= 0.6.7', :group => :test
  # include RSpec matchers from the mongoid-rspec gem
  gem 'mongoid-rspec', '>= 1.4.4', :group => :test
  gem 'factory_girl_rails', '>= 1.3.0', :group => :test

  gem 'capybara'
end