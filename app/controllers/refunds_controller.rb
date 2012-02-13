class RefundsController < ApplicationController
  # GET /refunds
  # GET /refunds.json
  def index
    @refunds = Refund.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @refunds }
    end
  end

  # GET /refunds/1
  # GET /refunds/1.json
  def show
    @refund = Refund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/new
  # GET /refunds/new.json
  def new
    @refund = Refund.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/1/edit
  def edit
    @refund = Refund.find(params[:id])
  end

  # POST /refunds
  # POST /refunds.json
  def create
    @refund = Refund.new(params[:refund])

    respond_to do |format|
      if @refund.save
        format.html { redirect_to @refund, notice: 'Refund was successfully created.' }
        format.json { render json: @refund, status: :created, location: @refund }
      else
        format.html { render action: "new" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /refunds/1
  # PUT /refunds/1.json
  def update
    @refund = Refund.find(params[:id])

    respond_to do |format|
      if @refund.update_attributes(params[:refund])
        format.html { redirect_to @refund, notice: 'Refund was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refunds/1
  # DELETE /refunds/1.json
  def destroy
    @refund = Refund.find(params[:id])
    @refund.destroy

    respond_to do |format|
      format.html { redirect_to refunds_url }
      format.json { head :ok }
    end
  end
end
