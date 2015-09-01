class AddDesignerToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :designer, :string
    add_column :designs, :executioner, :string
  end
end
