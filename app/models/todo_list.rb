class TodoList < ApplicationRecord
  #
  ## Association
  #
  belongs_to :user
  has_many :todo_list_items

  #
  ## Validation
  #
  validates :title, presence: true, length: {maximum: 120}
  validates :description, length: {maximum: 160}
end
