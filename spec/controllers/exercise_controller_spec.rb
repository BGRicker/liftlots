require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  before(:each) do
    @workout = Fabricate(:workout)
    @exercise_attributes = Fabricate.attributes_for(:exercise)
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves a new exercise object" do
        expect { post :create, workout_id: @workout, exercise: @exercise_attributes }.to change( Exercise, :count).by(1)
      end
    end
  end

  context "User leaves name field blank" do
    it "does not save a new exercise object" do
      expect { post :create, workout_id: @workout, exercise: {name: '', reps: 12 } }.to change( Exercise, :count).by(0)
    end
  end

  context "User inputs 0 in reps" do
    it "does not save a new exercise object" do
      expect { post :create, workout_id: @workout, exercise: {name: 'Chest', reps: 0 } }.to change( Exercise, :count).by(0)
    end
  end
end
