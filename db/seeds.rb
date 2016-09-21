task :sample_data => :environment do
  require 'faker'
end

def create_workout
  10.times do |n|
    Workout.create!(
    title: Faker::Pokemon.name,
    user_id: 1
    )
  end
end

def create_exercise
  50.times do |n|
    Exercise.create!(
    name: Faker::App.name,
    reps: Faker::Number.between(1,20),
    note: Faker::StarWars.quote,
    workout_id: Faker::Number.between(1,10)
    )
  end
end



create_workout
create_exercise
