CarrierWave.configure do |config|
  # config.grid_fs_connection = Mongoid.database
  config.storage = :file
  # config.storage = :grid_fs
  # config.grid_fs_access_url = '/tmp'
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.root = Rails.root.join('tmp')
end