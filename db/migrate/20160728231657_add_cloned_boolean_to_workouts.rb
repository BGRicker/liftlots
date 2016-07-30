class AddClonedBooleanToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :is_a_copy, :boolean, default: false
    add_column :workouts, :times_copied, :integer
  end
end
