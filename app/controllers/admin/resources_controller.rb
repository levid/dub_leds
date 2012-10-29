class Admin::ResourcesController < AdminController
  respond_to :html, :json, :xml
  
  # GET /admin/resources
  # GET /admin/resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /admin/resources/:id
  # GET /admin/resources/:id.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /admin/resources/new
  # GET /admin/resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /admin/resources/:id/edit
  # GET /admin/resources/:id/edit.json
  # GET /admin/resources/:id/edit.xml
  def edit
    @resource = Resource.find(params[:id])
    
    respond_to do |format|
      # format.html { render :layout => false }
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @resource }
    end
  end

  # POST /admin/resources
  # POST /admin/resources.json
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        flash[:success] = 'Resource was successfully created.'
        format.html { redirect_to admin_resource_path(@resource.id) }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/resources/:id
  # PUT /admin/resources/:id.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        flash[:success] = 'Resource was successfully updated.'
        format.html { redirect_to admin_resource_path(@resource.id) }
        format.json { head :ok }
      else
        flash[:error] = @resource.errors.full_messages.join('')
        format.html { render action: "edit" }
        format.json { render json: @resource.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/resources/:id
  # DELETE /admin/resources/:id.json
  def destroy
    @resource = Resource.find(params[:id])
    
    respond_to do |format|
      if @resource.destroy
        flash[:success] = 'Resource was removed'
        format.html { redirect_to admin_resources_path  }
        format.json { head :ok }
      else
        flash[:error] = @resource.errors.full_messages.join('')
        format.html { redirect_to admin_resources_path(@resource.id) }
        format.json { render json: @resource.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
end
