class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_names
  before_filter :set_year
  before_filter :find_rim
  before_filter :newsletter_signup

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

  def find_rim
    @active_rim = get_cookie('active_rim')
  end

  def set_cookie(params)
    cookie_name = params[:cookie_name]
    cookie_value = params[:cookie_value]
    cookies[":#{cookie_name}"] = cookie_value
  end

  def get_cookie(cookie_name)
    return cookies[":#{cookie_name}"]
  end
  
  def only_allow_admin
    redirect_to root_path, :alert => 'Not authorized as an administrator.' unless current_user.has_role? :admin
  end
  
  def newsletter_signup
    @newsletter = Newsletter.new
  end

end
