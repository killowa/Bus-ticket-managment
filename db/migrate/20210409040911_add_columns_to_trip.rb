class AddColumnsToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :price, :float
    add_column :trips, :available_places, :integer
  end
end
