class ApplicationController < ActionController::Base
  before_filter :ssl_required, :unless => :development?
  before_filter :authentication_required

  private

  def ssl_required
    render(:json => { :error => 'SSL is required.' }, :status => :bad_request) unless request.ssl?
  end

  def authentication_required
    authenticate_or_request_with_http_basic { |api_key, _| api_key == HIDEABED_API_KEY }
  end

  def development?
    Rails.env.development?
  end
end
