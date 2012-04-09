class Newsletter < ActiveRecord::Base
  
  # field :email, :type => String
  
  validates_presence_of :email
end
