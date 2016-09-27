require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  before(:each) do
    @workout = Fabricate(:workout)
    @exercise_attributes = Fabricate.attributes_for(:exercise)
  end

  describe "POST #create" do
    context "a successful create" do
      it "saves a new exercise object" do
        expect { post :create, workout_id: @workout, exercise: @exercise_attributes }.to change( Exercise, :count ).by(1)
      end
    end
  end
end
