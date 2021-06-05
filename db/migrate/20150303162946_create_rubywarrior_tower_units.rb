class CreateRubywarriorTowerUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :rubywarrior_tower_units do |t|
      t.string :name
      t.integer :por_x
      t.integer :pos_y
      t.integer :direction

      t.timestamps
    end
  end
end
