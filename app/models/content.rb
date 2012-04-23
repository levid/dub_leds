class Content < ActiveRecord::Base
  attr_accessible :title, :sub_title, :description, :resource_type
  validates_presence_of :title
end
