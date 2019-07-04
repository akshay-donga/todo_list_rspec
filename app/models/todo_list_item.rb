class TodoListItem < ApplicationRecord
  #
  ## Association
  #
  belongs_to :todo_list

  #
  ## Validation
  #
  validates :title, presence: true, length: {maximum: 120}
end
