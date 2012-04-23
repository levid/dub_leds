class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :subject, :body
  validates_presence_of :name, :subject, :body
  validates_format_of :email, :with => /^(\S+)@(\S+)\.(\S+)$/
end
