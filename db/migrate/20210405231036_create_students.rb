class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.references :trip, null: true, foreign_key: true

      t.timestamps
    end
  end
end
