class Software < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :name, :image, :download_url
  validates_presence_of :name, :download_url
end
