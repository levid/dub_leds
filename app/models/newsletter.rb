class Newsletter
  include Mongoid::Document
  
  field :email, :type => String
  
  validates_presence_of :email
end
