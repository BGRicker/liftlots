class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  validates :title, presence: true
end
