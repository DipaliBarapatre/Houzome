class AddFpIdToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :fp_id, :string
  end
end
