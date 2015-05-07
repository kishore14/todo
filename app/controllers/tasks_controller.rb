class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  before_action :require_user
  
  def index
    @tasks = Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new()
    task_params
    
    if @task.save
      flash[:notice] = "Your task is created"
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit;  end
  
  def update
    task_params
    if @task.save
      flash[:notice] = "The post was updated."
      redirect_to task_path(@task)
    else
      render :edit
    end
  end
  
  private
  def set_task
    @task = Task.find_by slug: params[:id]
  end

  def task_params
    @task.title = params[:task][:title] 
    @task.actions = params[:task][:actions]
    @task.current_update = '' 
    if params[:task][:current_update] !=''
      @task.history = "\r\n #{Time.now.strftime("%d/%m/%Y %H:%M")}\r\n==============================\r\n" + params[:task][:current_update] + "\r\n" +@task.history 
    else
    @task.history = 'None'
    end
    @task.user_id = current_user
    @task.status_id = params[:task][:status_id]
    
  end
end