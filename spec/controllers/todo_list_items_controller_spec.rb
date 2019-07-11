require 'rails_helper'

RSpec.describe TodoListItemsController, type: :request do
  # describe 'GET #index' do
  #   let!(:todo_list) {FactoryGirl.create(:todo_list)}
  #   let!(:todo_list_item1) {FactoryGirl.create(:todo_list_item, todo_list: todo_list)}
  #   let!(:todo_list_item2) {FactoryGirl.create(:todo_list_item, todo_list: todo_list)}
  #   let(:path) {todo_list_todo_list_items_path(todo_list)}

  #   before do
  #     controller.stub(:authenticate_user)
  #     get path
  #   end

  #   it 'assigns todo_list_items' do
  #     # json_response = JSON.parse(response.body)
  #     expect(assigns(:todo_list_items)).to eq([todo_list_item1, todo_list_item2])
  #   end
  # end

  # describe 'GET show' do
  #   let (:todo_list_item) {FactoryGirl.create(:todo_list_item)}
  #   let! (:todo_list) {FactoryGirl.create(:todo_list)}
  #   let (:path) { todo_list_todo_list_item_path(id: todo_list_item.id, todo_list_id: todo_list.id) }
    
  #   before do
  #     get path
  #   end

  #   context "when user authenticated" do
  #     it "JSON body response contains expected todo_list_item attributes" do
  #       json_response = JSON.parse(response.body)
  #       # expect(json_response.keys).to match_array([:id, :todo_list_id, :title])
  #     end
  #   end

  #   context 'when user is unauthorized' do
  #     it "User is not authorized" do
  #       # get path
  #       json_response = JSON.parse(response.body)
  #       expect(response).to have_http_status(:not_found)
  #       expect(json_response.keys).to match_array(['error'])
  #       expect(json_response.values).to match_array(['Please Sign in First'])
  #     end
  #   end
  # end
end
