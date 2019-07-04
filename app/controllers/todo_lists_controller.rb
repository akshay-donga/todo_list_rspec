class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, only: [:show, :update, :destroy]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @size = params[:size] ? params[:size].to_i : 10
    @todo_lists = current_user.todo_lists.includes(:todo_list_items).page(@page).per(@size)
    render json: {data: @todo_lists}, status: :ok
  end

  def show
    render json: {data: @todo_list}, status: :ok
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      render json: {data: @todo_list, message: 'Todo List Created Successfully' }, status: :created
    else
      render json: {error: @todo_list.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render json: {data: @todo_list, message: 'Todo List Updated Successfully'}, status: :ok
    else
      render json: {error: @todo_list.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list.destroy
    render json: { message: 'Todo List Deleted Successfully' }, status: :ok
  end

  private

  def set_todo_list
    @todo_list = current_user.todo_lists.find(params[:id])
    render json: { message: 'Please Select Proper ToDo List' }, status: :not_found if @todo_list.blank?
  end

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end
end
