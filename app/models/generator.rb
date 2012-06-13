class Generator < ActiveRecord::Base
  mount_uploader :thumbnail, GeneratorUploader
  attr_accessible :thumbnail
  
  belongs_to :spree_user, :class_name => 'Spree:User'
end
