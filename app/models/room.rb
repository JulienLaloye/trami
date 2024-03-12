class Room < ApplicationRecord
  # geocoded_by :adress
  # after_validation :geocode, if: :will_save_change_to_address?
  has_many :appointments
  has_many :participants, class_name: 'User', through: :appointments, source: :user, foreign_key: 'user_id'
  belongs_to :user
  belongs_to :activity

  GENDER_OPTIONS = ["men", "women", "no preference"]
  validates :title, :description, :gender, :date, :max_part, :min_part, :language, presence: true
  # validates :description, length: { in: (50...400) }
  validates :min_age, numericality: { greater_than_or_equal_to: 18, message: "must be at least 18" }
  validates :max_age, numericality: { less_than: 99, message: "must be bellow 99" }
  # max age must be > min age
  validates_comparison_of :max_age, greater_than: :min_age
  validates :gender, inclusion: { in: GENDER_OPTIONS }
  # validate :date_must_be_in_the_future
  validates :min_part, numericality: { greater_than_or_equal_to: 2, message: "must be at least 2" }
  # validates :max_part, numericality: { less_than: 10, message: "must be bellow 10 " }
  # max_part must be > min part
  # validates_comparison_of :max_part, greater_or_equal_than: :min_part
  # participants < max_part
  # TODO: validates_comparison_of :max_part, greater_or_equal_than: :participants

  private

  def date_must_be_in_the_future
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
