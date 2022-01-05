class Item < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  monetize :planned_cents
  monetize :remaining_cents
end
