class CreateRankings < ActiveRecord::Migration[7.1]
  def change
    create_table :rankings do |t|
      t.string :name
      t.integer :treshold
      t.string :picture
      t.string :description

      t.timestamps
    end
  end
end
