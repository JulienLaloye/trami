class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # geocoded_by :adress
  # after_validation :geocode, if: :will_save_change_to_address?
  has_many :appointments
  has_many :rooms, through: :appointments, source: :room
  has_many :reviews
  has_many :reviews, through: :appointments
  belongs_to :mood
  belongs_to :avatar
  belongs_to :ranking

  has_many :reportings, class_name: 'Report', foreign_key: 'reporter_id'
  has_many :received_reports, class_name: 'Report', foreign_key: 'reportee_id'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :description, :username, :gender, :birthdate, :nationality, :address, presence: true
  validate :validate_age
  validates :username, presence: true, uniqueness: true

  private

  def validate_age
    if birthdate.present? && birthdate >= 18.years.ago
      errors.add(:birthdate, 'should be over 18 years old.')
    end
  end
end
