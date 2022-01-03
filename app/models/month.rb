class Month < ApplicationRecord
  validates :month, presence: true
  belongs_to :team
  monetize :monthly_planned_cents, with_currency: :usd
  has_many :categories
end
