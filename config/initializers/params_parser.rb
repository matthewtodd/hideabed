# eager load the params parser...
ActionController::ParamsParser

# ...so we can override its json handling
ActionController::Base.param_parsers[Mime::JSON] = Proc.new do |raw|
  if raw.blank?
    { :json => {} }
  else
    { :json => JSON[raw].with_indifferent_access }
  end
end
