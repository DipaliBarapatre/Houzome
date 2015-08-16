class CreateBuilders < ActiveRecord::Migration
  def change
    create_table :builders do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.text :description

      t.timestamps null: false
    end
  end
end
