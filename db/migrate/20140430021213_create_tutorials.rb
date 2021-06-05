class CreateTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :tutorials do |t|
      t.string :title
      t.float :score
      t.integer :visits_count
      t.integer :number_of_pages
      t.string :version
      t.text :objective

      t.timestamps
    end
  end
end
