class Users::RegistrationsController < ApplicationController
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  #skip_before_filter :require_no_authentication

  def check_permissions
    authorize! :create, resource
  end

  def create
    super
    session['devise.omniauth_data'] = nil unless @user.new_record?
  end
  
  def email
    if session[:omniauth]
      if params[:email]
        user = User.new
        user.email = params[:email]
        user.apply_omniauth(session[:omniauth], false)
        if user.save
          user.authentications.create!(:provider => session[:omniauth]['provider'], :uid => session[:omniauth]['uid'])
          session[:omniauth] = nil
          # Create a new User through omniauth
          # Register the new user + create new authentication
          flash[:notice] = t(:welcome)
          sign_in_and_redirect(:user, user)
        else
          flash[:alert] = user.errors.to_a[0]
          redirect_to new_user_registration_url
        end
      end
    else
      flash[:alert] = t(:fail)
      redirect_to new_user_registration_url
    end
  end

  private

  def build_resource(*args)
    super
    if session['devise.omniauth_data']
      @user.apply_omniauth(session['devise.omniauth_data'])
      @user.valid?
    end
  end
  
end
