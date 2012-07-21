class MediaController < ApplicationController
  def index
    @media        = Media.all
    @page_content = Content.where(:resource_type => 'media').first
  end
end
