class Transaction < ApplicationRecord
  validates :name, presence: true
  belongs_to :item
  monetize :spent_cents
end
