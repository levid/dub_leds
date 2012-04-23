class Admin::ContentsController < AdminController
  respond_to :html, :json, :xml
  
  # GET /admin/contents
  # GET /admin/contents.json
  def index
    @contents = Content.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  # GET /admin/contents/:id
  # GET /admin/contents/:id.json
  def show
    @content = Content.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @content }
    end
  end

  # GET /admin/contents/new
  # GET /admin/contents/new.json
  def new
    @content = Content.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content }
    end
  end

  # GET /admin/contents/:id/edit
  # GET /admin/contents/:id/edit.json
  # GET /admin/contents/:id/edit.xml
  def edit
    @content = Content.find(params[:id])
    
    respond_to do |format|
      # format.html { render :layout => false }
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @content }
    end
  end

  # POST /admin/contents
  # POST /admin/contents.json
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        flash[:success] = 'Content was successfully created.'
        format.html { redirect_to admin_content_path(@content.id) }
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/contents/:id
  # PUT /admin/contents/:id.json
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        flash[:success] = 'Content was successfully updated.'
        format.html { redirect_to admin_content_path(@content.id) }
        format.json { head :ok }
      else
        flash[:error] = @content.errors.full_messages.join('')
        format.html { render action: "edit" }
        format.json { render json: @content.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/contents/:id
  # DELETE /admin/contents/:id.json
  def destroy
    @content = Content.find(params[:id])
    
    respond_to do |format|
      if @content.destroy
        flash[:success] = 'Content was removed'
        format.html { redirect_to admin_contents_path  }
        format.json { head :ok }
      else
        flash[:error] = @content.errors.full_messages.join('')
        format.html { redirect_to admin_contents_path(@content.id) }
        format.json { render json: @content.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
end
