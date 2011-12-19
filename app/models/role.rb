# Role model
class Role
  include Mongoid::Document
  
  field :title, type: String
  field :name, type: String

  has_and_belongs_to_many :users
  
  def role?(role)
    return self.roles.find_by_name(role).try(:name) == role.to_s
  end
end