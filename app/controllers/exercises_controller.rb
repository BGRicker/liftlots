class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(exercise_params)
    if @exercise.save
      redirect_to workout_path(@exercise.workout_id)
    else
      @workout.reload
      render 'workouts/show', :status => :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    redirect_to workout_path(@exercise.workout_id)
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.find(params[:id])
    @exercise.update_attributes(exercise_params)
    if @exercise.save
      redirect_to workout_path(@exercise.workout_id)
    else
      render :edit, :status => :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :reps, :weight, :note)
  end

end
