class TodosController < ApplicationController

  before_action :get_list
  before_action :get_todo, only: [:show, :edit, :update, :destroy, :complete, :reopen]
  before_action :get_parent, only: [:show] #can't get_parent for create method.. how to pass
  
  
  def show
  end

  def new
    @parentID = params[:format] 
    @todo = @list.todos.new
  end

  def edit
    @parentID = @todo.parent_id
  end
  
  
  def create
    @todo = @list.todos.new(todo_params)
    if @todo.save

      if @todo.parent_id
        # redirect_to list_todo_path(@todo.parent.list, @todo.parent)
        redirect_to [@todo.parent.list, @todo.parent]
      else
        redirect_to @list
      end

    else
      render :new
    end
  end

  def update
    @todo.update_attributes(todo_params)
    redirect_to @list
  end

  def destroy
    @todo.destroy
    redirect_to @list
  end

  def complete
    unless @todo.complete!
      flash[:alert] = 'Unable to complete the todo'
    end
    if @todo.parent_id
      # redirect_to list_todo_path(@todo.parent.list, @todo.parent)
      redirect_to [@todo.parent.list, @todo.parent]
    else
      redirect_to @list
    end
  end

  def reopen
    unless @todo.reopen!
      flash[:alert] = 'Unable to reopen the todo'
    end
    if @todo.parent_id
      # redirect_to list_todo_path(@todo.parent.list, @todo.parent)
      redirect_to [@todo.parent.list, @todo.parent]
    else
      redirect_to @list
    end
  end

  private

  def get_list
    @list = List.find(params[:list_id])
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end
  
  def get_parent
    @parentID = @todo.id
  end
  
  def todo_params
    params.require(:todo).permit(:title, :description, :due_date, :parent_id)
  end
  

end