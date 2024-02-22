class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.references :mood, null: false, foreign_key: true
      t.string :category
      t.text :interests, array: true, default: []

      t.timestamps
    end
  end
end
