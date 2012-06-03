class Admin::GeneratorsController < AdminController
  respond_to :html, :json, :xml

  # GET /generator
  # GET /generator.json
  def index
    @generator = Generator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @generator }
    end
  end

  # GET /generator/1
  # GET /generator/1.json
  def show
    @generator = Generator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @generator }
    end
  end

  # GET /generator/new
  # GET /generator/new.json
  def new
    @generator = Generator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @generator }
    end
  end

  # GET /generator/1/edit
  def edit
    @generator = Generator.find(params[:id])
  end

  # POST /generator
  # POST /generator.json
  def create
    @generator = Generator.new(params[:generator])
  
    respond_to do |format|
      if @generator.save
        format.html { redirect_to admin_generator_path(@generator.id), notice: 'Generator was successfully created.' }
        format.json { render json: @generator, status: :created, location: @generator }
      else
        format.html { render action: "new" }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /generator/1
  # PUT /generator/1.json
  def update
    @generator = Generator.find(params[:id])

    respond_to do |format|
      if @generator.update_attributes(params[:generator])
        format.html { redirect_to admin_generator_path(@generator.id), notice: 'Generator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @generator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generator/1
  # DELETE /generator/1.json
  def destroy
    @generator = Generator.find(params[:id])

    respond_to do |format|
      if @generator.destroy
        flash[:success] = 'Generator was removed'
        format.html { redirect_to admin_generators_path  }
        format.json { head :ok }
      else
        flash[:error] = @generator.errors.full_messages.join('')
        format.html { redirect_to admin_generator_path(@generator.id) }
        format.json { render json: @generator.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end
end
