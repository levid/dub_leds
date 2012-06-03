class GeneratorController < ApplicationController
  
  def index
    @rims = Rim.all
    @path = :generator_path
    @generator = Generator.all
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

end
