class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new, :create]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    if logged_in?
      # @tasks = Task.all.page(params[:page]).per(10)
      @tasks = current_user.tasks.order('created_at DESC').page(params[:page])
    else
      redirect_to login_url
    end
  end

  def show
    # set_task
      # @task = Task.find(params[:id])
  end

  def new
      @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'タスク が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク が投稿されませんでした'
      render :new
    end
  end

  def edit
    # set_task
    # @task = Task.find(params[:id])
  end

  def update
    # set_task
    # @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

  def destroy
    # set_task
    # @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスク は正常に削除されました'
    redirect_to tasks_url
  end
  
  #このクラスのみで定義する
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status, :name)
  end
end
