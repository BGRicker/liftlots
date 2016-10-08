class WorkoutsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create(workout_params)
    if @workout.save
      redirect_to @workout
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def destroy
    @workout = current_user.workouts.find(params[:id])
    if @workout.user != current_user
      return render :text => "Not Allowed", :status => forbidden
    end
    @workout.destroy
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
    @new_workout = @workout.deep_clone include: :exercises
    @new_workout.is_a_copy = true
    @new_workout.save
    redirect_to workout_path(@new_workout)
  end

  private

  def workout_params
    params.require(:workout).permit(:title)
  end
end
