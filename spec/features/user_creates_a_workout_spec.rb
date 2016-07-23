require 'rails_helper'
require 'spec_helper'

feature "can be created" do
  it "creates a workout" do
    sign_up_as("Kanye@west.com", "pizza123123")
    expect(page).to have_content "Welcome"
    create_workout("Your Cool Workout")
    expect(page).to have_content "Your Cool Workout"
  end
end


feature "can be viewed" do
  it "can view a workout" do
    sign_in_as("Kanye@west.com", "pizza123123")
    create_workout("Your New Workout")
    click_on "Your New Workout"
    expect(page).to have_content "Add Exercise to Workout"
  end
end
