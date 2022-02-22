class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :superpowers, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
