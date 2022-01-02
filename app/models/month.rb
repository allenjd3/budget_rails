class Month < ApplicationRecord
  validates :month, presence: true
  belongs_to :team
end
