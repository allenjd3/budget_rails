class Month < ApplicationRecord
  validates :month, presence: true
  belongs_to :team
  monetize :monthly_planned_cents
  has_many :categories

  def calculate_remaining
    actual_planned = Money.from_cents(Item.where(category_id: (self.categories.pluck(:id))).sum(:planned_cents))
    monthly_planned = Money.from_cents(self.monthly_planned_cents)
    monthly_planned - actual_planned
  end
end
