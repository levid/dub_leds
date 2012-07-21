class SoftwareController < ApplicationController
  # GET /software
  # GET /software.json
  def index
    @software = Software.where("default_id > ?", 0).empty? ? Software.all : Software.where("default_id > ?", 0)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @software }
    end
  end
end
