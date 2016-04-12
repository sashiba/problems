class TasksController < ApplicationController
  before_action :require_login, :require_admin

  def new
    @task = Task.new
  end

  def create
    if @task = Task.create(task_params)
      redirect_to root_path
    else
      flash[:danger] = "erors"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :test_command, :test)
  end
end
