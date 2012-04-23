class Content < ActiveRecord::Base
  attr_accessible :title, :sub_title, :description, :type
  validates_presence_of :title
end
