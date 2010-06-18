class UsersController < ApplicationController
  
  before_filter :set_user, :only => [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new(params[:user])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render :action => "new"
    end
  end
  
  def update
    @user.update_attributes!(params[:user])
    redirect_to users_path
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  protected
  
  def set_user
    @user = User.find(params[:id]) if params[:id]
  end
  
end
