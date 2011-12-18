CarrierWave.configure do |config|
  config.grid_fs_database = 'dub_leds_development'
  config.grid_fs_host = 'localhost'
  config.storage = :grid_fs 
  config.grid_fs_access_url = "/tmp" 
end