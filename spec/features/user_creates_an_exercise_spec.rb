require 'rails_helper'
require 'spec_helper'

feature "can be created" do
  it "with valid data" do
    workout = Workout.new(title: "test workout", user_id: 1)
    exercise = Exercise.new(name: "arnold press", reps: 100, note: "cool note")
    exercise.workout = workout
    assert(exercise.workout.title == "test workout")
    assert(exercise.valid?)
  end

  it "without optional note data" do
    workout = Workout.new(title: "test workout", user_id: 1)
    exercise = Exercise.new(name: "arnold press", reps: 100, note: nil)
    exercise.workout = workout
    assert(exercise.note == nil)
    assert(exercise.valid?)
  end

  it "through the table UI with valid data but no note" do
    sign_up_as("myolympia@ymca.com", "70sbig")
    create_workout("always chest day")
    create_exercise("always chest day", "bench press", 12)
    expect(page).to have_content("always chest day")
    expect(page).to have_content("bench press")
    expect(page).to have_content(12)
    expect(page).not_to have_content("Narnia")
  end

  it "through the table UI with valid data with note" do
    sign_up_as("kanye@equinox.com", "90ssmall")
    create_workout("hi I'm new here")
    create_exercise("hi I'm new here", "squat rack for curls", 3, "tapout t shirt")
    expect(page).to have_content("hi I'm new here")
    expect(page).to have_content("squat rack for curls")
    expect(page).to have_content("tapout t shirt")
    expect(page).to have_content(3)
    expect(page).not_to have_content("I've read up on this")
  end
end

feature "will not be created" do
  it "without an exercise title" do
    workout = Workout.new(title: "test workout", user_id: 1)
    exercise = Exercise.new(reps: 100, note: "cool note")
    exercise.workout = workout
    assert(exercise.invalid?)
  end

  it "without a positive integer rep" do
    workout = Workout.new(title: "test workout", user_id: 1)
    exercise = Exercise.new(name: "arnold press", reps: 0, note: "cool note")
    exercise.workout = workout
    assert(exercise.invalid?)
  end

  it "without any rep" do
    workout = Workout.new(title: "test workout", user_id: 1)
    exercise = Exercise.new(name: "arnold press", note: "cool note")
    exercise.workout = workout
    assert(exercise.invalid?)
  end

  it "without a workout" do
    exercise = Exercise.new(name: "arnold press", note: "cool note")
    assert(exercise.invalid?)
  end
end
