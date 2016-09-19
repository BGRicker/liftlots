class ExercisesController < ApplicationController

  def new
    @workout = Workout.find(params[:workout_id])
    @exercise = Exercise.new
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @exercise = @workout.exercises.create(exercise_params)
    if @exercise.save
      flash[:success] = 'New Workout has been created!'
      redirect_to workout_path(@workout)
    else
      render :_new , status:  :unprocessable_entity
    end
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
