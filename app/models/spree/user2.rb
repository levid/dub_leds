module Spree
  class User2 < ActiveRecord::Base
    # include Core::UserBanners
    # 
    #     devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
    #            :token_authenticatable, :encryptable, :encryptor => 'authlogic_sha512', :authentication_keys => [:login]
    # 
    #    # has_many :authentications
    #    # 
    #    # validates_presence_of :name
    #    # validates_uniqueness_of :name, :email, :case_sensitive => false
    #    # attr_accessible :name, :username, :email, :password, :password_confirmation, :remember_me, :roles, :authentications, :login, :confirmed_at, :unconfirmed_email, :last_sign_in_ip, :current_sign_in_ip, :confirmation_sent_at, :current_sign_in_at, :last_sign_in_at, :remember_created_at, :invitation_token, :authentication_token, :locked_at, :reset_password_token, :unlock_token, :reset_password_sent_at, :failed_attempts 
    #    # 
    # 
    #     has_many :orders
    #     has_and_belongs_to_many :roles, :join_table => 'spree_roles_users'
    #     belongs_to :ship_address, :foreign_key => 'ship_address_id', :class_name => 'Spree::Address'
    #     belongs_to :bill_address, :foreign_key => 'bill_address_id', :class_name => 'Spree::Address'
    # 
    #     before_save :check_admin
    #     before_validation :set_login
    #     before_destroy :check_completed_orders
    #     
    #     validates_presence_of :name
    #     validates_uniqueness_of :name, :email, :case_sensitive => false
    #     attr_accessor :login
    #     
    #     before_create :create_login
    # 
    #     # Setup accessible (or protected) attributes for your model
    #     attr_accessible :name, :username, :email, :password, :password_confirmation, :persistence_token, :role_ids, :remember_me, :roles, 
    #                     :authentications, :login, :unconfirmed_email, :last_sign_in_ip, :current_sign_in_ip, 
    #                     :current_sign_in_at, :last_sign_in_at, :remember_created_at, :invitation_token, :authentication_token, :locked_at, 
    #                     :reset_password_token, :unlock_token, :reset_password_sent_at, :failed_attempts 
    # 
    #     users_table_name = User.table_name
    #     roles_table_name = Role.table_name
    # 
    #     scope :admin, lambda { includes(:roles).where("#{roles_table_name}.name" => "admin") }
    #     scope :registered, where("#{users_table_name}.email NOT LIKE ?", "%@example.net")
    # 
    #     class DestroyWithOrdersError < StandardError; end
    # 
    #     # has_role? simply needs to return true or false whether a user has a role or not.
    #     def has_role?(role_in_question)
    #       roles.any? { |role| role.name == role_in_question.to_s }
    #     end
    # 
    #     # Creates an anonymous user.  An anonymous user is basically an auto-generated +User+ account that is created for the customer
    #     # behind the scenes and its completely transparently to the customer.  All +Orders+ must have a +User+ so this is necessary
    #     # when adding to the "cart" (which is really an order) and before the customer has a chance to provide an email or to register.
    #     def self.anonymous!
    #       token = User.generate_token(:persistence_token)
    #       User.create(:email => "#{token}@example.net", :password => token, :password_confirmation => token, :persistence_token => token)
    #     end
    # 
    #     def self.admin_created?
    #       User.admin.count > 0
    #     end
    # 
    #     def anonymous?
    #       email =~ /@example.net$/
    #     end
    # 
    #     def send_reset_password_instructions
    #       generate_reset_password_token!
    #       UserMailer.reset_password_instructions(self).deliver
    #     end
    # 
    #     def create_login
    #       email = self.email.split(/@/)
    #       login_taken = User.where( :login => email[0]).first
    #       unless login_taken
    #         self.login = email[0]
    #       else
    #         self.login = self.email
    #       end
    #     end
    # 
    #     def role?(role)
    #       return !self.roles.where(name: role.to_s).empty?
    #     end
    # 
    #     def apply_omniauth(omniauth)
    #       case omniauth['provider']
    #       when 'facebook'
    #         self.apply_facebook(omniauth)
    #       end
    #       authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
    #     end
    # 
    #     def facebook
    #       @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
    #     end
    # 
    #     def self.find_for_database_authentication(warden_conditions)
    #        conditions = warden_conditions.dup
    #        login = conditions.delete(:login)
    #        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.strip.downcase }]).first
    #      end
    # 
    #     def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    #       data = access_token.extra.raw_info
    #       if user = self.find_by_email(data.email)
    #         user
    #       else # Create a user with a stub password.
    #         self.create!(:email => data.email, :password => Devise.friendly_token[0,20])
    #       end
    #     end
    # 
    #     def self.new_with_session(params, session)
    #         super.tap do |user|
    #         if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
    #           user.email = data["email"]
    #         end
    #       end
    #     end
    # 
    #     def self.find_for_open_id(access_token, signed_in_resource=nil)
    #       data = access_token.info
    #       if user = self.find_by_email(data.email)
    #         user
    #       else
    #         self.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    #       end
    #     end
    # 
    #     def update_with_password(params={})
    #       current_password = params.delete(:current_password)
    #       check_password = true
    #       if params[:password].blank?
    #         params.delete(:password)
    #         if params[:password_confirmation].blank?
    #           params.delete(:password_confirmation)
    #           check_password = false
    #         end
    #       end
    #       result = if valid_password?(current_password) || !check_password
    #         update_attributes(params)
    #       else
    #         self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
    #         self.attributes = params
    #         false
    #       end
    #       clean_up_passwords
    #       result
    #     end
    # 
    #     protected
    #       def password_required?
    #         !persisted? || password.present? || password_confirmation.present?
    #       end
    #       
    #       def apply_facebook(omniauth)
    #         if (extra = omniauth['extra']['user_hash'] rescue false)
    #           self.email = (extra['email'] rescue '')
    #         end
    #       end
    # 
    #       # Attempt to find a user by it's email. If a record is found, send new
    #       # password instructions to it. If not user is found, returns a new user
    #       # with an email not found error.
    #       def self.send_reset_password_instructions(attributes={})
    #         recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    #         recoverable.send_reset_password_instructions if recoverable.persisted?
    #         recoverable
    #       end
    # 
    #       def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
    #         (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }
    # 
    #         attributes = attributes.slice(*required_attributes)
    #         attributes.delete_if { |key, value| value.blank? }
    # 
    #         if attributes.size == required_attributes.size
    #           if attributes.has_key?(:login)
    #             login = attributes[:login]
    #             record = find_record(login)
    #           else
    #             record = where(attributes).first
    #           end
    #         end
    # 
    #         unless record
    #           record = new
    # 
    #           required_attributes.each do |key|
    #             value = attributes[key]
    #             record.send("#{key}=", value)
    #             record.errors.add(key, value.present? ? error : :blank)
    #           end
    #         end
    #         record
    #       end
    # 
    #       def self.find_record(login)
    #         where(["username = :value OR email = :value", { :value => login }]).first
    #       end
    # 
    #     private
    # 
    #       def check_completed_orders
    #         raise DestroyWithOrdersError if orders.complete.present?
    #       end
    # 
    #       def check_admin
    #         return if self.class.admin_created?
    #         admin_role = Role.find_or_create_by_name 'admin'
    #         self.roles << admin_role
    #       end
    # 
    #       def set_login
    #         # for now force login to be same as email, eventually we will make this configurable, etc.
    #         self.login ||= self.email if self.email
    #       end
    # 
    #       # Generate a friendly string randomically to be used as token.
    #       def self.friendly_token
    #         SecureRandom.base64(15).tr('+/=', '-_ ').strip.delete("\n")
    #       end
    # 
    #       # Generate a token by looping and ensuring does not already exist.
    #       def self.generate_token(column)
    #         loop do
    #           token = friendly_token
    #           break token unless find(:first, :conditions => { column => token })
    #         end
    #       end
    # 
    #       def self.current
    #         Thread.current[:user]
    #       end
    # 
    #       def self.current=(user)
    #         Thread.current[:user] = user
    #       end
  end
end
