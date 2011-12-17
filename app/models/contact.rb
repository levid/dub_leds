class Contact
  include Mongoid::Document
  
  field :name,           :type => String
  field :email,          :type => String
  field :subject,        :type => String
  field :body,           :type => String
  
  validates_presence_of :name, :subject, :body
  validates_format_of :email, :with => /^(\S+)@(\S+)\.(\S+)$/
end
