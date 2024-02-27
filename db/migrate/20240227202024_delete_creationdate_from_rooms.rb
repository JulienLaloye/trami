class DeleteCreationdateFromRooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :rooms, :creation_date
  end
end
