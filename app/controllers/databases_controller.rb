class DatabasesController < ApplicationController
  def index
    @databases = Database.all
    respond_to do |format|
      format.json { render :json => @databases.map(&:name) }
    end
  end
end