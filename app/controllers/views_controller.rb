class ViewsController < ApplicationController
  before_filter :load_database

  def show
    render :json => @database.view(params[:design_name], params[:name])
  end

  private

  def load_database
    @database = Database.find_by_name!(params[:database_name])
  end
end