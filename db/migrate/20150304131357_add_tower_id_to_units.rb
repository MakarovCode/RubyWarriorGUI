class AddTowerIdToUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :rubywarrior_tower_units, :rubywarrior_tower_id, :integer
    add_index :rubywarrior_tower_units, :rubywarrior_tower_id
  end
end
