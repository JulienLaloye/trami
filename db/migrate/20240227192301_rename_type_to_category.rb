class RenameTypeToCategory < ActiveRecord::Migration[7.1]
  def change
    rename_column :moods, :type, :category
  end
end
