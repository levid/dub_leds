class GeneratorController < ApplicationController
  
  def index
    @rims = Rim.all
    @path = :generator_path
    @generator = Generator.all.last(1).reverse
  end

  def new

  end

  # POST /generator
  # POST /generator.json
  def create
    @generator = Generator.new(params[:generator])
    
    respond_to do |format|
      if @generator.save
        format.html { redirect_to generator_path, notice: 'Image was successfully uploaded.' }
        format.json { render json: @generator, status: :created, location: @generator }
      else
        format.html { render action: "new" }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  
    # if @generator.save
    #      render json: @generator, status: :created
    #    else
    #      render json: @generator.errors, status: :unprocessable_entity
    #    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
