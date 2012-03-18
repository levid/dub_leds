class Admin::MediasController < AdminController
  respond_to :html, :json, :xml
  
  # GET /admin/media
  # GET /admin/media.json
  def index
    @media = Media.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media }
    end
  end

  # GET /admin/media/:id
  # GET /admin/media/:id.json
  def show
    @media = Media.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media }
    end
  end

  # GET /admin/media/new
  # GET /admin/media/new.json
  def new
    @media = Media.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media }
    end
  end

  # GET /admin/media/:id/edit
  # GET /admin/media/:id/edit.json
  # GET /admin/media/:id/edit.xml
  def edit
    @media = Media.find(params[:id])
    
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @media }
    end
  end

  # POST /admin/media
  # POST /admin/media.json
  def create
    @media = Media.new(params[:media])

    respond_to do |format|
      if @media.save
        flash[:success] = 'Media was successfully created.'
        format.html { redirect_to admin_media_path(@media.id) }
        format.json { render json: @media, status: :created, location: @media }
      else
        format.html { render action: "new" }
        format.json { render json: @media.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/media/:id
  # PUT /admin/media/:id.json
  def update
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.update_attributes(params[:media])
        flash[:success] = 'Media was successfully updated.'
        format.html { redirect_to admin_media_path(@media.id) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @media.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/media/:id
  # DELETE /admin/media/:id.json
  def destroy
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.destroy
        flash[:success] = 'Media was removed'
        format.html { redirect_to admin_medias_path  }
        format.json { head :ok }
      else
        flash[:error] = @media.errors.full_messages.join('')
        format.html { redirect_to admin_media_path(@media.id) }
        format.json { render json: @media.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
end
