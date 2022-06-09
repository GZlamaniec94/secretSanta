class GroupsController < ApplicationController
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end    

    def show
    @members = @group.members
  end    

  def edit
  end  

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if  @group.save
      flash[:notice] = "Group was created successfully"
      redirect_to @group         
    else
      render 'new'
    end    
  end  

  def destroy
    @group.destroy
    redirect_to groups_path
  end  


  private 
  def group_params
    params.require(:group).permit(:name)
  end    

  def set_group
    @group = Group.find_by_id(params[:id]) 
    session[:current_group_id]=@group.id    
  end 

end  