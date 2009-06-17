class DocumentsController < ApplicationController
  before_filter :load_database

  def show
    @document = @database.documents.find_by_name!(params[:name])
    render :json => @document
  end

  private

  def load_database
    @database = Database.find_by_name!(params[:database_name])
  end
end