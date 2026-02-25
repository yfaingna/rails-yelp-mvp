class Review < ApplicationRecord
  # A review must belong to a restaurant
  belongs_to :restaurant
  # A review must have a content
  validates :content, presence: true
  # A review must have a rating
  validates :rating, presence: true, numericality: {
    # It must be an integer
    only_integer: true, # Remove if using decimal
    # A review’s rating must be a number between 0 and 5
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5
  }
end
