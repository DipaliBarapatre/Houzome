class AddImageToBuilders < ActiveRecord::Migration
  def change
    add_column :builders, :image_id, :string
  end
end
