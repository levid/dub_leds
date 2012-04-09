class TechnologyController < ApplicationController

  def index
     @rims = Rim.all.sort!{ |s| s.id }
     @resources = Resource.all
  end

  # GET /technology/:title
  def show
    @resource = Resource.where(title: params[:title])

    respond_to do |format|
      format.json { render json: @resource }
    end
  end
end
