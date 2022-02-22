class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :description, presence: true
  validates :price, presence: true
  validates :name, presence: true
end
