class ViewsController < ApplicationController
  before_filter :load_database
  before_filter :load_design
  before_filter :load_view

  def show
    render :json => @database.documents.view(@view)
  end

  private

  def load_database
    @database = Database.find_by_name!(params[:database_name])
  end

  def load_design
    @design = @database.documents.find_by_name!("_design/#{params[:design_name]}")
  end

  def load_view
    @view = @design.views.find_by_name!(params[:name])
  end
end