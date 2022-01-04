class Month < ApplicationRecord
  validates :month, presence: true
  belongs_to :team
  monetize :monthly_planned_cents
  has_many :categories
end
