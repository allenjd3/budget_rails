class Transaction < ApplicationRecord
  validates :name, presence: true
  belongs_to :item
  monetize :spent_cents
  after_commit :update_item_remaining

  private

  def update_item_remaining
    item = self.item
    item.remaining_cents = item.planned_cents - item.transactions.sum(:spent_cents)
    item.save
  end
end
