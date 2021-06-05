class CreateTutorialComments < ActiveRecord::Migration[6.1]
  def change
    create_table :tutorial_comments do |t|
      t.text :description
      t.references :user, index: true
      t.references :tutorial, index: true

      t.timestamps
    end
  end
end
