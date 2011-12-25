class Technology
  include Mongoid::Document
  
  field :title,          :type => String
  field :sub_title,      :type => String
  field :description,    :type => String

end
