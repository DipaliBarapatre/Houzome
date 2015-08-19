class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.string :name, null: false
      t.references :apartment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
