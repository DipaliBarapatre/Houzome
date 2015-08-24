class ChangePriceOnOrder < ActiveRecord::Migration
  def change
  	change_column :orders, :price, :decimal, :precision => 15, :scale => 5
  end
end
