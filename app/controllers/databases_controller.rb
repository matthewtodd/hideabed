class DatabasesController < ApplicationController
  def index
    @databases = Database.all
    render :json => @databases.map(&:name)
  end

  def create
    @database = Database.new(:name => params[:name])
    if @database.save
      render :json => { 'ok' => true }, :status => :created
    else
      render :json => @database.errors, :status => :precondition_failed
    end
  end

  def show
    @database = Database.find_by_name!(params[:name])
    render :json => @database
  end

  def destroy
    @database = Database.find_by_name!(params[:name])
    @database.destroy
    render :json => { 'ok' => true }
  end
end
