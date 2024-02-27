class RenameTresholdToThreshold < ActiveRecord::Migration[7.1]
  def change
    rename_column :rankings, :treshold, :threshold
  end
end
