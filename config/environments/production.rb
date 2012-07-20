DubLeds::Application.configure do
  APP_CONFIG      = YAML.load_file(Rails.root.join('config', 'app.yml'))[Rails.env]
  S3_CONFIG       = YAML.load_file(Rails.root.join('config', 's3.yml'))[Rails.env]
  OMNIAUTH_CONFIG = YAML.load_file(Rails.root.join('config', 'omniauth.yml'))[Rails.env]

  Fog::Logger[:warning] = nil

  # Settings specified here will take precedence over those in config/application.rb

  # ENV['MONGOID_HOST'] = 'staff.mongohq.com'
  #   ENV['MONGOID_PORT'] = '10022'
  #   ENV['MONGOID_USERNAME'] = 'levid'
  #   ENV['MONGOID_PASSWORD'] = 'wooteni'
  #   ENV['MONGOID_DATABASE'] = 'dub_leds'
  #   # ENV['MONGOHQ_URL'] = 'mongodb://levid:wooteni@staff.mongohq.com:10022/dub_leds'
  #
  #   ENV['MONGOHQ_URL'] = 'mongodb://levid:wooteni@staff.mongohq.com:10064/app2090795'


  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  config.assets.js_compressor  = :uglifier
  config.assets.css_compressor = :yui

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Specifies the header that your server uses for sending files
  config.action_dispatch.x_sendfile_header = "X-Sendfile"

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default :charset => "utf-8"
  config.action_mailer.default_url_options = { :host => APP_CONFIG['default_host'].to_s }

  # Set up email server
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
      :address => APP_CONFIG['smtp']['address'],
      :port => APP_CONFIG['smtp']['port'],
      :user_name => APP_CONFIG['smtp']['user_name'],
      :password => APP_CONFIG['smtp']['password'],
      :authentication => :plain,
      :enable_starttls_auto => true
  }

end
