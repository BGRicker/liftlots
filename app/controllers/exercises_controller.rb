class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @workout.exercises.create(exercise_params)
    redirect_to @workout
  end


  private

  def exercise_params
    params.require(:exercise).permit(:name, :reps, :weight, :note)

  end

end
