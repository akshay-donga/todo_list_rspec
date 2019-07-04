FactoryGirl.define do
  factory :todo_list_item do
    todo_list
    title {Faker::Internet.name}
  end
end