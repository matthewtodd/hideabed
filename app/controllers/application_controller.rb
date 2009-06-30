# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  before_filter :ssl_required, :unless => :development?
  before_filter :authentication_required

  private

  def development?
    Rails.env.development?
  end

  def ssl_required
    unless request.ssl?
      render :json => '{"error":"SSL is required."}', :status => :bad_request
    end
  end

  def authentication_required
    authenticate_or_request_with_http_basic do |username, password|
      username == HIDEABED_API_KEY
    end
  end
end
