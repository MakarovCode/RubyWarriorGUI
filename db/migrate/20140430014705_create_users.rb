class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :username
      t.string :country
      t.string :profession
      t.text :why

      t.timestamps
    end
  end
end
