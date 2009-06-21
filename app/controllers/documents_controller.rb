class DocumentsController < ApplicationController
  before_filter :load_database

  def create
    @document = @database.documents.build(:name => document_name, :data => request.request_parameters)
    if @document.save
      render :json => { :ok => true, :id => @document.name, :rev => @document.revision }, :status => :created
    else
    end
  end

  def show
    @document = @database.documents.find_by_name!(document_name)
    render :json => @document
  end

  private

  def load_database
    @database = Database.find_by_name!(params[:database_name])
  end

  def document_name
    params[:name]
  end
end
