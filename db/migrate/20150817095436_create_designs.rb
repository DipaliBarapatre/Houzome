class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :name
      t.string :master_image_id

      t.timestamps null: false
    end
  end
end
