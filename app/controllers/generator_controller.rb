class GeneratorController < ApplicationController
  
  def index
    @rims = Rim.all
    @path = :generator_path
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def find_rim
    @rims = DubLeds::Rim.find params[:id]
  end

end
