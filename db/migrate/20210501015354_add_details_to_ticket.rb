class AddDetailsToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :price, :integer
    add_reference :tickets, :trip, null: false, foreign_key: true
  end
end
