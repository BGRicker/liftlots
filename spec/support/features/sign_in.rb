module Features
  def sign_in
    sign_in_as "Kanye@West.com", "pizza123123"
  end

  def sign_in_as(email, password)
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button  "Log in"
  end

  def sign_up_as(email, password)
    visit root_path
    click_on 'Sign up'
    fill_in "Email", with: email
    fill_in "Password", with: password, :match => :prefer_exact
    fill_in "Password confirmation", with: password, :match => :prefer_exact
    click_button  "Sign up"
  end

  def create_workout(title)
    click_on 'New Workout'
    fill_in "Title", with: title
    click_button "Create Workout"
  end

  def create_exercise(workout_title, name, reps, notes = nil)
    visit root_path
    click_on workout_title
    fill_in 'Name', with: name
    fill_in 'Reps', with: reps
    fill_in 'Notes', with: notes
    click_button "Create Exercise"
  end
end
