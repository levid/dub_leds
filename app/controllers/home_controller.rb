class HomeController < ApplicationController
  before_filter :find_rim, :except => [:index, :new, :create, :update]
  
  # GET /home
  def index
    @rims = Rim.all
    @path = :home_path
  end

  # GET /home/:id
  def show
    @rims = Rim.all.collect { |r| r.id }
  end

  # GET /home/:id/new
  def new
    @rims = Rim.new
  end

  # POST /home/:id
  def create
    @rims = Rim.new(params[:rim])

    if(@rims.save)
      flash[:success] = 'Rim successfully created'
    else
      flash[:error] = @rims.errors.full_messages.join('')
    end
    
    redirect_to home_show_path(@rims.id)
  end

  # GET /home/:id
  def edit
    @rims = Rim.find(params[:id])
  end

  # PUT /home/:id
  def update
    @rims = Rim.find(params[:id])

    if @rims.update_attributes(params[:rim])
      flash[:success] = 'Rim was updated'
    else
      flash[:error] = @rims.errors.full_messages.join('')
    end

    redirect_to home_show_path(@rims.id)
  end

  # DELETE /home/:id/
  def destroy
    @rims = Rim.find(params[:id]).destroy

    if @rims.save
      flash[:success] = 'Rim was removed'
    else
      flash[:error] = @rims.errors.full_messages.join('')
    end

    redirect_to home_show_path(@rims.id)
  end

  protected

  def find_rim
    @rim = Rim.find params[:id]
  end
end
