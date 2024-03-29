require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Pick the frameworks you want:
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

# require "mongoid/railtie"
# require "carrierwave/mongoid"
# require "carrierwave/orm/activerecord"

Bundler.require *Rails.groups(:assets) if defined?(Bundler)

ENV['PATH'] = "/usr/local/bin:#{ENV['PATH']}"

# if defined?(Bundler)
#   # If you precompile assets before deploying to production, use this line
#   Bundler.require(*Rails.groups(:assets => %w(development test)))
#   # If you want your assets lazily compiled in production, use this line
#   # Bundler.require(:default, :assets, Rails.env)
# end

module DubLeds
  class Application < Rails::Application
    
    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Load application's view overrides
      Dir.glob(File.join(File.dirname(__FILE__), "../app/overrides/*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.1'

    config.assets.initialize_on_precompile = false
    config.active_record.whitelist_attributes = true
    
    config.delete_tmp_file_after_storage = false
    config.delete_cache_id_after_storage = false

    # config.generators do |g|
    #       g.orm :active_record
    #     end
  end
end