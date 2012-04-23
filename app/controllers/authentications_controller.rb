class AuthenticationsController < ApplicationController

  # Load user's authentications (Twitter, Facebook, ....)
  def index
    @authentications = current_user.authentications if current_user
  end

  # Create an authentication when this is called from
  # the authentication provider callback
  def create
    @authentication = Authentication.find(:first, conditions: {provider: omniauth['provider'], uid: omniauth['uid']})

    if @authentication #.persisted? #???
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: @authentication.provider_name
      # sign_in_and_redirect @user, :event => :authentication
      sign_in_and_redirect(:user, @authentication.user)

    elsif current_user
      current_user.authentications.create!(provider: omniauth['provider'], uid: omniauth['uid'])
      flash[:notice] = "Authentication successful. #{provider} added to your account."
      redirect_to current_user

    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        user.authentications.map &:save!
        # send pass by mail? or just tell that a random pass was set, click link to reset (change behaviour of the reset)
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        # session["devise.omniauth_data"] = omniauth.except('extra')
        session[:omniauth] = omniauth
        redirect_to new_user_registration_url
      end
    end
  end

  # Destroy an authentication
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = t(:successfully_destroyed_authentication)
    redirect_to authentications_url
  end

  def create_new_omniauth_user(omniauth)
    user = User.new
    user.apply_omniauth(omniauth, true)
    if user.save
      user
    else
      nil
    end
  end
end