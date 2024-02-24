class RenameLocationToAdress < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :current_location, :adress
    rename_column :rooms, :location, :adress
  end
end
