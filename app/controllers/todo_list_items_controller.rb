class TodoListItemsController < ApplicationController
  # skip_before_action :authenticate_user!
  before_action :set_todo_list
  before_action :set_todo_list_item, only: [:show, :update, :destroy]

  def index
    @todo_list_items = @todo_list.todo_list_items
    render json: {data: @todo_list_items}, status: :ok
  end

  def show
    render json: {data: @todo_list_item}, status: :ok
  end

  def create
    @todo_list_item = @todo_list.todo_list_items.new(todo_list_item_params)

    if @todo_list_item.save
      render json: {data: @todo_list_item, message: 'ToDo List Item Created Successfully' }, status: :created
    else
      render json: {error: @todo_list_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @todo_list_item.update(todo_list_item_params)
      render json: {data: @todo_list_item, message: 'ToDo List Updated Successfully'}, status: :ok
    else
      render json: {error: @todo_list.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list_item.destroy
    render json: { message: 'ToDo List Item Deleted Successfully' }, status: :ok
  end

  private

  def set_todo_list_item
    @todo_list_item = @todo_list.todo_list_items.find_by_id(params[:id])
    render json: { message: 'Please Select Proper ToDo List Item' }, status: :not_found if @todo_list_item.blank?
  end

  def set_todo_list
    @todo_list = TodoList.find_by_id(params[:todo_list_id])
    render json: { message: 'Please Select Proper ToDo List' }, status: :not_found if @todo_list.blank?
  end

  def todo_list_item_params
    params.require(:todo_list_item).permit(:todo_list_id, :title)
  end
end
