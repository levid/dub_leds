class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :only_allow_admin
  
  def index

  end
end
