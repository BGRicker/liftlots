class WorkoutsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    redirect_to root_path
  end

  def index
    @workouts = current_user.workouts
  end

  def show
    @exercise = Exercise.new
    @workout = current_user.workouts.find(params[:id])
    @exercises = @workout.exercises
  end

  def copy
    @workout = current_user.workouts.find(params[:workout_id])
    @new_workout = @workout.dup.save
    redirect_to root_path
  end

  private

  def workout_params
    params.require(:workout).permit(:title)
  end
end
