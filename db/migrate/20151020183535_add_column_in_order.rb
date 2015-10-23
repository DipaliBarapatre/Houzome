class AddColumnInOrder < ActiveRecord::Migration
  def change
    add_column :orders, :apartment_name, :string
    add_column :orders, :tower, :string

  end
end
