class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
  end  

  private 
  def group_params
    params.require(:group).permit(:name, :member_ids[])
  end    

end  