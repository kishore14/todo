class StatusesController < ApplicationController
  before_action :require_user
  
  def new
    @status = Status.new
  end
  
  def create
     @status = Status.new(status_params)
    if @status.save
      flash[:notice] = "New Status Created."
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @status = Status.find_by slug: params[:id]
  end
  
  def status_params
    params.require(:status).permit(:status)
  end
  
end