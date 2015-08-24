class ChangeSellingPriceToDesign < ActiveRecord::Migration
  def change
  	change_column :designs, :selling_price, :decimal, :precision => 15, :scale => 5
  end
end
