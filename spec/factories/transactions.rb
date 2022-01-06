FactoryBot.define do
  factory :transaction do
    name { "MyString" }
    item { nil }
    spent { 1 }
    spent_date { "2022-01-04" }
  end
end
