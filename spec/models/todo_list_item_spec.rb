require 'rails_helper'

RSpec.describe TodoListItem, type: :model do
  describe 'associations' do
    it {should belong_to(:todo_list)}
  end

  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_length_of(:title).is_at_most(120)}
  end
end