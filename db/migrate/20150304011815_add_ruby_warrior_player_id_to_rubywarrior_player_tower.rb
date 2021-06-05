class AddRubyWarriorPlayerIdToRubywarriorPlayerTower < ActiveRecord::Migration[6.1]
  def change
    add_column :rubywarrior_player_towers, :rubywarrior_player_id, :integer
    add_index :rubywarrior_player_towers, :rubywarrior_player_id
  end
end
