class Appointment < ApplicationRecord
  validates :ownership, presence: true
end
