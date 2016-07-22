class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :workout_id
      t.integer :reps
      t.integer :weight
      t.string :note
      t.timestamps
    end
  end
end
