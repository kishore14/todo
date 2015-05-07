class SessionsController < ApplicationController
  
  def new
    redirect_to tasks_path if logged_in?
  end
  
  def create
    user = User.where(name: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you are logged in."
      redirect_to tasks_path      
    else
      flash[:error] = "Username or pasword combination is incorrect."
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You are logged out.'
    redirect_to root_path
  end
end