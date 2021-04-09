class AllowNullInBus < ActiveRecord::Migration[6.1]
  def change
    change_column :buses, :trip_id, :integer, null: true
  end
end
