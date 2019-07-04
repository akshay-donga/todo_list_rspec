FactoryGirl.define do
  factory :user do
    name { Faker::Name.name}
    email { Faker::Internet.email}
    city  "Rajkot"
    password { Faker::Internet.password }
    auth_token '1234567890'
  end
end