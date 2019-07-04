FactoryGirl.define do
  factory :post do
    user
    title { Faker::Name.name }
    content "this is first post"
  end
end
