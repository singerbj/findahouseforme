class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 30) 
  end

  def edit
    @user = User.find(params[:id])
    if @user.update_attributes(params[:house])  
      redirect_to users_path 
    else
      render 'users'
    end     
  end  
  
  def update
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to houses_path 
    
  end            
end
