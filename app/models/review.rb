class Review < ApplicationRecord
  belongs_to :appointment
  belongs_to :user

  validates :rating, :user_id, :rating, :comment, :appointment_id, presence: true
  validates :rating, numericality: { in: (0...5) }
  validates :comment, length: { greater_than: 100 }
end
