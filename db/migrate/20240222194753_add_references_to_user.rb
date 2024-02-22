class AddReferencesToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :mood, null: false, foreign_key: true
    add_reference :users, :ranking, null: false, foreign_key: true
    add_reference :users, :avatar, null: false, foreign_key: true
  end
end
