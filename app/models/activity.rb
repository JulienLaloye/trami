class Activity < ApplicationRecord
  belongs_to :mood
  has_many :rooms
end
