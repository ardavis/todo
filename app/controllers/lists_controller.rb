class ListsController < ApplicationController

  before_action :get_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.new
  end

  def show
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def update
    @list.update_attributes(list_params)
    redirect_to lists_path
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end