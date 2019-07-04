require 'rails_helper'

RSpec.describe TodoList, type: :model do
  describe 'associations' do
    it {should have_many(:todo_list_items)}
    it {should belong_to(:user)}
  end
end