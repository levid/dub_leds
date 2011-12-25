class HomeController < ApplicationController

  # GET /home
  def index
    @rims = Rim.all.sort!(&:id)
    
    @controller_js_args = @active_rim
    
    # puts YAML::dump(@rims)

    @path = :home_path
    @users = User.all
  end
  
end
