class Superpower < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :description, presence: true
  validates :price, presence: true
  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name description category],
                  associated_against: {
                    user: %i[username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
