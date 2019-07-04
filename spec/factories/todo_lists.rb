FactoryGirl.define do
  factory :todo_list do
    user
    title {Faker::Internet.name}
    description "f ds dsv sv dsv vds s"
  end
end