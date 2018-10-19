class TasksController < ApplicationController
  before_action :set_todo_list
  #before_action :set_task, except: [:create]

  def create
    @tasks = @todo_list.tasks.create(task_params)
    redirect_to @todo_list
  end
  def show
  end
  def new
    @tasks = Task.new
  end
  def update
    @tasks = @todo_list.tasks.find(params[:id])
    if @tasks.update(task_params)
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @todo_list
  end
  def destroy
    @tasks = @todo_list.tasks.find(params[:id])
   if @tasks.destroy
    flash[:success] = "Todo List item was deleted."
   else
    flash[:error] = "Todo List item could not be deleted."
   end
   redirect_to @todo_list 
  end  
  def complete
    @tasks.update_attribute(:completed_at, Time.now)
    redirect_to @todo_list, notice: "Task completed"
  end
   private
  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
    @tasks = params[:id] ? Task.find(params[:id]) : Task.new
  end
  # def set_task
  #   @tasks = @todo_list.tasks.find(params[:id])
  # end
  def task_params
    params[:task].permit(:content)
  end
end
