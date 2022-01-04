FactoryBot.define do
  factory :category do
    name { "MyString" }
    month { FactoryBot.create(:month) }
  end
end
