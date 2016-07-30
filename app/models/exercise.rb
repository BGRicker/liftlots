class Exercise < ApplicationRecord
  belongs_to :workout
  validates :name, presence: true
  validates :reps, numericality: { only_integer: true }
end
