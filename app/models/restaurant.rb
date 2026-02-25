class Restaurant < ApplicationRecord
  # When a restaurant is destroyed, all of its reviews must be destroyed as well.
  has_many :reviews, dependent: :destroy
  # A restaurant must have a name, an address and a category
  validates :name, :address, presence: true
  # A restaurant’s category must belong to this fixed list
  CATEGORIES = %w(chinese italian japanese french belgian)
  validates :category, inclusion: { in: CATEGORIES }, presence: true
end
