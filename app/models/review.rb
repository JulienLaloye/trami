class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :user

  validates :user_id, :feedbacks, :appointment_id, presence: true
end
