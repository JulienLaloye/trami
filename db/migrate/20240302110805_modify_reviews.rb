class ModifyReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :rating
    remove_column :reviews, :comment
    add_column :rooms, :feedbacks, :text, default: [], array: true
  end
end
