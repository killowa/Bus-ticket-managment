class CreateBuses < ActiveRecord::Migration[6.1]
  def change
    create_table :buses do |t|
      t.integer :capacity
      t.references :trip, null: true, foreign_key: true

      t.timestamps
    end
  end
end
