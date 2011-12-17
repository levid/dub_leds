class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'default'

  # Inside your protected controller
  # before_filter :authenticate_admin!

  # Inside your controllers and views
  # admin_signed_in?
  #   current_admin
  #   admin_session
  
  def show
    @admin = Admin.find(params[:id])

  end

end
