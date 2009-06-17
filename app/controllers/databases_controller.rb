class DatabasesController < ApplicationController
  def index
    render :json => Database.all.map(&:name)
  end

  def create
    @database = Database.new(:name => params[:name])
    if @database.save
      render :json => { 'ok' => true }, :status => :created
    else
      render :json => @database.errors, :status => :precondition_failed
    end
  end
end