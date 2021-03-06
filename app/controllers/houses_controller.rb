class HousesController < ApplicationController
  before_filter :admin_user, :only => [:edit, :update, :destroy]
  
  def index
    #@houses = House.paginate(:page => params[:page], :per_page => 25) 
    @json = create_json 
    @house = House.new
    @houses = House.order(:street)
    
    
    logger.info "**********************************Houses: (#{@json})"
    if params[:house]
        params[:house].each do |key, value|
        @houses = @houses.send("having_#{key}", value) unless value.blank?
      end
    end
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

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def create_json
     
      ##################
      @users = User.all

        @users.each do |user|
            @userlist << {
              :id => user.id,
              :fname => user.fname,
              :lname => user.lname,
              :photo => user.profile_pic.url(:small)
            }
         end
    end
end
