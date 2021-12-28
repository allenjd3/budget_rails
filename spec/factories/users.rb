FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    team { 1 }
  end
end
