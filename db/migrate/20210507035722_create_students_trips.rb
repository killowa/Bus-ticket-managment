class CreateStudentsTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :students_trips do |t|
      t.belongs_to :student
      t.belongs_to :trip
      t.timestamps
    end
  end
end
