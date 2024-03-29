class Admin::SoftwaresController < AdminController
  respond_to :html, :json, :xml

  # GET /software
  # GET /software.json
  def index
    @software = Software.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @software }
    end
  end

  # GET /software/1
  # GET /software/1.json
  def show
    @software = Software.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @software }
    end
  end

  # GET /software/new
  # GET /software/new.json
  def new
    @software = Software.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @software }
    end
  end

  # GET /software/1/edit
  def edit
    @software = Software.find(params[:id])
  end

  # POST /software
  # POST /software.json
  def create
    @software = Software.new(params[:software])

    binding.pry

    respond_to do |format|
      if @software.save
        format.html { redirect_to admin_software_path(@software), notice: 'Software was successfully created.' }
        format.json { render json: @software, status: :created, location: @software }
      else
        format.html { render action: "new" }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /software/1
  # PUT /software/1.json
  def update
    if params[:default_id]
      clear_all_defaults
    end

    @software             = Software.find(params[:id])
    @software.default_id  = params[:id]

    respond_to do |format|
      if @software.update_attributes(params[:software])
        format.html { redirect_to admin_software_path(@software), notice: 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  ## GET /software/1/make_default
  def make_default
    clear_all_defaults

    @software             = Software.find(params[:id])
    @software.default_id  = params[:id]

    respond_to do |format|
      if @software.save
        format.html { redirect_to admin_softwares_path, notice: 'Software was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @software.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /software/1
  # DELETE /software/1.json
  def destroy
    @software = Software.find(params[:id])
    @software.destroy

    respond_to do |format|
      format.html { redirect_to admin_softwares_path }
      format.json { head :no_content }
    end
  end

  protected
    def clear_all_defaults
      @all_software = Software.all
      @all_software.each do |software|
        software.default_id = nil
        software.save
      end
    end
end
