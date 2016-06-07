class TodosController < ApplicationController

  before_action :get_list
  before_action :get_todo, only: [:show, :edit, :update, :destroy, :complete, :reopen]

  def show
  end

  def new
    @todo = @list.todos.new
  end

  def edit
  end

  def create
    @todo = @list.todos.new(todo_params)
    if @todo.save
      redirect_to @list
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
    redirect_to @list
  end

  def reopen
    unless @todo.reopen!
      flash[:alert] = 'Unable to reopen the todo'
    end
    redirect_to @list
  end

  private

  def get_list
    @list = List.find(params[:list_id])
  end

  def get_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description)
  end

end