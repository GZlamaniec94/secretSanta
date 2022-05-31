class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = User.first
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