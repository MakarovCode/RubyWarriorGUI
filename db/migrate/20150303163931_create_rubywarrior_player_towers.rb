class CreateRubywarriorPlayerTowers < ActiveRecord::Migration[6.1]
  def change
    create_table :rubywarrior_player_towers do |t|
      t.integer :time
      t.integer :score
      t.integer :difficulty
      t.boolean :clear
      t.references :rubywarrior_tower, index: true

      t.timestamps
    end
  end
end
