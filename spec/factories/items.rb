FactoryBot.define do
  factory :item do
    name { "MyString" }
    planned { 1 }
    remaining { 1 }
    is_fund { false }
    category { FactoryBot.create(:category) }
  end
end
