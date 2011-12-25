class ContactController < ApplicationController
  
  # GET /contact
  def index
    @contact = Contact.new
  end
  
  # GET /contact/:id
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @contact }
    end
  end

  # GET /contact/new
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contact/:id/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contact
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        # Send the email
        # Use .create to create the email object without delivering it
        ContactMailer.send_contact_email(@contact).deliver

        format.html { redirect_to root_path, notice: 'Thank you for your message, we will be in touch with you shortly!' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "index" }
        format.json { render json: @contact.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact/:id
  def update
    @contact = Message.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:message])
        format.html { redirect_to @contact, notice: 'Message was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors.full_messages.join(''), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact/:id
  def destroy
    @contact = Message.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :ok }
    end
  end

end
