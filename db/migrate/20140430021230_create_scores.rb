class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.float :value
      t.references :user, index: true
      t.references :tutorial, index: true

      t.timestamps
    end
  end
end
