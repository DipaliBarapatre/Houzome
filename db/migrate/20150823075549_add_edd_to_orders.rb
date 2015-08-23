class AddEddToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :edd, :date
  end
end
