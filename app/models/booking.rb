class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :start_date_not_in_past
  validate :state do
    if state != "pending" && state != "accepted" && state != "declined" && state != "cancelled" && state != "completed" && state != "reviewed"
      errors.add(:state, "must be pending, accepted or declined or cancelled or completed or reviewed")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def start_date_not_in_past
    return if start_date.blank?

    if start_date < Time.now.in_time_zone("Europe/Paris").to_date
      errors.add(:start_date, "must be in the future")
    end
  end
end
