source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'mysql2'
end

gem 'jquery-rails'
gem 'rack', '1.3.3'
gem 'haml'
gem 'draper'
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.3.3"
gem "devise", ">= 1.5.0" #https://github.com/plataformatec/devise
gem "omniauth-facebook"
gem "omniauth-twitter"
gem 'yaml_db'
gem 'carrierwave-mongoid'
gem 'mini_magick'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  gem 'spork-testunit', '0.0.6'
  gem 'guard'
  gem 'guard-test'
  gem 'mocha', :require => false
  gem 'vcr'
  gem 'fakeweb'
  gem 'simplecov', :require => false
  gem "capybara", ">= 1.1.2"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier',     '>= 1.0.3'
  gem "therubyracer", :require => 'v8'
  gem "compass",      '>= 0.10'
end
