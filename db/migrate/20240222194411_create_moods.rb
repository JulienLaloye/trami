class CreateMoods < ActiveRecord::Migration[7.1]
  def change
    create_table :moods do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :picture

      t.timestamps
    end
  end
end
