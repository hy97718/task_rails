class TasksController < ApplicationController
  
    def index
      @tasks = Task.all
    end
  

  def show
  end

  def new
    @task =Task.new
  end

  def create
    p = task_params
    # フォームの入力がfalseの場合、keyなしのparamsが渡されるため
    # validation前にfalseを埋め込む
    if !p.respond_to? :is_all_day
        p[:is_all_day] = false
    end
    @task= Task.new(p)
    if @task.save
      flash[:success] = "タスクを登録しました。" 
      redirect_to tasks_url
    else 
      flash.now[:failure] = "タスクの登録に失敗しました。"
      render :new
    end
  end

  def edit
  end

  private
  def task_params
    params.require(:task).permit(
    :title,
    :start_at,
    :end_at,
    :is_all_day,
    :memo,
    )
  end


end


