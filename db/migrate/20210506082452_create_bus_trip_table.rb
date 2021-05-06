class CreateBusTripTable < ActiveRecord::Migration[6.1]
  def change
    create_table :buses_trips_tables, id: false do |t|
      t.belongs_to :bus
      t.belongs_to :trip
      t.timestamps
    end
  end
end
