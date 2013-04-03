class HousesController < ApplicationController
  def index
     @houses = House.paginate(:page => params[:page], :per_page => 30) 
  end

  def new
     @house = House.new
  end
  
  def edit
    @house = House.find(params[:id])
  end
 
  def create
    @house = House.new(params[:house])
    @house.save
    redirect_to houses_path
  end

  def destroy
    House.find(params[:id]).destroy
    redirect_to houses_path
  end
  
  def update
    @house = House.find(params[:id])
    if @house.update_attributes(params[:house])  
      redirect_to houses_path 
    else
      render 'edit'
    end
  end
end
