class Appointment < ApplicationRecord
  has_many :users
  has_many :rooms
  belongs_to :room
  belongs_to :user
  validates :ownership, inclusion: [true, false]
  # validate uniqueness of the couple room user
end
