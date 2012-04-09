class Media < ActiveRecord::Base
  
  mount_uploader :thumbnail, ImageUploader
  
  # field :title,          :type => String
  #   field :description,    :type => String
  #   field :video_url,      :type => String
  #   field :created_at,     :type => DateTime, :default => Time.now.to_s
  #   field :updated_at,     :type => DateTime, :default => Time.now.to_s
  
  validates_presence_of :title, :video_url
end
