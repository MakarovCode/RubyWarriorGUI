class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.text :content
      t.string :title

      t.timestamps
    end
  end
end
