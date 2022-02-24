class Superpower < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :description, presence: true
  validates :price, presence: true
  validates :name, presence: true
  pg_search_scope :search_for_spowers_by_name_descr_cat_user,
                  against: %i[name description],
                  associated_against: {
                    user: %i[username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end

# add category
