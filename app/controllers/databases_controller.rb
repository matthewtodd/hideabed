class DatabasesController < ApplicationController
  def index
    render :json => Database.all.map(&:name)
  end

  def create
    @database = Database.new(:name => params[:name])
    if @database.save
      render :json => {}
    end
  end
end