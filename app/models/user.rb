class User < ActiveRecord::Base
  
  ROLES = %w[admin moderator author banned]
  
  ## Database authenticatable
  # field :email,              :type => String, :null => false
  #  field :encrypted_password, :type => String, :null => false
  # 
  #  ## Recoverable
  #  field :reset_password_token,   :type => String
  #  field :reset_password_sent_at, :type => Time
  # 
  #  ## Rememberable
  #  field :remember_created_at, :type => Time
  # 
  #  ## Trackable
  #  field :sign_in_count,      :type => Integer
  #  field :current_sign_in_at, :type => Time
  #  field :last_sign_in_at,    :type => Time
  #  field :current_sign_in_ip, :type => String
  #  field :last_sign_in_ip,    :type => String
 
  ## Encryptable
  # field :password_salt, :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # Token authenticatable
  # field :authentication_token, :type => String

  ## Invitable
  # field :invitation_token, :type => String
  
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :rememberable, :trackable, :validatable, :omniauthable, :token_authenticatable
  
  has_many :authentications
  has_and_belongs_to_many :roles
  
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false    
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :roles, :authentications

  def role?(role)
    return !self.roles.where(role: role.to_s).empty?
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end  
  
  def apply_omniauth(omniauth, confirmation)
    self.email = omniauth['user_info']['email'] if email.blank?
    # Check if email is already into the database => user exists
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else 
      # Create a user with a stub password. 
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def self.new_with_session(params, session)
      super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def update_with_password(params={})
    current_password = params.delete(:current_password)
    check_password = true
    if params[:password].blank?
      params.delete(:password)
      if params[:password_confirmation].blank?
        params.delete(:password_confirmation)
        check_password = false
      end 
    end
    result = if valid_password?(current_password) || !check_password
      update_attributes(params)
    else
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      self.attributes = params
      false
    end
    clean_up_passwords
    result
  end
end
