class Content < ActiveRecord::Base
  attr_accessible :title, :sub_title, :page_content, :resource_type
  validates_presence_of :title
end
