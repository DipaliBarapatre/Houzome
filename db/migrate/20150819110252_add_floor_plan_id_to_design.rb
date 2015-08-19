class AddFloorPlanIdToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :floor_plan_id, :string, array: true

    add_index :designs, :floor_plan_id, using: 'gin'
  end
end
