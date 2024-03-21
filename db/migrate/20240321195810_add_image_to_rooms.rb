class AddImageToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :image, :string
  end
end
