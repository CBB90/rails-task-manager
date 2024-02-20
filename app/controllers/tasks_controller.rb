class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # Display the form for a new task
  def new
    @task = Task.new
  end

  # Process the form submission and create a new task
  def create
    @task = Task.find(params[:id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
