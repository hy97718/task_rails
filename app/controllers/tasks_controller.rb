class TasksController < ApplicationController
  
    def index
      @tasks = Task.all
    end
  

  def new
    @task =Task.new
  end

  def create
    @task= Task.new(task_params)
    if @task.save
      flash[:notice] = "タスクを登録しました。"
      redirect_to :tasks
    else 
      flash.now[:mistake] = "タスクの登録に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find_by(id:params[:id])
  end

  def edit
    @task = Task.find_by(id:params[:id])
  end

  def update
    @task = Task.find_by(id:params[:id])

    if @task.update(task_params)
      flash[:success] = "タスクを編集しました。"
      redirect_to :tasks
    else 
      flash.now[:failure] = "タスクの編集に失敗しました。"
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
    flash[:erace] = "予定を削除しました"
    redirect_to :tasks
    else
      redirect_to :tasks
    end  
  end


  private
  def task_params
    params.require(:task).permit(
    :title,
    :start_at,
    :end_at,
    :is_all_day,
    :memo
    )
  end


end


