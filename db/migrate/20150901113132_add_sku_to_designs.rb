class AddSkuToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :sku, :string
  end
end
