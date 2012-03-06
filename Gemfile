source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'mysql2'
  gem 'mongrel', '1.2.0.pre2'
  gem 'pry'
end

gem 'jquery-rails'
gem 'rack', '1.3.3'
gem 'haml'

# Decorators
gem 'draper'

# Mongoid
gem 'bson_ext', '>= 1.3.1'
gem 'mongoid', '>= 2.3.3'

# User based authentication
gem 'devise', '>= 1.5.0' #https://github.com/plataformatec/devise
gem 'omniauth', '>= 1.0.0'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-openid'

# Export / Import database dump
gem 'yaml_db'

# Uploading images to Mongoid
gem 'carrierwave-mongoid'
gem 'mini_magick'

# Role based administration
gem 'cancan'

# thin server
gem 'thin'

# Shopping cart
gem 'acts_as_shopping_cart', :git => "git@github.com:crowdint/acts_as_shopping_cart.git"

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
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'yui-compressor'
  # gem "therubyracer", :require => 'v8'
  gem "compass"
  gem 'sprockets'
end
