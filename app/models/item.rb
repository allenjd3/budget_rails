class Item < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  has_many :transactions
  monetize :planned_cents
  monetize :remaining_cents
end
