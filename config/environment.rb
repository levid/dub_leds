# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# Initialize the rails application
DubLeds::Application.initialize!

ActiveRecord::Base.include_root_in_json = true
