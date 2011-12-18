Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qW7eyIXhRoMK8N84Kc5g', 'TIoQRdth1ZYGZzny77LGmgOmiJSTwXqBEkIdAsyjEw'
  provider :facebook, '42844466516', 'cf9fd40144a2f6d26d4a1fbd152bbca5', {:scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
  
  OmniAuth.config.full_host = "http://localhost:3000"
  
end