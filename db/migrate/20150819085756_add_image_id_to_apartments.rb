class AddImageIdToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :image_id, :string
  end
end
