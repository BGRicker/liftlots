require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should belong_to(:workout) }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:reps).only_integer.is_greater_than_or_equal_to(1)}

end
