class HomeController < ApplicationController

  # GET /home
  def index
    @rims = Rim.all

    @path = :home_path
    @users = User.all
  end
end
