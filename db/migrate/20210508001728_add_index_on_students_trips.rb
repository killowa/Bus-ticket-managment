class AddIndexOnStudentsTrips < ActiveRecord::Migration[6.1]
  def change
    add_index :students_trips, [:student_id, :trip_id], unique: true
  end
end
