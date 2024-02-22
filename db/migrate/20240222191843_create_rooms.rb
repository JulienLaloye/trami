class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.string :gender
      t.datetime :date
      t.integer :max_part
      t.integer :min_part
      t.string :location
      t.string :langage
      t.datetime :creation_date

      t.timestamps
    end
  end
end
