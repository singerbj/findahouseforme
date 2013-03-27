class HousesController < ApplicationController
  def new
  end
  
  def show
     @houses = House.paginate(:page => params[:page])
  end
end
