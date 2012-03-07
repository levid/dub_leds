class HomeController < ApplicationController

  before_filter :set_date

  # GET /home
  def index
    @rims = Rim.all.sort!(&:id)
    @controller_js_args = [{ :active_rim => @active_rim }]
    # @controller_js_args = [{ :currentDay => @date_current, :today => @date_today, :environment => 'jit' }]

    # puts YAML::dump(@rims)

    @path = :home_path
    @users = User.all
  end

  protected
    def set_date
      today = Time.now.in_time_zone(ActiveSupport::TimeZone.new('Pacific Time (US & Canada)')).strftime("%Y-%m-%d")

      @date_today   = today
      @date_current = params[:day].present? ? DateTime.parse(params[:day]).strftime("%Y-%m-%d") : today
      @current_day  = params[:day].present? ? DateTime.parse(params[:day]).strftime("%b %d, %Y") : 'Today'
    end

end
