class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

    def show        
      @groups = @user.groups   
    end
   
    def new
      @user = User.new
    end
    
    def edit        
    end
    
     def update      
         if @user.update(user_params)
          flash[:notice] = "Your account was updated successfully."
             redirect_to groups_url  
         else
             render 'edit'
         end    
     end    
    
     def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          flash[:notice] = "Your account was creates successfully."
          redirect_to groups_path
         else
             render 'new'
         end        
     end
    
   def destroy
         @user.destroy
         session[:user_id] = nil if @user == current_user
         flash[:notice] = "Account and groups successfull deleted."
         redirect_to root_path        
     end    
    
    
    
    
     private   
    
     def user_params
          params.require(:user).permit(:username, :email, :password)
     end       
    
     def set_user
         @user = User.find(params[:id])
     end    

     def require_same_user
        if current_user != @user
          flash[:alert] = "You can only edit or delete your account"
          redirect_to groups_url
        end    
     end    
end  