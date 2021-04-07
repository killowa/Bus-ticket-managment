class AddDetailsToTrip < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :starting_time, :integer
    add_column :trips, :ending_time, :integer
  end
end
