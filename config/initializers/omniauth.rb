Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, OMNIAUTH_CONFIG['twitter']['consumer_key'], OMNIAUTH_CONFIG['twitter']['consumer_secret']
  provider :facebook, OMNIAUTH_CONFIG['facebook']['consumer_key'], OMNIAUTH_CONFIG['facebook']['consumer_secret'], {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  OmniAuth.config.logger = Logger.new(STDOUT)
  OmniAuth.logger.progname = "omniauth"
end
