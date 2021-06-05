class CreateRubywarriorTowers < ActiveRecord::Migration[6.1]
  def change
    create_table :rubywarrior_towers do |t|
      t.string :name
      t.text :description
      t.text :tip
      t.text :clue
      t.integer :time_bonus
      t.integer :ace_score
      t.integer :size_width
      t.integer :size_height
      t.integer :stairs_x
      t.integer :stairs_y
      t.references :rubywarrior_tower_warrior, index: true

      t.timestamps
    end
  end
end
