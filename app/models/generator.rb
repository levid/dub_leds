class Generator < ActiveRecord::Base
  mount_uploader :thumbnail, GeneratorUploader
  mount_uploader :preview, GeneratorUploader
end
