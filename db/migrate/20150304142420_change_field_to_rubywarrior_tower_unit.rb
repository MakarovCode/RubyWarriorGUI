class ChangeFieldToRubywarriorTowerUnit < ActiveRecord::Migration[6.1]
  def change
    remove_column :rubywarrior_tower_units, :por_x
    add_column :rubywarrior_tower_units, :pos_x, :integer
  end
end
