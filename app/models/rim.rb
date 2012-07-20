class Rim < ActiveRecord::Base

  mount_uploader :image,        ImageUploader
  mount_uploader :small_image,  ImageUploader
  mount_uploader :medium_image, ImageUploader

  attr_accessible :title, :description, :color, :size, :fitting, :image, :medium_image, :small_image, :product_id
  validates_presence_of :title

  has_many :products, :class_name => "Spree::Products"

end
