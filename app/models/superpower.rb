class Superpower < ApplicationRecord
  CATEGORIES = %w(enhancements almighty\ powers mental\ powers transportation)
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :description, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :category, inclusion: { in: CATEGORIES }
end
