class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.text :numbers, array: true, default: []
      t.string :floor_plan_id

      t.timestamps null: false
    end
  end
end
