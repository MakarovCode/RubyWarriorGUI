class AddFilePathToRubywarriorPlayerTower < ActiveRecord::Migration[6.1]
  def change
    add_column :rubywarrior_player_towers, :file_path, :string
  end
end
