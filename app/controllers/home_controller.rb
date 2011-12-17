class HomeController < ApplicationController

  # GET /home
  def index
    @rims = Rim.all.sort!(&:id)

    @path = :home_path
    @users = User.all
  end
end
