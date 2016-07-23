module Features
  def create_workout(title)
    click_on "New Workout"
    fill_in "Title", with: title
    click_button "Create Workout"
  end
end
