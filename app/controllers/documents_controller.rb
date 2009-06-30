class DocumentsController < ApplicationController
  before_filter :load_database
  before_filter :load_document,          :only => [:show, :destroy]
  before_filter :load_or_build_document, :only => [:update]

  def show
    render :json => @document
  end

  def update
    if @document.update_attributes(:revision_confirmation => params[:json][:_rev] || 'unspecified', :data => document_data)
      render :json => { :ok => true, :id => @document.name, :rev => @document.revision }, :status => :created
    else
      render :json => { :error => 'conflict', :reason => 'Document update conflict.' }, :status => :conflict
    end
  end

  def destroy
    if @document.revision == params[:rev]
      @document.destroy
      render :json => { :ok => true, :rev => ActiveSupport::SecureRandom.hex(16) }
    else
      render :json => { :error => 'conflict', :reason => 'Document update conflict.' }, :status => :conflict
    end
  end

  private

  def load_database
    @database = Database.find_by_name!(params[:database_name])
  end

  def build_document
    @document = @database.documents.build(:name => document_name, :data => document_data)
  end

  def load_document
    @document = @database.documents.find_by_name!(document_name)
  end

  def load_or_build_document
    load_document
  rescue ActiveRecord::RecordNotFound
    build_document
  end

  def document_name
    params[:name]
  end

  def document_data
    params[:json].except(:_id, :_rev)
  end
end
