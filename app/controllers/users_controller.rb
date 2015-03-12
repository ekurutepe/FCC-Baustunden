class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end
  
  def make_admin
    @user = User.find(params[:id])
    @user.update_attribute :admin, true
    
    redirect_to users_path, :notice => "#{@user.name} made admin"
      
  end
end
