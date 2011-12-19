class Authentication
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String

  belongs_to :user

  attr_accessible :uid, :provider

  def provider_name
    if provider == 'open_id'
      "OpenID"
    else
      provider.titleize
    end
  end
end