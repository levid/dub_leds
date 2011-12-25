class CookiesController < ApplicationController
  respond_to :html, :json, :xml

  # GET /cookies/:id
  def show
    @cookie = get_cookie(:data)
    
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => @cookie }
    end
  end

  # POST /cookies/:id
  def create
    @cookie = set_cookie(params)

    respond_to do |format|
      if !@cookie.nil?
        # flash[:success] = 'Cookie updated'
        format.json { render json: @cookie, status: :created, location: @cookie }
      else
        # flash[:error] = @cookie.errors.full_messages.join('')
        format.json { render json: @cookie.errors, status: :unprocessable_entity }
      end
    end
  end

end
