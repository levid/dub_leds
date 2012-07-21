class TechnologyController < ApplicationController
  def index
     @rims          = Rim.all.sort!{ |s| s.id }
     @modal_content = Content.where(:resource_type => 'technology_modal').all
     @page_content  = Content.where(:resource_type => 'technology').first
  end

  # GET /technology/:title
  def show
    @modal_content = Content.where(title: params[:title])

    respond_to do |format|
      format.json { render json: @modal_content }
    end
  end
end
