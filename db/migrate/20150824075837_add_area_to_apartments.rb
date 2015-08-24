class AddAreaToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :area, :string
  end
end
