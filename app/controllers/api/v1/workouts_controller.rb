module Api
  module V1
    class WorkoutsController < ApplicationController
      def index
        @workouts = Workout.all.where(is_a_copy: false)
        render :json => @workouts
      end
    end
  end
end
