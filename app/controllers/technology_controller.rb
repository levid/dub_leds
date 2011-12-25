class TechnologyController < ApplicationController
  
  def index
     @rims = Rim.all.sort!(&:id)
  end

end
