class CreateSubImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_id
      t.references :design, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
