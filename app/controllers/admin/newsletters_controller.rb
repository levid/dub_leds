class Admin::NewslettersController < AdminController
  respond_to :html, :json, :xml
  
  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @newsletters }
    end
  end

  # GET /newsletters/:id
  # GET /newsletters/:id.json
  def show
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @newsletter }
    end
  end

  # GET /newsletters/new
  # GET /newsletters/new.json
  def new
    @newsletter = Newsletter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @newsletter }
    end
  end

  # GET /newsletters/:id/edit
  # GET /newsletters/:id/edit.json
  # GET /newsletters/:id/edit.xml
  def edit
    @newsletter = Newsletter.find(params[:id])
    
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @newsletter }
    end
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(params[:newsletter])

    respond_to do |format|
      if @newsletter.save
        flash[:success] = 'Newsletter was successfully created.'
        format.html { redirect_to admin_newsletter_path(@newsletter.id) }
        format.json { render json: @newsletter, status: :created, location: @newsletter }
      else
        format.html { render action: "new" }
        format.json { render json: @newsletter.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /newsletters/1
  # PUT /newsletters/1.json
  def update
    @newsletter = Newsletter.find(params[:id])

    respond_to do |format|
      if @newsletter.update_attributes(params[:newsletter])
        flash[:success] = 'Newsletter was successfully updated.'
        format.html { redirect_to admin_newsletter_path(@newsletter.id) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @newsletter.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy

    respond_to do |format|
      if @newsletter.destroy
        flash[:success] = 'Media was removed'
        format.html { redirect_to admin_newsletters_path  }
        format.json { head :ok }
      else
        flash[:error] = @newsletter.errors.full_messages.join('')
        format.html { redirect_to admin_newsletter_path(@newsletter.id) }
        format.json { render json: @newsletter.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
end
