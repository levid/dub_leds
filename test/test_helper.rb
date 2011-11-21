require 'rubygems'
require 'spork'
require 'simplecov'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  # Configure Rails Environment
  ENV["RAILS_ENV"] = "test"

  require File.expand_path('../../config/environment', __FILE__)
  require "rails/test_help"

  Rails.backtrace_cleaner.remove_silencers!

  require 'mocha'
end

Spork.each_run do
  path = File.expand_path('../../',__FILE__)
  Dir["#{path}/app/models/**/*.rb"].each      { |f| load f }
  Dir["#{path}/app/decorators/**/*.rb"].each  { |f| load f }
  Dir["#{path}/app/controllers/**/*.rb"].each { |f| load f }
  # This code will be run each time you run your specs.
end

SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Decorators", "app/decorators"
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'
  add_group 'Plugins', 'vendor/plugins'
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#
VCR.config do |c|
  c.cassette_library_dir = File.expand_path('../fixtures/', __FILE__)
  c.stub_with :fakeweb
  c.default_cassette_options = { :record => :new_episodes }
end

