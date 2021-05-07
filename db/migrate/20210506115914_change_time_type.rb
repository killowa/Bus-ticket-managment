class ChangeTimeType < ActiveRecord::Migration[6.1]
  def change
    change_column :trips, :starting_time, :string
    change_column :trips, :ending_time, :string
  end
end
