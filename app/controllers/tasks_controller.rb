class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in #, only: [:index, :show]
  before_action :correct_user, only: [:edit, :show, :destroy, :update]
 
 
  def index
    # if logged_in?
#            @tasks = current_user.tasks.build
            @tasks = current_user.tasks.order(id: :desc)
    # end
  end


  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
     
    if @task.save
      flash[:success] = 'task が正常に作成されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'task が作成されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy

    flash[:success] = 'task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  # def set_task
  #   @task = Task.find(params[:id])
  # end

  # = セキリティー    
  def task_params
    params.require(:task).permit(:conntent, :status)
  end
  
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end