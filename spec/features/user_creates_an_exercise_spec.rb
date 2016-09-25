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
