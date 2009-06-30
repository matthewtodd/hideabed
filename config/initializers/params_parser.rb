# eager load the params parser...
ActionController::ParamsParser

# ...so we can override its json handling
ActionController::Base.param_parsers[Mime::JSON] = lambda do |request_body|
  { :json => Doily(request_body).with_indifferent_access }
end
