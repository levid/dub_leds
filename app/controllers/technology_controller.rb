class TechnologyController < ApplicationController

  def index
     @rims = Rim.all.sort!{ |s| s.id }
     @contents = Content.all
  end

  # GET /technology/:title
  def show
    @content = Content.where(title: params[:title])

    respond_to do |format|
      format.json { render json: @content }
    end
  end
end
