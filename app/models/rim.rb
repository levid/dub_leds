class Rim
  include Mongoid::Document
  
  mount_uploader :image,        ImageUploader
  mount_uploader :small_image,  ImageUploader
  mount_uploader :medium_image, ImageUploader

  field :title,          :type => String
  field :description,    :type => String
  field :color,          :type => String
  field :size,           :type => String
  field :fitting,        :type => String
  field :created_at,     :type => DateTime, :default => Time.now.to_s
  field :updated_at,     :type => DateTime, :default => Time.now.to_s
  
  validates_presence_of :title
  
end
