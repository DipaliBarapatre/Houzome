class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :city, :string
  end
end
