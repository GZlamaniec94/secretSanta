class MembersController < ApplicationController
  def new
    @member = Member.new
  end
  
  
  def create
    @member = Member.new(member_params)    
  end  
  
  private 
  def group_params
    params.require(:group).permit(:name, :email)
  end

end