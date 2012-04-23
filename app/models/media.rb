class Media < ActiveRecord::Base
  mount_uploader :thumbnail, ImageUploader
  
  attr_accessible :title, :video_url, :thumbnail, :description
  validates_presence_of :title, :video_url
end
