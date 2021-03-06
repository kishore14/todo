class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end
  
  def show;  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice]= 'You are registered.'
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit;  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :time_zone)
  end
  
  def set_user 
    @user = User.find_by slug: params[:id]
  end
  
end