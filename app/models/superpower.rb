class Superpower < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :description, presence: true
  validates :price, presence: true
  validates :name, presence: true
  CATEGORIES = %w(enhancements almighty\ powers mental\ powers transportation)
  validates :category, inclusion: { in: CATEGORIES }
  pg_search_scope :search_for_spowers_by_name_descr_cat_user,
                  against: %i[name description category], 
                  associated_against: {
                    user: %i[username]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end