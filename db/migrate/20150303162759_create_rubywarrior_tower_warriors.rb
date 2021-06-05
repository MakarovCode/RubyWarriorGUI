class CreateRubywarriorTowerWarriors < ActiveRecord::Migration[6.1]
  def change
    create_table :rubywarrior_tower_warriors do |t|
      t.integer :pos_x
      t.integer :pos_y
      t.integer :direction
      t.text :habilities

      t.timestamps
    end
  end
end
