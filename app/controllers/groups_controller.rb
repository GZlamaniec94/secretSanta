class GroupsController < ApplicationController
  before_action :require_user
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
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

  private 
  def group_params
    params.require(:group).permit(:name)
  end    

end  