class Mood < ApplicationRecord
  has_many :activities
  has_many :users
end
