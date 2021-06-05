class AddImageFieldToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :image, :string
  end
end
