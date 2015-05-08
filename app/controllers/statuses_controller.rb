class StatusesController < ApplicationController
  before_action :require_user
  
  def new
    @status = Status.new
  end
  
  def create
    @status = Status.new()
    status_params
    if @status.save
      flash[:notice] = "New Status Created."
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @status = Status.where("slug =? and user_id =?" , params[:id], @current_user.id).first
  end
  
  def status_params
    @status.status = params[:status][:status] 
    @status.user_id = @current_user.id
  end
  
end