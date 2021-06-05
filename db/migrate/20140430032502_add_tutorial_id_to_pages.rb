class AddTutorialIdToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :tutorial_id, :integer
    add_index :pages, :tutorial_id
  end
end
