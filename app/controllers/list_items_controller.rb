class ListItemsController < ApplicationController

  def index
    @task_list = TaskList.find(params[:task_list_id])
  end

  def new
    @task_list = TaskList.find(params[:task_list_id])
    @list_item = @task_list.list_items.new
  end

  def create
    @task_list = TaskList.find(params[:task_list_id])
    @list_item = @task_list.list_items.new(list_item_params)

    if @list_item.save
      flash[:success] = "New item added."
      redirect_to task_list_list_items_path
    else
      flash[:error] = "The item could not be added.  Sorry."
      render action: :new
    end

  end

  private

  def list_item_params
    params[:list_item].permit(:content)
  end

end
