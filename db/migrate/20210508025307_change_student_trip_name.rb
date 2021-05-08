class ChangeStudentTripName < ActiveRecord::Migration[6.1]
  def change
    rename_table :students_trips, :trips_users
  end
end
