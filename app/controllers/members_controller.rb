class MembersController < ApplicationController
  before_action :set_current_group_id, only: [:create]
  def new
    @member = Member.new
  end 

  def show 
  end  
  

  def create
    @member = Member.new(member_params)
    @member.group_id = session[:current_group_id]    
    if @member.save
      redirect_to group_path(Group.find_by_id(session[:current_group_id]))
    end  
  end  
  
  private 
  def member_params
    params.require(:member).permit(:name, :email)
  end

  def set_member
    @member = Member.find(params[:id])   
  end 

  def set_current_group_id
    current_group_id = session[:current_group_id]
  end   

end