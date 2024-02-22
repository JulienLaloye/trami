class AddReferencesToRoom < ActiveRecord::Migration[7.1]
  def change
    add_reference :rooms, :activity, null: false, foreign_key: true
    add_reference :rooms, :user, null: false, foreign_key: true
    add_column :rooms, :finished, :boolean
  end
end
