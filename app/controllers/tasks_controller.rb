class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
    if params[:title].present?
      @tasks = current_user.tasks.get_by_title params[:title]
    end
    if params[:op_started].present?
      @tasks = current_user.tasks.get_by_op_started params[:op_started]
    end
    if params[:op_expection].present?
      @tasks = current_user.tasks.get_by_op_expection params[:op_expection]
    end
    if params[:priority].present?
      @tasks = current_user.tasks.get_by_priority params[:priority]
    end
    if params[:status].present?
      @tasks = current_user.tasks.get_by_status params[:status]
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_index_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

  def start
    @task = Task.find(params[:id])
    @op_started=Date.today
    @task.update_attributes( :op_started => @op_started )
    @task.operating!
    redirect_to tasks_path
  end

  def finished
    @task = Task.find(params[:id])
    @op_finished=Date.today
    @task.update_attributes( :op_finished => @op_finished  )
    @task.finished!
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def search
    @tasks = Task.search(params[:search])
  end

  private
    def task_params
      params.require(:task).permit(:title,:note,:op_start,:op_expection,:op_finished,:priority,:status)
    end

end
