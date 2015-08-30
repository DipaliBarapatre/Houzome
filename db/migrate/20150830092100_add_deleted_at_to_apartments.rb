class AddDeletedAtToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :deleted_at, :datetime
    add_index :apartments, :deleted_at
  end
end
