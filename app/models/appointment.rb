class Appointment < ApplicationRecord
  # has_many :users
  # has_many :rooms
  belongs_to :room
  belongs_to :user
  validates :ownership, inclusion: { in: [true, false] }
  validates :presence, inclusion: { in: [true, false] }
  validate :unique_room_user_combination, on: :create

  private

  def unique_room_user_combination
    if Appointment.exists?(room_id: room_id, user_id: user_id)
      errors.add(:base, "An appointment for this room and user already exists")
    end
  end
end
