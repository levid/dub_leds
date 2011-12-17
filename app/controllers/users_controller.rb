class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'default'

  def show
    @user = User.find(params[:id])

  end

end