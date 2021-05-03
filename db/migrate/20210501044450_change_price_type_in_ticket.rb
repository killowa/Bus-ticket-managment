class ChangePriceTypeInTicket < ActiveRecord::Migration[6.1]
  def change
    change_column :tickets, :price, :float
  end
end
