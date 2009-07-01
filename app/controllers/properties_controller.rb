class PropertiesController < ApplicationController
  def index
    render :json => { :version => '0.9' }
  end
end
