class AddColorToMoods < ActiveRecord::Migration[7.1]
  def change
    add_column :moods, :color, :string
  end
end
