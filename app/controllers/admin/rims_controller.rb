class Admin::RimsController < AdminController
  respond_to :html, :json, :xml

  # GET /admin/rims
  # GET /admin/rims.json
  def index
    @rims = Rim.all
    @path = :rim_path
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @rims }
    end
  end

  # GET /admin/rims/:id
  # GET /admin/rims/:id.json
  def show
    # @rims = Rim.all.collect { |r| r.id }
    @rim = Rim.find(params[:id])
    authorize! :show, @rim
    
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @rims }
    end
  end

  # GET /admin/rims/new
  # GET /admin/rims/new.json
  def new
    @rim = Rim.new

    respond_to do |format|
      format.html
      format.json { render json: @rims }
    end
  end
  
  # GET /admin/rims/:id/edit
  # GET /admin/rims/:id/edit.json
  # GET /admin/rims/:id/edit.xml
  def edit
    @rim = Rim.find(params[:id])

    respond_to do |format|
      # format.html { render :layout => false }
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @rim }
    end
  end

  # POST /admin/rims
  # POST /admin/rims.json
  def create
    @rim = Rim.new(params[:rim])

    respond_to do |format|
      if @rim.save
        flash[:success] = 'Rim successfully created.'
        format.html { redirect_to admin_rim_path(@rim.id) }
        format.json { render json: @rim, status: :created, location: @rim }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { render action: "new" }
        format.json { render json: @rim.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/rims/:id
  # PUT /admin/rims/:id.json
  def update
    @rim = Rim.find(params[:id])

    respond_to do |format|
      if @rim.update_attributes(params[:rim])
        flash[:success] = 'Rim was successfully updated.'
        format.html { redirect_to admin_rim_path(@rim.id) }
        format.json { head :ok }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { render action: "edit" }
        format.json { render json: @rim.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/rims/:id
  # DELETE /admin/rims/:id.json
  def destroy
    @rim = Rim.find(params[:id])

    respond_to do |format|
      if @rim.destroy
        flash[:success] = 'Rim was removed'
        format.html { redirect_to admin_rims_path  }
        format.json { head :ok }
      else
        flash[:error] = @rim.errors.full_messages.join('')
        format.html { redirect_to admin_rim_path(@rim.id) }
        format.json { render json: @rim.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
  
  def image_cache
    headers['Cache-Control'] = 'public; max-age=600' # cache image for 10 minutes
    send_data "#{Rails.root}/tmp/uploads/#{params['cache_id']}/#{params['filename']}", :disposition => 'inline', :type => "image/png"
  end
end
