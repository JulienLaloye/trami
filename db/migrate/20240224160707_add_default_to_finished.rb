class AddDefaultToFinished < ActiveRecord::Migration[7.1]
  def change
    change_column_default :rooms, :finished, false
    change_column_default :appointments, :status, 0
  end
end
