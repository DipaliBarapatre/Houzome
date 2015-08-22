class AddDescriptionToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :description, :text
    add_column :designs, :selling_price, :decimal, :precision => 8, :scale => 2
    add_column :designs, :specifications, :text
  end
end
