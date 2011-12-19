class HomeController < ApplicationController

  # GET /home
  def index
    @rims = Rim.all.sort!(&:id)
    
    # puts YAML::dump(@rims)

    @path = :home_path
    @users = User.all
  end
end
