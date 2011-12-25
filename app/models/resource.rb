class Resource
  include Mongoid::Document
  
  field :type,          :type => String
  field :title,         :type => String
  field :sub_title,     :type => String
  field :description,   :type => String
  
  validates_presence_of :type
end
