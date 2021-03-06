class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page], :per_page => 25) 
  end

  def edit
    #@user = User.find(params[:id])
    #if @user.update_attributes(params[:house])  
    #  redirect_to users_path 
    #else
    #  render 'users'
    #end     
  end  
  
  def update
    #@user = User.find(params[:id])
    #@user.toggle!(:admin)
    #redirect_to houses_path 
  end

  def toggle_admin
    @user = User.find(params[:id])
    if @user.admin == true
      logger.info "***********setting admin to false"
      @user.admin = false
      @user.save
      redirect_to users_path
    else
      logger.info "***********setting admin to true"
      @user.admin = true
      @user.save
      redirect_to users_path
    end 
  end
end
