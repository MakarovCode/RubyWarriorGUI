class CreateRubywarriorPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :rubywarrior_players do |t|
      t.string :name
      t.integer :actual_level
      t.integer :actual_difficulty

      t.timestamps
    end
  end
end
