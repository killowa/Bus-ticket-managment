class RemoveAvailableFromTrips < ActiveRecord::Migration[6.1]
  def change
    remove_column :trips, :available, :boolean
  end
end
