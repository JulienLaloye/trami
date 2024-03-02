class AddPresenceToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :presence, :boolean, default: false
  end
end
