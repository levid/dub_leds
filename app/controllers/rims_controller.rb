class RimsController < ApplicationController
  respond_to :html, :json
  layout 'default'

  # GET /rims
  def index
    @rims = Rim.all
    @path = :rim_path
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @rims }
    end
  end

  # GET /rims/:id
  def show
    # @rims = Rim.all.collect { |r| r.id }
    @rim = Rim.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @rims }
    end
  end

  # GET /rims/:id/new
  def new
    @rim = Rim.new

    # respond_with @rim

    respond_to do |format|
      format.html
      format.json { render json: @rims }
    end
  end

  # POST /rims/:id
  def create
    @rim = Rim.new(params[:rim])

    respond_to do |format|
      if @rim.save
        flash[:success] = 'Rim successfully created.'
        format.html { redirect_to rim_show_path(@rim.id), notice: 'Rim successfully created.' }
        format.json { render json: @rim, status: :created, location: @rim }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { render action: "new" }
        format.json { render json: @rim.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /rims/:id/edit
  def edit
    @rim = Rim.find(params[:id])

    # respond_with @page

    respond_to do |format|
      format.html { render :layout => false }
      format.json { render json: @rim }
    end
  end

  # PUT /rims/:id
  def update
    @rim = Rim.find(params[:id])

    respond_to do |format|
      if @rim.update_attributes(params[:rim])
        flash[:success] = 'Rim was successfully updated.'
        format.html { redirect_to rim_show_path(@rim.id), notice: 'Rim was successfully updated.' }
        format.json { head :ok }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { redirect_to rim_show_path(@rim.id) }
        format.json { render json: @rim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rims/:id/
  def destroy
    @rim = Rim.find(params[:id])

    respond_to do |format|
      if @rim.destroy
        flash[:success] = 'Rim was removed'
        format.html { redirect_to rim_path, notice: 'Rim was removed.' }
        format.json { head :ok }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { redirect_to rim_show_path(@rim.id) }
        format.json { render json: @rim.errors, status: :unprocessable_entity }
      end
    end
  end
end
