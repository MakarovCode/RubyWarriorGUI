class CreateCategoryTutorials < ActiveRecord::Migration[6.1]
  def change
    create_table :category_tutorials do |t|
      t.string :version
      t.references :category, index: true
      t.references :tutorial, index: true

      t.timestamps
    end
  end
end
