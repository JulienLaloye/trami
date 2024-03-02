class RemoveColumnFeedbacksFromRooms < ActiveRecord::Migration[7.1]
  def change
    remove_column :rooms, :feedbacks
    add_column :reviews, :feedbacks, :text, default: [], array: true
  end
end
