class Privacy < ActiveRecord::Base

  # field :title,         :type => String
  #   field :content,       :type => String

  validates_presence_of :title, :content
end
