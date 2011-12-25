class HomeController < ApplicationController

  # GET /home
  def index
    @rims = Rim.all.sort!(&:id)
    
    @controller_js_args = 'test'
    
    # puts YAML::dump(@rims)

    @path = :home_path
    @users = User.all
  end
end
