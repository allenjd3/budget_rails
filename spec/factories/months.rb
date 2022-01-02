FactoryBot.define do
  factory :month do
    month { "2022-01-01" }
    monthly_planned { 1 }
    team { FactoryBot.create(:team) }
  end
end
