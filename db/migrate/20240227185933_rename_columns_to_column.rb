class RenameColumnsToColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :rooms, :langage, :language
    rename_column :rooms, :adress, :address
    rename_column :users, :adress, :address
  end
end
