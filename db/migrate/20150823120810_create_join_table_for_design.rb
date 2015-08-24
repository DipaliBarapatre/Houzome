class CreateJoinTableForDesign < ActiveRecord::Migration
  def change
    create_join_table :designs, :flats do |t|
      t.index [:design_id, :flat_id]
      t.index [:flat_id, :design_id]
    end
  end
end
