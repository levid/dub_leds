class GeneratorController < ApplicationController
  
  def index
    @rims = Rim.all
    @path = :generator_path
    @generator = Generator.all
  end

  def new

  end

  # POST /generator
  # POST /generator.json
  def create
    @generator = Generator.new(params[:generator])
  
    if @generator.save
      render json: @generator, status: :created
    else
      render json: @generator.errors, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
