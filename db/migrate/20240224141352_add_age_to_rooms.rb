class AddAgeToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :min_age, :integer
    add_column :rooms, :max_age, :integer
  end
end
