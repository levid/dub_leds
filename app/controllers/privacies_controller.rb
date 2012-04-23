class PrivaciesController < ApplicationController
  # GET /privacies
  # GET /privacies.json
  def index
    @privacies = Privacy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @privacies }
    end
  end

  # GET /privacies/1
  # GET /privacies/1.json
  def show
    @privacy = Privacy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @privacy }
    end
  end

  # GET /privacies/new
  # GET /privacies/new.json
  def new
    @privacy = Privacy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @privacy }
    end
  end

  # GET /privacies/1/edit
  def edit
    @privacy = Privacy.find(params[:id])
  end

  # POST /privacies
  # POST /privacies.json
  def create
    @privacy = Privacy.new(params[:privacy])

    respond_to do |format|
      if @privacy.save!
        format.html { redirect_to @privacy, notice: 'Privacy was successfully created.' }
        format.json { render json: @privacy, status: :created, location: @privacy }
      else
        format.html { render action: "new" }
        format.json { render json: @privacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /privacies/1
  # PUT /privacies/1.json
  def update
    @privacy = Privacy.find(params[:id])

    respond_to do |format|
      if @privacy.update_attributes(params[:privacy])
        format.html { redirect_to @privacy, notice: 'Privacy was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @privacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privacies/1
  # DELETE /privacies/1.json
  def destroy
    @privacy = Privacy.find(params[:id])
    @privacy.destroy

    respond_to do |format|
      format.html { redirect_to privacies_url }
      format.json { head :ok }
    end
  end
end
