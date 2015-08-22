class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.string :aasm_state
      t.text :apartment_address
      t.string :flat
      t.string :city
      t.text :special_request
      t.string :number
      t.string :order_type
      t.references :apartment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
