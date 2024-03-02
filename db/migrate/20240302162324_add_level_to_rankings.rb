class AddLevelToRankings < ActiveRecord::Migration[7.1]
  def change
    add_column :rankings, :level, :integer
  end
end
