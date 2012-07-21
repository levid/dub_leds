CarrierWave.configure do |config|
  # # config.grid_fs_connection = Mongoid.database
  #  config.storage = :file
  #  # config.storage = :grid_fs
  #  # config.grid_fs_access_url = '/tmp'
  #  config.cache_dir = "#{Rails.root}/tmp/uploads"
  #  config.root = Rails.root.join('tmp')

  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => S3_CONFIG['access_key_id'],        # required
    :aws_secret_access_key  => S3_CONFIG['secret_access_key'],    # required
    :region                 => S3_CONFIG['region']                # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = S3_CONFIG['directory']                  # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.fog_host       = "http://#{S3_CONFIG['directory']}.s3.amazonaws.com/"

  # compute = Fog::Compute.new(:provider => 'AWS', :aws_access_key_id => S3_CONFIG['access_key_id'], :aws_secret_access_key => S3_CONFIG['secret_access_key'])
  # storage = Fog::Storage.new(:provider => 'AWS', :aws_access_key_id => S3_CONFIG['access_key_id'], :aws_secret_access_key => S3_CONFIG['secret_access_key'])
  # storage.sync_clock
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/