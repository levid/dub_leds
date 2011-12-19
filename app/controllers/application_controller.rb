class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_names
  before_filter :set_year
  
  layout :set_layout
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def set_names
    @current_controller = controller_name
    @current_action     = action_name
    
    logger.debug { @current_controller.inspect }
  end

  def set_year
    t = Time.now
    @year = t.strftime("%Y")
  end
  
  def after_sign_in_path_for(resource)
    return request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  
  def set_layout
    if(controller_name != 'home') 
       "subpages"
    else
       "application"
    end
  end

end
