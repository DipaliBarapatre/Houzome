class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :flats, :towers do |t|
      t.index [:flat_id, :tower_id]
      t.index [:tower_id, :flat_id]
    end
  end
end
