class AddShowInMenuToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :show_in_menu, :boolean
  end
end
