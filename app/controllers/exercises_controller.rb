class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @workout.exercises.create(exercise_params)
    redirect_to @workout
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to workout_path(@exercise.workout_id)
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :reps, :weight, :note)
  end

end
