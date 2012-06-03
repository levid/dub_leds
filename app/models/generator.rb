class Generator < ActiveRecord::Base
  mount_uploader :thumbnail, GeneratorUploader
  attr_accessible :thumbnail
end
