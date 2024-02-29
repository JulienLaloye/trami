class AddParticipantsToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :participants, :integer, default: 1
  end
end
