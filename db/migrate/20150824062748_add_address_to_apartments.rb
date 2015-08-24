class AddAddressToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :address, :text
  end
end
