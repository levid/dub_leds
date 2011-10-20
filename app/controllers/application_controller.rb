class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_names
  before_filter :set_year

  def set_names
    @current_controller = controller_name
    @current_action     = action_name
  end

  def set_year
    t = Time.now
    @year = t.strftime("%Y")
  end

end
