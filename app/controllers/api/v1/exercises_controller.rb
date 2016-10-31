module Api
  module V1
    class ExercisesController < ApplicationController
      def index
        render :json => Exercise.all
      end
    end
  end
end
