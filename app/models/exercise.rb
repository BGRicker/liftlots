class Exercise < ApplicationRecord
  belongs_to :workout
  validates :name, presence: true
  validates :reps, numericality: { only_integer: true, :greater_than_or_equal_to => 1 }
end
