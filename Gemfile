source 'https://rubygems.org'
ruby '2.1.1'

gem 'bundler'
gem 'rails', '>= 3.2'

gem 'fog'

gem 'rest-client', :require => 'rest_client'

gem 'rpm_contrib'
gem 'newrelic_rpm'
gem 'spectator-validates_email', :require => 'validates_email'
gem 'thin'
gem 'date_validator'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'compass-rails'
  gem 'uglifier'
  gem 'yui-compressor'
  gem 'bootstrap-sass'
end

gem 'coffee-rails'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'fancybox-rails'

# Memcache client gem
gem 'dalli'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
gem 'debugger', :group => [:development, :test]

# Mongoid
gem "mongoid", "~> 2.3"
gem "bson_ext", "~> 1.4"

# I18n
gem 'rails-i18n'
gem 'mongoid_globalize', :git => 'https://github.com/vicentemundim/mongoid_globalize.git'
gem 'i18n_routing'
gem "carmen-rails"
gem "carmen"

gem 'RedCloth'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem 'rmagick'

# 12 Factor Application
gem 'rails_12factor', group: :production

group :test do
  # Rspec
  gem 'rspec-rails', :group => [:development, :test]
  # use the database_cleaner gem to reset the test database
  gem 'database_cleaner', :group => :test
  # include RSpec matchers from the mongoid-rspec gem
  gem 'mongoid-rspec', :group => :test
  gem 'factory_girl_rails', :group => :test

  gem 'capybara'
end
