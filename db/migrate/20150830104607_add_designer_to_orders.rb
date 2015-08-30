class AddDesignerToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :designer, :string
    add_column :orders, :executioner, :string
  end
end
