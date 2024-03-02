class Appointment < ApplicationRecord
  has_many :users
  belongs_to :room
  validates :ownership, presence: true
  # validate uniqueness of the couple room user
end
