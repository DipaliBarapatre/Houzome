class AddDesignToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :design, index: true, foreign_key: true
  end
end
