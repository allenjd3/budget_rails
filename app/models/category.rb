class Category < ApplicationRecord
  validates :name, presence: true
  belongs_to :month
  has_many :items
end
