class MediaController < ApplicationController
  
  def index
    @media = Media.all
    @media = :media_path
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
