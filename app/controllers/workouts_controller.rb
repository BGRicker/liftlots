class WorkoutsController < ApplicationController

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
    @workout = current_user.workouts.find(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:title)
  end
end
