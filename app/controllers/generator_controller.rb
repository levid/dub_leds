class GeneratorController < ApplicationController
  def index
    @rims = Rim.all
    @path = :generator_path
    # @generator = Generator.all.last(1).reverse
    @generator = Generator.first
    @user = Spree::User.find(current_user) rescue nil
  end

  def new
  end

  # PUT /generator
  # PUT /generator.json
  def upload
    @user = Spree::User.find(params[:id])
    @generator = Generator.new(params[:generator])
    
    GeneratorUploader.enable_processing = true
    
    if params[:generator][:thumbnail]
      @generator.thumbnail = GeneratorUploader.new
      @generator.thumbnail.store!(params[:generator][:thumbnail])
    end

    respond_to do |format|
      if @generator.save
        @user.generator = @generator
        if @user.save
          format.html { redirect_to generator_path, notice: 'Image was successfully uploaded.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
