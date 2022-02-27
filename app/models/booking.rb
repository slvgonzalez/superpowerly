class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :superpower

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_cannot_be_in_the_past, :start_date_not_after_end_date, :superpower_user_id_not_the_same_as_user_id
  # validates :end_date, comparison: { greater_than: :start_date }
  # validates :start_date, comparison: { greater_than: Date.now }
  def start_date_not_after_end_date
    if start_date >= end_date
      errors.add(:start_date, "can't be after or the same as end date")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def superpower_user_id_not_the_same_as_user_id
    if user_id == superpower[:user_id]
      errors.add("you can't rent from yourself")
    end
  end

  def superpower_already_booked
    sup = superpower.bookings.map do |book|
      (book.start_date..book.end_date)
    end
    bool = sup.none? do |date_range|
      (start_date..end_date).to_a.each do |date|
        date_range.include?(date)
      end
    end
    if bool == false
      errors.add(:superpower, "is already booked for this period :(")
    end
  end
end
